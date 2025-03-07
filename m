Return-Path: <linux-renesas-soc+bounces-14151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09104A56D59
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 17:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BCBA3AA31A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 16:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79F823A99D;
	Fri,  7 Mar 2025 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGG5aah1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D1023817D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364189; cv=none; b=iRoB+/ADajURQo6+U9RZcUELdALK+79J6EiDnln1tWZSh05dkVuIAdv21dupBIfn+H07jtez+uOWuFjHpwbM8173gFJINLWySxC7uuE5qzOXuMxh4lexyrxC9e2cDYFxA+VcOIVux5kQo206JnfPrvBFSH+6YWa8HqO0QPyIqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364189; c=relaxed/simple;
	bh=Sj8e8anhd4MGz7sCV7yp8ycHDHz9712M1RLjjhJjsNE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iu35ymTbD6UQ6d5p10SapbuKA6SxHuyTysQqhCq3wmnuOgt5yFcrZ6UmGL7gqIUgxv4O9S+YzRwIaBI1L9/Dh+Wt9gPTxwgaEyDWm0Y8Od1qHqH5ZerG5ardy8/GwHYa2uRN++zcbk2mQDmged2dzYj5iKmqGhtveAxllRs/msM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGG5aah1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741364188; x=1772900188;
  h=date:from:to:cc:subject:message-id;
  bh=Sj8e8anhd4MGz7sCV7yp8ycHDHz9712M1RLjjhJjsNE=;
  b=RGG5aah13yh21jTZ/3x7oQCQQLbKmO1HUw6wUSL/hk13l3O14/9ltS0p
   SYYXP+n64/os+wWCSC3k0qqfkhpN766TI4UOq+92J+J4AYptCMschmeUn
   7kVgbaXf9H3Ch2ioEqiFpsvN4Y2zWeKKDDwymaAOPpyJiPLoM/pJYel/G
   FhWeucGKWQYRitI0J8bPBsPdFqxa970dSXD/Vn9gz0ShW9iWhKOk5OWlC
   1GnV8awWKXiFj0JlvBINIOxnZJPzk/4ecqSB7y0xqfGuTsO0nkaCooeOu
   eFGq8FujAX1ywHCftORBdEVQbWa6yXk76YrrWerpqrn7fygjDoaMK6hOl
   A==;
X-CSE-ConnectionGUID: 0EF+6H0cThW/Z/qQ3mhIrQ==
X-CSE-MsgGUID: /kDRoO7FTjOvisfppjYNzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59819465"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="59819465"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:16:27 -0800
X-CSE-ConnectionGUID: Hfkay9UJTgOszRmB3BZ9Qw==
X-CSE-MsgGUID: aqXmIaxiQpiXAcVvCLr9hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124273967"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2025 08:16:27 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqaN6-0000jd-0J;
	Fri, 07 Mar 2025 16:16:24 +0000
Date: Sat, 08 Mar 2025 00:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 6078cb0812da8411d59c8bc8ffeb12610a8ec39e
Message-ID: <202503080041.JYXQWld3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 6078cb0812da8411d59c8bc8ffeb12610a8ec39e  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1456m

configs tested: 57
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250307    gcc-13.2.0
arc                  randconfig-002-20250307    gcc-13.2.0
arm                  randconfig-001-20250307    clang-21
arm                  randconfig-002-20250307    gcc-14.2.0
arm                  randconfig-003-20250307    clang-19
arm                  randconfig-004-20250307    clang-21
arm64                randconfig-001-20250307    gcc-14.2.0
arm64                randconfig-002-20250307    clang-15
arm64                randconfig-003-20250307    gcc-14.2.0
arm64                randconfig-004-20250307    clang-15
csky                 randconfig-001-20250307    gcc-14.2.0
csky                 randconfig-002-20250307    gcc-14.2.0
hexagon              randconfig-001-20250307    clang-21
hexagon              randconfig-002-20250307    clang-21
i386       buildonly-randconfig-001-20250307    clang-19
i386       buildonly-randconfig-002-20250307    clang-19
i386       buildonly-randconfig-003-20250307    gcc-11
i386       buildonly-randconfig-004-20250307    clang-19
i386       buildonly-randconfig-005-20250307    gcc-12
i386       buildonly-randconfig-006-20250307    clang-19
loongarch            randconfig-001-20250307    gcc-14.2.0
loongarch            randconfig-002-20250307    gcc-14.2.0
nios2                randconfig-001-20250307    gcc-14.2.0
nios2                randconfig-002-20250307    gcc-14.2.0
parisc               randconfig-001-20250307    gcc-14.2.0
parisc               randconfig-002-20250307    gcc-14.2.0
powerpc              randconfig-001-20250307    gcc-14.2.0
powerpc              randconfig-002-20250307    clang-21
powerpc              randconfig-003-20250307    clang-19
powerpc64            randconfig-001-20250307    clang-21
powerpc64            randconfig-002-20250307    gcc-14.2.0
powerpc64            randconfig-003-20250307    gcc-14.2.0
riscv                randconfig-001-20250307    gcc-14.2.0
riscv                randconfig-002-20250307    clang-19
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250307    gcc-14.2.0
s390                 randconfig-002-20250307    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250307    gcc-14.2.0
sh                   randconfig-002-20250307    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250307    gcc-14.2.0
sparc                randconfig-002-20250307    gcc-14.2.0
sparc64              randconfig-001-20250307    gcc-14.2.0
sparc64              randconfig-002-20250307    gcc-14.2.0
um                   randconfig-001-20250307    clang-17
um                   randconfig-002-20250307    clang-21
x86_64     buildonly-randconfig-001-20250307    clang-19
x86_64     buildonly-randconfig-002-20250307    gcc-12
x86_64     buildonly-randconfig-003-20250307    clang-19
x86_64     buildonly-randconfig-004-20250307    clang-19
x86_64     buildonly-randconfig-005-20250307    clang-19
x86_64     buildonly-randconfig-006-20250307    gcc-12
xtensa               randconfig-001-20250307    gcc-14.2.0
xtensa               randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

