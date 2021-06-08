Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12BB39FB2A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 17:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhFHPub (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 11:50:31 -0400
Received: from mga09.intel.com ([134.134.136.24]:37970 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231165AbhFHPua (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 11:50:30 -0400
IronPort-SDR: MJ1a56BfsB1nYMMzibSuXkBqS3pZhJX4mvhVzU6l2FluCwvhDxBwHpLJEyQQeyBs9uUI+7j22E
 8h2YNZ3awryg==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="204837387"
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; 
   d="gz'50?scan'50,208,50";a="204837387"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 08:46:16 -0700
IronPort-SDR: 0Cznli+4f+imX2JdmInyOUwgwM+4tL3Ifo/tffg/Q6WYqY/VgHOxspmjEjthoeA1aY+iL8jUUp
 Qlemo1iZIJNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; 
   d="gz'50?scan'50,208,50";a="440516757"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 08 Jun 2021 08:46:13 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lqdvh-00096J-8h; Tue, 08 Jun 2021 15:46:13 +0000
Date:   Tue, 8 Jun 2021 23:45:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     kbuild-all@lists.01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [renesas-drivers:master 152/165]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:992:1: error: version control
 conflict marker in file
Message-ID: <202106082338.CvXDOgzl-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   afd2bd149ec124722b609dcf91e1acbb9eec6593
commit: 067856b548f5d4a61d28ff88b97ac08150153e81 [152/165] Merge remote-tracking branch 'drm-misc/for-linux-next' into renesas-drivers
config: csky-randconfig-r014-20210608 (attached as .config)
compiler: csky-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=067856b548f5d4a61d28ff88b97ac08150153e81
        git remote add renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
        git fetch --no-tags renesas-drivers master
        git checkout 067856b548f5d4a61d28ff88b97ac08150153e81
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=csky 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_ttm_alloc_gart':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:992:1: error: version control conflict marker in file
     992 | <<<<<<< HEAD
         | ^~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:994:28: error: 'struct ttm_buffer_object' has no member named 'mem'
     994 |   ttm_resource_free(bo, &bo->mem);
         |                            ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:995:5: error: 'struct ttm_buffer_object' has no member named 'mem'
     995 |   bo->mem = tmp;
         |     ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:996:1: error: version control conflict marker in file
     996 | ======= I'M SOOOOOO TIRED OF THESE CONFLICTS BETWEEN DRM/DRM-NEXT AND DRM-MISC/FOR-LINUX-NEXT
         | ^~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:996:10: warning: missing terminating ' character
     996 | ======= I'M SOOOOOO TIRED OF THESE CONFLICTS BETWEEN DRM/DRM-NEXT AND DRM-MISC/FOR-LINUX-NEXT
         |          ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:996:10: error: missing terminating ' character
     996 | ======= I'M SOOOOOO TIRED OF THESE CONFLICTS BETWEEN DRM/DRM-NEXT AND DRM-MISC/FOR-LINUX-NEXT
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1003:1: error: version control conflict marker in file
    1003 | >>>>>>> drm-misc/for-linux-next
         | ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:959:24: warning: unused variable 'gtt' [-Wunused-variable]
     959 |  struct amdgpu_ttm_tt *gtt = (void *)bo->ttm;
         |                        ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_ttm_bo_eviction_valuable':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1369:1: error: version control conflict marker in file
    1369 | <<<<<<< HEAD
         | ^~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1510:13: error: invalid storage class for function 'amdgpu_ttm_fw_reserve_vram_fini'
    1510 | static void amdgpu_ttm_fw_reserve_vram_fini(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1510:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1510 | static void amdgpu_ttm_fw_reserve_vram_fini(struct amdgpu_device *adev)
         | ^~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1523:12: error: invalid storage class for function 'amdgpu_ttm_fw_reserve_vram_init'
    1523 | static int amdgpu_ttm_fw_reserve_vram_init(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1553:12: error: invalid storage class for function 'amdgpu_ttm_training_reserve_vram_fini'
    1553 | static int amdgpu_ttm_training_reserve_vram_fini(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1564:13: error: invalid storage class for function 'amdgpu_ttm_training_data_block_init'
    1564 | static void amdgpu_ttm_training_data_block_init(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1587:12: error: invalid storage class for function 'amdgpu_ttm_reserve_tmr'
    1587 | static int amdgpu_ttm_reserve_tmr(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_ttm_init':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1662:41: error: 'amdgpu_bo_driver' undeclared (first use in this function); did you mean 'amdgpu_bo_move'?
    1662 |  r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
         |                                         ^~~~~~~~~~~~~~~~
         |                                         amdgpu_bo_move
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1662:41: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_fill_buffer':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1961:1: error: version control conflict marker in file
    1961 | <<<<<<< HEAD
         | ^~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:38:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2096:23: error: invalid storage class for function 'amdgpu_mm_tt_table_open'
    2096 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_tt_table);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:173:12: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     173 | static int __name ## _open(struct inode *inode, struct file *file) \
         |            ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_mm_tt_table_open':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2096:23: error: 'amdgpu_mm_tt_table_show' undeclared (first use in this function); did you mean 'amdgpu_mm_tt_table_open'?
    2096 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_tt_table);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:175:27: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     175 |  return single_open(file, __name ## _show, inode->i_private); \
         |                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_fill_buffer':
>> include/linux/seq_file.h:173:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     173 | static int __name ## _open(struct inode *inode, struct file *file) \
         | ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2096:1: note: in expansion of macro 'DEFINE_SHOW_ATTRIBUTE'
    2096 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_tt_table);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2096:23: error: initializer element is not constant
    2096 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_tt_table);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2096:23: note: (near initialization for 'amdgpu_mm_tt_table_fops.open')
    2096 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_tt_table);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2097:23: error: invalid storage class for function 'amdgpu_mm_gds_table_open'
    2097 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gds_table);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:173:12: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     173 | static int __name ## _open(struct inode *inode, struct file *file) \
         |            ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_mm_gds_table_open':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2097:23: error: 'amdgpu_mm_gds_table_show' undeclared (first use in this function); did you mean 'amdgpu_mm_gds_table_open'?
    2097 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gds_table);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:175:27: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     175 |  return single_open(file, __name ## _show, inode->i_private); \
         |                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_fill_buffer':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2097:23: error: initializer element is not constant
    2097 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gds_table);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2097:23: note: (near initialization for 'amdgpu_mm_gds_table_fops.open')
    2097 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gds_table);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2098:23: error: invalid storage class for function 'amdgpu_mm_gws_table_open'
    2098 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gws_table);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:173:12: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     173 | static int __name ## _open(struct inode *inode, struct file *file) \
         |            ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_mm_gws_table_open':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2098:23: error: 'amdgpu_mm_gws_table_show' undeclared (first use in this function); did you mean 'amdgpu_mm_gws_table_open'?
    2098 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gws_table);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:175:27: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     175 |  return single_open(file, __name ## _show, inode->i_private); \
         |                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_fill_buffer':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2098:23: error: initializer element is not constant
    2098 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gws_table);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2098:23: note: (near initialization for 'amdgpu_mm_gws_table_fops.open')
    2098 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gws_table);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2099:23: error: invalid storage class for function 'amdgpu_mm_oa_table_open'
    2099 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_oa_table);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:173:12: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     173 | static int __name ## _open(struct inode *inode, struct file *file) \
         |            ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_mm_oa_table_open':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2099:23: error: 'amdgpu_mm_oa_table_show' undeclared (first use in this function); did you mean 'amdgpu_mm_oa_table_open'?
    2099 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_oa_table);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:175:27: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     175 |  return single_open(file, __name ## _show, inode->i_private); \
         |                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_fill_buffer':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2099:23: error: initializer element is not constant
    2099 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_oa_table);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2099:23: note: (near initialization for 'amdgpu_mm_oa_table_fops.open')
    2099 | DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_oa_table);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2100:23: error: invalid storage class for function 'amdgpu_ttm_page_pool_open'
    2100 | DEFINE_SHOW_ATTRIBUTE(amdgpu_ttm_page_pool);
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:173:12: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     173 | static int __name ## _open(struct inode *inode, struct file *file) \
         |            ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_ttm_page_pool_open':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2100:23: error: 'amdgpu_ttm_page_pool_show' undeclared (first use in this function); did you mean 'amdgpu_ttm_page_pool_open'?
    2100 | DEFINE_SHOW_ATTRIBUTE(amdgpu_ttm_page_pool);
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:175:27: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     175 |  return single_open(file, __name ## _show, inode->i_private); \
         |                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_fill_buffer':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2100:23: error: initializer element is not constant
    2100 | DEFINE_SHOW_ATTRIBUTE(amdgpu_ttm_page_pool);
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2100:23: note: (near initialization for 'amdgpu_ttm_page_pool_fops.open')
    2100 | DEFINE_SHOW_ATTRIBUTE(amdgpu_ttm_page_pool);
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:180:11: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     180 |  .open  = __name ## _open,    \
         |           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2107:16: error: invalid storage class for function 'amdgpu_ttm_vram_read'
    2107 | static ssize_t amdgpu_ttm_vram_read(struct file *f, char __user *buf,
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2142:16: error: invalid storage class for function 'amdgpu_ttm_vram_write'
    2142 | static ssize_t amdgpu_ttm_vram_write(struct file *f, const char __user *buf,
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2183:10: error: initializer element is not constant
    2183 |  .read = amdgpu_ttm_vram_read,
         |          ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2183:10: note: (near initialization for 'amdgpu_ttm_vram_fops.read')
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2184:11: error: initializer element is not constant
    2184 |  .write = amdgpu_ttm_vram_write,
         |           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2184:11: note: (near initialization for 'amdgpu_ttm_vram_fops.write')
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2195:16: error: invalid storage class for function 'amdgpu_iomem_read'
    2195 | static ssize_t amdgpu_iomem_read(struct file *f, char __user *buf,
         |                ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2251:16: error: invalid storage class for function 'amdgpu_iomem_write'
    2251 | static ssize_t amdgpu_iomem_write(struct file *f, const char __user *buf,
         |                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2297:10: error: initializer element is not constant
    2297 |  .read = amdgpu_iomem_read,
         |          ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2297:10: note: (near initialization for 'amdgpu_ttm_iomem_fops.read')
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2298:11: error: initializer element is not constant
    2298 |  .write = amdgpu_iomem_write,
         |           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2298:11: note: (near initialization for 'amdgpu_ttm_iomem_fops.write')
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_ttm_debugfs_init':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2315:9: error: 'amdgpu_mm_vram_table_fops' undeclared (first use in this function); did you mean 'amdgpu_mm_oa_table_fops'?
    2315 |        &amdgpu_mm_vram_table_fops);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         amdgpu_mm_oa_table_fops
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_fill_buffer':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2327:1: error: expected declaration or statement at end of input
    2327 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1954:6: warning: unused variable 'r' [-Wunused-variable]
    1954 |  int r;
         |      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1953:21: warning: unused variable 'job' [-Wunused-variable]
    1953 |  struct amdgpu_job *job;
         |                     ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1951:11: warning: unused variable 'num_bytes' [-Wunused-variable]
    1951 |  uint64_t num_bytes;
         |           ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1950:26: warning: unused variable 'num_dw' [-Wunused-variable]
    1950 |  unsigned int num_loops, num_dw;
         |                          ^~~~~~
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c: In function 'amdgpu_vm_move_to_lru_tail':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:663:1: error: version control conflict marker in file
     663 | <<<<<<< HEAD
         | ^~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:666:10: warning: missing terminating ' character
     666 | ======= I'M SOOOOOO TIRED OF THESE CONFLICTS BETWEEN DRM/DRM-NEXT AND DRM-MISC/FOR-LINUX-NEXT
         |          ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:666:10: error: missing terminating ' character
     666 | ======= I'M SOOOOOO TIRED OF THESE CONFLICTS BETWEEN DRM/DRM-NEXT AND DRM-MISC/FOR-LINUX-NEXT
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:656:21: warning: unused variable 'shadow' [-Wunused-variable]
     656 |   struct amdgpu_bo *shadow = amdgpu_bo_shadowed(bo);
         |                     ^~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:691:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     691 | int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
         | ^~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:756:12: error: invalid storage class for function 'amdgpu_vm_clear_bo'
     756 | static int amdgpu_vm_clear_bo(struct amdgpu_device *adev,
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:878:12: error: invalid storage class for function 'amdgpu_vm_pt_create'
     878 | static int amdgpu_vm_pt_create(struct amdgpu_device *adev,
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:965:12: error: invalid storage class for function 'amdgpu_vm_alloc_pts'
     965 | static int amdgpu_vm_alloc_pts(struct amdgpu_device *adev,
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1016:13: error: invalid storage class for function 'amdgpu_vm_free_table'
    1016 | static void amdgpu_vm_free_table(struct amdgpu_vm_pt *entry)
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1039:13: error: invalid storage class for function 'amdgpu_vm_free_pts'
    1039 | static void amdgpu_vm_free_pts(struct amdgpu_device *adev,
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1310:12: error: invalid storage class for function 'amdgpu_vm_update_pde'
    1310 | static int amdgpu_vm_update_pde(struct amdgpu_vm_update_params *params,
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1337:13: error: invalid storage class for function 'amdgpu_vm_invalidate_pds'
    1337 | static void amdgpu_vm_invalidate_pds(struct amdgpu_device *adev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1405:13: error: invalid storage class for function 'amdgpu_vm_update_flags'
    1405 | static void amdgpu_vm_update_flags(struct amdgpu_vm_update_params *params,
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1440:13: error: invalid storage class for function 'amdgpu_vm_fragment'
    1440 | static void amdgpu_vm_fragment(struct amdgpu_vm_update_params *params,
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1503:12: error: invalid storage class for function 'amdgpu_vm_update_ptes'
    1503 | static int amdgpu_vm_update_ptes(struct amdgpu_vm_update_params *params,
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c: In function 'amdgpu_vm_bo_update':
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1870:1: error: version control conflict marker in file
    1870 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1874:1: error: version control conflict marker in file
    1874 | =======
         | ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1877:1: error: version control conflict marker in file
    1877 | >>>>>>> drm-misc/for-linux-next
         | ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c: In function 'amdgpu_vm_move_to_lru_tail':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1963:13: error: invalid storage class for function 'amdgpu_vm_update_prt_state'
    1963 | static void amdgpu_vm_update_prt_state(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1979:13: error: invalid storage class for function 'amdgpu_vm_prt_get'
    1979 | static void amdgpu_vm_prt_get(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1993:13: error: invalid storage class for function 'amdgpu_vm_prt_put'
    1993 | static void amdgpu_vm_prt_put(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2005:13: error: invalid storage class for function 'amdgpu_vm_prt_cb'
    2005 | static void amdgpu_vm_prt_cb(struct dma_fence *fence, struct dma_fence_cb *_cb)
         |             ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2019:13: error: invalid storage class for function 'amdgpu_vm_add_prt_cb'
    2019 | static void amdgpu_vm_add_prt_cb(struct amdgpu_device *adev,
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2052:13: error: invalid storage class for function 'amdgpu_vm_free_mapping'
    2052 | static void amdgpu_vm_free_mapping(struct amdgpu_device *adev,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2070:13: error: invalid storage class for function 'amdgpu_vm_prt_fini'
    2070 | static void amdgpu_vm_prt_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2263:13: error: invalid storage class for function 'amdgpu_vm_bo_insert_map'
    2263 | static void amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2759:17: error: invalid storage class for function 'amdgpu_vm_get_block_size'
    2759 | static uint32_t amdgpu_vm_get_block_size(uint64_t vm_size)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3016:12: error: invalid storage class for function 'amdgpu_vm_check_clean_reserved'
    3016 | static int amdgpu_vm_check_clean_reserved(struct amdgpu_device *adev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3588:1: error: expected declaration or statement at end of input
    3588 | }
         | ^
   At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3504:6: warning: 'amdgpu_debugfs_vm_bo_info' defined but not used [-Wunused-function]
    3504 | void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3406:6: warning: 'amdgpu_vm_handle_fault' defined but not used [-Wunused-function]
    3406 | bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3382:6: warning: 'amdgpu_vm_set_task_info' defined but not used [-Wunused-function]
    3382 | void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3362:6: warning: 'amdgpu_vm_get_task_info' defined but not used [-Wunused-function]
    3362 | void amdgpu_vm_get_task_info(struct amdgpu_device *adev, u32 pasid,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3314:5: warning: 'amdgpu_vm_ioctl' defined but not used [-Wunused-function]
    3314 | int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
         |     ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3296:6: warning: 'amdgpu_vm_manager_fini' defined but not used [-Wunused-function]
    3296 | void amdgpu_vm_manager_fini(struct amdgpu_device *adev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3249:6: warning: 'amdgpu_vm_manager_init' defined but not used [-Wunused-function]
    3249 | void amdgpu_vm_manager_init(struct amdgpu_device *adev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3184:6: warning: 'amdgpu_vm_fini' defined but not used [-Wunused-function]
    3184 | void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
         |      ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3162:6: warning: 'amdgpu_vm_release_compute' defined but not used [-Wunused-function]
    3162 | void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3055:5: warning: 'amdgpu_vm_make_compute' defined but not used [-Wunused-function]
    3055 | int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2894:5: warning: 'amdgpu_vm_init' defined but not used [-Wunused-function]
    2894 | int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, u32 pasid)
         |     ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2782:6: warning: 'amdgpu_vm_adjust_size' defined but not used [-Wunused-function]
    2782 | void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2721:6: warning: 'amdgpu_vm_bo_invalidate' defined but not used [-Wunused-function]
    2721 | void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2685:6: warning: 'amdgpu_vm_evictable' defined but not used [-Wunused-function]
    2685 | bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2630:6: warning: 'amdgpu_vm_bo_rmv' defined but not used [-Wunused-function]
    2630 | void amdgpu_vm_bo_rmv(struct amdgpu_device *adev,
         |      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2598:6: warning: 'amdgpu_vm_bo_trace_cs' defined but not used [-Wunused-function]
    2598 | void amdgpu_vm_bo_trace_cs(struct amdgpu_vm *vm, struct ww_acquire_ctx *ticket)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2584:30: warning: 'amdgpu_vm_bo_lookup_mapping' defined but not used [-Wunused-function]
    2584 | struct amdgpu_bo_va_mapping *amdgpu_vm_bo_lookup_mapping(struct amdgpu_vm *vm,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2481:5: warning: 'amdgpu_vm_bo_clear_mappings' defined but not used [-Wunused-function]
    2481 | int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2427:5: warning: 'amdgpu_vm_bo_unmap' defined but not used [-Wunused-function]
    2427 | int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2367:5: warning: 'amdgpu_vm_bo_replace_map' defined but not used [-Wunused-function]
    2367 | int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2301:5: warning: 'amdgpu_vm_bo_map' defined but not used [-Wunused-function]
    2301 | int amdgpu_vm_bo_map(struct amdgpu_device *adev,
         |     ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2225:22: warning: 'amdgpu_vm_bo_add' defined but not used [-Wunused-function]
    2225 | struct amdgpu_bo_va *amdgpu_vm_bo_add(struct amdgpu_device *adev,
         |                      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2168:5: warning: 'amdgpu_vm_handle_moved' defined but not used [-Wunused-function]
    2168 | int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2114:5: warning: 'amdgpu_vm_clear_freed' defined but not used [-Wunused-function]
    2114 | int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1785:6: warning: 'amdgpu_vm_get_memory' defined but not used [-Wunused-function]
    1785 | void amdgpu_vm_get_memory(struct amdgpu_vm *vm, uint64_t *vram_mem,
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1286:10: warning: 'amdgpu_vm_map_gart' defined but not used [-Wunused-function]
    1286 | uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr)
         |          ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1260:22: warning: 'amdgpu_vm_bo_find' defined but not used [-Wunused-function]
    1260 | struct amdgpu_bo_va *amdgpu_vm_bo_find(struct amdgpu_vm *vm,
         |                      ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1138:5: warning: 'amdgpu_vm_flush' defined but not used [-Wunused-function]
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - LOCK_STAT && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT


vim +992 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

   946	
   947	/*
   948	 * amdgpu_ttm_alloc_gart - Make sure buffer object is accessible either
   949	 * through AGP or GART aperture.
   950	 *
   951	 * If bo is accessible through AGP aperture, then use AGP aperture
   952	 * to access bo; otherwise allocate logical space in GART aperture
   953	 * and map bo to GART aperture.
   954	 */
   955	int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
   956	{
   957		struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
   958		struct ttm_operation_ctx ctx = { false, false };
   959		struct amdgpu_ttm_tt *gtt = (void *)bo->ttm;
   960		struct ttm_placement placement;
   961		struct ttm_place placements;
   962		struct ttm_resource *tmp;
   963		uint64_t addr, flags;
   964		int r;
   965	
   966		if (bo->resource->start != AMDGPU_BO_INVALID_OFFSET)
   967			return 0;
   968	
   969		addr = amdgpu_gmc_agp_addr(bo);
   970		if (addr != AMDGPU_BO_INVALID_OFFSET) {
   971			bo->resource->start = addr >> PAGE_SHIFT;
   972			return 0;
   973		}
   974	
   975		/* allocate GART space */
   976		placement.num_placement = 1;
   977		placement.placement = &placements;
   978		placement.num_busy_placement = 1;
   979		placement.busy_placement = &placements;
   980		placements.fpfn = 0;
   981		placements.lpfn = adev->gmc.gart_size >> PAGE_SHIFT;
   982		placements.mem_type = TTM_PL_TT;
   983		placements.flags = bo->resource->placement;
   984	
   985		r = ttm_bo_mem_space(bo, &placement, &tmp, &ctx);
   986		if (unlikely(r))
   987			return r;
   988	
   989		/* compute PTE flags for this buffer object */
   990		flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, tmp);
   991	
 > 992	<<<<<<< HEAD
   993			amdgpu_gart_invalidate_tlb(adev);
 > 994			ttm_resource_free(bo, &bo->mem);
   995			bo->mem = tmp;
 > 996	======= I'M SOOOOOO TIRED OF THESE CONFLICTS BETWEEN DRM/DRM-NEXT AND DRM-MISC/FOR-LINUX-NEXT
   997		/* Bind pages */
   998		gtt->offset = (u64)tmp->start << PAGE_SHIFT;
   999		r = amdgpu_ttm_gart_bind(adev, bo, flags);
  1000		if (unlikely(r)) {
  1001			ttm_resource_free(bo, &tmp);
  1002			return r;
  1003	>>>>>>> drm-misc/for-linux-next
  1004		}
  1005	
  1006		ttm_resource_free(bo, &bo->resource);
  1007		ttm_bo_assign_mem(bo, tmp);
  1008	
  1009		return 0;
  1010	}
  1011	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--C7zPtVaVf+AK4Oqc
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--C7zPtVaVf+AK4Oqc--
