Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78FB7B0A8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 18:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjI0Qpb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 12:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjI0Qpa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 12:45:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2222F92
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695833129; x=1727369129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YruFDaEAw4LJ4m4MyVN25yY/yEB3xoweeUlw55qHLGo=;
  b=PQRNcFISDBNI8ZvJ9m2lT/nG4yGc0p0GVbZjD223gzfaI/NU3uA03wpv
   jBr7j3SBTkHRma+ySDmsEEFEnElY/1kAd8TMbQmSmuIm40wQGrhwfbSYj
   dnQYAKQ54slGrDPJVe5JtZCM6hftie/xn9i1k6dO1riks+JgaZ0PkodrP
   lFAmJxX82fIPzaGfcofor7ev0achsdzJci0HnPrCgi/dz3UapJ5WX+fr/
   jpim+RFMYVmDQsbfnv5qdGk7FXohs5Hz20sBIEa/pzJ/FqCEjqHhpvMb/
   i+HuVNSvd6p8qvSMEa5G7Go65hULzp17wkLxNxqTg2FwvvhEkAzwABKRL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3409647"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="3409647"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:45:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819499718"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="819499718"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2023 09:45:27 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlXfB-0000Rn-13;
        Wed, 27 Sep 2023 16:45:25 +0000
Date:   Thu, 28 Sep 2023 00:45:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.6-rc1 2/137]
 drivers/of/overlay.c:82: warning: Function parameter or member 'kobj' not
 described in 'overlay_changeset'
Message-ID: <202309280043.aEmlhRNw-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.6-rc1
head:   5b25c3b1c2d80478ded680c33b1067e3faed4c0d
commit: 785f4b55d5d734c2524ae242831777b5210f8e2a [2/137] of: overlay: Kobjectify overlay objects
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230928/202309280043.aEmlhRNw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280043.aEmlhRNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280043.aEmlhRNw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/overlay.c:82: warning: Function parameter or member 'kobj' not described in 'overlay_changeset'


vim +82 drivers/of/overlay.c

7518b5890d8ac3 Pantelis Antoniou 2014-10-28  56  
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  57  /**
0290c4ca2536a3 Frank Rowand      2017-10-17  58   * struct overlay_changeset
39a751a4cb7e47 Frank Rowand      2018-02-12  59   * @id:			changeset identifier
0290c4ca2536a3 Frank Rowand      2017-10-17  60   * @ovcs_list:		list on which we are located
1e4089667c7c73 Frank Rowand      2022-04-20  61   * @new_fdt:		Memory allocated to hold unflattened aligned FDT
067c098766c6af Frank Rowand      2022-04-20  62   * @overlay_mem:	the memory chunk that contains @overlay_root
1e4089667c7c73 Frank Rowand      2022-04-20  63   * @overlay_root:	expanded device tree that contains the fragment nodes
067c098766c6af Frank Rowand      2022-04-20  64   * @notify_state:	most recent notify action used on overlay
3912b7917ab78d Frank Rowand      2017-10-17  65   * @count:		count of fragment structures
3912b7917ab78d Frank Rowand      2017-10-17  66   * @fragments:		fragment nodes in the overlay expanded device tree
3912b7917ab78d Frank Rowand      2017-10-17  67   * @symbols_fragment:	last element of @fragments[] is the  __symbols__ node
0290c4ca2536a3 Frank Rowand      2017-10-17  68   * @cset:		changeset to apply fragments to live device tree
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  69   */
0290c4ca2536a3 Frank Rowand      2017-10-17  70  struct overlay_changeset {
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  71  	int id;
0290c4ca2536a3 Frank Rowand      2017-10-17  72  	struct list_head ovcs_list;
1e4089667c7c73 Frank Rowand      2022-04-20  73  	const void *new_fdt;
067c098766c6af Frank Rowand      2022-04-20  74  	const void *overlay_mem;
1e4089667c7c73 Frank Rowand      2022-04-20  75  	struct device_node *overlay_root;
067c098766c6af Frank Rowand      2022-04-20  76  	enum of_overlay_notify_action notify_state;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  77  	int count;
0290c4ca2536a3 Frank Rowand      2017-10-17  78  	struct fragment *fragments;
3912b7917ab78d Frank Rowand      2017-10-17  79  	bool symbols_fragment;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  80  	struct of_changeset cset;
785f4b55d5d734 Pantelis Antoniou 2015-03-15  81  	struct kobject kobj;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28 @82  };
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  83  

:::::: The code at line 82 was first introduced by commit
:::::: 7518b5890d8ac366faa2326ce2356ef6392ce63d of/overlay: Introduce DT overlay support

:::::: TO: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
:::::: CC: Grant Likely <grant.likely@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
