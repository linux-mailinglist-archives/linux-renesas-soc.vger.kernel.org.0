Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03D9678D7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 02:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbjAXBdg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 20:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjAXBdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 20:33:35 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E802B11EBD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 17:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674524014; x=1706060014;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/yCtJA5TyS0nIb+AnB1b6BJd4tnmxb7b2b0Xwe4YBFQ=;
  b=fetj26yI9hML6JCjJJov150DApbdC2SjnLWATH7vfZkKecG1C4z510P/
   /yl2k00VZPCxyGGtjgVzw7PO0Ju26ablr+jgTyp54Pfet5SK720f6Rapf
   Wgt5V///hnjociIiaqaSoFjEIu+YwbeL13M71TZ+Qv2UMe6nEwVRLI3Vb
   egjDYOJGYOP4Gsipo+UH8deZOEMFOq5h9cmikVL/EcSORuCdYaA8KIt01
   r0rXM/iXrTdLAykQK72ZxhNgPUNPjhT7a8wYTg3V7iPxoVAk2HWasDvQ1
   ZrzwkRCwXdfA/h3+RRGwnRbHk6DL98eBLX7LZhMEW+/CyHzZOKY5JCi3S
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412439779"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="412439779"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 17:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655253098"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="655253098"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 17:33:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK8Bm-00061M-2G;
        Tue, 24 Jan 2023 01:33:30 +0000
Date:   Tue, 24 Jan 2023 09:32:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.3] BUILD SUCCESS
 5b06e1cb0eba21179ba9f92027a91675049b75c4
Message-ID: <63cf3535.JPXgOI5GRB4SXuS8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.3
branch HEAD: 5b06e1cb0eba21179ba9f92027a91675049b75c4  arm64: dts: beacon-renesom: Fix audio clock rate

elapsed time: 724m

configs tested: 40
configs skipped: 77

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                  randconfig-r046-20230123
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                            allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig

clang tested configs:
riscv                randconfig-r042-20230123
x86_64                          rhel-8.3-rust
x86_64               randconfig-k001-20230123
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
