Return-Path: <linux-renesas-soc+bounces-6956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 882AA91ED24
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 04:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AB7D1F21E05
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 02:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0276B674;
	Tue,  2 Jul 2024 02:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFH8e5js"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3418830
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jul 2024 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719888843; cv=none; b=ZvC1qtx4QH8kTQsTpEzT2xEbQX+4P0/vqd4DcE73vdKTEdCP7vlrf6o6zEsqQrafacpLV8/xtwEZyS0NPuA1X+P+INiEq3VZr9tlevbcHjtVeB0rlAODcfPXXLfquOssO4YBvaTNkWdWELdfT8IGw8dS5XsU31uEo7AkIBqP/T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719888843; c=relaxed/simple;
	bh=x587WV9Y3KDvQpBcGLmsh8wwuoVUnrgCZTvb5IT+lSI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cC1XBuqZad4V0mf1DoICq+pN0dv1I25Tnv4XzcogsuwvvL1Ub97gWbN97S3z/eFCRN2XFICjZgt2PBZ6zMVpCrsiBnJn8pIPgxIPO8tJA3OuogKsb/d18zsa+Ky7ZzradPNnk0f854VtwDOu89t2cQId/dzQ3HMg8v1evO+ttiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFH8e5js; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719888842; x=1751424842;
  h=date:from:to:cc:subject:message-id;
  bh=x587WV9Y3KDvQpBcGLmsh8wwuoVUnrgCZTvb5IT+lSI=;
  b=ZFH8e5jsM/UUG3ImT3c0qwZC/pvwqKvbzElenAhPsB9WvPzOMqf+29N0
   1hyGzuT0JUKF5fqFIs34W2wG9DiMJDdxPjQK8qTPBKJZ1kzrgxGmwqwc1
   aFK1antTRxgH1NQWX5ySXoEeBFIfGzG56TUTyp8jBbXbcg0ZiGag+bymS
   5yfHNpmL6uoWT9gx+k8w7h4FaZPizRsVAxTCMMiFvPk/FtQVYFFDFOi9q
   llOlz5X1bKrBUi2n7wIaw6wwNiA/uHJ90vPhnXSdf3abAObAJ6qbPLQR9
   qPlhCXC5jb3xZgbn/PxGEe1q5TFHd1/MuzyLckU9JwR1RvWSCDsRZG5R9
   Q==;
X-CSE-ConnectionGUID: EUxBsA9ESRy3u4RuvNyyjw==
X-CSE-MsgGUID: m+oSdNgdTa+wh21gTX53lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16706694"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="16706694"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 19:54:01 -0700
X-CSE-ConnectionGUID: PZOtV0f7Tn2OzDzmStIHIg==
X-CSE-MsgGUID: nherbYt8T0aBvgperQJGXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="50675659"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jul 2024 19:54:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOTeX-000Ndm-26;
	Tue, 02 Jul 2024 02:53:57 +0000
Date: Tue, 02 Jul 2024 10:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 5c91aa40e630a19362a16429ec9b886da940e69d
Message-ID: <202407021027.FWWnIh1t-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 5c91aa40e630a19362a16429ec9b886da940e69d  Merge branches 'renesas-arm-defconfig-for-v6.11' and 'renesas-dts-for-v6.11' into renesas-next

elapsed time: 983m

configs tested: 19
configs skipped: 97

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                             allyesconfig   clang-19
sh                                allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

