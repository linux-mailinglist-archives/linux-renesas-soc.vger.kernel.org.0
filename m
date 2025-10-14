Return-Path: <linux-renesas-soc+bounces-22984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDBDBD72D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 05:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DCED188AEE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 03:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C09A1EF36C;
	Tue, 14 Oct 2025 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKQBGqM5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C6B7494
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 03:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760411978; cv=none; b=PW0C9j8takXiL7fKRl+2I0C759B+gbWcGx4ptfvgpFkT6xlh+QkL7bXGEtSTwnSR4QoUB4tlqe7vGaW9sWSl4gzb3ym5wGxA8g29p5Cw5Dl4UBQi82n4KPk834AVj//Rton0wPuB3fKvD+0KC/NDeSw6zntKUH4DVMLNMxX3PXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760411978; c=relaxed/simple;
	bh=rL/rQLsV0kh6edAS7ttg8Z/B2hwrlDsdwylk4H03HgI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c+3R7xN83sbhTNttVdn7CqdpQzY60bsVtfQbdhhyms7lQ4gn48nDJmlHfit3vHytUrOxAupHy/0cj9QGQYxJuSu3CWR4CehBgf8Fx6xWVwUfFk+yVI9uHUEN5hdCMD2v92CzGNBovxe87fKOFJWevrjJpqXuDTWLSUmMq62qocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKQBGqM5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760411977; x=1791947977;
  h=date:from:to:cc:subject:message-id;
  bh=rL/rQLsV0kh6edAS7ttg8Z/B2hwrlDsdwylk4H03HgI=;
  b=oKQBGqM55nfSC7al5UcCF1Ym5zAV4WR7rGex8fJndFU/zor54l8C3nwJ
   3s9T16veqj1JoKDzNGdqJTZ9JJQ2rqPTmtTzUade2SKu7SGNAPD1j858T
   n2GR+UFTHBTa2ORH9RmvJyD0+z6w2cCX7Oe7OLEDUEj38HzvlxzcGTiQ5
   K7uLjd8M+M3WviL0BsbY0CPIM1WmRpafirTEnFco5egr5heMH24KuWZ1P
   s929KTLqjOCqqcJcLOlSrcKxVNGlJzSqkzQBBKPkqD0A8eTJzrW99ctdY
   qyVqH0y8JqiCMnUE3tRrBa24k24NvDmdtd4fDbVlKDF6dJ+/hzfdsF85b
   A==;
X-CSE-ConnectionGUID: KrwBd9WORgWNvmX5y9Zrpg==
X-CSE-MsgGUID: dUori9V3RSO6MJiO2/TJrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61602268"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="61602268"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 20:19:36 -0700
X-CSE-ConnectionGUID: AOxkhgmlSl2yq+kytJ/8Hw==
X-CSE-MsgGUID: ER1KJpn/Q6G0E6H6EJk1Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="181448888"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 13 Oct 2025 20:19:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8VYC-0002IA-28;
	Tue, 14 Oct 2025 03:18:27 +0000
Date: Tue, 14 Oct 2025 11:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.19] BUILD
 SUCCESS caf433bb59db842b41f57e4d0088ce0f76bb302a
Message-ID: <202510141145.CerhQnLz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.19
branch HEAD: caf433bb59db842b41f57e4d0088ce0f76bb302a  arm64: defconfig: Enable the Renesas RZ/G3E thermal driver

elapsed time: 794m

configs tested: 6
configs skipped: 125

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20251014    gcc-9.5.0
arm64  randconfig-002-20251014    gcc-10.5.0
arm64  randconfig-003-20251014    gcc-14.3.0
arm64  randconfig-004-20251014    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

