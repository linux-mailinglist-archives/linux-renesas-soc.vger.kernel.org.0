Return-Path: <linux-renesas-soc+bounces-26165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A7493CE8533
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 00:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 415A23001E0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 23:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CB0274B39;
	Mon, 29 Dec 2025 23:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q78g+tdE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63730262FFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Dec 2025 23:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767050880; cv=none; b=WNzi//aVA5wK2O9B+JIkTMZnB2AzYqi4dNrDf0Tar3LO0cAT2fqvHVNiEtaXxgoR7MeeNjsHoQNC0BOHnNBymNxYvBCIjtQC/yeJCG5f3DkON76Bzkke3EvT+P/W1SgUAzIchOTCDeL906sQfDztjnuX7491Nzs6W37v1af8veE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767050880; c=relaxed/simple;
	bh=ScVG0SIkK8fKh5jPBFLfqXUwfJa844WVNqPqziXM+9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G/0y45DVtqnDJ6ROSZXguoPinWwPGZBfBeuW4oKRGTizfBmZqa9AxSxThvuFHP65KLIMDow2fVmkwOwgef1rg5MaIIluXUoL0CmGsVpFJmlcBVyqxWOmLtExBlKopem78dLrObdQYTsq2PiG3+MxkPjGW7dn1eHriY/yyRKzE4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q78g+tdE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767050878; x=1798586878;
  h=date:from:to:cc:subject:message-id;
  bh=ScVG0SIkK8fKh5jPBFLfqXUwfJa844WVNqPqziXM+9s=;
  b=Q78g+tdEl3LCEQvqyKmsQ+pD3/yNpQ7M920NtKL4K7iG4I1YshD+BpDQ
   qmToHQAvebFsZPkhBNmlNgH3DfzZLlXD8YMaprbpm2l9HBgWibXyJPJ0P
   chegnUF6ZDQw0FcEnWE3+QyLhR0mw7IOWadG2ncyj4aK+Lfv5udGjzJSF
   Lvy+GHCGR60x5ZZDezu3Ov/pRfk+0aKCScFNW4ens9d/IigLOF3FXTdi+
   +g2uSy9neRLFAxlvr8j0uy1yCi+o1P9OXp0zfXUzr/hT2WjnWykq45N1K
   By2O6/Fx6r8ibTv6L+kIst4Jbou3R93F1bP4D6/F1SjONUIC2fJ91LY+r
   g==;
X-CSE-ConnectionGUID: CrRM3KRMQkaFwFkkbqeSLg==
X-CSE-MsgGUID: CXDPhh3JQjiiCU3Flml+4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86078278"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="86078278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 15:27:58 -0800
X-CSE-ConnectionGUID: Nk6ZnlHPTYi095wc9fdBNA==
X-CSE-MsgGUID: VkSRRMKuQfyODOWEfRpEsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="201020540"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Dec 2025 15:27:57 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaMeY-0000000087Z-2Aq2;
	Mon, 29 Dec 2025 23:27:54 +0000
Date: Tue, 30 Dec 2025 07:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.20] BUILD SUCCESS
 6b9804013bdd7370cf6d2ef0e86588abe97fd2e6
Message-ID: <202512300732.5yKGgZ75-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
branch HEAD: 6b9804013bdd7370cf6d2ef0e86588abe97fd2e6  arm64: dts: renesas: r8a779h0: Add WWDT nodes

elapsed time: 722m

configs tested: 19
configs skipped: 156

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  defconfig    gcc-15.1.0
arc                    defconfig    gcc-15.1.0
arm                  allnoconfig    clang-22
arm                 allyesconfig    gcc-15.1.0
arm                    defconfig    clang-22
arm      randconfig-001-20251229    gcc-15.1.0
arm      randconfig-002-20251229    gcc-12.5.0
arm      randconfig-003-20251229    clang-22
arm      randconfig-004-20251229    gcc-15.1.0
arm64               allmodconfig    clang-19
arm64                allnoconfig    gcc-15.1.0
arm64                  defconfig    gcc-15.1.0
arm64    randconfig-001-20251229    clang-22
arm64    randconfig-002-20251229    clang-22
arm64    randconfig-003-20251229    gcc-10.5.0
arm64    randconfig-004-20251229    gcc-9.5.0
csky                   defconfig    gcc-15.1.0
hexagon                defconfig    clang-22
i386                   defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

