Return-Path: <linux-renesas-soc+bounces-17278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85679ABE74B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 00:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31EC64E025E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 22:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FA7250C1F;
	Tue, 20 May 2025 22:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKXoVUDK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065B61F03D4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780605; cv=none; b=catdw6aQUY6KI94LnUxuVecCtInN9Ih6TMFRjY7dZAlA+iNItbtZI5BcjEvI+GvfYxxEHy82JVuRyl14ZCTYtPe2+wSw/6UfC89I14Vswe3attiXPe8fbnRlErz3mAKDn98eQEo0qpER9KVr5BSmBnWMjKEojKUyb/P7OsXIFuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780605; c=relaxed/simple;
	bh=FoSFxMSxaxtW7/7j6Im9KEWvkqzdv2bDFZE46G8XR+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GjRFNbYh7d1NS58ZxRQhJsTTe+36k28Ij6wn0fo39dJBu8EAIqnFq03/sxScgLgoqNWjh4aLRT+bXOpTWtC1yWOx9lw9267PoAQe4P5iJJ7+9bKI2bXPmEoN10wkevq5VPDXCc3EIRXHCdJVHRymtbw6LsPJHQbaL0EaJitaCwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKXoVUDK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747780603; x=1779316603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FoSFxMSxaxtW7/7j6Im9KEWvkqzdv2bDFZE46G8XR+o=;
  b=HKXoVUDK0XNqjfZvfM3NURGDqnbQj/pna8meXD+3W8LrqKN34SAdr2IH
   oo6hJFUJTtSilcz5MDOCxdalSWAgwG8Q93BoXd48+KEWic5vgWgIisykH
   KP8/sy5nw7VolA7dwcSaPzgMnhIz7ent/fKVEJwCFz00ocSe/aTiO60G7
   eYkwe6WUHP8QfZkze2afl/gchQ/Bfrp2DrpciJhPmdGdycYL06ciqhIkZ
   pltR8niUj9njgAlsUKRTz85CHDAdR08fHydQKZ+sHiO8QOfe88UIefqoP
   kTk8vBtewal8UGnCTOJbt1oA3miclexOJ6k0npv0Cf7tATI+aompL9u4N
   g==;
X-CSE-ConnectionGUID: qUss03w7QfmI1c6G+sT3lg==
X-CSE-MsgGUID: KOyE7cNeT1u92ENbAqLM0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52363809"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="52363809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:36:42 -0700
X-CSE-ConnectionGUID: ziWS6na+Q2WPu3fVsmSSmw==
X-CSE-MsgGUID: tXuldYRYT9edV+ukjOfzfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="163110117"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2025 15:36:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHVZe-000NdA-2q;
	Tue, 20 May 2025 22:36:38 +0000
Date: Wed, 21 May 2025 06:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 16/58]
 drivers/gpu/drm/xe/xe_svm.c:712:16: error: implicit declaration of function
 'drm_gpusvm_find_vma_start'; did you mean 'xe_svm_find_vma_start'?
Message-ID: <202505210600.iPS7fzOk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   051b9eadcc17b76b87726d74d18d1b741837adcc
commit: 64207500b99223e7ba854a4ab5d170a542fc0375 [16/58] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250521/202505210600.iPS7fzOk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210600.iPS7fzOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210600.iPS7fzOk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_svm.c: In function 'xe_svm_find_vma_start':
>> drivers/gpu/drm/xe/xe_svm.c:712:16: error: implicit declaration of function 'drm_gpusvm_find_vma_start'; did you mean 'xe_svm_find_vma_start'? [-Wimplicit-function-declaration]
     712 |         return drm_gpusvm_find_vma_start(&vm->svm.gpusvm,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                xe_svm_find_vma_start
   drivers/gpu/drm/xe/xe_svm.c: In function 'xe_svm_handle_pagefault':
>> drivers/gpu/drm/xe/xe_svm.c:858:31: error: 'struct xe_device' has no member named 'atomic_svm_timeslice_ms'
     858 |                         vm->xe->atomic_svm_timeslice_ms : 0,
         |                               ^~


vim +712 drivers/gpu/drm/xe/xe_svm.c

   694	
   695	/**
   696	 * xe_svm_find_vma_start - Find start of CPU VMA
   697	 * @vm: xe_vm pointer
   698	 * @start: start address
   699	 * @end: end address
   700	 * @vma: Pointer to struct xe_vma
   701	 *
   702	 *
   703	 * This function searches for a cpu vma, within the specified
   704	 * range [start, end] in the given VM. It adjusts the range based on the
   705	 * xe_vma start and end addresses. If no cpu VMA is found, it returns ULONG_MAX.
   706	 *
   707	 * Return: The starting address of the VMA within the range,
   708	 * or ULONG_MAX if no VMA is found
   709	 */
   710	u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *vma)
   711	{
 > 712		return drm_gpusvm_find_vma_start(&vm->svm.gpusvm,
   713						 max(start, xe_vma_start(vma)),
   714						 min(end, xe_vma_end(vma)));
   715	}
   716	
   717	#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
   718	static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
   719	{
   720		return &tile->mem.vram;
   721	}
   722	
   723	/**
   724	 * xe_svm_alloc_vram()- Allocate device memory pages for range,
   725	 * migrating existing data.
   726	 * @vm: The VM.
   727	 * @tile: tile to allocate vram from
   728	 * @range: SVM range
   729	 * @ctx: DRM GPU SVM context
   730	 *
   731	 * Return: 0 on success, error code on failure.
   732	 */
   733	int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
   734			      struct xe_svm_range *range,
   735			      const struct drm_gpusvm_ctx *ctx)
   736	{
   737		struct mm_struct *mm = vm->svm.gpusvm.mm;
   738		struct xe_vram_region *vr = tile_to_vr(tile);
   739		struct drm_buddy_block *block;
   740		struct list_head *blocks;
   741		struct xe_bo *bo;
   742		ktime_t end = 0;
   743		int err;
   744	
   745		range_debug(range, "ALLOCATE VRAM");
   746	
   747		if (!mmget_not_zero(mm))
   748			return -EFAULT;
   749		mmap_read_lock(mm);
   750	
   751	retry:
   752		bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
   753					 xe_svm_range_size(range),
   754					 ttm_bo_type_device,
   755					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
   756					 XE_BO_FLAG_CPU_ADDR_MIRROR);
   757		if (IS_ERR(bo)) {
   758			err = PTR_ERR(bo);
   759			if (xe_vm_validate_should_retry(NULL, err, &end))
   760				goto retry;
   761			goto unlock;
   762		}
   763	
   764		drm_gpusvm_devmem_init(&bo->devmem_allocation,
   765				       vm->xe->drm.dev, mm,
   766				       &gpusvm_devmem_ops,
   767				       &tile->mem.vram.dpagemap,
   768				       xe_svm_range_size(range));
   769	
   770		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
   771		list_for_each_entry(block, blocks, link)
   772			block->private = vr;
   773	
   774		xe_bo_get(bo);
   775		err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
   776						   &bo->devmem_allocation, ctx);
   777		if (err)
   778			xe_svm_devmem_release(&bo->devmem_allocation);
   779	
   780		xe_bo_unlock(bo);
   781		xe_bo_put(bo);
   782	
   783	unlock:
   784		mmap_read_unlock(mm);
   785		mmput(mm);
   786	
   787		return err;
   788	}
   789	#endif
   790	
   791	static bool supports_4K_migration(struct xe_device *xe)
   792	{
   793		if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
   794			return false;
   795	
   796		return true;
   797	}
   798	
   799	/**
   800	 * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
   801	 * @range: SVM range for which migration needs to be decided
   802	 * @vma: vma which has range
   803	 * @preferred_region_is_vram: preferred region for range is vram
   804	 *
   805	 * Return: True for range needing migration and migration is supported else false
   806	 */
   807	bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
   808						bool preferred_region_is_vram)
   809	{
   810		struct xe_vm *vm = range_to_vm(&range->base);
   811		u64 range_size = xe_svm_range_size(range);
   812	
   813		if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
   814			return false;
   815	
   816		xe_assert(vm->xe, IS_DGFX(vm->xe));
   817	
   818		if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
   819			drm_info(&vm->xe->drm, "Range is already in VRAM\n");
   820			return false;
   821		}
   822	
   823		if (preferred_region_is_vram && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
   824			drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
   825			return false;
   826		}
   827	
   828		return true;
   829	}
   830	
   831	/**
   832	 * xe_svm_handle_pagefault() - SVM handle page fault
   833	 * @vm: The VM.
   834	 * @vma: The CPU address mirror VMA.
   835	 * @gt: The gt upon the fault occurred.
   836	 * @fault_addr: The GPU fault address.
   837	 * @atomic: The fault atomic access bit.
   838	 *
   839	 * Create GPU bindings for a SVM page fault. Optionally migrate to device
   840	 * memory.
   841	 *
   842	 * Return: 0 on success, negative error code on error.
   843	 */
   844	int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
   845				    struct xe_gt *gt, u64 fault_addr,
   846				    bool atomic)
   847	{
   848		struct drm_gpusvm_ctx ctx = {
   849			.read_only = xe_vma_read_only(vma),
   850			.devmem_possible = IS_DGFX(vm->xe) &&
   851				IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
   852			.check_pages_threshold = IS_DGFX(vm->xe) &&
   853				IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
   854			.devmem_only = atomic && IS_DGFX(vm->xe) &&
   855				IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
   856			.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
   857				IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
 > 858				vm->xe->atomic_svm_timeslice_ms : 0,
   859		};
   860		struct xe_svm_range *range;
   861		struct drm_exec exec;
   862		struct dma_fence *fence;
   863		struct xe_tile *tile = gt_to_tile(gt);
   864		int migrate_try_count = ctx.devmem_only ? 3 : 1;
   865		ktime_t end = 0;
   866		int err;
   867	
   868		lockdep_assert_held_write(&vm->lock);
   869		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
   870	
   871		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
   872	
   873	retry:
   874		/* Always process UNMAPs first so view SVM ranges is current */
   875		err = xe_svm_garbage_collector(vm);
   876		if (err)
   877			return err;
   878	
   879		range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
   880	
   881		if (IS_ERR(range))
   882			return PTR_ERR(range);
   883	
   884		if (ctx.devmem_only && !range->base.flags.migrate_devmem)
   885			return -EACCES;
   886	
   887		if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
   888			return 0;
   889	
   890		range_debug(range, "PAGE FAULT");
   891	
   892		if (--migrate_try_count >= 0 &&
   893		    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
   894			err = xe_svm_alloc_vram(vm, tile, range, &ctx);
   895			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
   896			if (err) {
   897				if (migrate_try_count || !ctx.devmem_only) {
   898					drm_dbg(&vm->xe->drm,
   899						"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
   900						vm->usm.asid, ERR_PTR(err));
   901					goto retry;
   902				} else {
   903					drm_err(&vm->xe->drm,
   904						"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
   905						vm->usm.asid, ERR_PTR(err));
   906					return err;
   907				}
   908			}
   909		}
   910	
   911		range_debug(range, "GET PAGES");
   912		err = xe_svm_range_get_pages(vm, range, &ctx);
   913		/* Corner where CPU mappings have changed */
   914		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
   915			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
   916			if (migrate_try_count > 0 || !ctx.devmem_only) {
   917				if (err == -EOPNOTSUPP) {
   918					range_debug(range, "PAGE FAULT - EVICT PAGES");
   919					drm_gpusvm_range_evict(&vm->svm.gpusvm,
   920							       &range->base);
   921				}
   922				drm_dbg(&vm->xe->drm,
   923					"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
   924					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
   925				range_debug(range, "PAGE FAULT - RETRY PAGES");
   926				goto retry;
   927			} else {
   928				drm_err(&vm->xe->drm,
   929					"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
   930					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
   931			}
   932		}
   933		if (err) {
   934			range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
   935			goto err_out;
   936		}
   937	
   938		range_debug(range, "PAGE FAULT - BIND");
   939	
   940	retry_bind:
   941		drm_exec_init(&exec, 0, 0);
   942		drm_exec_until_all_locked(&exec) {
   943			err = drm_exec_lock_obj(&exec, vm->gpuvm.r_obj);
   944			drm_exec_retry_on_contention(&exec);
   945			if (err) {
   946				drm_exec_fini(&exec);
   947				goto err_out;
   948			}
   949	
   950			fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
   951			if (IS_ERR(fence)) {
   952				drm_exec_fini(&exec);
   953				err = PTR_ERR(fence);
   954				if (err == -EAGAIN) {
   955					ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
   956					range_debug(range, "PAGE FAULT - RETRY BIND");
   957					goto retry;
   958				}
   959				if (xe_vm_validate_should_retry(&exec, err, &end))
   960					goto retry_bind;
   961				goto err_out;
   962			}
   963		}
   964		drm_exec_fini(&exec);
   965	
   966		dma_fence_wait(fence, false);
   967		dma_fence_put(fence);
   968	
   969	err_out:
   970	
   971		return err;
   972	}
   973	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

