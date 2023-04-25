Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6146EE75B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 20:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjDYSKO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Apr 2023 14:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjDYSKN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 14:10:13 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A81A1619D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682446212; x=1713982212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6nmcsbCNtSexEx6LQK58BqPxspsvDZNTF9XwqYmM8o=;
  b=jRah5gx8i2ylUbgyxs84OAGZSlkattFtlSzroJF1Tjn1ZoOJSMTrhx+H
   F8432Wor2NTh7sN1VYtaoqUgWYWUlwR3kFIP5nvacuY3kF6t/TBxeFGWl
   lUn3CfG/Vq/dDNHc0HqoULHR3pcFPe3MiM36MKqDGQKi5v/JkdaVx9P0+
   VArA3x6GvEi6kW7voGOslYGK2KCDgKbd3Gn7AA+SDnWhcE3Vv5SbX+TCS
   dgjqzHESRgJzGLTnMxBtHt4A3H0Jfqb8pzphzIKU6i8IUWMeDMEkw8fRW
   2qvaJbS2qdCQmZU235gHvyok6f8V5zhHZRTvwTRo1aTSn7qthBurOdoqz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="348781468"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="348781468"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 11:09:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="939863069"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="939863069"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Apr 2023 11:09:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1prN6v-000jeq-2o;
        Tue, 25 Apr 2023 18:09:53 +0000
Date:   Wed, 26 Apr 2023 02:08:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 32/48]
 drivers/dma/dw-edma/dw-edma-core.c:231:13: error: redefinition of
 'dw_edma_device_caps'
Message-ID: <202304260234.QTHOuoZG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   109f3e0b7f96d5fdf923b8002a68961774c25a6e
commit: 96f65c7bbf0f2e3f2913180b739a926d3b3ddc9c [32/48] Merge remote-tracking branch 'pci/next' into renesas-drivers
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230426/202304260234.QTHOuoZG-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=96f65c7bbf0f2e3f2913180b739a926d3b3ddc9c
        git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
        git fetch --no-tags geert-renesas-drivers master
        git checkout 96f65c7bbf0f2e3f2913180b739a926d3b3ddc9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/dma/dw-edma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260234.QTHOuoZG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/dw-edma/dw-edma-core.c:231:13: error: redefinition of 'dw_edma_device_caps'
     231 | static void dw_edma_device_caps(struct dma_chan *dchan,
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/dma/dw-edma/dw-edma-core.c:213:13: note: previous definition of 'dw_edma_device_caps' with type 'void(struct dma_chan *, struct dma_slave_caps *)'
     213 | static void dw_edma_device_caps(struct dma_chan *dchan,
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/dma/dw-edma/dw-edma-core.c:213:13: warning: 'dw_edma_device_caps' defined but not used [-Wunused-function]


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
