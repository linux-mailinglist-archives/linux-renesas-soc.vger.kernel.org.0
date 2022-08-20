Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA1F59ACFD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Aug 2022 11:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344859AbiHTJhb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 20 Aug 2022 05:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344378AbiHTJh3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Aug 2022 05:37:29 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B32B9404;
        Sat, 20 Aug 2022 02:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660988247; x=1692524247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ljtd1sJoSw4+WWLOhkP+dR7DajSFnivj+he0lgBJyJQ=;
  b=XksN9KdvuwHJEfDqEcKIgfuuLD3V8JTxzElgZNaI31NVZXucTRuAuHKd
   liBvVDKTNA5J5Ae/kpMZJ//0MQo/5o31LzSj3PTy/H8bDRPmMpuPBQwX1
   Nw6a/IBIqyFD+dH1B44lzWIvKoszCWqAF1zTr9wc2IY+FNrrR7bv2yi1y
   xZPoLPHXjJcC4hpOSOKcIu1G6TWzduHMVxqKmIKUa1FQ0v1Tm7OTiItB0
   Ib2uTuGyy24UIiF65nMoT/fyOceOmKO/V4Dgd31E+1Xd8g7kAC5ctvpM1
   0/qadMAIjSEHiXMpJQJNGr2ZRdUhMs9QHZhojgiNED5XlEQYSrppjdQ0s
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="293164757"
X-IronPort-AV: E=Sophos;i="5.93,250,1654585200"; 
   d="scan'208";a="293164757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 02:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,250,1654585200"; 
   d="scan'208";a="637560355"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Aug 2022 02:37:25 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oPKuy-0002Rf-1o;
        Sat, 20 Aug 2022 09:37:24 +0000
Date:   Sat, 20 Aug 2022 17:37:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzv2m evk: Enable i2c
Message-ID: <202208201751.koiuT1se-lkp@intel.com>
References: <20220819193944.337599-4-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819193944.337599-4-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
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
[also build test ERROR on geert-renesas-drivers/renesas-clk linus/master v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Phil-Edworthy/Add-i2c-to-Renesas-RZ-V2M-SoC-and-board/20220820-034159
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
config: arm64-randconfig-r004-20220820 (https://download.01.org/0day-ci/archive/20220820/202208201751.koiuT1se-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 0ac597f3cacf60479ffd36b03766fa7462dabd78)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4b130a56e73ba827a556422037fe7e3690a36b00
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Phil-Edworthy/Add-i2c-to-Renesas-RZ-V2M-SoC-and-board/20220820-034159
        git checkout 4b130a56e73ba827a556422037fe7e3690a36b00
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts:75.1-9 Label or path pinctrl not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
