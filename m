Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC3B6E72DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Apr 2023 08:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjDSGIk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Apr 2023 02:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbjDSGIi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2023 02:08:38 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AE07EE8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 23:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681884517; x=1713420517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFd6S826A5maJk4OGrAotGluTj43cfII7cPWpLVWpvc=;
  b=j6TfU3DMkg2RPA3q5pEkp1t78+Z/4tHzTsNWW659YEayTJ+w+P4+YUCC
   ClcWsl84LXcQ8fLPtFhRw/uUSRdvWQtswvku2hdUnWainhx5Yay6BMWaV
   Ufwnb0FqKFsf2hOqd2XdhSR2e/yf4aMC8fiEXhGON8T7Ao1HqcjwraMGM
   NSXkjz1jyRWgTRp/QL7vN+IrLEtdRIvnX9bwg/fUOFGNBcbvSNVXRFOuj
   wWyl0MZcBD2611dHSu9e+ZjZJhsfswdK2K2rOOtMgN4MRQSvP4qw/SHXl
   xqSgoGceKNXWrFKYs8WTbuaDbUh3hFuCfpeCspy/V/iNfhTAhbc6t7LL/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="408269843"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="408269843"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 23:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693912304"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="693912304"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 23:08:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pp0za-000ebG-0q;
        Wed, 19 Apr 2023 06:08:34 +0000
Date:   Wed, 19 Apr 2023 14:07:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 32/47]
 drivers/dma/dw-edma/dw-edma-core.c:231:13: error: redefinition of
 'dw_edma_device_caps'
Message-ID: <202304191404.hmYyn4RN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   7e16ec08611059a1000cfa489ab5ae396d623e70
commit: 9ba38c702dd57eb4403edf14467a620ed3d8cc23 [32/47] Merge remote-tracking branch 'pci/next' into renesas-drivers
config: i386-randconfig-a015-20230417 (https://download.01.org/0day-ci/archive/20230419/202304191404.hmYyn4RN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=9ba38c702dd57eb4403edf14467a620ed3d8cc23
        git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
        git fetch --no-tags geert-renesas-drivers master
        git checkout 9ba38c702dd57eb4403edf14467a620ed3d8cc23
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191404.hmYyn4RN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/dw-edma/dw-edma-core.c:231:13: error: redefinition of 'dw_edma_device_caps'
   static void dw_edma_device_caps(struct dma_chan *dchan,
               ^
   drivers/dma/dw-edma/dw-edma-core.c:213:13: note: previous definition is here
   static void dw_edma_device_caps(struct dma_chan *dchan,
               ^
   1 error generated.


vim +/dw_edma_device_caps +231 drivers/dma/dw-edma/dw-edma-core.c

3883d64449ffe8 Serge Semin 2023-01-13  230  
6f94141d8662ff Serge Semin 2023-01-13 @231  static void dw_edma_device_caps(struct dma_chan *dchan,
6f94141d8662ff Serge Semin 2023-01-13  232  				struct dma_slave_caps *caps)
6f94141d8662ff Serge Semin 2023-01-13  233  {
6f94141d8662ff Serge Semin 2023-01-13  234  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
6f94141d8662ff Serge Semin 2023-01-13  235  
6f94141d8662ff Serge Semin 2023-01-13  236  	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
6f94141d8662ff Serge Semin 2023-01-13  237  		if (chan->dir == EDMA_DIR_READ)
6f94141d8662ff Serge Semin 2023-01-13  238  			caps->directions = BIT(DMA_DEV_TO_MEM);
6f94141d8662ff Serge Semin 2023-01-13  239  		else
6f94141d8662ff Serge Semin 2023-01-13  240  			caps->directions = BIT(DMA_MEM_TO_DEV);
6f94141d8662ff Serge Semin 2023-01-13  241  	} else {
6f94141d8662ff Serge Semin 2023-01-13  242  		if (chan->dir == EDMA_DIR_WRITE)
6f94141d8662ff Serge Semin 2023-01-13  243  			caps->directions = BIT(DMA_DEV_TO_MEM);
6f94141d8662ff Serge Semin 2023-01-13  244  		else
6f94141d8662ff Serge Semin 2023-01-13  245  			caps->directions = BIT(DMA_MEM_TO_DEV);
6f94141d8662ff Serge Semin 2023-01-13  246  	}
6f94141d8662ff Serge Semin 2023-01-13  247  }
6f94141d8662ff Serge Semin 2023-01-13  248  

:::::: The code at line 231 was first introduced by commit
:::::: 6f94141d8662ff9b164ea0c74a8325bbffc54183 dmaengine: dw-edma: Join read/write channels into a single device

:::::: TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
