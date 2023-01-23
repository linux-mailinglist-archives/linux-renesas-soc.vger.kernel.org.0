Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1026D6787A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 21:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjAWUYZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 15:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjAWUYZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 15:24:25 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E31C2684
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 12:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674505464; x=1706041464;
  h=date:from:cc:subject:message-id:mime-version;
  bh=c3KZKw6tzJDSQNTFKm2ABedO/TYlo/ud4fzT2ss55MA=;
  b=VpEqOF2uCiuHPddP9jUIdYeKcE8HJELJCaXgKzfAV/AeLly8F9x1MCkX
   dKX9TLiuFiWSu7FVTE8OxTT4fgh7kEKP7fO6+xC2A91DxSBfre6SUo4Aq
   HT2/MxR+uf8ANlP0G4VhW7Gf3neuGIzRzXj7BXEkYe5hZSdAdhL5YoMmz
   cbQnPr+6stgc5J8BJm2NikvGyhMmL10azsDriAJi9eGhxrKLx2uq+1v2C
   ZLawxwh8ui0ikSM9KwiHKOVrUNqiNc2D/OxTsYicxK3R7wLY1po1jFqle
   kW4CewtnkaaERjBD2Oxtw/iJhTjrYgvsgAbTKPxrNS/MmzfnP2UsmKlJ8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353411510"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="353411510"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 12:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="990599845"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="990599845"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2023 12:24:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK3Ma-0005sG-2b;
        Mon, 23 Jan 2023 20:24:20 +0000
Date:   Tue, 24 Jan 2023 04:23:42 +0800
From:   kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-devel:master 18/19] drivers/block/pktcdvd.c:49:10:
 fatal error: linux/pktcdvd.h: No such file or directory
Message-ID: <202301240450.yiHTqTmb-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
head:   8e27b1d4225c6a239971725fb12a477f99fc4b64
commit: 2f34838107c62f78f4cd17f34b744f24d3cc80d5 [18/19] Merge tag 'v6.2-rc5' into renesas-devel
config: alpha-randconfig-r026-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240450.yiHTqTmb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?id=2f34838107c62f78f4cd17f34b744f24d3cc80d5
        git remote add geert-renesas-devel https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
        git fetch --no-tags geert-renesas-devel master
        git checkout 2f34838107c62f78f4cd17f34b744f24d3cc80d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/block/pktcdvd.c:49:10: fatal error: linux/pktcdvd.h: No such file or directory
      49 | #include <linux/pktcdvd.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +49 drivers/block/pktcdvd.c

4b83e99ee7092d Jens Axboe 2023-01-04  48  
4b83e99ee7092d Jens Axboe 2023-01-04 @49  #include <linux/pktcdvd.h>
4b83e99ee7092d Jens Axboe 2023-01-04  50  #include <linux/module.h>
4b83e99ee7092d Jens Axboe 2023-01-04  51  #include <linux/types.h>
4b83e99ee7092d Jens Axboe 2023-01-04  52  #include <linux/kernel.h>
4b83e99ee7092d Jens Axboe 2023-01-04  53  #include <linux/compat.h>
4b83e99ee7092d Jens Axboe 2023-01-04  54  #include <linux/kthread.h>
4b83e99ee7092d Jens Axboe 2023-01-04  55  #include <linux/errno.h>
4b83e99ee7092d Jens Axboe 2023-01-04  56  #include <linux/spinlock.h>
4b83e99ee7092d Jens Axboe 2023-01-04  57  #include <linux/file.h>
4b83e99ee7092d Jens Axboe 2023-01-04  58  #include <linux/proc_fs.h>
4b83e99ee7092d Jens Axboe 2023-01-04  59  #include <linux/seq_file.h>
4b83e99ee7092d Jens Axboe 2023-01-04  60  #include <linux/miscdevice.h>
4b83e99ee7092d Jens Axboe 2023-01-04  61  #include <linux/freezer.h>
4b83e99ee7092d Jens Axboe 2023-01-04  62  #include <linux/mutex.h>
4b83e99ee7092d Jens Axboe 2023-01-04  63  #include <linux/slab.h>
4b83e99ee7092d Jens Axboe 2023-01-04  64  #include <linux/backing-dev.h>
4b83e99ee7092d Jens Axboe 2023-01-04  65  #include <scsi/scsi_cmnd.h>
4b83e99ee7092d Jens Axboe 2023-01-04  66  #include <scsi/scsi_ioctl.h>
4b83e99ee7092d Jens Axboe 2023-01-04  67  #include <scsi/scsi.h>
4b83e99ee7092d Jens Axboe 2023-01-04  68  #include <linux/debugfs.h>
4b83e99ee7092d Jens Axboe 2023-01-04  69  #include <linux/device.h>
4b83e99ee7092d Jens Axboe 2023-01-04  70  #include <linux/nospec.h>
4b83e99ee7092d Jens Axboe 2023-01-04  71  #include <linux/uaccess.h>
4b83e99ee7092d Jens Axboe 2023-01-04  72  

:::::: The code at line 49 was first introduced by commit
:::::: 4b83e99ee7092df37a5cf292fde976ebc475ea63 Revert "pktcdvd: remove driver."

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
