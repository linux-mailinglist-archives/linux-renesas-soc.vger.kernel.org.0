Return-Path: <linux-renesas-soc+bounces-2876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577C85786C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 10:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C582B212E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 09:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583961B80B;
	Fri, 16 Feb 2024 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBPpEo2j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E814F64;
	Fri, 16 Feb 2024 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708074307; cv=none; b=GZpJP4qwRHkw193V2UW5q3UFokIm+bwdbkX+bzSJJJs5m1K4+DHw4yS2WB15pzASO3MxI5kZ6qAWSp3/tD63KGOQxWAburYQWWLzkO+y78zbOER7bTfzsIqM5YXOJlfvJH4Q/34jgBp/DA+jihLTLy+A6HYKltTJXtuxs6/AcAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708074307; c=relaxed/simple;
	bh=g8hPbA2/gYF/CSzjwdouvtoWbto1dwGMcgtNCz6PS5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFMplBOqzR/tkcRdICaewgvYnL64GRYaC04cT45RydtWXVpVrzORKrgE7eCAEGjDXgOYPbXWFlw5Cbe7+ZrljS2M4LdDbGh2CIumNZFKJO8YNZ9c97LeN5FX8/eqCZ8CmnF5UlOuV0T40UDeSa+7e3LuFWkagApIVivZW9OKcKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBPpEo2j; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708074305; x=1739610305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g8hPbA2/gYF/CSzjwdouvtoWbto1dwGMcgtNCz6PS5Y=;
  b=KBPpEo2j8JJeST/zPxgMcq7nVxBH3jCgg3tzTuBdFKMBHfZ62cpnMh0L
   b6DfU4HO2KW0/LTFt8n1PuTSWwDq7HObuiJBBnXWrbAHXY6Sxm9D7wNa9
   fmXp0gg8ZLL5HE4+w45B3BsirVTadgTGnTViJBGKPpNStwz4wIBo2b10M
   jfj/VpWSWKkphqZ0O5Q9TyyYG85yN+Ag6Y8LfW1lrbarPMz4pQn7lWgWV
   Ukw1behg1wZRtICvumJQWAHZtWh8jyjBoD/iFML31T5WE3ROVZsaW5xXS
   f5Btw+ZtOOrhCqwu6cjWyusJE4/BIREHmGlfsxNKJTFxQfB44hj3MAKZh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12825802"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="12825802"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 01:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="41279178"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Feb 2024 01:04:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rau9J-00017c-24;
	Fri, 16 Feb 2024 09:04:49 +0000
Date: Fri, 16 Feb 2024 17:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	"open list:ACPI" <linux-acpi@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Melissa Wen <mwen@igalia.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
Message-ID: <202402161633.zhmOGq2G-lkp@intel.com>
References: <20240214215756.6530-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214215756.6530-2-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-Stop-using-select-ACPI_VIDEO-in-all-drivers/20240215-055936
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240214215756.6530-2-mario.limonciello%40amd.com
patch subject: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
config: alpha-kismet-CONFIG_FB_BACKLIGHT-CONFIG_FB_NVIDIA-0-0 (https://download.01.org/0day-ci/archive/20240216/202402161633.zhmOGq2G-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402161633.zhmOGq2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161633.zhmOGq2G-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by FB_NVIDIA
   .config:98:warning: symbol value 'n' invalid for SERIAL_AR933X_NR_UARTS
   .config:208:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:244:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:345:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:427:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:432:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:620:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:652:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:687:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:757:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:800:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:848:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:853:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:865:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:896:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:907:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:913:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:915:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:917:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1149:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1176:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1282:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1453:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1591:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1592:warning: symbol value 'n' invalid for WATCHDOG_OPEN_TIMEOUT
   .config:1710:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:1757:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1891:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2178:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2192:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2327:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2328:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2378:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:2570:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2655:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2846:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2860:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2934:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:2944:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2969:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2995:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3101:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3142:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3223:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3344:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3426:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3481:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3524:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:3528:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3543:warning: symbol value 'n' invalid for PANEL_PROFILE
   .config:3648:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3770:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3837:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3851:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4005:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4173:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4233:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4254:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4346:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4562:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4652:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4686:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4722:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:5034:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5118:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5138:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5300:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5389:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:5394:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5411:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5549:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:5552:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5667:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5700:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5789:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5797:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5821:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:5941:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6039:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:6118:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6287:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6538:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6653:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:6663:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6675:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6811:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6938:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6939:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6951:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7048:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:7278:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7329:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7358:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7452:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7582:warning: symbol value 'n' invalid for PSTORE_DEFAULT_KMSG_BYTES
   .config:7595:warning: symbol value 'n' invalid for KDB_CONTINUE_CATASTROPHIC
   .config:7623:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:7629:warning: symbol value 'n' invalid for RCU_FANOUT
   .config:7707:warning: symbol value 'n' invalid for PANEL_LCD
   .config:7873:warning: symbol value 'n' invalid for VIDEO_VIVID_MAX_DEVS

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

