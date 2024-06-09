Return-Path: <linux-renesas-soc+bounces-5976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C62901483
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 07:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50F101C20974
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 05:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340A22C9D;
	Sun,  9 Jun 2024 05:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNPYFlsE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319DD168DA
	for <linux-renesas-soc@vger.kernel.org>; Sun,  9 Jun 2024 05:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717910635; cv=none; b=ZY+p47tb9Wf57sqB0y0dI2xXcOuoDlc6xnCGue7KmWdGIlCuK7P6wAn6iF0yBV94kU9bzRm64Co0owCFaHmanbq2gkQUqWzyGEFmobjkJUXmev6IfY8yxwefibd4RaMi9Ed6XuzNHNVz1cm0b+UXxIN28HTxyChney+kZppvcj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717910635; c=relaxed/simple;
	bh=3gu5RuhpmW6o9Dzs9y660Df3zHBQZ9UdNOBZP8rx88Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OuWTfq4hm7s4RlKjSMxwNbXdjnMocK9W+m1rQa5BiuxknX7u8KVX1PyNL/DCyOhe4JdRWibPjb+vYN72cMVGcT1kfw8994u6axit6FWXB7+m8zaMSDq4ssNOv6kjU6NAf9FVTdyLpphEg46mRdN0//9L7Dwub8mp1l0AZaMmd2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JNPYFlsE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717910633; x=1749446633;
  h=date:from:to:cc:subject:message-id;
  bh=3gu5RuhpmW6o9Dzs9y660Df3zHBQZ9UdNOBZP8rx88Q=;
  b=JNPYFlsET+is1/ABy5bxH7Wu/bNINxSp8oOA5g6RH7ZE5/MKIdNrflXc
   npyYb1QiLlGbe4uEvBS3VXp4N4VMrsF3+qs4eIOyMx+YG6qq5shcTG5Cq
   MC3S1YgzRpa9sLVhDbswYbjyY3C/mtaK+ZHPD4PmnMuDU0jWn4ofCVsiC
   i19uj44/5MZWKbLewoIDqgLFy/i9pnHjAzhhDwrdvGC3XKtu+nO25AcM1
   Vvo58Zi881vCvt297Oy/nc1Yv8at7F6dEnOaPIRq6qn1In3Zz3sCz1oq0
   6IBaY0tJB09IQmV9UXluKxJ2cUCdv6M0ju30xQwpQmOJRGhQIG3i/RUSN
   A==;
X-CSE-ConnectionGUID: v3ARjBw0TS21Mgfx+fqtPw==
X-CSE-MsgGUID: Bnw3xtHoTGqd2koz8dLoYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14331401"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14331401"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 22:23:52 -0700
X-CSE-ConnectionGUID: NRWc5hW6Rk6TDTRsr3fwkw==
X-CSE-MsgGUID: 1ikbLvKcRteFAAIczhPawg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="61911196"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jun 2024 22:23:51 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGB1x-0000sG-2H;
	Sun, 09 Jun 2024 05:23:49 +0000
Date: Sun, 09 Jun 2024 13:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.11] BUILD SUCCESS
 WITH WARNING 2bb78d9fb7c997f13309838600eead88cc99e96b
Message-ID: <202406091323.jNt5Mg8Q-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.11
branch HEAD: 2bb78d9fb7c997f13309838600eead88cc99e96b  arm64: dts: renesas: r8a779h0: Add video capture nodes

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406091234.0WUhe1oS-lkp@intel.com

Warning: (recently discovered and may have been fixed)

arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1012.12-1022.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1040.12-1050.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1068.12-1078.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1096.12-1106.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1124.12-1134.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1152.12-1162.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1668.12-1678.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
arch/arm64/boot/dts/renesas/r8a779h0.dtsi:956.12-966.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
arch/arm64/boot/dts/renesas/r8a779h0.dtsi:984.12-994.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm64-randconfig-001-20240609
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-isp-fed00000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef0000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef1000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef2000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef3000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef4000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef5000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef6000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    `-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef7000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
clang_recent_errors
`-- arm64-allmodconfig
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-isp-fed00000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef0000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef1000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef2000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef3000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef4000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef5000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    |-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef6000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary
    `-- arch-arm64-boot-dts-renesas-r8a779h0.dtsi.-.:Warning-(graph_child_address):soc-video-e6ef7000-ports-port:graph-node-has-single-child-node-endpoint-address-cells-size-cells-are-not-necessary

elapsed time: 2413m

configs tested: 44
configs skipped: 151

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240609   clang
arm                   randconfig-002-20240609   gcc  
arm                   randconfig-003-20240609   gcc  
arm                   randconfig-004-20240609   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240609   gcc  
arm64                 randconfig-002-20240609   clang
arm64                 randconfig-003-20240609   gcc  
arm64                 randconfig-004-20240609   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                           x86_64_defconfig   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

