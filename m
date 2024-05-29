Return-Path: <linux-renesas-soc+bounces-5575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FDD8D2A06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 03:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3D71F26EC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 01:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2740515AAD6;
	Wed, 29 May 2024 01:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIVAk9VX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6188C7E767
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 01:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946250; cv=none; b=ukyYO5NwTP1T9H7Wrnxlb0lTE3AZ3B5SfWu+OQR44AXSp031Eic8PBOxriWjJhiuG46ZmOLKqKwwg1CUjILR13fox9bgL4daXOsXcC7WT2XDqWqxIU7NRIAR8ZFtfWfrHXtWqcfN5Uwu4w9gqEHRE5BE3wRok1VQUaPD2vnvDy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946250; c=relaxed/simple;
	bh=STdZN/5rresr7AFsAXEI4MdbvzYJSgK0Oro4TKJftzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LWjNqIj8NOBgJ1mrLw6lXGLy2KXBuDOfABAEs7lG3FZRPPlpj8tcGpoA4MYJ+aEgYIy5Y2tB8P259KvkaLxm2SLv8LIal8GT19LRSv3UQEliO2IcII4XYFspsZAE2C5sj4SVHtIH8GRoo0iySP0bKJOjxVFU2OKw9iDLYD8JF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIVAk9VX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716946247; x=1748482247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STdZN/5rresr7AFsAXEI4MdbvzYJSgK0Oro4TKJftzI=;
  b=RIVAk9VXWz3wBXc1MUObJhkFcw7ZXnNRdY/6Mgs31kxET6q/WcMYfxOy
   3oITei1am043LKAokf0vNY0Y7L0YHda0PLubnwaXM1T0wsJwRWd7McX93
   Ib0si+dGI5Io3cNWlduY+e7h0BpMO44fKBt87bAhv1Idde0ePeMy4oiab
   pJLH/i+y8XTCiMNWRAaYG/G2kLKTGcpGUjUNESgKh9DEcaZtzxcU4Ds0X
   nB/66lt7seSs2M9et3kg3ZT8ndU5t6Z87El9zbo4MNCmWNb63Zf5bT58C
   F/WQ6XSadzHFU3h+SSOZThPIDf0A4CHa5Tjy2l/QDUt0BWheRo6a1zMyC
   w==;
X-CSE-ConnectionGUID: d3K8iWE5SzqFwRwa4KJhoQ==
X-CSE-MsgGUID: dBAOSCuGRRef2SOksa8Y2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13456821"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13456821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 18:30:44 -0700
X-CSE-ConnectionGUID: Y5naWKSJTm6jwP1GRLMhqw==
X-CSE-MsgGUID: FBvQwgiARdCUwknrTHKV3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="39696800"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2024 18:30:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC89I-000CyB-27;
	Wed, 29 May 2024 01:30:40 +0000
Date: Wed, 29 May 2024 09:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [geert-renesas-drivers:master 1238/1305]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:20:
 error: use of undeclared identifier 'I2C_CLASS_SPD'
Message-ID: <202405290948.dvQMPrCs-lkp@intel.com>
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
config: i386-randconfig-006-20240529 (https://download.01.org/0day-ci/archive/20240529/202405290948.dvQMPrCs-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290948.dvQMPrCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290948.dvQMPrCs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:20: error: use of undeclared identifier 'I2C_CLASS_SPD'
    1565 |                 control->class = I2C_CLASS_SPD;
         |                                  ^
   1 error generated.


vim +/I2C_CLASS_SPD +1565 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c

3e55845c3983d92 Likun Gao 2023-04-25  1551  
3e55845c3983d92 Likun Gao 2023-04-25  1552  static int smu_v14_0_2_i2c_control_init(struct smu_context *smu)
3e55845c3983d92 Likun Gao 2023-04-25  1553  {
3e55845c3983d92 Likun Gao 2023-04-25  1554  	struct amdgpu_device *adev = smu->adev;
3e55845c3983d92 Likun Gao 2023-04-25  1555  	int res, i;
3e55845c3983d92 Likun Gao 2023-04-25  1556  
3e55845c3983d92 Likun Gao 2023-04-25  1557  	for (i = 0; i < MAX_SMU_I2C_BUSES; i++) {
3e55845c3983d92 Likun Gao 2023-04-25  1558  		struct amdgpu_smu_i2c_bus *smu_i2c = &adev->pm.smu_i2c[i];
3e55845c3983d92 Likun Gao 2023-04-25  1559  		struct i2c_adapter *control = &smu_i2c->adapter;
3e55845c3983d92 Likun Gao 2023-04-25  1560  
3e55845c3983d92 Likun Gao 2023-04-25  1561  		smu_i2c->adev = adev;
3e55845c3983d92 Likun Gao 2023-04-25  1562  		smu_i2c->port = i;
3e55845c3983d92 Likun Gao 2023-04-25  1563  		mutex_init(&smu_i2c->mutex);
3e55845c3983d92 Likun Gao 2023-04-25  1564  		control->owner = THIS_MODULE;
3e55845c3983d92 Likun Gao 2023-04-25 @1565  		control->class = I2C_CLASS_SPD;
3e55845c3983d92 Likun Gao 2023-04-25  1566  		control->dev.parent = &adev->pdev->dev;
3e55845c3983d92 Likun Gao 2023-04-25  1567  		control->algo = &smu_v14_0_2_i2c_algo;
3e55845c3983d92 Likun Gao 2023-04-25  1568  		snprintf(control->name, sizeof(control->name), "AMDGPU SMU %d", i);
3e55845c3983d92 Likun Gao 2023-04-25  1569  		control->quirks = &smu_v14_0_2_i2c_control_quirks;
3e55845c3983d92 Likun Gao 2023-04-25  1570  		i2c_set_adapdata(control, smu_i2c);
3e55845c3983d92 Likun Gao 2023-04-25  1571  
3e55845c3983d92 Likun Gao 2023-04-25  1572  		res = i2c_add_adapter(control);
3e55845c3983d92 Likun Gao 2023-04-25  1573  		if (res) {
3e55845c3983d92 Likun Gao 2023-04-25  1574  			DRM_ERROR("Failed to register hw i2c, err: %d\n", res);
3e55845c3983d92 Likun Gao 2023-04-25  1575  			goto Out_err;
3e55845c3983d92 Likun Gao 2023-04-25  1576  		}
3e55845c3983d92 Likun Gao 2023-04-25  1577  	}
3e55845c3983d92 Likun Gao 2023-04-25  1578  
3e55845c3983d92 Likun Gao 2023-04-25  1579  	/* assign the buses used for the FRU EEPROM and RAS EEPROM */
3e55845c3983d92 Likun Gao 2023-04-25  1580  	/* XXX ideally this would be something in a vbios data table */
3e55845c3983d92 Likun Gao 2023-04-25  1581  	adev->pm.ras_eeprom_i2c_bus = &adev->pm.smu_i2c[1].adapter;
3e55845c3983d92 Likun Gao 2023-04-25  1582  	adev->pm.fru_eeprom_i2c_bus = &adev->pm.smu_i2c[0].adapter;
3e55845c3983d92 Likun Gao 2023-04-25  1583  
3e55845c3983d92 Likun Gao 2023-04-25  1584  	return 0;
3e55845c3983d92 Likun Gao 2023-04-25  1585  Out_err:
3e55845c3983d92 Likun Gao 2023-04-25  1586  	for ( ; i >= 0; i--) {
3e55845c3983d92 Likun Gao 2023-04-25  1587  		struct amdgpu_smu_i2c_bus *smu_i2c = &adev->pm.smu_i2c[i];
3e55845c3983d92 Likun Gao 2023-04-25  1588  		struct i2c_adapter *control = &smu_i2c->adapter;
3e55845c3983d92 Likun Gao 2023-04-25  1589  
3e55845c3983d92 Likun Gao 2023-04-25  1590  		i2c_del_adapter(control);
3e55845c3983d92 Likun Gao 2023-04-25  1591  	}
3e55845c3983d92 Likun Gao 2023-04-25  1592  	return res;
3e55845c3983d92 Likun Gao 2023-04-25  1593  }
3e55845c3983d92 Likun Gao 2023-04-25  1594  

:::::: The code at line 1565 was first introduced by commit
:::::: 3e55845c3983d92e28517a545e403b5eb9acf95b drm/amd/swsmu: add smu v14_0_2 support

:::::: TO: Likun Gao <Likun.Gao@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

