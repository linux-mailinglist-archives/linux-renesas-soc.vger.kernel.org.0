Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF2E3A086B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 02:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhFIAcR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 20:32:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:13186 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230009AbhFIAcQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 20:32:16 -0400
IronPort-SDR: 45AbuYHBi9AHVkA4V2Q54fQLBX0MTkvEyyim4uaj/pDIPTjV8z/XGxPhcVNZEoYmU/kAlPLaSE
 CcQLpf9RIEqg==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="204788861"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; 
   d="scan'208";a="204788861"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 17:30:21 -0700
IronPort-SDR: VxXp7K/zxBNbKf6/dYLzL9+pZteQ3Jj4IKOll1H8WhxuHtOzDgky16o9HqO9ucGao2ZWEtkVA4
 uTiMKtwa/RPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; 
   d="scan'208";a="551798493"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Jun 2021 17:30:19 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lqm6t-0009Hf-4b; Wed, 09 Jun 2021 00:30:19 +0000
Date:   Wed, 09 Jun 2021 08:29:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD REGRESSION
 afd2bd149ec124722b609dcf91e1acbb9eec6593
Message-ID: <60c00b77.kmhivO3EhiPNOANO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: afd2bd149ec124722b609dcf91e1acbb9eec6593  [LOCAL] arm64: defconfig: Update renesas_defconfig

Error/Warning in current branch:

drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: error: initialization of 'int (*)(struct ttm_resource_manager *, struct ttm_buffer_object *, const struct ttm_place *, struct ttm_resource **)' from incompatible pointer type 'int (*)(struct ttm_resource_manager *, struct ttm_buffer_object *, const struct ttm_place *, struct ttm_resource *)' [-Werror=incompatible-pointer-types]
drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:75:5: error: 'struct ttm_resource' has no member named 'mm_node'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1510:13: error: invalid storage class for function 'amdgpu_ttm_fw_reserve_vram_fini'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1510:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1523:12: error: invalid storage class for function 'amdgpu_ttm_fw_reserve_vram_init'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1553:12: error: invalid storage class for function 'amdgpu_ttm_training_reserve_vram_fini'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1564:13: error: invalid storage class for function 'amdgpu_ttm_training_data_block_init'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1587:12: error: invalid storage class for function 'amdgpu_ttm_reserve_tmr'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1662:41: error: 'amdgpu_bo_driver' undeclared (first use in this function); did you mean 'amdgpu_bo_move'?
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2096:23: error: 'amdgpu_mm_tt_table_show' undeclared (first use in this function); did you mean 'amdgpu_mm_tt_table_open'?
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2096:23: error: initializer element is not constant
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2096:23: error: invalid storage class for function 'amdgpu_mm_tt_table_open'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2097:23: error: 'amdgpu_mm_gds_table_show' undeclared (first use in this function); did you mean 'amdgpu_mm_gds_table_open'?
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2097:23: error: invalid storage class for function 'amdgpu_mm_gds_table_open'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2098:23: error: 'amdgpu_mm_gws_table_show' undeclared (first use in this function); did you mean 'amdgpu_mm_gws_table_open'?
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2098:23: error: invalid storage class for function 'amdgpu_mm_gws_table_open'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2099:23: error: 'amdgpu_mm_oa_table_show' undeclared (first use in this function); did you mean 'amdgpu_mm_oa_table_open'?
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2099:23: error: invalid storage class for function 'amdgpu_mm_oa_table_open'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2100:23: error: 'amdgpu_ttm_page_pool_show' undeclared (first use in this function); did you mean 'amdgpu_ttm_page_pool_open'?
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2100:23: error: invalid storage class for function 'amdgpu_ttm_page_pool_open'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2107:16: error: invalid storage class for function 'amdgpu_ttm_vram_read'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2142:16: error: invalid storage class for function 'amdgpu_ttm_vram_write'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2195:16: error: invalid storage class for function 'amdgpu_iomem_read'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2251:16: error: invalid storage class for function 'amdgpu_iomem_write'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2315:9: error: 'amdgpu_mm_vram_table_fops' undeclared (first use in this function); did you mean 'amdgpu_mm_oa_table_fops'?
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2327:1: error: expected declaration or statement at end of input
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:992:1: error: version control conflict marker in file
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:994:28: error: 'struct ttm_buffer_object' has no member named 'mem'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:996:10: error: missing terminating ' character
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:996:10: warning: missing terminating ' character
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1016:13: error: invalid storage class for function 'amdgpu_vm_free_table'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1039:13: error: invalid storage class for function 'amdgpu_vm_free_pts'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1310:12: error: invalid storage class for function 'amdgpu_vm_update_pde'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1337:13: error: invalid storage class for function 'amdgpu_vm_invalidate_pds'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1405:13: error: invalid storage class for function 'amdgpu_vm_update_flags'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1440:13: error: invalid storage class for function 'amdgpu_vm_fragment'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1503:12: error: invalid storage class for function 'amdgpu_vm_update_ptes'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1963:13: error: invalid storage class for function 'amdgpu_vm_update_prt_state'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1979:13: error: invalid storage class for function 'amdgpu_vm_prt_get'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1993:13: error: invalid storage class for function 'amdgpu_vm_prt_put'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2005:13: error: invalid storage class for function 'amdgpu_vm_prt_cb'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2019:13: error: invalid storage class for function 'amdgpu_vm_add_prt_cb'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2052:13: error: invalid storage class for function 'amdgpu_vm_free_mapping'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2070:13: error: invalid storage class for function 'amdgpu_vm_prt_fini'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2263:13: error: invalid storage class for function 'amdgpu_vm_bo_insert_map'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2759:17: error: invalid storage class for function 'amdgpu_vm_get_block_size'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3016:12: error: invalid storage class for function 'amdgpu_vm_check_clean_reserved'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3588:1: error: expected declaration or statement at end of input
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:663:1: error: version control conflict marker in file
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:666:10: error: missing terminating ' character
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:666:10: warning: missing terminating ' character
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:691:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:756:12: error: invalid storage class for function 'amdgpu_vm_clear_bo'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:878:12: error: invalid storage class for function 'amdgpu_vm_pt_create'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:965:12: error: invalid storage class for function 'amdgpu_vm_alloc_pts'
include/linux/seq_file.h:173:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]

possible Error/Warning in current branch:

drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: error: incompatible function pointer types initializing 'int (*)(struct ttm_resource_manager *, struct ttm_buffer_object *, const struct ttm_place *, struct ttm_resource **)' with an expression of type 'int (struct ttm_resource_manager *, struct ttm_buffer_object *, const struct ttm_place *, struct ttm_resource *)' [-Werror,-Wincompatible-function-pointer-types]
drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:75:7: error: no member named 'mm_node' in 'struct ttm_resource'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1006:19: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1006:24: error: expected identifier
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1006:2: error: conflicting types for 'ttm_resource_free'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1006:2: warning: declaration specifier missing, defaulting to 'int'
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1007:20: error: a parameter list without types is only allowed in a function definition
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1009:2: error: expected identifier or '('
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1010:1: error: extraneous closing brace ('}')
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:994:30: error: no member named 'mem' in 'struct ttm_buffer_object'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:665:55: error: no member named 'mem' in 'struct ttm_buffer_object'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- csky-randconfig-r014-20210608
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:initialization-of-int-(-)(struct-ttm_resource_manager-struct-ttm_buffer_object-const-struct-ttm_place-struct-ttm_resource-)-from-incompatible-poin
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:struct-ttm_resource-has-no-member-named-mm_node
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_bo_driver-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gds_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gws_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_oa_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_tt_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_vram_table_fops-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_ttm_page_pool_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:initializer-element-is-not-constant
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gds_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gws_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_oa_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_tt_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_page_pool_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_reserve_tmr
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_data_block_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:struct-ttm_buffer_object-has-no-member-named-mem
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_add_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_alloc_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_bo_insert_map
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_check_clean_reserved
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_clear_bo
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_fragment
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_mapping
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_table
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_get_block_size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_invalidate_pds
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_get
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_put
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_pt_create
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_flags
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_pde
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_prt_state
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_ptes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:missing-terminating-character
|   `-- include-linux-seq_file.h:warning:ISO-C90-forbids-mixed-declarations-and-code
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:initialization-of-int-(-)(struct-ttm_resource_manager-struct-ttm_buffer_object-const-struct-ttm_place-struct-ttm_resource-)-from-incompatible-poin
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:struct-ttm_resource-has-no-member-named-mm_node
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_bo_driver-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gds_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gws_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_oa_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_tt_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_vram_table_fops-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_ttm_page_pool_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:initializer-element-is-not-constant
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gds_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gws_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_oa_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_tt_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_page_pool_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_reserve_tmr
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_data_block_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:struct-ttm_buffer_object-has-no-member-named-mem
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_add_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_alloc_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_bo_insert_map
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_check_clean_reserved
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_clear_bo
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_fragment
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_mapping
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_table
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_get_block_size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_invalidate_pds
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_get
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_put
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_pt_create
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_flags
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_pde
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_prt_state
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_ptes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:missing-terminating-character
|   `-- include-linux-seq_file.h:warning:ISO-C90-forbids-mixed-declarations-and-code
|-- ia64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:initialization-of-int-(-)(struct-ttm_resource_manager-struct-ttm_buffer_object-const-struct-ttm_place-struct-ttm_resource-)-from-incompatible-poin
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:struct-ttm_resource-has-no-member-named-mm_node
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_bo_driver-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gds_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gws_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_oa_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_tt_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_vram_table_fops-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_ttm_page_pool_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:initializer-element-is-not-constant
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gds_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gws_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_oa_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_tt_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_page_pool_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_reserve_tmr
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_data_block_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:struct-ttm_buffer_object-has-no-member-named-mem
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_add_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_alloc_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_bo_insert_map
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_check_clean_reserved
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_clear_bo
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_fragment
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_mapping
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_table
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_get_block_size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_invalidate_pds
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_get
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_put
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_pt_create
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_flags
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_pde
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_prt_state
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_ptes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:missing-terminating-character
|   `-- include-linux-seq_file.h:warning:ISO-C90-forbids-mixed-declarations-and-code
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:initialization-of-int-(-)(struct-ttm_resource_manager-struct-ttm_buffer_object-const-struct-ttm_place-struct-ttm_resource-)-from-incompatible-poin
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:struct-ttm_resource-has-no-member-named-mm_node
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_bo_driver-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gds_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gws_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_oa_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_tt_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_vram_table_fops-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_ttm_page_pool_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:initializer-element-is-not-constant
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gds_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gws_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_oa_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_tt_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_page_pool_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_reserve_tmr
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_data_block_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:struct-ttm_buffer_object-has-no-member-named-mem
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_add_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_alloc_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_bo_insert_map
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_check_clean_reserved
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_clear_bo
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_fragment
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_mapping
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_table
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_get_block_size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_invalidate_pds
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_get
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_put
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_pt_create
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_flags
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_pde
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_prt_state
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_ptes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:missing-terminating-character
|   `-- include-linux-seq_file.h:warning:ISO-C90-forbids-mixed-declarations-and-code
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:initialization-of-int-(-)(struct-ttm_resource_manager-struct-ttm_buffer_object-const-struct-ttm_place-struct-ttm_resource-)-from-incompatible-poin
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:struct-ttm_resource-has-no-member-named-mm_node
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_bo_driver-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gds_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gws_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_oa_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_tt_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_vram_table_fops-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_ttm_page_pool_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:initializer-element-is-not-constant
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gds_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gws_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_oa_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_tt_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_page_pool_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_reserve_tmr
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_data_block_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:struct-ttm_buffer_object-has-no-member-named-mem
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_add_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_alloc_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_bo_insert_map
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_check_clean_reserved
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_clear_bo
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_fragment
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_mapping
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_table
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_get_block_size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_invalidate_pds
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_get
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_put
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_pt_create
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_flags
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_pde
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_prt_state
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_ptes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:missing-terminating-character
|   `-- include-linux-seq_file.h:warning:ISO-C90-forbids-mixed-declarations-and-code
|-- powerpc64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:initialization-of-int-(-)(struct-ttm_resource_manager-struct-ttm_buffer_object-const-struct-ttm_place-struct-ttm_resource-)-from-incompatible-poin
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:struct-ttm_resource-has-no-member-named-mm_node
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_bo_driver-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gds_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gws_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_oa_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_tt_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_vram_table_fops-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_ttm_page_pool_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:initializer-element-is-not-constant
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gds_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gws_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_oa_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_tt_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_page_pool_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_reserve_tmr
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_data_block_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:struct-ttm_buffer_object-has-no-member-named-mem
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_add_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_alloc_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_bo_insert_map
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_check_clean_reserved
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_clear_bo
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_fragment
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_mapping
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_table
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_get_block_size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_invalidate_pds
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_get
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_put
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_pt_create
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_flags
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_pde
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_prt_state
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_ptes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:missing-terminating-character
|   `-- include-linux-seq_file.h:warning:ISO-C90-forbids-mixed-declarations-and-code
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:initialization-of-int-(-)(struct-ttm_resource_manager-struct-ttm_buffer_object-const-struct-ttm_place-struct-ttm_resource-)-from-incompatible-poin
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:struct-ttm_resource-has-no-member-named-mm_node
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_bo_driver-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gds_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gws_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_oa_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_tt_table_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_vram_table_fops-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_ttm_page_pool_show-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:initializer-element-is-not-constant
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gds_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gws_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_oa_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_tt_table_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_page_pool_open
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_reserve_tmr
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_data_block_init
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_reserve_vram_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_read
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_write
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:struct-ttm_buffer_object-has-no-member-named-mem
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:expected-declaration-or-statement-at-end-of-input
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_add_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_alloc_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_bo_insert_map
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_check_clean_reserved
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_clear_bo
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_fragment
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_mapping
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_pts
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_table
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_get_block_size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_invalidate_pds
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_cb
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_fini
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_get
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_put
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_pt_create
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_flags
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_pde
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_prt_state
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_ptes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:missing-terminating-character
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:missing-terminating-character
|   `-- include-linux-seq_file.h:warning:ISO-C90-forbids-mixed-declarations-and-code
`-- x86_64-randconfig-s032-20210608
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:initialization-of-int-(-)(struct-ttm_resource_manager-struct-ttm_buffer_object-const-struct-ttm_place-struct-ttm_resource-)-from-incompatible-poin
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:struct-ttm_resource-has-no-member-named-mm_node
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_bo_driver-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gds_table_show-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_gws_table_show-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_oa_table_show-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_tt_table_show-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_mm_vram_table_fops-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:amdgpu_ttm_page_pool_show-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-declaration-or-statement-at-end-of-input
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:initializer-element-is-not-constant
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_read
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_iomem_write
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gds_table_open
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_gws_table_open
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_oa_table_open
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_mm_tt_table_open
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_fini
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_fw_reserve_vram_init
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_page_pool_open
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_reserve_tmr
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_data_block_init
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_training_reserve_vram_fini
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_read
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:invalid-storage-class-for-function-amdgpu_ttm_vram_write
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:missing-terminating-character
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:struct-ttm_buffer_object-has-no-member-named-mem
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:version-control-conflict-marker-in-file
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:missing-terminating-character
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:expected-declaration-or-statement-at-end-of-input
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_add_prt_cb
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_alloc_pts
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_bo_insert_map
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_check_clean_reserved
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_clear_bo
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_fragment
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_mapping
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_pts
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_free_table
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_get_block_size
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_invalidate_pds
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_cb
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_fini
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_get
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_prt_put
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_pt_create
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_flags
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_pde
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_prt_state
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:invalid-storage-class-for-function-amdgpu_vm_update_ptes
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:missing-terminating-character
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:version-control-conflict-marker-in-file
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:ISO-C90-forbids-mixed-declarations-and-code
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:warning:missing-terminating-character
    `-- include-linux-seq_file.h:warning:ISO-C90-forbids-mixed-declarations-and-code

clang_recent_errors
`-- powerpc-randconfig-r011-20210608
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-ttm_resource_manager-struct-ttm_buffer_object-const-struct-ttm_place-struct-ttm_re
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_preempt_mgr.c:error:no-member-named-mm_node-in-struct-ttm_resource
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:a-parameter-list-without-types-is-only-allowed-in-a-function-definition
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:conflicting-types-for-ttm_resource_free
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-identifier
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:expected-identifier-or-(
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:extraneous-closing-brace-(-)
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:no-member-named-mem-in-struct-ttm_buffer_object
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:error:this-function-declaration-is-not-a-prototype-Werror-Wstrict-prototypes
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ttm.c:warning:declaration-specifier-missing-defaulting-to-int
    `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c:error:no-member-named-mem-in-struct-ttm_buffer_object

elapsed time: 720m

configs tested: 97
configs skipped: 2

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm                    vt8500_v6_v7_defconfig
mips                     loongson2k_defconfig
powerpc                     taishan_defconfig
xtensa                          iss_defconfig
sh                           se7722_defconfig
powerpc                      ep88xc_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                      pic32mzda_defconfig
sh                          sdk7780_defconfig
arc                        vdk_hs38_defconfig
powerpc                      walnut_defconfig
arm                       aspeed_g5_defconfig
arm                             rpc_defconfig
mips                    maltaup_xpa_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                         vf610m4_defconfig
um                               alldefconfig
sh                           sh2007_defconfig
powerpc                     ksi8560_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210608
x86_64               randconfig-a002-20210608
x86_64               randconfig-a003-20210608
x86_64               randconfig-a006-20210608
x86_64               randconfig-a005-20210608
x86_64               randconfig-a001-20210608
i386                 randconfig-a003-20210608
i386                 randconfig-a006-20210608
i386                 randconfig-a004-20210608
i386                 randconfig-a001-20210608
i386                 randconfig-a005-20210608
i386                 randconfig-a002-20210608
i386                 randconfig-a015-20210608
i386                 randconfig-a013-20210608
i386                 randconfig-a016-20210608
i386                 randconfig-a011-20210608
i386                 randconfig-a012-20210608
i386                 randconfig-a014-20210608
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210608
x86_64               randconfig-a012-20210608
x86_64               randconfig-a014-20210608
x86_64               randconfig-a011-20210608
x86_64               randconfig-a016-20210608
x86_64               randconfig-a013-20210608

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
