Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B849E52FF67
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 May 2022 22:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344847AbiEUUe4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 May 2022 16:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240502AbiEUUez (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 May 2022 16:34:55 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B625338BE0;
        Sat, 21 May 2022 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653165294; x=1684701294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U53QBVnQjgrZwXCmHNKU8vM4EN7VyzE4dG5Eg1eRKBU=;
  b=oFBWnyun3v2d6phSv+G3umEqeXli2+w+IV9Re+7hpW51BEHybtbmyJP6
   x4a6/ZPzftiehlttA2+gIw6zBMLHyBQsGKqMXq/Rhbdzo1bl46J+QYt+c
   l8yvkzVKVFq6LLERXrREIhbvBojGnwjMxXZ+GrLxQrWm22CNVda8hNRzh
   364ImFVhLNgA0sIT6GvFABYYpjhSK6p3rQiB9Vwn81dBiwTzhv7vJSpTO
   LhRb1nj/WUkcSvWeg6Ta2GDCF+83W99FzQ503YOzvLnQdmioyMEicvTAL
   2whOqRk5+CCTuutem+6A1STbFf+NMasYZYTxQ3C/nZyfIHpbqlDvqh9ft
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="333533404"
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="333533404"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="607545747"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 May 2022 13:34:52 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nsVoJ-0006bQ-JH;
        Sat, 21 May 2022 20:34:51 +0000
Date:   Sun, 22 May 2022 04:34:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     kbuild-all@lists.01.org, Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: rzv2m evk: Enable ethernet
Message-ID: <202205220428.1iv6rKAJ-lkp@intel.com>
References: <20220520100736.15182-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520100736.15182-1-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on geert-renesas-devel/next]
[cannot apply to krzk/for-next v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Phil-Edworthy/arm64-dts-renesas-rzv2m-evk-Enable-ethernet/20220520-180929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220522/202205220428.1iv6rKAJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bae3dc745b58471823c22e98b6dbfb0ef17e213a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Phil-Edworthy/arm64-dts-renesas-rzv2m-evk-Enable-ethernet/20220520-180929
        git checkout bae3dc745b58471823c22e98b6dbfb0ef17e213a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts:47.1-5 Label or path avb not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
