Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A793555CF99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jun 2022 15:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240341AbiF0Unz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Jun 2022 16:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbiF0Uny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 16:43:54 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABC519C15
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jun 2022 13:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656362633; x=1687898633;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=42dlCM9OA8qMtBemwV2rgavUVfH/XGPdiZxK3cixzhw=;
  b=YyJtQxi9GwhWjW2uaLU3uZYOixDTGEzOvjJ7VGWDo7QML/3RaYraLwWS
   R6/opNaHf7bmLC69V6kmrJgS4NZBX6mwQ6DY8FmQnAugN3yBo8YuELeeI
   6EaV+0Utwek0BamXRb2NnjacXlvaUcMKFeJNYUFW+9sfL2lPegFr0o1dY
   +c+en9sIW2TqsFslgF4SNEOpQJFfWUDVszo5fNuuTBfy+0n9u0tI234ot
   r7GK8BmtLnyX/khbmh1rnqByeWtQqRSmjUtiKY6HhwpiUQ5CEd1XEiAkG
   lrjitWrpslrnPNU5LS09wf4+2s/eeG34C/4g52poS78WDTD2a6I+4Ehzu
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="367872042"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="367872042"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 13:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="679740512"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2022 13:43:51 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o5vaH-00090h-SN;
        Mon, 27 Jun 2022 20:43:49 +0000
Date:   Tue, 28 Jun 2022 04:43:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 8a0c9dc8a8618e38c4241a947a93c7002652ff1b
Message-ID: <62ba1683.C0uwGJnhBOYg9dvJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 8a0c9dc8a8618e38c4241a947a93c7002652ff1b  Merge tag 'v5.19-rc4' into renesas-devel

elapsed time: 728m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64               randconfig-a012-20220627
x86_64               randconfig-a016-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a013-20220627
x86_64               randconfig-a014-20220627
x86_64               randconfig-a015-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a016-20220627
i386                 randconfig-a013-20220627
s390                 randconfig-r044-20220627
riscv                randconfig-r042-20220627
arc                  randconfig-r043-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
i386                 randconfig-a002-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a005-20220627
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a004-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
