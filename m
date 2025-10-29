Return-Path: <linux-renesas-soc+bounces-23839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C54FC19916
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 11:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE6E11898132
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 10:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CDD2E541F;
	Wed, 29 Oct 2025 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9d5BRph"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5E22DEA7E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 10:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732217; cv=none; b=usy+Fcoe5/oJcWX3K+hpnFC8PgXR73w/SYF7RQZhwjPzOM8w0M3LgOVBSfE1uSTaI+cE0h5veSwJr4qKE8Mmgt/IRh3m0WD28ijNoSwwUDzUH9nLuPZ1JvgnI2U4xmEuA+3M9rrfhy8xUnyKB5CSTJnmYrscACceOHvJmANcvTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732217; c=relaxed/simple;
	bh=hgKPLF9/Dz4+aIpew6IzPxQzQb+Esci7i2oveGxItAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QRHgwuq4w52cX32EoCKOy/bNIv3VfIGCpUX4VC4oh+p2MgK75rm1PtVJr5k35g97emSbrlP8v670XVeVGcz9ENmF28+cxU16IbaqjLebVGzg8sfWqPZ7jzq6LLlwGmdPk0vXO9uslyw9YdqNQ5hftUJdAOZgx7fmPXs7EH0M/ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9d5BRph; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761732215; x=1793268215;
  h=date:from:to:cc:subject:message-id;
  bh=hgKPLF9/Dz4+aIpew6IzPxQzQb+Esci7i2oveGxItAg=;
  b=G9d5BRphTHICkyLmSL6YusnurOSdZ0OmMwe5iB9eFWnVFRrYsF7d+Q2Z
   dmG9DckKzi3DTQfycwd9jYNeSLGk+6QBSDqNAyJLc2rKZJwuoL4+diz1m
   jrn8JAjHYmUVarhf5hDfTZWflBrlekQGKup7WWaIgMU+ODgH9QzEx73gC
   r9WRGIoIJWabUFLHYPliLBa76UtZxZSNk0UqWlhRHAE6AVSJWU5yiKpeT
   yL8hVQ8I6LdtysRErDn2WXj4PFH0YyWIr4KHVkA7oX5TnqKmOnWgsYgyG
   e4hiruLJuL1C16h3yTDPiLezbeOZMZZ1IH2PWiduT0kmaSHGad6zURrEQ
   w==;
X-CSE-ConnectionGUID: rsO2HLe6TMWCSM91x6pVHQ==
X-CSE-MsgGUID: fK9YnvGQTka/9RtCt2Rleg==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63550152"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63550152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 03:03:34 -0700
X-CSE-ConnectionGUID: ELpowLAST3eeoeeq47HTxA==
X-CSE-MsgGUID: RmpRFoNJTceHOrXKxDq78w==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2025 03:03:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE31f-000KUb-1r;
	Wed, 29 Oct 2025 10:03:31 +0000
Date: Wed, 29 Oct 2025 18:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.19] BUILD SUCCESS
 6e20a9d94a459b4eac436ba2e8d4717a0c496842
Message-ID: <202510291852.fzxrMweJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
branch HEAD: 6e20a9d94a459b4eac436ba2e8d4717a0c496842  arm64: dts: renesas: r8a77961: Add GX6250 GPU node

elapsed time: 1463m

configs tested: 11
configs skipped: 167

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                allnoconfig    clang-22
arm    randconfig-001-20251028    clang-22
arm    randconfig-002-20251028    clang-22
arm    randconfig-003-20251028    clang-22
arm    randconfig-004-20251028    gcc-8.5.0
arm64              allnoconfig    gcc-15.1.0
arm64             allyesconfig    clang-22
arm64  randconfig-001-20251028    clang-22
arm64  randconfig-002-20251028    clang-22
arm64  randconfig-003-20251028    gcc-11.5.0
arm64  randconfig-004-20251028    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

