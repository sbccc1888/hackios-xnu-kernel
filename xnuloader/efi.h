/*
 * Minimal UEFI definitions for the XNU loader (freestanding, no EDK2).
 * Only what the loader touches is declared; unused slots are void pointers
 * so that structure layouts still match the UEFI specification.
 */
#ifndef XNULOADER_EFI_H
#define XNULOADER_EFI_H

#include <stdint.h>
#include <stddef.h>

#define EFIAPI
typedef uint64_t efi_status;
typedef void *efi_handle;
typedef uint16_t char16;

#define EFI_ERROR_BIT        0x8000000000000000ULL
#define EFI_ERROR(s)         (((s) & EFI_ERROR_BIT) != 0)
#define EFI_BUFFER_TOO_SMALL (EFI_ERROR_BIT | 5)

typedef struct {
	uint32_t a; uint16_t b; uint16_t c; uint8_t d[8];
} efi_guid;

typedef struct {
	uint64_t signature; uint32_t revision; uint32_t header_size; uint32_t crc32; uint32_t reserved;
} efi_table_header;

struct efi_text_output;
typedef struct efi_text_output {
	void *reset;
	efi_status (EFIAPI *output_string)(struct efi_text_output *self, const char16 *str);
} efi_text_output;

enum { EfiLoaderData = 2, EfiConventionalMemory = 7 };
enum { AllocateAnyPages = 0, AllocateMaxAddress = 1, AllocateAddress = 2 };
enum { AllHandles = 0, ByRegisterNotify = 1, ByProtocol = 2 };
typedef efi_status (EFIAPI *EFI_PROTOCOLS_PER_HANDLE)(efi_handle handle, efi_guid ***protocols, uint64_t *count);

typedef struct {
	uint32_t type; uint32_t pad; uint64_t phys_start; uint64_t virt_start; uint64_t pages; uint64_t attribute;
} efi_memory_descriptor;

typedef struct {
	efi_table_header hdr;
	void *raise_tpl, *restore_tpl;
	efi_status (EFIAPI *allocate_pages)(int type, int mem_type, uint64_t pages, uint64_t *addr);
	efi_status (EFIAPI *free_pages)(uint64_t addr, uint64_t pages);
	efi_status (EFIAPI *get_memory_map)(uint64_t *size, void *map, uint64_t *key, uint64_t *desc_size, uint32_t *desc_ver);
	efi_status (EFIAPI *allocate_pool)(int type, uint64_t size, void **buf);
	efi_status (EFIAPI *free_pool)(void *buf);
	efi_status (EFIAPI *create_event)(uint32_t type, uint64_t tpl,
	    void (EFIAPI *notify)(void *event, void *ctx), const void *ctx, void **event);
	efi_status (EFIAPI *set_timer)(void *event, uint32_t type, uint64_t trigger_time);
	efi_status (EFIAPI *wait_for_event)(uint64_t count, void **event, uint64_t *index);
	efi_status (EFIAPI *signal_event)(void *event);
	efi_status (EFIAPI *close_event)(void *event);
	efi_status (EFIAPI *check_event)(void *event);
	efi_status (EFIAPI *install_protocol_interface)(efi_handle *handle, const efi_guid *guid,
	    int type, void *iface);
	efi_status (EFIAPI *reinstall_protocol_interface)(efi_handle handle, const efi_guid *guid,
	    void *old_iface, void *new_iface);
	void *uninstall_protocol_interface;
	efi_status (EFIAPI *handle_protocol)(efi_handle h, const efi_guid *guid, void **iface);
	void *reserved, *register_protocol_notify, *locate_handle, *locate_device_path, *install_configuration_table;
	efi_status (EFIAPI *load_image)(int boot_policy, efi_handle parent, void *path,
	    void *src, uint64_t size, efi_handle *image);
	efi_status (EFIAPI *start_image)(efi_handle image, uint64_t *exit_size, char16 **exit_data);
	efi_status (EFIAPI *exit)(efi_handle image, efi_status status, uint64_t size, char16 *data);
	void *unload_image;
	efi_status (EFIAPI *exit_boot_services)(efi_handle image, uint64_t map_key);
	void *get_next_monotonic_count;
	efi_status (EFIAPI *stall)(uint64_t microseconds);
	efi_status (EFIAPI *set_watchdog_timer)(uint64_t timeout, uint64_t code, uint64_t size, char16 *data);
	efi_status (EFIAPI *connect_controller)(efi_handle controller, efi_handle *drivers,
	    void *remaining, int recursive);
	efi_status (EFIAPI *disconnect_controller)(efi_handle controller, efi_handle child,
	    efi_handle driver_binding);
	void *open_protocol, *close_protocol;
	efi_status (EFIAPI *open_protocol_information)(efi_handle handle, const efi_guid *guid,
	    void **entry_buffer, uint64_t *entry_count);
	void *protocols_per_handle;
	efi_status (EFIAPI *locate_handle_buffer)(int type, const efi_guid *guid, void *key, uint64_t *count, efi_handle **buf);
	efi_status (EFIAPI *locate_protocol)(const efi_guid *guid, void *registration, void **iface);
	void *install_multiple_protocol_interfaces, *uninstall_multiple_protocol_interfaces;
	void *calculate_crc32, *copy_mem, *set_mem;
	efi_status (EFIAPI *create_event_ex)(uint32_t type, uint64_t tpl, void (EFIAPI *notify)(void *event, void *ctx),
	    const void *ctx, const efi_guid *group, void **event);
} efi_boot_services;

struct efi_time {
	uint16_t year;
	uint8_t  month, day, hour, minute, second, pad1;
	uint32_t nanosecond;
	int16_t  timezone;              /* minutes; 0x7FF = not specified */
	uint8_t  daylight, pad2;
};

typedef struct {
	efi_table_header hdr;
	efi_status (EFIAPI *get_time)(struct efi_time *time, void *capabilities);
	void *set_time, *get_wakeup_time, *set_wakeup_time;
	void *set_virtual_address_map, *convert_pointer;
	void *get_variable, *get_next_variable_name, *set_variable;
	void *get_next_high_mono_count;
	void (EFIAPI *reset_system)(int type, efi_status status, uint64_t size, void *data);
} efi_runtime_services;

typedef struct {
	efi_table_header hdr;
	char16 *vendor; uint32_t revision; uint32_t pad;
	efi_handle con_in_handle; void *con_in;
	efi_handle con_out_handle; efi_text_output *con_out;
	efi_handle stderr_handle; efi_text_output *std_err;
	efi_runtime_services *rt;
	efi_boot_services *bs;
	uint64_t nr_tables;                     /* the configuration tables: ACPI, a device tree, ... */
	struct { efi_guid guid; void *table; } *tables;
} efi_system_table;

/* a device path is a list of these, each followed by its data, ending with type 0x7f subtype 0xff */
typedef struct {
	uint8_t type, subtype;
	uint8_t length[2];                      /* of the whole node, header included, little endian */
} efi_device_path;

/* Graphics Output */
typedef struct {
	uint32_t version, width, height, pixel_format;
	uint32_t pixel_mask[4];
	uint32_t pixels_per_scanline;
} efi_gop_mode_info;

typedef struct {
	uint32_t max_mode, mode;
	efi_gop_mode_info *info;
	uint64_t info_size;
	uint64_t fb_base;
	uint64_t fb_size;
} efi_gop_mode;

typedef struct efi_gop {
	efi_status (EFIAPI *query_mode)(struct efi_gop *self, uint32_t mode, uint64_t *info_size, efi_gop_mode_info **info);
	efi_status (EFIAPI *set_mode)(struct efi_gop *self, uint32_t mode);
	void *blt;
	efi_gop_mode *mode;
} efi_gop;

/*
 * Qualcomm's open ChargerEx protocol.  The protocol is implemented by the
 * stock ChargerExDxe in the redwood UEFI image and is safe to use for
 * read-only charger/battery queries while boot services remain resident.
 */
typedef struct {
	uint64_t revision;
	efi_status (EFIAPI *get_charger_presence)(uint8_t *present);
	efi_status (EFIAPI *get_battery_presence)(uint8_t *present);
	efi_status (EFIAPI *get_battery_voltage)(uint32_t *millivolts);
	efi_status (EFIAPI *is_offmode_charging)(uint8_t *offmode);
	efi_status (EFIAPI *is_power_ok)(uint32_t type, void *info);
} efi_charger_ex;

/*
 * The first public entries of Xiaomi's Qualcomm charger protocol.  Its GUID,
 * revision and function layout are taken from the QcomChargerDxeLA.efi and
 * QcomChargerApp.efi shipped in this repository.  get_charging_action is used
 * only as a status read: the loader never calls take_action and therefore does
 * not change current/voltage limits or bypass the firmware's JEITA checks.
 */
typedef struct {
	uint64_t revision;
	efi_status (EFIAPI *initialize)(uint8_t enable);
	void *reserved_10;
	void *reserved_18;
	efi_status (EFIAPI *get_charging_action)(uint32_t *action, void *battery_status, uint8_t display);
	efi_status (EFIAPI *take_action)(uint32_t action, const void *battery_status);
} efi_qcom_charger;

/*
 * EFI_CLOCK_PROTOCOL, as far as this loader uses it.
 *
 * QcomPkg/Include/Protocol/EFIClock.h: the first entries are the ones needed to
 * turn a clock on by name, which is how the QUSB2 PHY gets its ref clock.
 */
typedef struct efi_clock_protocol efi_clock_protocol;

struct efi_clock_protocol {
	uint64_t revision;
	efi_status (EFIAPI *get_id)(efi_clock_protocol *self, const char *name, uint32_t *id);
	efi_status (EFIAPI *enable)(efi_clock_protocol *self, uint32_t id);
	efi_status (EFIAPI *disable)(efi_clock_protocol *self, uint32_t id);
	efi_status (EFIAPI *reset)(efi_clock_protocol *self, uint32_t id);
	efi_status (EFIAPI *set_frequency)(efi_clock_protocol *self, uint32_t id, uint32_t hz);
	efi_status (EFIAPI *get_frequency)(efi_clock_protocol *self, uint32_t id, uint32_t *hz);
	efi_status (EFIAPI *is_enabled)(efi_clock_protocol *self, uint32_t id, uint8_t *on);
	efi_status (EFIAPI *set_parent)(efi_clock_protocol *self, uint32_t id, uint32_t parent);
	efi_status (EFIAPI *get_parent)(efi_clock_protocol *self, uint32_t id, uint32_t *parent);
	efi_status (EFIAPI *get_parent_count)(efi_clock_protocol *self, uint32_t id, uint32_t *n);
	efi_status (EFIAPI *get_parents)(efi_clock_protocol *self, uint32_t id, void *list);
};

/* Standard DXE GUIDs used by the HK6 USB handshake. */
static const efi_guid EFI_LOADED_IMAGE_GUID = {0x5b1b31a1, 0x9562, 0x11d2,
    {0x8e, 0x3f, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b}};
static const efi_guid EFI_DRIVER_BINDING_GUID = {0x18a031ab, 0xb443, 0x4d1a,
    {0xa5, 0xc0, 0x0c, 0x09, 0x26, 0x1e, 0x9f, 0x71}};

/*
 * The pieces of DXE that ios-party's HK6 peripheral handshake needs.  Their
 * analysis of the vendor UsbConfigDxe showed StartController() answering success
 * while the core stays in host mode, because a private static-mode policy
 * replaces the requested mode before the equality test.  The workaround is to
 * install our own USB Config table with ModeType = 4 and let the vendor DWC3
 * driver bind to it, which needs these structures.
 */
typedef struct efi_driver_binding efi_driver_binding;
struct efi_driver_binding {
	uint32_t version;
	efi_handle image_handle;
	efi_handle driver_binding_handle;
	efi_status (EFIAPI *supported)(efi_driver_binding *self, efi_handle controller, void *remaining);
	void *start, *stop;
	uint32_t version2;
};

typedef struct {
	uint32_t revision;
	void *parent_handle;
	void *system_table;
	void *device_handle;
	void *file_path;
	void *reserved;
	uint32_t load_options_size;
	void *load_options;
	void *image_base;
	uint64_t image_size;
	uint32_t image_code_type, image_data_type;
	void *unload;
} efi_loaded_image;

typedef struct {
	uint32_t revision;
	efi_status (EFIAPI *query_core_count)(void *self, uint8_t *count);
	efi_status (EFIAPI *query_core_info)(void *self, uint8_t *core, void *info);
	efi_status (EFIAPI *start_controller)(void *self, uint8_t core, uint32_t mode);
	efi_status (EFIAPI *stop_controller)(void *self, uint8_t core, uint32_t mode);
} efi_qcom_usb_init;

/* The vendor DWC3 Supported() reads CoreNum/ModeType at 0x88/0x8c. */
typedef struct efi_qcom_usb_config {
	uint32_t revision;
	void *methods[16];
	uint32_t core_num;
	uint32_t mode_type;
	/* the two VBUS callbacks UsbConfigDxe asserts non-null */
	efi_status (EFIAPI *get_vbus_status)(struct efi_qcom_usb_config *self, uint8_t *state);
	efi_status (EFIAPI *enable_vbus)(struct efi_qcom_usb_config *self, uint8_t enable);
} efi_qcom_usb_config;

typedef struct {
	uint8_t core_num;
	uint32_t mode_type;
} efi_qcom_usb_core;

enum { UsbModePeripheral = 0x02, UsbModePeripheralAlt = 0x04, UsbModeHost = 0x01 };

/* Block I/O + Partition Info (used to persist the log on the phone) */
typedef struct {
	uint32_t media_id; uint8_t removable, present, logical, read_only, write_caching; uint8_t pad[3];
	uint32_t block_size; uint32_t io_align; uint64_t last_block;
} efi_block_media;

typedef struct efi_block_io {
	uint64_t revision;
	efi_block_media *media;
	void *reset;
	efi_status (EFIAPI *read_blocks)(struct efi_block_io *self, uint32_t media_id, uint64_t lba, uint64_t size, void *buf);
	efi_status (EFIAPI *write_blocks)(struct efi_block_io *self, uint32_t media_id, uint64_t lba, uint64_t size, void *buf);
	efi_status (EFIAPI *flush_blocks)(struct efi_block_io *self);
} efi_block_io;

/* Block I/O 2: the same reads, asynchronous -- a token's event is signalled when one is done */
typedef struct {
	void *event;
	efi_status transaction_status;
} efi_block_io2_token;

typedef struct efi_block_io2 {
	efi_block_media *media;
	void *reset;
	efi_status (EFIAPI *read_blocks_ex)(struct efi_block_io2 *self, uint32_t media_id, uint64_t lba,
	    efi_block_io2_token *token, uint64_t size, void *buf);
	void *write_blocks_ex, *flush_blocks_ex;
} efi_block_io2;

#pragma pack(push, 1)
typedef struct {
	uint32_t revision; uint32_t type; uint8_t system;
	uint8_t reserved[7];
	/* GPT entry */
	efi_guid type_guid, unique_guid;
	uint64_t start_lba, end_lba, attributes;
	char16 name[36];
} efi_partition_info;
#pragma pack(pop)

/* CPU architectural protocol: only the exception-handler hook is used */
typedef struct efi_cpu_arch {
	void *flush_data_cache, *enable_interrupt, *disable_interrupt, *get_interrupt_state, *init;
	efi_status (EFIAPI *register_interrupt_handler)(struct efi_cpu_arch *self, int64_t type,
	    void (EFIAPI *handler)(int64_t type, uint64_t *context));
} efi_cpu_arch;

/* Index of fields in EFI_SYSTEM_CONTEXT_AARCH64 viewed as an array of u64 */
enum { EXC_CTX_FP = 29, EXC_CTX_LR = 30, EXC_CTX_SP = 31, EXC_CTX_ELR = 96, EXC_CTX_SPSR = 97, EXC_CTX_ESR = 99, EXC_CTX_FAR = 100 };

/*
 * Qualcomm EFI_USB_DEVICE_PROTOCOL (interface as published in the open-source
 * ABL, QcomModulePkg/Include/Protocol/EFIUsbDevice.h): a polled USB
 * peripheral-mode API. The stock fastboot is built on it.
 */
enum { UsbDeviceEventNoEvent, UsbDeviceEventDeviceStateChange, UsbDeviceEventTransferNotification, UsbDeviceEventOemEvent };
enum { UsbDeviceTransferStatusActive, UsbDeviceTransferStatusCompleteOK, UsbDeviceTransferStatusCancelled,
       UsbDeviceTransferStatusCompleteError };
enum { UsbDeviceStateConnected, UsbDeviceStateDisconnected };

typedef union {
	uint32_t device_state;
	struct { uint32_t status; uint8_t endpoint_index; uint64_t bytes_completed; void *data_buffer; } transfer;
	uint64_t raw[8];
} usb_device_event_data;

typedef struct {
	const void *device_descriptor;
	const void **descriptors;
	const void *ss_device_descriptor;
	const void **ss_descriptors;
	const void *device_qualifier;
	const void *bos;
	uint8_t string_count;
	const void **strings;
} usb_device_descriptor_set;

typedef struct {
	uint64_t revision;
	void *start;
	efi_status (*send)(uint8_t endpoint, uint64_t size, void *buffer);
	efi_status (EFIAPI *handle_event)(uint32_t *event, uint64_t *size, usb_device_event_data *data);
	efi_status (EFIAPI *allocate_transfer_buffer)(uint64_t size, void **buffer);
	efi_status (EFIAPI *free_transfer_buffer)(void *buffer);
	efi_status (*stop)(void);
	efi_status (*abort_xfer)(uint8_t endpoint);
	efi_status (EFIAPI *set_endpoint_stall_state)(uint8_t endpoint, uint8_t state);
	efi_status (*start_ex)(usb_device_descriptor_set *set);
} usb_device_protocol;

#define EFI_CPU_ARCH_GUID       { 0x26baccb1, 0x6f42, 0x11d4, { 0xbc, 0xe7, 0x00, 0x80, 0xc7, 0x3c, 0x88, 0x81 } }
#define QCOM_USB_DEVICE_GUID    { 0xd9d9ce48, 0x44b8, 0x4f49, { 0x8e, 0x3e, 0x2a, 0x3b, 0x92, 0x7d, 0xc6, 0xc1 } }
#define QCOM_USB_INIT_EVENT_GUID { 0x1c0cffce, 0xfc8d, 0x4e44, { 0x8c, 0x78, 0x9c, 0x9e, 0x5b, 0x53, 0x0d, 0x36 } }
/* gEfiUsbfnIoProtocolGuid (QcomPkg.dec): the DWC3 controller itself.
 * StartController() here is what makes UsbDeviceDxe's StartEx() work; without
 * it StartEx answers EFI_UNSUPPORTED. */
#define QCOM_USBFN_IO_GUID      { 0x32d2963a, 0xfe5d, 0x4f30, { 0xb6, 0x33, 0x6e, 0x5d, 0xc5, 0x58, 0x03, 0xcc } }
#define EFI_GOP_GUID            { 0x9042a9de, 0x23dc, 0x4a38, { 0x96, 0xfb, 0x7a, 0xde, 0xd0, 0x80, 0x51, 0x6a } }
/* gEfiUsbfnChgProtocolGuid: the charger/connection half of the DWC3 stack */
#define QCOM_USBFN_CHG_GUID     { 0xb1ccba26, 0x6f42, 0xd411, { 0xbc, 0xe7, 0x00, 0x80, 0xc7, 0x3c, 0x88, 0x81 } }
#define QCOM_PLATFORM_INFO_GUID { 0x157a5c45, 0x21b2, 0x43c5, { 0xba, 0x7c, 0x82, 0x2f, 0xee, 0x5f, 0xe5, 0x99 } }
#define QCOM_CHIP_INFO_GUID     { 0xb0760469, 0x970c, 0x487a, { 0xa4, 0xb5, 0x28, 0xdb, 0x7b, 0x45, 0xce, 0xf1 } }
#define QCOM_SMEM_GUID          { 0xf4e5c7d0, 0xd239, 0x47cb, { 0xaa, 0xcd, 0x7f, 0x66, 0xef, 0x76, 0x32, 0x38 } }
#define QCOM_TLMM_GUID          { 0x2a9f2e27, 0x0a1e, 0x4b1c, { 0x8f, 0x3f, 0x1e, 0x2b, 0x00, 0x00, 0x00, 0x00 } }
#define QCOM_CLOCK_GUID         { 0x241afae6, 0x885f, 0x4f6c, { 0xa7, 0xea, 0xc2, 0x8e, 0xab, 0x79, 0xc3, 0xe5 } }
#define EFI_BLOCK_IO_GUID       { 0x964e5b21, 0x6459, 0x11d2, { 0x8e, 0x39, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b } }
#define EFI_BLOCK_IO2_GUID      { 0xa77b2472, 0xe282, 0x4e9f, { 0xa2, 0x45, 0xc2, 0xc0, 0xe2, 0x7b, 0xbc, 0xc1 } }
#define EFI_DEVICE_PATH_GUID    { 0x09576e91, 0x6d3f, 0x11d2, { 0x8e, 0x39, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b } }
#define EFI_PARTITION_INFO_GUID { 0x8cf2f62c, 0xbc9b, 0x4821, { 0x80, 0x8d, 0xec, 0x9e, 0xc4, 0x21, 0xa1, 0xa0 } }
#define QCOM_CHARGER_EX_GUID     { 0x6edc8a6d, 0x2663, 0x43cd, { 0x90, 0xff, 0x46, 0x21, 0xff, 0xd1, 0x0d, 0xf5 } }
#define QCOM_CHARGER_GUID        { 0x21bfb78b, 0x02ea, 0x4ab7, { 0x99, 0x40, 0xb5, 0x8a, 0x2a, 0xd6, 0x58, 0x29 } }

#endif /* XNULOADER_EFI_H */

/*
 * EFI_USBFN_IO_PROTOCOL, in the header's own order.
 *
 * QcomPkg/Include/Protocol/EFIUsbfnIo.h lists eighteen methods; every one is
 * declared here even when unused, because a short struct shifts the slots after
 * it.  An earlier version stopped early and the DetectPort call landed on
 * garbage: "UEFI EXCEPTION type=0 elr=10002 esr=8a000000 far=10002".
 */
typedef struct efi_usbfn_io_protocol efi_usbfn_io;

/* EFI_USBFN_ENDPOINT_TYPE */
/*
 * EFI_USB_ENDPOINT_TYPE, keeping the USB spec's bmAttributes numbering.
 *
 * UsbFunctionIo.h defines Control 0x00, Bulk 0x02, and comments out Isochronous 0x01
 * and Interrupt 0x03 because this controller does not implement them.  An earlier
 * version of this file renumbered the four contiguously, which put Bulk at 1 and told
 * the driver an isochronous endpoint was a bulk one.
 */
enum {
	UsbfnEndpointControl = 0x00,
	UsbfnEndpointIsochronous = 0x01,
	UsbfnEndpointBulk = 0x02,
	UsbfnEndpointInterrupt = 0x03,
};

/* EFI_USBFN_PORT_TYPE */
enum {
	UsbfnUnknownPort = 0,
	UsbfnStandardDownstreamPort = 1,
	UsbfnChargingDownstreamPort = 2,
	UsbfnDedicatedChargingPort = 3,
	UsbfnInvalidDedicatedChargingPort = 4,
	UsbfnProprietaryCharger = 5,
};

/* EFI_USBFN_ENDPOINT_DIRECTION */
enum { UsbfnEndpointDirectionInput = 0, UsbfnEndpointDirectionOutput = 1 };

/*
 * The descriptor chain EFI_USBFN_IO_CONFIGURE_ENABLE_ENDPOINTS() takes, exactly as
 * QcomPkg/Include/Protocol/EFIUsbfnIo.h defines it:
 *
 *   EFI_USB_DEVICE_INFO     { DeviceDescriptor*, ConfigInfoTable** }
 *   EFI_USB_CONFIG_INFO     { ConfigDescriptor*, InterfaceInfoTable** }
 *   EFI_USB_INTERFACE_INFO  { InterfaceDescriptor*, EndpointDescriptorTable** }
 *
 * (An earlier version of this file passed a flat blob instead, and the driver
 * dereferenced the wrong words: "far=4000000002100123".)
 */
typedef struct {
	uint8_t length;
	uint8_t descriptor_type;
	uint16_t bcd_usb;
	uint8_t device_class, device_sub_class, device_protocol, max_packet_size;
	uint16_t id_vendor, id_product, bcd_device;
	uint8_t str_manufacturer, str_product, str_serial_number, num_configurations;
} __attribute__((packed)) efi_usb_device_descriptor;

typedef struct {
	uint8_t length;
	uint8_t descriptor_type;
	uint16_t total_length;
	uint8_t num_interfaces, configuration_value, configuration, attributes;
	uint8_t max_power;
} __attribute__((packed)) efi_usb_config_descriptor;

typedef struct {
	uint8_t length;
	uint8_t descriptor_type;
	uint8_t interface_number, alternate_setting, num_endpoints;
	uint8_t interface_class, interface_sub_class, interface_protocol, interface_string;
} __attribute__((packed)) efi_usb_interface_descriptor;

typedef struct {
	uint8_t length;
	uint8_t descriptor_type;
	uint8_t endpoint_address, attributes;
	uint16_t max_packet_size;
	uint8_t interval;
} __attribute__((packed)) efi_usb_endpoint_descriptor;

typedef struct {
	efi_usb_interface_descriptor *interface_descriptor;
	efi_usb_endpoint_descriptor **endpoint_descriptor_table;
} efi_usb_interface_info;

typedef struct {
	efi_usb_config_descriptor *config_descriptor;
	efi_usb_interface_info **interface_info_table;
} efi_usb_config_info;

typedef struct {
	efi_usb_device_descriptor *device_descriptor;
	efi_usb_config_info **config_info_table;
} efi_usb_device_info;

struct efi_usbfn_io_protocol {
	uint64_t revision;
	efi_status (EFIAPI *detect_port)(efi_usbfn_io *self, uint32_t *port_type);
	efi_status (EFIAPI *configure_enable_endpoints)(efi_usbfn_io *self, efi_usb_device_info *info);
	efi_status (EFIAPI *get_endpoint_max_packet_size)(efi_usbfn_io *self, uint32_t type, uint32_t speed, uint32_t *size);
	efi_status (EFIAPI *get_device_info)(efi_usbfn_io *self, void *info, uint32_t *size);
	efi_status (EFIAPI *get_vendor_id_product_id)(efi_usbfn_io *self, uint16_t *vid, uint16_t *pid);
	efi_status (EFIAPI *abort_transfer)(efi_usbfn_io *self, uint32_t endpoint, uint32_t direction);
	efi_status (EFIAPI *get_endpoint_stall_state)(efi_usbfn_io *self, uint32_t endpoint, uint32_t direction, uint8_t *stalled);
	efi_status (EFIAPI *set_endpoint_stall_state)(efi_usbfn_io *self, uint32_t endpoint, uint32_t direction, uint8_t stalled);
	efi_status (EFIAPI *event_handler)(efi_usbfn_io *self, void *event, uint64_t *size, void *data);
	efi_status (EFIAPI *transfer)(efi_usbfn_io *self, uint32_t endpoint, uint32_t direction, uint64_t *size, void *buffer);
	efi_status (EFIAPI *get_max_transfer_size)(efi_usbfn_io *self, uint32_t endpoint, uint64_t *size);
	efi_status (EFIAPI *allocate_transfer_buffer)(efi_usbfn_io *self, uint64_t size, void **buffer);
	efi_status (EFIAPI *free_transfer_buffer)(efi_usbfn_io *self, void *buffer);
	efi_status (EFIAPI *start_controller)(efi_usbfn_io *self);
	efi_status (EFIAPI *stop_controller)(efi_usbfn_io *self);
	efi_status (EFIAPI *set_endpoint_policy)(efi_usbfn_io *self, uint32_t endpoint, uint32_t direction, void *policy);
	efi_status (EFIAPI *get_endpoint_policy)(efi_usbfn_io *self, uint32_t endpoint, uint32_t direction, void *policy);
	efi_status (EFIAPI *configure_enable_endpoints_ex)(efi_usbfn_io *self, efi_usb_device_info *info, void *ss_info);
};

