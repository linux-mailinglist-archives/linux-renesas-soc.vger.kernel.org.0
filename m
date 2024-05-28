Return-Path: <linux-renesas-soc+bounces-5570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 287B18D28F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 01:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABD2A1F25D60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 23:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAA813E029;
	Tue, 28 May 2024 23:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSI/Oidn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14FF13DDD2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716940437; cv=none; b=NpdfjADMQH685kO4SNcy8Yhv+WtzV3BKhfhyIiwwZM4enGRMCYE7UTs4Y4PTyPrmqpgXVqlclvBDsaWiSodUXvgqfkhZ94B21wsLwtQV+CwIIS6iyUkGkfDk0C46x/rx0rQ57x+RVGM7xvdngcSlgzlLbevvO/diJ4x4cIQibg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716940437; c=relaxed/simple;
	bh=wI4KOBWnpGHY9c4n5mEYmBiR8R4+Z+itBmNHlk7TN6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nBCqMq0b6cGyc0s5AV1rA9j+3WeTgfG/c/j/ah+Igy7vNxAjsBhifulAGJrTqxuLjynq0aINBpLY/A8ZkZvLQcTYSeMgydwYqPuMWnS2uay4dPsSjgd6JG6jOPy9Twzc0UjfwHtgG2ZHRQ3Q+MSHzROsgBoVL465NTOa5Zy7Nro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSI/Oidn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716940435; x=1748476435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wI4KOBWnpGHY9c4n5mEYmBiR8R4+Z+itBmNHlk7TN6o=;
  b=TSI/Oidnf3ksZ5aGi0lmlBIkq+pJ8DcBlVwEEw3hGiYpGqI2fInwZsuH
   HlSb8G4iq2nzXqLVTWOzpsmhs0ssz3YnRq2LL2yhOnD89ZOrsGZ5Zrgzf
   Ivx1U2jupuh2u+bcE5VnsOwwmmxQNhsJTQ/ehS1RCHQjloHEJ6Wr0WVoV
   1jz6Wz7VsI8WPiGUlLtd6cBu8opdYzewoig0zp8NfOmSX32OQ/EOSOGJ9
   grwMzAVTMwp2ZF2TWq2gpc1OAiSpk+nhPMjO3f3O8oNFMD2M91t14P6+L
   LkUyNvhob7AgZ0/sPJmPbeEctd7kRyjX9/K0Ldv8yoMmOE4CIlg4KTqzH
   w==;
X-CSE-ConnectionGUID: dzm/XSUZS+K0JFfZ+JR8dg==
X-CSE-MsgGUID: odeMsV18S3m8cvaO1rjocQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13138253"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="13138253"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 16:53:54 -0700
X-CSE-ConnectionGUID: 8jzEAy9GRkWQj3yiSELXNw==
X-CSE-MsgGUID: DmGlVnIfTIuogqoTRltdig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="40231374"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2024 16:53:52 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC6dZ-000CtF-35;
	Tue, 28 May 2024 23:53:49 +0000
Date: Wed, 29 May 2024 07:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [geert-renesas-drivers:master 1238/1305]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:34:
 error: 'I2C_CLASS_SPD' undeclared; did you mean 'I2C_CLASS_HWMON'?
Message-ID: <202405290741.B3D8sNtJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   0b2f40fe4961467879063f9e70c4d1426ff4218d
commit: e61bcf42d290e73025bab38e0e55a5586c2d8ad5 [1238/1305] i2c: Remove I2C_CLASS_SPD
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240529/202405290741.B3D8sNtJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290741.B3D8sNtJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290741.B3D8sNtJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c: In function 'smu_v14_0_2_i2c_control_init':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:34: error: 'I2C_CLASS_SPD' undeclared (first use in this function); did you mean 'I2C_CLASS_HWMON'?
    1565 |                 control->class = I2C_CLASS_SPD;
         |                                  ^~~~~~~~~~~~~
         |                                  I2C_CLASS_HWMON
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:34: note: each undeclared identifier is reported only once for each function it appears in


vim +1565 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c

3e55845c3983d9 Likun Gao 2023-04-25  1551  
3e55845c3983d9 Likun Gao 2023-04-25  1552  static int smu_v14_0_2_i2c_control_init(struct smu_context *smu)
3e55845c3983d9 Likun Gao 2023-04-25  1553  {
3e55845c3983d9 Likun Gao 2023-04-25  1554  	struct amdgpu_device *adev = smu->adev;
3e55845c3983d9 Likun Gao 2023-04-25  1555  	int res, i;
3e55845c3983d9 Likun Gao 2023-04-25  1556  
3e55845c3983d9 Likun Gao 2023-04-25  1557  	for (i = 0; i < MAX_SMU_I2C_BUSES; i++) {
3e55845c3983d9 Likun Gao 2023-04-25  1558  		struct amdgpu_smu_i2c_bus *smu_i2c = &adev->pm.smu_i2c[i];
3e55845c3983d9 Likun Gao 2023-04-25  1559  		struct i2c_adapter *control = &smu_i2c->adapter;
3e55845c3983d9 Likun Gao 2023-04-25  1560  
3e55845c3983d9 Likun Gao 2023-04-25  1561  		smu_i2c->adev = adev;
3e55845c3983d9 Likun Gao 2023-04-25  1562  		smu_i2c->port = i;
3e55845c3983d9 Likun Gao 2023-04-25  1563  		mutex_init(&smu_i2c->mutex);
3e55845c3983d9 Likun Gao 2023-04-25  1564  		control->owner = THIS_MODULE;
3e55845c3983d9 Likun Gao 2023-04-25 @1565  		control->class = I2C_CLASS_SPD;
3e55845c3983d9 Likun Gao 2023-04-25  1566  		control->dev.parent = &adev->pdev->dev;
3e55845c3983d9 Likun Gao 2023-04-25  1567  		control->algo = &smu_v14_0_2_i2c_algo;
3e55845c3983d9 Likun Gao 2023-04-25  1568  		snprintf(control->name, sizeof(control->name), "AMDGPU SMU %d", i);
3e55845c3983d9 Likun Gao 2023-04-25  1569  		control->quirks = &smu_v14_0_2_i2c_control_quirks;
3e55845c3983d9 Likun Gao 2023-04-25  1570  		i2c_set_adapdata(control, smu_i2c);
3e55845c3983d9 Likun Gao 2023-04-25  1571  
3e55845c3983d9 Likun Gao 2023-04-25  1572  		res = i2c_add_adapter(control);
3e55845c3983d9 Likun Gao 2023-04-25  1573  		if (res) {
3e55845c3983d9 Likun Gao 2023-04-25  1574  			DRM_ERROR("Failed to register hw i2c, err: %d\n", res);
3e55845c3983d9 Likun Gao 2023-04-25  1575  			goto Out_err;
3e55845c3983d9 Likun Gao 2023-04-25  1576  		}
3e55845c3983d9 Likun Gao 2023-04-25  1577  	}
3e55845c3983d9 Likun Gao 2023-04-25  1578  
3e55845c3983d9 Likun Gao 2023-04-25  1579  	/* assign the buses used for the FRU EEPROM and RAS EEPROM */
3e55845c3983d9 Likun Gao 2023-04-25  1580  	/* XXX ideally this would be something in a vbios data table */
3e55845c3983d9 Likun Gao 2023-04-25  1581  	adev->pm.ras_eeprom_i2c_bus = &adev->pm.smu_i2c[1].adapter;
3e55845c3983d9 Likun Gao 2023-04-25  1582  	adev->pm.fru_eeprom_i2c_bus = &adev->pm.smu_i2c[0].adapter;
3e55845c3983d9 Likun Gao 2023-04-25  1583  
3e55845c3983d9 Likun Gao 2023-04-25  1584  	return 0;
3e55845c3983d9 Likun Gao 2023-04-25  1585  Out_err:
3e55845c3983d9 Likun Gao 2023-04-25  1586  	for ( ; i >= 0; i--) {
3e55845c3983d9 Likun Gao 2023-04-25  1587  		struct amdgpu_smu_i2c_bus *smu_i2c = &adev->pm.smu_i2c[i];
3e55845c3983d9 Likun Gao 2023-04-25  1588  		struct i2c_adapter *control = &smu_i2c->adapter;
3e55845c3983d9 Likun Gao 2023-04-25  1589  
3e55845c3983d9 Likun Gao 2023-04-25  1590  		i2c_del_adapter(control);
3e55845c3983d9 Likun Gao 2023-04-25  1591  	}
3e55845c3983d9 Likun Gao 2023-04-25  1592  	return res;
3e55845c3983d9 Likun Gao 2023-04-25  1593  }
3e55845c3983d9 Likun Gao 2023-04-25  1594  

:::::: The code at line 1565 was first introduced by commit
:::::: 3e55845c3983d92e28517a545e403b5eb9acf95b drm/amd/swsmu: add smu v14_0_2 support

:::::: TO: Likun Gao <Likun.Gao@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

