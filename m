Return-Path: <linux-renesas-soc+bounces-6955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E2091ED23
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 04:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C400C1F21095
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 02:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28BAB674;
	Tue,  2 Jul 2024 02:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xa/tLdXx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A98830
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jul 2024 02:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719888722; cv=none; b=l+4bhoaex7IwvbeqDuWSGROMKjkGmryGSXT+HAJlRolnJbRHG3HSwUYSl+u6Y/o/w5mHZYQxAEhTSOLvLO2wL2y32UFtAlQR4QNla7WWiCB9UL/RbhmPVxfDPo9cWaj6aiJM6Xun1rhUYnh1AQ155vELTK9sJ3451F6OD85GNOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719888722; c=relaxed/simple;
	bh=QmkVl+FjgO+nAsGb7TrD/M+IDeKLYns3zaCbRfS/xZ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SOlDlPB3ZF4ao+tUXig+wSnbIZconnXbGpM8/FJzzsHyY/BcMYLB3431GJFRg3OcjeTYJUMWY9axGkD56HdMofbdukJAX7VpM++NVo/qBPu9Cw6ya7vjxPbpC2inx6MddarB2OiDcPXpN2A4p9AkXVAqlOKmHZlib1GQbQKcMY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xa/tLdXx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719888721; x=1751424721;
  h=date:from:to:cc:subject:message-id;
  bh=QmkVl+FjgO+nAsGb7TrD/M+IDeKLYns3zaCbRfS/xZ4=;
  b=Xa/tLdXxOar42OKWyenG1uDiMA5/AGzInXakVkc/RduACb9NQ/Q/RK34
   A3CBetLC5lFRx/0hFGYg1fQhy54R4WdXaVwsjknJaiRH5xTKExpI3l4tb
   LEg3FfGGDUOUvvSagGiCOyDmwTknmWURSavXJPf8uTaMQCFka9HAPmtnC
   iv3FHKNTXNDUUBfS3e4XbJpiYPr4pOTFy+7GPx8L/+aU8eEkVCwSpTmw6
   +E25l725GPxOMU0pUH7ci5W/uSUf/d2Sgy24NaWPUH+TunWubG84Qc62U
   nFhDmCQiUADPUVvpEMzBHvft3hkHAVhn7dNFqR0c+9ly0x6ixbz2CfHbO
   Q==;
X-CSE-ConnectionGUID: kj1X4QH0RmCkTlXDiBZeKg==
X-CSE-MsgGUID: wqq7DYdcR+aWMBIMTz+kJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17256816"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="17256816"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 19:52:01 -0700
X-CSE-ConnectionGUID: 1h0/tfZFSYKMohQHor6wUA==
X-CSE-MsgGUID: XPWDFUxkQ3u64JFDXm46Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="50091221"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jul 2024 19:51:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOTcb-000Ndf-1Q;
	Tue, 02 Jul 2024 02:51:57 +0000
Date: Tue, 02 Jul 2024 10:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.11] BUILD SUCCESS
 07e777318911d76fa787fc57f02b595481382291
Message-ID: <202407021032.AvKVyPJX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.11
branch HEAD: 07e777318911d76fa787fc57f02b595481382291  arm64: dts: renesas: r8a779h0: R-Car Sound support

elapsed time: 980m

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

