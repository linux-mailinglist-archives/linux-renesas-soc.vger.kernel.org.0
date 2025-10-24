Return-Path: <linux-renesas-soc+bounces-23586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD196C06654
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 15:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7BD18948FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 13:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D89303A38;
	Fri, 24 Oct 2025 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wc4pBiGm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDC0242D79
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311235; cv=none; b=rwAO+Hqg9ekzAxMOL4KGemob2eSRIIx+vR44Yxelq4iKLAVwU1fg2hn30O01ZcqctoVpzJXNylHugCWGsQqnO1CPpbCr9lu06jSFaivcHkMIL11GaX2z+zF88zJfVGYAwu+sS76NABgtkAOj65dyn6s6fK1XtiBdSsUumvDHF6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311235; c=relaxed/simple;
	bh=Re7cD8t4NnY3cj0u0Mp1ufgmd+Dk6PvaGVnr+4vUI9Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ae2AqTjhxvo84GyQjGnOV4QyeVbZ8zk7CHiP2hDCcavTMYV4ytgXrgkfDRkZh9T+y7OEzbcNDIzAkkE3GTFix23HUX7ZKQGWy00nNZIdsME9qh0ba1zWoki4Bb9i9ym0GExinEUAc48KL3rUIfATjXygEHhOTJ/UlnWkYGwuNGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wc4pBiGm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761311234; x=1792847234;
  h=date:from:to:cc:subject:message-id;
  bh=Re7cD8t4NnY3cj0u0Mp1ufgmd+Dk6PvaGVnr+4vUI9Y=;
  b=Wc4pBiGmRTjE68dmCljbw/T+r/uXUdk1WJ27Qz0UoT4XUfivtTPcohPq
   SyXiPKn2acxnrSuKE1kk59D4GeCyZ+bd/IcXd06ZRbPfeK3B+p5QJwugB
   YQA6P7AwWvtaK85dmjYM9w5bAJg/ajlNxBdN3LjFSLGs0K09ikjz/gkU3
   16X6LI7YcZ5qiP73HkRHQ664SFR0oV1NFVY1gldHLVIciqAQ3XkX8ffaY
   bEnKZm+wJAIC9M2B8UVs4X5MIegpYQP0ed8O8qFc8jHI7bnDPx6YgkyF0
   aYd95iVbX/loIiZCXjTceynO7Jfd/kSMwlVaMFP5n8dqGKvj2Bk+DXYg8
   w==;
X-CSE-ConnectionGUID: 4e54Td/mTDerD1vboLs5Sw==
X-CSE-MsgGUID: vm/uCvTTQNGMKzxi23BGog==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63398764"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="63398764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 06:07:12 -0700
X-CSE-ConnectionGUID: VzKfTKDVS/mXOqvcVVlvXA==
X-CSE-MsgGUID: GOboO/mXS5iZANpuGMQUUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184323961"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Oct 2025 06:07:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCHVd-000EW9-09;
	Fri, 24 Oct 2025 13:07:09 +0000
Date: Fri, 24 Oct 2025 21:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.19] BUILD
 SUCCESS e7d34657744a3e48e7ff3f61342eccd9852445bc
Message-ID: <202510242159.Qv8AsQpM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.19
branch HEAD: e7d34657744a3e48e7ff3f61342eccd9852445bc  arm64: defconfig: Enable RZ/T2H / RZ/N2H ADC driver

elapsed time: 1128m

configs tested: 11
configs skipped: 112

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20251024    clang-20
arm    randconfig-002-20251024    gcc-15.1.0
arm    randconfig-003-20251024    clang-22
arm    randconfig-004-20251024    clang-22
arm64             allmodconfig    clang-19
arm64  randconfig-001-20251024    gcc-8.5.0
arm64  randconfig-002-20251024    clang-16
arm64  randconfig-003-20251024    gcc-13.4.0
arm64  randconfig-004-20251024    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

