Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405504A9DC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 18:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241669AbiBDRil (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 12:38:41 -0500
Received: from mga03.intel.com ([134.134.136.65]:12334 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241090AbiBDRik (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 12:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643996320; x=1675532320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O1t48c17XoJx7EOIIIEmyVVzGAn2IVOrgHRTPrmEe/U=;
  b=CsSnSB2tqP2z4iqdEwZSSJuf10v8SdLXVz244JmQhdXYtxWvi/JReYvP
   4vFx1PBSGeuvzviICrlTKiIbBuuBfjjwuhYlncrU33qpeI2JIR+2C9BaP
   +xXk2Edd24966H/u9a3i4lmlm7PNgE27ugB6qs6rrDGAcKxYtewedGOsq
   gqlVjk9Q2YB6l65nLVe7H0Mzp6cVhPs5pSuzjuTNi6o5o1X9artneecuX
   ZSpM7k764U8RMVG7PcTNf52Nf/MF51l19/eufqyV4X9WUbKibeK5t6Ezo
   +4t4hQ+157oGPd69Ng2jMab9qqzT8FAEKelBymlbQjmS9tj+cVvXRBCne
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="248357839"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="248357839"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 09:38:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="631768511"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2022 09:38:37 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nG2Xc-000Xx0-Li; Fri, 04 Feb 2022 17:38:36 +0000
Date:   Sat, 5 Feb 2022 01:38:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Message-ID: <202202050101.eoVR3IJN-lkp@intel.com>
References: <20220204135221.2598-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204135221.2598-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v5.17-rc2]
[cannot apply to geert-renesas-drivers/renesas-clk next-20220204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Biju-Das/clk-renesas-rzg2l-cpg-Add-support-for-RZ-V2L-SoC/20220204-215327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: mips-randconfig-r003-20220131 (https://download.01.org/0day-ci/archive/20220205/202202050101.eoVR3IJN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/c10eeae8f76f71a3b6778b816cb18c2db3e917f8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Biju-Das/clk-renesas-rzg2l-cpg-Add-support-for-RZ-V2L-SoC/20220204-215327
        git checkout c10eeae8f76f71a3b6778b816cb18c2db3e917f8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/clk/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/r9a07g044-cpg.c:14:10: fatal error: 'dt-bindings/clock/r9a07g054-cpg.h' file not found
   #include <dt-bindings/clock/r9a07g054-cpg.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +14 drivers/clk/renesas/r9a07g044-cpg.c

    12	
    13	#include <dt-bindings/clock/r9a07g044-cpg.h>
  > 14	#include <dt-bindings/clock/r9a07g054-cpg.h>
    15	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
