Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360DB50AF59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 07:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444051AbiDVFKh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 01:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356762AbiDVFKg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 01:10:36 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F674B412;
        Thu, 21 Apr 2022 22:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650604064; x=1682140064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ajU9/Al2pgTxbWYKHerN11BN/gqxMlOTbM0s5jP5RnM=;
  b=J9OtC5dfZfXKCXWKfcKVPa36OkJcY9G2yYj+jIhWrrQ1gkgFwj37Wayo
   Rv8D0tywyhhuld728cHhRsQV5wgFaOvChU9T8eMb75oSzSqP55gbXehrz
   DbWYvy8XwAsmRnf82XSPHj/XV/och90vzsgY2v8jHzXldKl7PUEvLwZTM
   PmrWwk/rwI5SgdSjn7s3mGeFUlkDFr3QVuiw2tmR4VFu/sW+ror2HAqpt
   odc9M0rd1mJ6zNjDS0bqyWY+P3NGf1fvkgLCc+XGW5IEf4oNCDn5FwjfE
   hyYOnqPMfv3z2IuSfv8Lgk+KPrlE5lXcr13hqulpnFd7yzVtZmsSiLkOz
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289692713"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="289692713"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 22:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="867218414"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2022 22:07:41 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nhlW8-0009F8-Lq;
        Fri, 22 Apr 2022 05:07:40 +0000
Date:   Fri, 22 Apr 2022 13:07:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     kbuild-all@lists.01.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v4 4/7] scsi: ufs-renesas: Add support for Renesas R-Car
 UFS controller
Message-ID: <202204221216.csH6k6mX-lkp@intel.com>
References: <20220420025450.289578-5-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420025450.289578-5-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yoshihiro,

I love your patch! Yet something to improve:

[auto build test ERROR on geert-renesas-devel/next]
[also build test ERROR on v5.18-rc3 next-20220421]
[cannot apply to mkp-scsi/for-next jejb-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Shimoda/treewide-scsi-ufs-Add-support-for-Renesas-R-Car-UFS-controller/20220420-105751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20220422/202204221216.csH6k6mX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/32b072c876095bb212d9bfb12f3b86d32bea1d07
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yoshihiro-Shimoda/treewide-scsi-ufs-Add-support-for-Renesas-R-Car-UFS-controller/20220420-105751
        git checkout 32b072c876095bb212d9bfb12f3b86d32bea1d07
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

drivers/scsi/ufs/ufs-renesas: struct of_device_id is 196 bytes.  The last of 1 is:
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x72 0x65 0x6e 0x65 0x73 0x61 0x73 0x2c 0x72 0x38 0x61 0x37 0x37 0x39 0x66 0x30 0x2d 0x75 0x66 0x73 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
>> FATAL: modpost: drivers/scsi/ufs/ufs-renesas: struct of_device_id is not terminated with a NULL entry!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
