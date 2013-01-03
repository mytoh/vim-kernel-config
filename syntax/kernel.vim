" Vim syntax file
" Language:     generic configure file
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last Change:  2005 Jun 20

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syntax keyword  kernelTodo      contained TODO FIXME XXX
" Avoid matching "text#text", used in /etc/disktab and /etc/gettytab
syntax match    kernelComment   "^#.*" contains=kernelTodo
syntax match    kernelComment   "\s#.*"ms=s+1 contains=kernelTodo
syntax region   kernelString    start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syntax region   kernelString    start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline

syntax keyword kernelConfigName
      \ cpu ident makeoptions options device

" general kernel options {{{

syntax keyword kernelOptions
      \ AAC_DEBUG AHC_ALLOW_MEMIO AHC_TMODE_ENABLE AHC_DUMP_EEPROM
      \ AHC_DEBUG AHC_DEBUG_OPTS AHC_REG_PRETTY_PRINT AHD_DEBUG
      \ AHD_DEBUG_OPTS AHD_TMODE_ENABLE AHD_REG_PRETTY_PRINT ADW_ALLOW_MEMIO

syntax keyword kernelOptions
      \ TWA_DEBUG TWA_FLASH_FIRMWARE

" Debugging options.
syntax keyword kernelOptions
      \ ALT_BREAK_TO_DEBUGGER BREAK_TO_DEBUGGER DDB DDB_BUFR_SIZE
      \ DDB_CAPTURE_DEFAULTBUFSIZE DDB_CAPTURE_MAXBUFSIZE
      \ DDB_CTF DDB_NUMSYM GDB KDB KDB_TRACE KDB_UNATTENDED
      \ KLD_DEBUG SYSCTL_DEBUG TEXTDUMP_PREFERRED TEXTDUMP_VERBOSE

" Miscellaneous options.
syntax keyword kernelOptions
      \ ADAPTIVE_LOCKMGRS ALQ AUDIT CAPABILITIES CAPABILITY_MODE
      \ COMPAT_43 COMPAT_43TTY COMPAT_FREEBSD4 COMPAT_FREEBSD5 COMPAT_FREEBSD6
      \ COMPAT_FREEBSD7 COMPILING_LINT COMPRESS_USER_CORES CY_PCI_FASTINTR
      \ DEADLKRES DIRECTIO FFCLOCK FULL_PREEMPTION IPI_PREEMPTION
      \ GEOM_AES GEOM_BDE GEOM_BSD GEOM_CACHE GEOM_CONCAT GEOM_ELI
      \ GEOM_FOX GEOM_GATE GEOM_JOURNAL GEOM_LABEL GEOM_LINUX_LVM
      \ GEOM_MBR GEOM_MIRROR GEOM_MULTIPATH GEOM_NOP GEOM_PART_APM
      \ GEOM_PART_BSD GEOM_PART_EBR GEOM_PART_EBR_COMPAT GEOM_PART_GPT
      \ GEOM_PART_LDM GEOM_PART_MBR GEOM_PART_PC98 GEOM_PART_VTOC8
      \ GEOM_PC98 GEOM_RAID GEOM_RAID3 GEOM_SHSEC GEOM_STRIPE
      \ GEOM_SUNLABEL GEOM_UNCOMPRESS GEOM_UZIP GEOM_VIRSTOR
      \ GEOM_VOL GEOM_ZERO KDTRACE_HOOKS KSTACK_MAX_PAGES KSTACK_PAGES
      \ KTRACE KTRACE_REQUEST_POOL LIBICONV MAC MAC_BIBA MAC_BSDEXTENDED
      \ MAC_IFOFF MAC_LOMAC MAC_MLS MAC_NONE MAC_PARTITION MAC_PORTACL
      \ MAC_SEEOTHERUIDS MAC_STATIC MAC_STUB MAC_TEST MD_ROOT
      \ MD_ROOT_FSTYPE MD_ROOT_SIZE MFI_DEBUG MFI_DECODE_LOG MPROF_BUFFERS
      \ MPROF_HASH_SIZE NEW_PCIB NO_ADAPTIVE_MUTEXES NO_ADAPTIVE_RWLOCKS
      \ NO_ADAPTIVE_SX NO_SYSCTL_DESCR NSWBUF_MIN MBUF_PACKET_ZONE_DISABLE
      \ PANIC_REBOOT_WAIT_TIME PPC_DEBUG PPC_PROBE_CHIPSET PPS_SYNC
      \ PREEMPTION PROCDESC QUOTA SCHED_4BSD SCHED_STATS SCHED_ULE
      \ SLEEPQUEUE_PROFILING SLHCI_DEBUG SPX_HACK STACK SUIDDIR MSGMNB
      \ MSGMNI MSGSEG MSGSSZ MSGTQL SEMMNI SEMMNS SEMMNU SEMMSL SEMOPM
      \ SEMUME SHMALL SHMMAX SHMMAXPGS SHMMIN SHMMNI SHMSEG SYSVMSG
      \ SYSVSEM SYSVSHM SW_WATCHDOG TURNSTILE_PROFILING UMTX_PROFILING
      \ VFS_AIO VERBOSE_SYSINIT WLCACHE WLDEBUG

" POSIX kernel options
syntax keyword kernelOptions
      \ P1003_1B_MQUEUE P1003_1B_SEMAPHORES _KPOSIX_PRIORITY_SCHEDULING

" Do we want the config file compiled into the kernel?
syntax keyword kernelOptions
      \ INCLUDE_CONFIG_FILE

" Options for static filesystems.  These should only be used at config
" time, since the corresponding lkms cannot work if there are any static
" dependencies.  Unusability is enforced by hiding the defines for the
" options in a never-included header.
syntax keyword kernelOptions
      \ CD9660 EXT2FS FDESCFS FFS FUSE MSDOSFS NANDFS NULLFS PROCFS
      \ PSEUDOFS REISERFS TMPFS UDF UNIONFS

" Pseudofs debugging
syntax keyword kernelOptions
      \ PSEUDOFS_TRACE

" In-kernel GSS-API
syntax keyword kernelOptions
      \ KGSSAPI KGSSAPI_DEBUG

" These static filesystems have one slightly bogus static dependency in
" sys/i386/i386/autoconf.c.  If any of these filesystems are
" statically compiled into the kernel, code for mounting them as root
" filesystems will be enabled - but look below.
syntax keyword kernelOptions
      \ NFSCLIENT NFSSERVER

" Use these options to compile the experimental nfs client and/or
" server that supports NFSv4 into a kernel.
" NFSCL - client
" NFSD - server
syntax keyword kernelOptions
      \ NFSCL NFSD

" filesystems and libiconv bridge
syntax keyword kernelOptions
      \ CD9660_ICONV MSDOSFS_ICONV UDF_ICONV

" If you are following the conditions in the copyright,
" you can enable soft-updates which will speed up a lot of thigs
" and make the system safer from crashes at the same time.
" otherwise a STUB module will be compiled in.
syntax keyword kernelOptions
      \ SOFTUPDATES

" On small, embedded systems, it can be useful to turn off support for
" snapshots.  It saves about 30-40k for a feature that would be lightly
" used, if it is used at all.
syntax keyword kernelOptions
      \ NO_FFS_SNAPSHOT

" Enabling this option turns on support for Access Control Lists in UFS,
" which can be used to support high security configurations.  Depends on
" UFS_EXTATTR.
syntax keyword kernelOptions
      \ UFS_ACL

" Enabling this option turns on support for extended attributes in UFS-based
" filesystems, which can be used to support high security configurations
" as well as new filesystem features.
syntax keyword kernelOptions
      \ UFS_EXTATTR UFS_EXTATTR_AUTOSTART

" Enable fast hash lookups for large directories on UFS-based filesystems.
syntax keyword kernelOptions
      \ UFS_DIRHASH

" Enable gjournal-based UFS journal.
syntax keyword kernelOptions
      \ UFS_GJOURNAL

" The below sentence is not in English, and neither is this one.
" We plan to remove the static dependences above, with a
" <filesystem>_ROOT option to control if it usable as root.  This list
" allows these options to be present in config files already (though
" they won't make any difference yet).
syntax keyword kernelOptions
      \ NFS_ROOT

" Options used only in subr_param.c.
syntax keyword kernelOptions
      \ HZ MAXFILES NBUF NSFBUFS VM_BCACHE_SIZE_MAX VM_SWZONE_SIZE_MAX
      \ MAXUSERS DFLDSIZ MAXDSIZ MAXSSIZ

" Generic SCSI options.
syntax keyword kernelOptions
      \ CAM_MAX_HIGHPOWER CAMDEBUG CAM_DEBUG_COMPILE CAM_DEBUG_DELAY
      \ CAM_DEBUG_BUS CAM_DEBUG_TARGET CAM_DEBUG_LUN
      \ CAM_DEBUG_FLAGS SCSI_DELAY SCSI_NO_SENSE_STRINGS SCSI_NO_OP_STRINGS

" Options used only in cam/ata/ata_da.c
syntax keyword kernelOptions
      \ ADA_TEST_FAILURE

" Options used only in cam/scsi/scsi_cd.c
syntax keyword kernelOptions
      \ CHANGER_MIN_BUSY_SECONDS CHANGER_MAX_BUSY_SECONDS

" Options used only in cam/scsi/scsi_sa.c.
syntax keyword kernelOptions
      \ SA_IO_TIMEOUT SA_SPACE_TIMEOUT SA_REWIND_TIMEOUT SA_ERASE_TIMEOUT
      \ SA_1FM_AT_EOD

" Options used only in cam/scsi/scsi_pt.c
syntax keyword kernelOptions
      \ SCSI_PT_DEFAULT_TIMEOUT

" Options used only in cam/scsi/scsi_ses.c
syntax keyword kernelOptions
      \ SES_ENABLE_PASSTHROUGH

" Options used in dev/sym/ (Symbios SCSI driver).
syntax keyword kernelOptions
      \ SYM_SETUP_LP_PROBE_MAP SYM_SETUP_SCSI_DIFF
      \ SYM_SETUP_PCI_PARITY SYM_SETUP_MAX_LUN


" Options used only in pci/ncr.c
syntax keyword kernelOptions
      \ SCSI_NCR_DEBUG SCSI_NCR_MAX_SYNC SCSI_NCR_MAX_WIDE
      \ SCSI_NCR_MYADDR

" Options used only in dev/isp/*
syntax keyword kernelOptions
      \ ISP_TARGET_MODE ISP_FW_CRASH_DUMP ISP_DEFAULT_ROLES ISP_INTERNAL_TARGET

" Options used only in dev/iscsi
syntax keyword kernelOptions
      \ ISCSI_INITIATOR_DEBUG

" Options used in the 'ata' ATA/ATAPI driver
syntax keyword kernelOptions
      \ ATA_STATIC_ID ATA_NOPCI ATA_REQUEST_TIMEOUT ATA_CAM

" Net stuff.
syntax keyword kernelOptions
      \ ACCEPT_FILTER_DATA ACCEPT_FILTER_DNS ACCEPT_FILTER_HTTP
      \ ALTQ ALTQ_CBQ ALTQ_CDNR ALTQ_DEBUG ALTQ_HFSC ALTQ_NOPCC
      \ ALTQ_PRIQ ALTQ_RED ALTQ_RIO BOOTP BOOTP_BLOCKSIZE
      \ BOOTP_COMPAT BOOTP_NFSROOT BOOTP_NFSV3 BOOTP_WIRED_TO
      \ DEVICE_POLLING DEV_ENC DEV_PF DEV_PFLOG DEV_PFSYNC
      \ DEV_VLAN DUMMYNET ETHER_8022 ETHER_8023 ETHER_II
      \ ETHER_SNAP INET INET6 IPDIVERT IPFILTER IPFILTER_DEFAULT_BLOCK
      \ IPFILTER_LOG IPFILTER_LOOKUP IPFIREWALL IPFIREWALL_DEFAULT_TO_ACCEPT
      \ IPFIREWALL_NAT IPFIREWALL_VERBOSE IPFIREWALL_VERBOSE_LIMIT
      \ IPSEC IPSEC_DEBUG IPSEC_FILTERTUNNEL IPSEC_NAT_T
      \ IPSTEALTH IPX KRPC LIBALIAS LIBMBPOOL LIBMCHAIN MBUF_PROFILING
      \ MBUF_STRESS_TEST MROUTING NETATALK NFSLOCKD PCBGROUP
      \ PF_DEFAULT_TO_DROP RADIX_MPATH ROUTETABLES SLIP_IFF_OPTS
      \ TCPDEBUG TCP_OFFLOAD TCP_SIGNATURE VLAN_ARRAY XBONEHACK
      \ FLOWTABLE

"
" SCTP
"
syntax keyword kernelOptions
      \ SCTP SCTP_DEBUG SCTP_WITH_NO_CSUM SCTP_LOCK_LOGGING
      \ SCTP_MBUF_LOGGING SCTP_MBCNT_LOGGING SCTP_PACKET_LOGGING
      \ SCTP_LTRACE_CHUNKS SCTP_LTRACE_ERRORS SCTP_USE_PERCPU_STAT
      \ SCTP_MCORE_INPUT

" Netgraph(4). Use option NETGRAPH to enable the base netgraph code.
" Each netgraph node type can be either be compiled into the kernel
" or loaded dynamically. To get the former, include the corresponding
" option below. Each type has its own man page, e.g. ng_async(4).
syntax keyword kernelOptions
      \ NETGRAPH NETGRAPH_DEBUG NETGRAPH_ASYNC NETGRAPH_ATMLLC
      \ NETGRAPH_ATM_ATMPIF NETGRAPH_BLUETOOTH NETGRAPH_BLUETOOTH_BT3C
      \ NETGRAPH_BLUETOOTH_H4 NETGRAPH_BLUETOOTH_HCI NETGRAPH_BLUETOOTH_L2CAP
      \ NETGRAPH_BLUETOOTH_SOCKET NETGRAPH_BLUETOOTH_UBT NETGRAPH_BLUETOOTH_UBTBCMFW
      \ NETGRAPH_BPF NETGRAPH_BRIDGE NETGRAPH_CAR NETGRAPH_CISCO
      \ NETGRAPH_DEFLATE NETGRAPH_DEVICE NETGRAPH_ECHO NETGRAPH_EIFACE
      \ NETGRAPH_ETHER NETGRAPH_ETHER_ECHO NETGRAPH_FEC
      \ NETGRAPH_FRAME_RELAY NETGRAPH_GIF NETGRAPH_GIF_DEMUX
      \ NETGRAPH_HOLE NETGRAPH_IFACE NETGRAPH_IP_INPUT
      \ NETGRAPH_IPFW NETGRAPH_KSOCKET NETGRAPH_L2TP NETGRAPH_LMI
" MPPC compression requires proprietary files (not included)
syntax keyword kernelOptions
      \ NETGRAPH_MPPC_COMPRESSION NETGRAPH_MPPC_ENCRYPTION
      \ NETGRAPH_NAT NETGRAPH_NETFLOW NETGRAPH_ONE2MANY NETGRAPH_PATCH
      \ NETGRAPH_PIPE NETGRAPH_PPP NETGRAPH_PPPOE NETGRAPH_PPTPGRE
      \ NETGRAPH_PRED1 NETGRAPH_RFC1490 NETGRAPH_SOCKET NETGRAPH_SPLIT
      \ NETGRAPH_SPPP NETGRAPH_TAG NETGRAPH_TCPMSS NETGRAPH_TEE
      \ NETGRAPH_TTY NETGRAPH_UI NETGRAPH_VJC NETGRAPH_VLAN

" NgATM options
syntax keyword kernelOptions
      \ NGATM_ATM NGATM_ATMBASE NGATM_SSCOP NGATM_SSCFU NGATM_UNI
      \ NGATM_CCATM

" DRM options
syntax keyword kernelOptions
      \ DRM_DEBUG

syntax keyword kernelOptions
      \ SOCKET_SEND_COW SOCKET_RECV_PFLIP TI_SF_BUF_JUMBO TI_JUMBO_HDRSPLIT

" XXX Conflict: # of devices vs network protocol (Native ATM).
" This makes "" unusable.
syntax keyword kernelOptions
      \ NATM

" DPT driver debug flags
syntax keyword kernelOptions
      \ DPT_MEASURE_PERFORMANCE DPT_HANDLE_TIMEOUTS DPT_TIMEOUT_FACTOR
      \ DPT_LOST_IRQ DPT_RESET_HBA

" Misc debug flags.  Most of these should probably be replaced with
" 'DEBUG', and then let people recompile just the interesting modules
" with 'make CC="cc -DDEBUG"'.
syntax keyword kernelOptions
      \ CLUSTERDEBUG DEBUG_1284 VP0_DEBUG LPT_DEBUG PLIP_DEBUG
      \ LOCKF_DEBUG NETATALKDEBUG SI_DEBUG

" Fb options
syntax keyword kernelOptions
      \ FB_DEBUG FB_INSTALL_CDEV

" ppbus related options
syntax keyword kernelOptions
      \ PERIPH_1284 DONTPROBE_1284

" smbus related options
syntax keyword kernelOptions
      \ ENABLE_ALART

" These cause changes all over the kernel
syntax keyword kernelOptions
      \ BLKDEV_IOSIZE BURN_BRIDGES DEBUG DEBUG_LOCKS DEBUG_VFS_LOCKS
      \ DFLTPHYS DIAGNOSTIC INVARIANT_SUPPORT INVARIANTS
      \ MAXCPU MAXPHYS MCLSHIFT MUTEX_DEBUG MUTEX_NOINLINE
      \ LOCK_PROFILING LOCK_PROFILING_FAST MSIZE REGRESSION
      \ RWLOCK_NOINLINE SX_NOINLINE VFS_BIO_DEBUG

" These are VM related options
syntax keyword kernelOptions
      \ VM_KMEM_SIZE VM_KMEM_SIZE_SCALE VM_KMEM_SIZE_MAX VM_NRESERVLEVEL
      \ VM_LEVEL_0_ORDER NO_SWAPPING MALLOC_MAKE_FAILURES
      \ MALLOC_PROFILE MALLOC_DEBUG_MAXZONES

" The MemGuard replacement allocator used for tamper-after-free detection
syntax keyword kernelOptions
      \ DEBUG_MEMGUARD

" The RedZone malloc(9) protection
syntax keyword kernelOptions
      \ DEBUG_REDZONE

" Standard SMP options
syntax keyword kernelOptions
      \ SMP

" Size of the kernel message buffer
syntax keyword kernelOptions
      \ MSGBUF_SIZE

" NFS options
syntax keyword kernelOptions
      \ NFS_MINATTRTIMO NFS_MAXATTRTIMO NFS_MINDIRATTRTIMO NFS_MAXDIRATTRTIMO
      \ NFS_GATHERDELAY NFS_WDELAYHASHSIZ NFS_DEBUG

" For the Bt848/Bt848A/Bt849/Bt878/Bt879 driver
syntax keyword kernelOptions
      \ OVERRIDE_CARD OVERRIDE_TUNER OVERRIDE_DBX OVERRIDE_MSP
      \ BROOKTREE_SYSTEM_DEFAULT BROOKTREE_ALLOC_PAGES BKTR_OVERRIDE_CARD
      \ BKTR_OVERRIDE_TUNER BKTR_OVERRIDE_DBX BKTR_OVERRIDE_MSP
      \ BKTR_SYSTEM_DEFAULT BKTR_ALLOC_PAGES BKTR_USE_PLL
      \ BKTR_GPIO_ACCESS BKTR_NO_MSP_RESET BKTR_430_FX_MODE
      \ BKTR_SIS_VIA_MODE BKTR_USE_FREEBSD_SMBUS BKTR_NEW_MSP34XX_DRIVER

" Options to support PPS
syntax keyword kernelOptions
      \ UART_PPS_ON_CTS

" options for bus/device framework
syntax keyword kernelOptions
      \ BUS_DEBUG

" options for USB support
syntax keyword kernelOptions
      \ USB_DEBUG USB_HOST_ALIGN USB_REQ_DEBUG USB_VERBOSE
      \ USB_EHCI_BIG_ENDIAN_DESC U3G_DEBUG UKBD_DFLT_KEYMAP
      \ UPLCOM_INTR_INTERVAL UVSCOM_DEFAULT_OPKTSIZE UVSCOM_INTR_INTERVAL

" Embedded system options
syntax keyword kernelOptions
      \ INIT_PATH

syntax keyword kernelOptions
      \ ROOTDEVNAME

syntax keyword kernelOptions
      \ FDC_DEBUG PCFCLOCK_VERBOSE PCFCLOCK_MAX_RETRIES

syntax keyword kernelOptions
      \ KTR KTR_ALQ KTR_MASK KTR_CPUMASK KTR_COMPILE KTR_ENTRIES
      \ KTR_VERBOSE WITNESS WITNESS_KDB WITNESS_SKIPSPIN

" options for ACPI support
syntax keyword kernelOptions
      \ ACPI_DEBUG ACPI_MAX_TASKS ACPI_MAX_THREADS

" ISA support
syntax keyword kernelOptions
      \ DEV_ISA ISAPNP

" various 'device presence' options.
syntax keyword kernelOptions
      \ DEV_BPF DEV_NETMAP DEV_MCA DEV_CARP DEV_SPLASH

" EISA support
syntax keyword kernelOptions
      \ DEV_EISA EISA_SLOTS

" ed driver
syntax keyword kernelOptions
      \ ED_HPP ED_3C503 ED_SIC

" bce driver
syntax keyword kernelOptions
      \ BCE_DEBUG BCE_NVRAM_WRITE_SUPPORT

" bxe driver
syntax keyword kernelOptions
      \ BXE_DEBUG BXE_NVRAM_WRITE_SUPPORT

syntax keyword kernelOptions
      \ SOCKBUF_DEBUG


" options for ubsec driver
syntax keyword kernelOptions
      \ UBSEC_DEBUG UBSEC_RNDTEST UBSEC_NO_RNG

" options for hifn driver
syntax keyword kernelOptions
      \ HIFN_DEBUG HIFN_RNDTEST

" options for safenet driver
syntax keyword kernelOptions
      \ SAFE_DEBUG SAFE_NO_RNG SAFE_RNDTEST

" syscons options
syntax keyword kernelOptions
      \ MAXCONS SC_ALT_MOUSE_IMAGE SC_CUT_SPACES2TABS SC_CUT_SEPCHARS
      \ SC_DEBUG_LEVEL SC_DFLT_FONT SC_DISABLE_KDBKEY SC_DISABLE_REBOOT
      \ SC_HISTORY_SIZE SC_KERNEL_CONS_ATTR SC_KERNEL_CONS_REV_ATTR
      \ SC_MOUSE_CHAR SC_NO_CUTPASTE SC_NO_FONT_LOADING SC_NO_HISTORY
      \ SC_NO_MODE_CHANGE SC_NO_SUSPEND_VTYSWITCH SC_NO_SYSMOUSE
      \ SC_NORM_ATTR SC_NORM_REV_ATTR SC_PIXEL_MODE
      \ SC_RENDER_DEBUG SC_TWOBUTTON_MOUSE

" teken terminal emulator options
syntax keyword kernelOptions
      \ TEKEN_CONS25 TEKEN_UTF8

" options for printf
syntax keyword kernelOptions
      \ PRINTF_BUFR_SIZE

" kbd options
syntax keyword kernelOptions
      \ KBD_DISABLE_KEYMAP_LOAD KBD_INSTALL_CDEV KBD_MAXRETRY
      \ KBD_MAXWAIT KBD_RESETDELAY KBDIO_DEBUG

" options for the Atheros driver
syntax keyword kernelOptions
      \ ATH_DEBUG ATH_TXBUF ATH_RXBUF ATH_DIAGAPI ATH_TX99_DIAG
      \ ATH_ENABLE_11N ATH_ENABLE_DFS ATH_EEPROM_FIRMWARE
      \ ATH_ENABLE_RADIOTAP_VENDOR_EXT
" options for the Atheros hal
syntax keyword kernelOptions
      \ AH_SUPPORT_AR5416
" XXX For now, this breaks non-AR9130 chipsets, so only use it
" XXX when actually targetting AR9130.
syntax keyword kernelOptions
      \ AH_SUPPORT_AR9130

syntax keyword kernelOptions
      \ AH_DEBUG AH_ASSERT AH_DEBUG_ALQ AH_REGOPS_FUNC AH_WRITE_REGDOMAIN
      \ AH_DEBUG_COUNTRY AH_WRITE_EEPROM AH_PRIVATE_DIAG AH_NEED_DESC_SWAP
      \ AH_USE_INIPDGAIN AH_MAXCHAN AH_RXCFG_SDMAMW_4BYTES

" AR5416 and later interrupt mitigation
" XXX do not use this for AR9130
syntax keyword kernelOptions
      \ AH_AR5416_INTERRUPT_MITIGATION

" options for the Broadcom BCM43xx driver (bwi)
syntax keyword kernelOptions
      \ BWI_DEBUG BWI_DEBUG_VERBOSE

" options for the Marvell 8335 wireless driver
syntax keyword kernelOptions
      \ MALO_DEBUG MALO_TXBUF MALO_RXBUF

" options for the Marvell wireless driver
syntax keyword kernelOptions
      \ MWL_DEBUG MWL_TXBUF MWL_RXBUF MWL_DIAGAPI MWL_AGGR_SIZE
      \ MWL_TX_NODROP

" dcons options
syntax keyword kernelOptions
      \ DCONS_BUF_SIZE DCONS_POLL_HZ DCONS_FORCE_CONSOLE DCONS_FORCE_GDB

" HWPMC options
syntax keyword kernelOptions
      \ HWPMC_HOOKS HWPMC_MIPS_BACKTRACE

" XBOX options for FreeBSD/i386, but some files are MI
syntax keyword kernelOptions
      \ XBOX

syntax keyword kernelOptions
      \ ZFS

" Interrupt filtering
syntax keyword kernelOptions
      \ INTR_FILTER

" 802.11 support layer
syntax keyword kernelOptions
      \ IEEE80211_DEBUG IEEE80211_DEBUG_REFCNT IEEE80211_AMPDU_AGE
      \ IEEE80211_SUPPORT_MESH IEEE80211_SUPPORT_SUPERG
      \ IEEE80211_SUPPORT_TDMA IEEE80211_ALQ IEEE80211_DFS_DEBUG

" 802.11 TDMA support
syntax keyword kernelOptions
      \ TDMA_SLOTLEN_DEFAULT TDMA_SLOTCNT_DEFAULT TDMA_BINTVAL_DEFAULT
      \ TDMA_TXRATE_11B_DEFAULT TDMA_TXRATE_11G_DEFAULT TDMA_TXRATE_11A_DEFAULT
      \ TDMA_TXRATE_TURBO_DEFAULT TDMA_TXRATE_HALF_DEFAULT TDMA_TXRATE_QUARTER_DEFAULT
      \ TDMA_TXRATE_11NA_DEFAULT TDMA_TXRATE_11NG_DEFAULT

" Network stack virtualization options
syntax keyword kernelOptions
      \ VIMAGE VNET_DEBUG

" Common Flash Interface (CFI) options
syntax keyword kernelOptions
      \ CFI_SUPPORT_STRATAFLASH CFI_ARMEDANDDANGEROUS

" Sound options
syntax keyword kernelOptions
      \ SND_DEBUG SND_DIAGNOSTIC SND_FEEDER_MULTIFORMAT
      \ SND_FEEDER_FULL_MULTIFORMAT SND_FEEDER_RATE_HP
      \ SND_PCM_64 SND_OLDSTEREO

syntax keyword kernelOptions
      \ X86BIOS

" Flattened device tree options
syntax keyword kernelOptions
      \ FDT FDT_DTB_STATIC

" OFED Infiniband stack
syntax keyword kernelOptions
      \ OFED OFED_DEBUG_INIT SDP SDP_DEBUG IPOIB IPOIB_DEBUG
      \ IPOIB_CM

" Resource Accounting
syntax keyword kernelOptions
      \ RACCT

" Resource Limits
syntax keyword kernelOptions
      \ RCTL

" }}}

" amd64 kernel options {{{

syntax keyword kernelOptionsAmd
      \ AUTO_EOI_1 AUTO_EOI_2 COUNT_XINVLTLB_HITS COUNT_IPIS MAXMEM
      \ PERFMON MPTABLE_FORCE_HTT MP_WATCHDOG NKPT PV_STATS

" Options for emulators.  These should only be used at config time, so
" they are handled like options for static filesystems
" (see src/sys/conf/options), except for broken debugging options.
syntax keyword kernelOptionsAmd
      \ COMPAT_FREEBSD32 IBCS2 COMPAT_LINUX COMPAT_LINUX32
      \ COMPAT_SVR4 DEBUG_SVR4 LINPROCFS LINSYSFS NDISAPI

syntax keyword kernelOptionsAmd
      \ TIMER_FREQ

" options for serial support
syntax keyword kernelOptionsAmd
      \ COM_ESP COM_MULTIPORT CONSPEED GDBSPEED COM_NO_ACPI

syntax keyword kernelOptionsAmd
      \ VGA_ALT_SEQACCESS VGA_DEBUG VGA_NO_FONT_LOADING
      \ VGA_NO_MODE_CHANGE VGA_SLOW_IOACCESS VGA_WIDTH90

syntax keyword kernelOptionsAmd
      \ VESA VESA_DEBUG

" AGP debugging support
syntax keyword kernelOptionsAmd
      \ AGP_DEBUG

syntax keyword kernelOptionsAmd
      \ ATKBD_DFLT_KEYMAP

" -------------------------------
" EOF
" -------------------------------
syntax keyword kernelOptionsAmd
      \ HAMMER PSM_HOOKRESUME PSM_RESETAFTERSUSPEND PSM_DEBUG DEV_ATPIC

" Debugging
syntax keyword kernelOptionsAmd
      \ KDTRACE_FRAME

" BPF just-in-time compiler
syntax keyword kernelOptionsAmd
      \ BPF_JITTER

syntax keyword kernelOptionsAmd
      \ XENHVM

" options for the Intel C600 SAS driver (isci)
syntax keyword kernelOptionsAmd
      \ ISCI_LOGGING

" hw random number generators for random(4)
syntax keyword kernelOptionsAmd
      \ PADLOCK_RNG RDRAND_RNG
"}}}

" kernel options from NOTES {{{

syntax keyword kernelOptions
      \ MAXDSIZ MAXSSIZ DFLDSIZ

syntax keyword kernelOptions
      \ BLKDEV_IOSIZE

syntax keyword kernelOptions
      \ DFLTPHYS MAXPHYS

syntax keyword kernelOptions
      \ INCLUDE_CONFIG_FILE

syntax keyword kernelOptions
      \ GEOM_AES GEOM_BDE GEOM_BSD GEOM_CACHE GEOM_CONCAT GEOM_ELI
      \ GEOM_FOX GEOM_GATE GEOM_JOURNAL GEOM_LABEL GEOM_LINUX_LVM
      \ GEOM_MBR GEOM_MIRROR GEOM_MULTIPATH GEOM_NOP GEOM_PART_APM
      \ GEOM_PART_BSD GEOM_PART_EBR GEOM_PART_EBR_COMPAT GEOM_PART_GPT
      \ GEOM_PART_LDM GEOM_PART_MBR GEOM_PART_PC98 GEOM_PART_VTOC8
      \ GEOM_PC98 GEOM_RAID GEOM_RAID3 GEOM_SHSEC GEOM_STRIPE
      \ GEOM_SUNLABEL GEOM_UZIP GEOM_VIRSTOR GEOM_VOL GEOM_ZERO

syntax keyword kernelOptions
      \ ROOTDEVNAME

syntax keyword kernelOptions
      \ SCHED_4BSD SCHED_STATS

syntax keyword kernelOptions
      \ SMP

syntax keyword kernelOptions
      \ MAXCPU

syntax keyword kernelOptions
      \ NO_ADAPTIVE_MUTEXES

syntax keyword kernelOptions
      \ NO_ADAPTIVE_RWLOCKS

syntax keyword kernelOptions
      \ NO_ADAPTIVE_SX

syntax keyword kernelOptions
      \ MUTEX_NOINLINE

syntax keyword kernelOptions
      \ RWLOCK_NOINLINE

syntax keyword kernelOptions
      \ SX_NOINLINE

syntax keyword kernelOptions
      \ PREEMPTION FULL_PREEMPTION MUTEX_DEBUG WITNESS WITNESS_KDB
      \ WITNESS_SKIPSPIN

syntax keyword kernelOptions
      \ LOCK_PROFILING

syntax keyword kernelOptions
      \ MPROF_BUFFERS MPROF_HASH_SIZE

syntax keyword kernelOptions
      \ SLEEPQUEUE_PROFILING TURNSTILE_PROFILING UMTX_PROFILING


syntax keyword kernelOptions
      \ COMPAT_43

syntax keyword kernelOptions
      \ COMPAT_43TTY

syntax keyword kernelOptions
      \ COMPAT_FREEBSD4

syntax keyword kernelOptions
      \ COMPAT_FREEBSD5

syntax keyword kernelOptions
      \ COMPAT_FREEBSD6

syntax keyword kernelOptions
      \ COMPAT_FREEBSD7

syntax keyword kernelOptions
      \ SYSVSHM SYSVSEM SYSVMSG

syntax keyword kernelOptions
      \ KDB

syntax keyword kernelOptions
      \ KDB_TRACE

syntax keyword kernelOptions
      \ KDB_UNATTENDED

syntax keyword kernelOptions
      \ DDB

syntax keyword kernelOptions
      \ DDB_NUMSYM

syntax keyword kernelOptions
      \ GDB

syntax keyword kernelOptions
      \ SYSCTL_DEBUG

syntax keyword kernelOptions
      \ TEXTDUMP_PREFERRED

syntax keyword kernelOptions
      \ TEXTDUMP_VERBOSE

syntax keyword kernelOptions
      \ NO_SYSCTL_DESCR

syntax keyword kernelOptions
      \ MALLOC_DEBUG_MAXZONES

syntax keyword kernelOptions
      \ DEBUG_MEMGUARD

syntax keyword kernelOptions
      \ DEBUG_REDZONE

syntax keyword kernelOptions
      \ KTRACE KTRACE_REQUEST_POOL

syntax keyword kernelOptions
      \ KTR KTR_ENTRIES KTR_COMPILE KTR_MASK KTR_CPUMASK KTR_VERBOSE

syntax keyword kernelOptions
      \ ALQ KTR_ALQ

syntax keyword kernelOptions
      \ INVARIANTS

syntax keyword kernelOptions
      \ INVARIANT_SUPPORT

syntax keyword kernelOptions
      \ DIAGNOSTIC

syntax keyword kernelOptions
      \ REGRESSION

syntax keyword kernelOptions
      \ COMPILING_LINT

syntax keyword kernelOptions
      \ STACK

syntax keyword kernelOptions
      \ HWPMC_HOOKS

syntax keyword kernelOptions
      \ INET  INET6

syntax keyword kernelOptions
      \ ROUTETABLES

syntax keyword kernelOptions
      \ TCP_OFFLOAD

syntax keyword kernelOptions
      \ IPSEC

syntax keyword kernelOptions
      \ IPSEC_NAT_T

syntax keyword kernelOptions
      \ IPX

syntax keyword kernelOptions
      \ NETATALK NETATALKDEBUG

syntax keyword kernelOptions
      \ LIBMCHAIN

syntax keyword kernelOptions
      \ LIBALIAS

syntax keyword kernelOptions
      \ FLOWTABLE

syntax keyword kernelOptions
      \ SCTP

syntax keyword kernelOptions
      \ SCTP_DEBUG

syntax keyword kernelOptions
      \ SCTP_WITH_NO_CSUM

syntax keyword kernelOptions
      \ SCTP_LOCK_LOGGING SCTP_MBUF_LOGGING SCTP_MBCNT_LOGGING
      \ SCTP_PACKET_LOGGING SCTP_LTRACE_CHUNKS SCTP_LTRACE_ERRORS

syntax keyword kernelOptions
      \ ALTQ ALTQ_CBQ ALTQ_RED ALTQ_RIO ALTQ_HFSC ALTQ_CDNR
      \ ALTQ_PRIQ ALTQ_NOPCC ALTQ_DEBUG

syntax keyword kernelOptions
      \ NETGRAPH NETGRAPH_DEBUG

syntax keyword kernelOptions
      \ NETGRAPH_ASYNC NETGRAPH_ATMLLC NETGRAPH_ATM_ATMPIF
      \ NETGRAPH_BLUETOOTH NETGRAPH_BLUETOOTH_BT3C NETGRAPH_BLUETOOTH_HCI
      \ NETGRAPH_BLUETOOTH_L2CAP NETGRAPH_BLUETOOTH_SOCKET
      \ NETGRAPH_BLUETOOTH_UBT    NETGRAPH_BLUETOOTH_UBTBCMFW
      \ NETGRAPH_BPF NETGRAPH_BRIDGE NETGRAPH_CAR NETGRAPH_CISCO
      \ NETGRAPH_DEFLATE NETGRAPH_DEVICE NETGRAPH_ECHO NETGRAPH_EIFACE
      \ NETGRAPH_ETHER NETGRAPH_FEC NETGRAPH_FRAME_RELAY NETGRAPH_GIF
      \ NETGRAPH_GIF_DEMUX NETGRAPH_HOLE NETGRAPH_IFACE NETGRAPH_IP_INPUT
      \ NETGRAPH_IPFW NETGRAPH_KSOCKET NETGRAPH_L2TP NETGRAPH_LMI

syntax keyword kernelOptions
      \ NETGRAPH_MPPC_ENCRYPTION NETGRAPH_NETFLOW NETGRAPH_NAT
      \ NETGRAPH_ONE2MANY NETGRAPH_PATCH NETGRAPH_PIPE NETGRAPH_PPP
      \ NETGRAPH_PPPOE NETGRAPH_PPTPGRE NETGRAPH_PRED1 NETGRAPH_RFC1490
      \ NETGRAPH_SOCKET NETGRAPH_SPLIT NETGRAPH_SPPP NETGRAPH_TAG
      \ NETGRAPH_TCPMSS NETGRAPH_TEE NETGRAPH_UI NETGRAPH_VJC NETGRAPH_VLAN

syntax keyword kernelOptions
      \ NGATM_ATM NGATM_ATMBASE NGATM_SSCOP NGATM_SSCFU NGATM_UNI
      \ NGATM_CCATM

syntax keyword kernelOptions
      \ IEEE80211_DEBUG IEEE80211_AMPDU_AGE IEEE80211_SUPPORT_MESH
      \ IEEE80211_SUPPORT_TDMA

syntax keyword kernelOptions
      \ XBONEHACK

syntax keyword kernelOptions
      \ ETHER_II ETHER_8023 ETHER_8022 ETHER_SNAP

syntax keyword kernelOptions
      \ MROUTING IPFIREWALL IPFIREWALL_VERBOSE IPFIREWALL_VERBOSE_LIMIT
      \ IPFIREWALL_DEFAULT_TO_ACCEPT IPFIREWALL_NAT IPDIVERT
      \ IPFILTER IPFILTER_LOG IPFILTER_LOOKUP IPFILTER_DEFAULT_BLOCK
      \ IPSTEALTH PF_DEFAULT_TO_DROP TCPDEBUG RADIX_MPATH

syntax keyword kernelOptions
      \ MBUF_STRESS_TEST MBUF_PROFILING

syntax keyword kernelOptions
      \ ACCEPT_FILTER_DATA ACCEPT_FILTER_DNS ACCEPT_FILTER_HTTP

syntax keyword kernelOptions
      \ TCP_SIGNATURE

syntax keyword kernelOptions
      \ DUMMYNET

syntax keyword kernelOptions
      \ SOCKET_SEND_COW SOCKET_RECV_PFLIP

syntax keyword kernelOptions
      \ FFS NFSCLIENT

syntax keyword kernelOptions
      \ CD9660 FDESCFS FUSE MSDOSFS NFSSERVER NFSLOCKD NFSCL
      \ NFSD KGSSAPI

syntax keyword kernelOptions
      \ NULLFS PROCFS PSEUDOFS PSEUDOFS_TRACE TMPFS UDF UNIONFS

syntax keyword kernelOptions
      \ NFS_ROOT

syntax keyword kernelOptions
      \ SOFTUPDATES

syntax keyword kernelOptions
      \ UFS_EXTATTR UFS_EXTATTR_AUTOSTART

syntax keyword kernelOptions
      \ UFS_ACL

syntax keyword kernelOptions
      \ UFS_DIRHASH

syntax keyword kernelOptions
      \ UFS_GJOURNAL

syntax keyword kernelOptions
      \ MD_ROOT_SIZE

syntax keyword kernelOptions
      \ MD_ROOT

syntax keyword kernelOptions
      \ QUOTA

syntax keyword kernelOptions
      \ SUIDDIR

syntax keyword kernelOptions
      \ NFS_MINATTRTIMO NFS_MAXATTRTIMO NFS_MINDIRATTRTIMO
      \ NFS_MAXDIRATTRTIMO NFS_GATHERDELAY NFS_WDELAYHASHSIZ
      \ NFS_DEBUG

syntax keyword kernelOptions
      \ EXT2FS

syntax keyword kernelOptions
      \ REISERFS

syntax keyword kernelOptions
      \ VFS_AIO

syntax keyword kernelOptions
      \ CD9660_ICONV MSDOSFS_ICONV UDF_ICONV

syntax keyword kernelOptions
      \ _KPOSIX_PRIORITY_SCHEDULING

syntax keyword kernelOptions
      \ P1003_1B_SEMAPHORES

syntax keyword kernelOptions
      \ P1003_1B_MQUEUE

syntax keyword kernelOptions
      \ AUDIT

syntax keyword kernelOptions
      \ MAC MAC_BIBA MAC_BSDEXTENDED MAC_IFOFF MAC_LOMAC MAC_MLS
      \ MAC_NONE MAC_PARTITION MAC_PORTACL MAC_SEEOTHERUIDS MAC_STUB
      \ MAC_TEST

syntax keyword kernelOptions
      \ CAPABILITIES CAPABILITY_MODE

syntax keyword kernelOptions
      \ PROCDESC

syntax keyword kernelOptions
      \ HZ

syntax keyword kernelOptions
      \ PPS_SYNC

syntax keyword kernelOptions
      \ FFCLOCK

syntax keyword kernelOptions
      \ CAMDEBUG CAM_DEBUG_COMPILE CAM_DEBUG_FLAGS CAM_DEBUG_BUS
      \ CAM_DEBUG_TARGET CAM_DEBUG_LUN CAM_DEBUG_DELAY CAM_MAX_HIGHPOWER
      \ SCSI_NO_SENSE_STRINGS SCSI_NO_OP_STRINGS SCSI_DELAY

syntax keyword kernelOptions
      \ CHANGER_MIN_BUSY_SECONDS CHANGER_MAX_BUSY_SECONDS

syntax keyword kernelOptions
      \ SA_IO_TIMEOUT SA_SPACE_TIMEOUT SA_REWIND_TIMEOUT SA_ERASE_TIMEOUT
      \ SA_1FM_AT_EOD

syntax keyword kernelOptions
      \ SCSI_PT_DEFAULT_TIMEOUT

syntax keyword kernelOptions
      \ SES_ENABLE_PASSTHROUGH

syntax keyword kernelOptions
      \ LIBICONV

syntax keyword kernelOptions
      \ MSGBUF_SIZE

syntax keyword kernelOptions
      \ KBD_DISABLE_KEYMAP_LOAD KBD_INSTALL_CDEV

syntax keyword kernelOptions
      \ FB_DEBUG

syntax keyword kernelOptions
      \ MAXCONS SC_ALT_MOUSE_IMAGE SC_DFLT_FONT

syntax keyword kernelOptions
      \ SC_DISABLE_KDBKEY SC_DISABLE_REBOOT SC_HISTORY_SIZE SC_MOUSE_CHAR
      \ SC_PIXEL_MODE

syntax keyword kernelOptions
      \ SC_NORM_ATTR SC_NORM_REV_ATTR SC_KERNEL_CONS_ATTR
      \ SC_KERNEL_CONS_REV_ATTR

syntax keyword kernelOptions
      \ SC_CUT_SPACES2TABS SC_CUT_SEPCHARS

syntax keyword kernelOptions
      \ SC_TWOBUTTON_MOUSE

syntax keyword kernelOptions
      \ SC_NO_CUTPASTE SC_NO_FONT_LOADING SC_NO_HISTORY
      \ SC_NO_MODE_CHANGE SC_NO_SYSMOUSE SC_NO_SUSPEND_VTYSWITCH

syntax keyword kernelOptions
      \ TEKEN_CONS25 TEKEN_UTF8

syntax keyword kernelOptions
      \ AHC_ALLOW_MEMIO

syntax keyword kernelOptions
      \ AHC_DUMP_EEPROM

syntax keyword kernelOptions
      \ AHC_TMODE_ENABLE

syntax keyword kernelOptions
      \ AHC_DEBUG

syntax keyword kernelOptions
      \ AHC_DEBUG_OPTS

syntax keyword kernelOptions
      \ AHC_REG_PRETTY_PRINT

syntax keyword kernelOptions
      \ AHD_DEBUG

syntax keyword kernelOptions
      \ AHD_DEBUG_OPTS

syntax keyword kernelOptions
      \ AHD_REG_PRETTY_PRINT

syntax keyword kernelOptions
      \ AHD_TMODE_ENABLE

syntax keyword kernelOptions
      \ ADW_ALLOW_MEMIO

syntax keyword kernelOptions
      \ ISCSI_INITIATOR_DEBUG

syntax keyword kernelOptions
      \ ISP_TARGET_MODE

syntax keyword kernelOptions
      \ ISP_DEFAULT_ROLES

syntax keyword kernelOptions
      \ DPT_TIMEOUT_FACTOR DPT_LOST_IRQ DPT_RESET_HBA

syntax keyword kernelOptions
      \ MFI_DEBUG

syntax keyword kernelOptions
      \ ATA_STATIC_ID

syntax keyword kernelOptions
      \ ATA_CAM

syntax keyword kernelOptions
      \ FDC_DEBUG

syntax keyword kernelOptions
      \ UART_PPS_ON_CTS

syntax keyword kernelOptions
      \ BREAK_TO_DEBUGGER

syntax keyword kernelOptions
      \ ALT_BREAK_TO_DEBUGGER

syntax keyword kernelOptions
      \ AH_SUPPORT_AR5416

syntax keyword kernelOptions
      \ AH_RXCFG_SDMAMW_4BYTES

syntax keyword kernelOptions
      \ MCLSHIFT MSIZE

syntax keyword kernelOptions
      \ NATM

syntax keyword kernelOptions
      \ LIBMBPOOL

syntax keyword kernelOptions
      \ SND_DEBUG SND_DIAGNOSTIC SND_FEEDER_MULTIFORMAT
      \ SND_FEEDER_FULL_MULTIFORMAT SND_FEEDER_RATE_HP SND_PCM_64
      \ SND_OLDSTEREO

syntax keyword kernelOptions
      \ PPC_PROBE_CHIPSET

syntax keyword kernelOptions
      \ DEBUG_1284 PERIPH_1284

syntax keyword kernelOptions
      \ DONTPROBE_1284 VP0_DEBUG LPT_DEBUG PPC_DEBUG PLIP_DEBUG
      \ PCFCLOCK_VERBOSE PCFCLOCK_MAX_RETRIES

syntax keyword kernelOptions
      \ BOOTP

syntax keyword kernelOptions
      \ BOOTP_NFSROOT BOOTP_NFSV3 BOOTP_COMPAT BOOTP_WIRED_TO
      \ BOOTP_BLOCKSIZE

syntax keyword kernelOptions
      \ SW_WATCHDOG

syntax keyword kernelOptions
      \ DEADLKRES

syntax keyword kernelOptions
      \ NSFBUFS

syntax keyword kernelOptions
      \ DEBUG_LOCKS

syntax keyword kernelOptions
      \ USB_DEBUG U3G_DEBUG

syntax keyword kernelOptions
      \ UKBD_DFLT_KEYMAP

syntax keyword kernelOptions
      \ UPLCOM_INTR_INTERVAL

syntax keyword kernelOptions
      \ UVSCOM_DEFAULT_OPKTSIZE UVSCOM_INTR_INTERVAL

syntax keyword kernelOptions
      \ DCONS_BUF_SIZE DCONS_POLL_HZ DCONS_FORCE_CONSOLE DCONS_FORCE_GDB

syntax keyword kernelOptions
      \ HIFN_DEBUG HIFN_RNDTEST

syntax keyword kernelOptions
      \ UBSEC_DEBUG UBSEC_RNDTEST

syntax keyword kernelOptions
      \ INIT_PATH

syntax keyword kernelOptions
      \ BUS_DEBUG DEBUG_VFS_LOCKS SOCKBUF_DEBUG

syntax keyword kernelOptions
      \ VERBOSE_SYSINIT

syntax keyword kernelOptions
      \ SEMMNI

syntax keyword kernelOptions
      \ SEMMNS

syntax keyword kernelOptions
      \ SEMMNU

syntax keyword kernelOptions
      \ SEMMSL

syntax keyword kernelOptions
      \ SEMOPM

syntax keyword kernelOptions
      \ SEMUME

syntax keyword kernelOptions
      \ SHMALL

syntax keyword kernelOptions
      \ SHMMAX SHMMAXPGS

syntax keyword kernelOptions
      \ SHMMIN

syntax keyword kernelOptions
      \ SHMMNI

syntax keyword kernelOptions
      \ SHMSEG

syntax keyword kernelOptions
      \ COMPRESS_USER_CORES

syntax keyword kernelOptions
      \ PANIC_REBOOT_WAIT_TIME

syntax keyword kernelOptions
      \ DIRECTIO

syntax keyword kernelOptions
      \ NSWBUF_MIN

syntax keyword kernelOptions
      \ CAM_DEBUG_DELAY

syntax keyword kernelOptions
      \ CLUSTERDEBUG

syntax keyword kernelOptions
      \ DEBUG

syntax keyword kernelOptions
      \ LOCKF_DEBUG

syntax keyword kernelOptions
      \ MSGMNB MSGMNI MSGSEG MSGSSZ MSGTQL

syntax keyword kernelOptions
      \ NBUF

syntax keyword kernelOptions
      \ SCSI_NCR_DEBUG SCSI_NCR_MAX_SYNC SCSI_NCR_MAX_WIDE SCSI_NCR_MYADDR

syntax keyword kernelOptions
      \ SC_DEBUG_LEVEL SC_RENDER_DEBUG

syntax keyword kernelOptions
      \ VFS_BIO_DEBUG

syntax keyword kernelOptions
      \ KSTACK_MAX_PAGES

syntax keyword kernelOptions
      \ AAC_DEBUG

syntax keyword kernelOptions
      \ RACCT

syntax keyword kernelOptions
      \ RCTL

syntax keyword kernelOptions
      \ BROOKTREE_ALLOC_PAGES MAXFILES

" }}}

" device options from NOTES {{{

syntax keyword kernelDevices
      \ hwpmc mn loop ether vlan wlan wlan_wep wlan_ccmp wlan_tkip
      \ wlan_xauth wlan_acl wlan_amrr token fddi arcnet sppp
      \ bpf netmap disc epair edsc tap tun gif gre faith stf ef
      \ pf pflog pfsync if_bridge carp enc lagg random mem ksyms
      \ scbus ch da sa cd ses pt targ targbh pass sg ctl pty nmdm
      \ md snp ccd firmware splash blank_saver daemon_saver dragon_saver
      \ fade_saver fire_saver green_saver logo_saver rain_saver snake_saver
      \ star_saver warp_saver sc bt adv adw aha aic ahb ahc ahd esp
      \ iscsi_initiator isp ispfw mpt ncr sym trm wds dpt ciss
      \ iir mly ida mlx amr amrp mfi mfip twe ahci mvs siis ata
      \ fdc uart scc puc mii mii_bitbang miibus acphy amphy atphy
      \ axphy bmtphy brgphy ciphy e1000phy gentbi icsphy ip1000phy
      \ jmphy lxtphy mlphy nsgphy nsphy nsphyter pnaphy qsphy
      \ rdcphy rgephy rlphy rlswitch smcphy tdkphy tlphy truephy
      \ xmphy cm ep ex fe fea sn an wi xe ae age alc ale bce
      \ bfe bge cas cxgb cxgb_t3fw dc et fxp gem hme jme lge msk my
      \ nge re rl pcn sf sge sis sk ste stge tl tx vr vte wb xl
      \ bxe cxgbe de em igb ixgb ixgbe le mxge nxge oce ti txp vx
      \ vxge fpa lmc ath ath_hal ath_rate_sample bwi bwn malo mwl mwlfw
      \ ral atm en fatm hatm patm utopia sound snd_ad1816 snd_als4000
      \ snd_atiixp snd_cmi snd_cs4281 snd_csa snd_ds1 snd_emu10k1
      \ snd_emu10kx snd_envy24 snd_envy24ht snd_es137x snd_ess
      \ snd_fm801 snd_gusc snd_hda snd_hdspe snd_ich snd_maestro
      \ snd_maestro3 snd_mss snd_neomagic snd_sb16 snd_sb8 snd_sbc
      \ snd_solo snd_spicds snd_t4dwave snd_uaudio snd_via8233 snd_via82c686
      \ snd_vibes pcii tnt4882 mcd scd joy cmx bktr cbb pccard cardbus
      \ mmc mmcsd sdhci smbus intpm alpm ichsmb viapm amdpm amdsmb
      \ nfpm nfsmb smb iicbus iicbb ic iic iicsmb iicoc ds133x ds1374
      \ ds1672 s35390a ppc ppbus vpo lpt plip ppi pps lpbb pcfclock
      \ uhci ohci ehci xhci usb udbp ufm uhid ukbd ulpt umass
      \ usfs umct umodem ums uep urio ucom u3g uark ubsa uftdi
      \ uipaq uplcom uslcom uvisor uvscom aue axe cdce cue kue
      \ rue udav mos uhso rum run uath upgt ural urtw zyd firewire sbp
      \ sbp_targ fwe fwip dcons dcons_crom crypto cryptodev rndtest
      \ hifn ubsec gzio

" added by hand
syntax keyword kernelDevices
      \ cpufreq acpi pci hptiop mps isci arcmsr hptmv hptrr hpt27xx
      \ ips twa tws aac aacp atkbdc atkbd psm kbdmux vga agp nfe
      \ vge cs ed ath_pci ipw iwi iwn wpi

" }}}



" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
highlight default link kernelComment    Comment
highlight default link kernelTodo       Todo
highlight default link kernelString     String
highlight default link kernelConfigName PreProc
highlight default link kernelOptions    Identifier
highlight default link kernelOptionsAmd kernelOptions
highlight default link kernelDevices    Type

let b:current_syntax = "kernel"

" vim: ts=8 sw=2
