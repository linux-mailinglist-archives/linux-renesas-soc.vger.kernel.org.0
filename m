Return-Path: <linux-renesas-soc+bounces-13519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DD5A40A87
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2025 18:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C4A3BA32D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2025 17:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2055F13BAF1;
	Sat, 22 Feb 2025 17:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/QTduSK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A02D12E7F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Feb 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740244187; cv=none; b=OwvOwmaypGEY8E13unCzqUTaZnoB36BejJluU2UfTMcP4xMKs7BcHiqkzcx9Rml+6YuDRxg19bnWMGmgvbVwnuS/UaocMYB3kiy6v07Wif1xEKhHJZVO3FVymUt6cU//8S/0NVHhLU77lrXBd5vRkfHdXTfA3S1/n+qw0GTd4E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740244187; c=relaxed/simple;
	bh=1wP/Maq1j5XQ+8xRlmVZfhHx9YgKVBkEM21jJ2VDcSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jC9I2mVvjbObibwfNVWdxnu/0v1UPBYHR2KaHZbWxqmOBXAK/niD1f18MRWkz1+MktWfatewMBL2XsKeB4E06nfaLI9J98jaExjdnrqx6RYgCLCZOcMtNveWiRbv2BkjOUtvJ76bPLfTJQRacnRLOrXF1Qm85p/VbV5XU0qcaVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/QTduSK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740244186; x=1771780186;
  h=date:from:to:cc:subject:message-id;
  bh=1wP/Maq1j5XQ+8xRlmVZfhHx9YgKVBkEM21jJ2VDcSk=;
  b=h/QTduSKqoQiJRsPoUDXylvbznGHQSmsnmZS0BMBSEXw/rKFtIP+ChQr
   y8MqjgqI7HWu4WkmE37LEXsarm6st6uepWuyzZz8ecN93voaukTqtw3WJ
   SGebQvnywAnfdJo15DMfAjTrbbIAyPiKx5vXLUHvZ0vGT57Nlv8DYE66h
   00yagDtPLISUwthyd6O3jePMRFDUQTh+1aa7jck3VTHOV625BfeEUHNLX
   3Omgzpuf5mCR7GVw9wxpOKPh+3s4BZt1sh3mZSbRKiDfbhhroCoYGVG+f
   TONGeyHXWOWwgiMSMOUgiqzBYiDe0JOP1RGQTxvGCMUZAfqujWRuD4///
   Q==;
X-CSE-ConnectionGUID: TUFH1ZSTQnKzPERmZeoMUA==
X-CSE-MsgGUID: tU/26brVQgWtLlRmnD4sIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="43877148"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="43877148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 09:09:45 -0800
X-CSE-ConnectionGUID: k9P1jpReToKMbSFHS0J00w==
X-CSE-MsgGUID: MyVlgOJXSjC9RRO/4/K4yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115484953"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2025 09:09:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlt0X-0006l1-2Y;
	Sat, 22 Feb 2025 17:09:41 +0000
Date: Sun, 23 Feb 2025 01:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.15] BUILD SUCCESS
 5f7ebb81112c3f50ffbb8e576e4d35cedd8aabb1
Message-ID: <202502230154.uuf1y7qM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
branch HEAD: 5f7ebb81112c3f50ffbb8e576e4d35cedd8aabb1  ARM: dts: renesas: r9a06g032: Fix UART dma channel order

elapsed time: 1455m

configs tested: 8
configs skipped: 113

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm    randconfig-001-20250222    gcc-14.2.0
arm    randconfig-002-20250222    gcc-14.2.0
arm    randconfig-003-20250222    clang-16
arm    randconfig-004-20250222    gcc-14.2.0
arm64  randconfig-001-20250222    gcc-14.2.0
arm64  randconfig-002-20250222    clang-21
arm64  randconfig-003-20250222    clang-18
arm64  randconfig-004-20250222    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

