Return-Path: <linux-renesas-soc+bounces-9800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A9B9A089B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 13:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F26371F23A3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 11:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DCE206953;
	Wed, 16 Oct 2024 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlV9v1tL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E14206059
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2024 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729079113; cv=none; b=khszBMhC2jHmTV3IZuTrw5Zkt9/96Vxigew9/zwGfqPfrJNOJkX3LxN+qPJvSs30HNf9/6BoFi+GoN8n8xnDhl0m5VPz+rdpOO3abqjFTqFr4BFweDt5z+FAHcPvbVRXr+NqtX8lfVaYfeDprDAd2If/AyR2+ytxAVJs+SGI/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729079113; c=relaxed/simple;
	bh=i6tAiuVAuEkxiv78z+/OH4pmZaPWq6LM8jppz7CtUh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EKbYNyaazWEkcfUjVoBj7SNE+fwboFSLvGJPCfiMEgiMKFmN62KKuBTkM19vu7ynbu2ruZ7l5HVLyBGnXA8dzc/NDeo9OxvgZNHE1ZHGv7hmAOenIUN3wfW+owyIiKPimsRg88WWqR6exQmshQ0SvScyc9jJY5w31/0MhKWa11M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlV9v1tL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729079111; x=1760615111;
  h=date:from:to:cc:subject:message-id;
  bh=i6tAiuVAuEkxiv78z+/OH4pmZaPWq6LM8jppz7CtUh0=;
  b=MlV9v1tLNzgWevgGpE0BpEsvehWDU6eqTC6hrKxEo+TbaofiRPfEuZHC
   ODc1v4tBdQkGio9wFWD96vhRH2yyq2ZXY47eo0kePeLvl99E15rNAronS
   ctiLG9Zk3AXK2xifU9tWj36b1yxK1PojVPc3NYFyRFPXx4ZuAoNKlvLxb
   smQYQwdaqymo+iYNbArgwUGiTLpUzZHfOIX2eNUkBrEnT0cmhONb0OsXi
   uBtGMhUjYn9LmEQM8o7UEWeQGsdpjp/YVehMA311L5P+9LeFnGOB+PHmk
   qOxOmP1Qd2WXtMFwxpGV9kvcfMY4qaPh7UZ5NDZhbEcyK0+6BOqKvyUe1
   w==;
X-CSE-ConnectionGUID: xpCcdvjLQ1u3EIfjv8GwJg==
X-CSE-MsgGUID: KrPIibk5Qeu76/tAIxGEwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28408464"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28408464"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:45:11 -0700
X-CSE-ConnectionGUID: r8jMDcAJTXKhMU1w+4Bwrg==
X-CSE-MsgGUID: 3gh5qlKBQ56IhlH1bUxejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78647486"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Oct 2024 04:45:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t12Sh-000Krb-2s;
	Wed, 16 Oct 2024 11:45:07 +0000
Date: Wed, 16 Oct 2024 19:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 9c520ac4bc1cc92f4ca28790a933f6c36af4a25a
Message-ID: <202410161949.ZOtjzfaZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 9c520ac4bc1cc92f4ca28790a933f6c36af4a25a  Merge branch 'renesas-dts-for-v6.13' into renesas-next

elapsed time: 2994m

configs tested: 1
configs skipped: 68

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
riscv  allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

