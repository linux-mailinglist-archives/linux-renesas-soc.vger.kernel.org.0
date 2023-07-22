Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48AB675DA2F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Jul 2023 07:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjGVFTO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 22 Jul 2023 01:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjGVFTA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 Jul 2023 01:19:00 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4AE46B7;
        Fri, 21 Jul 2023 22:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690003116; x=1721539116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B8t2gm7EDukEfOzodNthZCOkWrOCkHaglu+1T6jozLA=;
  b=UipA4J1gQ9VlDH6yu24m+THbtgkOTfgfJD2y7mJoK/mxGfvJ0IGne1F7
   n7t/Vq4D9ue5u/yJcSzDjX2Xj5WTGp41wWLfqAQbMyjHHvYQLgF5CqhCW
   CAES+SE2+MIZjJaobZpoiQpHfz1tG/GJSxglFfVKEv/V9E6KmvGW59NNj
   l8RBELIAQ9JsSi2+o3HUQS9JUdg64VIM+OmTKRwZDIE7xCu+nG21/riTy
   W5nES5sqezI2NX7XrvyLSyVJK+VYrvM6aI9gEDYFknyp1pNVRJDkHLP1N
   Gb5geTm+sAuZ+wSCiTF29ikw0XBBSOiIrNBC1QvjogJM3r58K7rzBVUKq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="352060112"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="352060112"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 22:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055799089"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="1055799089"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jul 2023 22:16:38 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qN4yr-0007zh-3D;
        Sat, 22 Jul 2023 05:16:38 +0000
Date:   Sat, 22 Jul 2023 13:16:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a07g043: Add MTU3a node
Message-ID: <202307221318.jz5pDcvU-lkp@intel.com>
References: <20230720131016.331793-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720131016.331793-6-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-devel/next]
[also build test ERROR on robh/for-next linus/master v6.5-rc2 next-20230721]
[cannot apply to tip/timers/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-timer-renesas-rz-mtu3-Improve-documentation/20230720-213033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20230720131016.331793-6-biju.das.jz%40bp.renesas.com
patch subject: [PATCH 5/6] arm64: dts: renesas: r9a07g043: Add MTU3a node
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230722/202307221318.jz5pDcvU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221318.jz5pDcvU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221318.jz5pDcvU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: scripts/dtc/include-prefixes/arm64/renesas/r9a07g043.dtsi:81.18-19 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
