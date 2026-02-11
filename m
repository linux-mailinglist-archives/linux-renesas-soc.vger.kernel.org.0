Return-Path: <linux-renesas-soc+bounces-28150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCECFMV3jGktpAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 13:36:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9354A1245D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 13:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8547C3014109
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 12:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34B63595D;
	Wed, 11 Feb 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRzzLydh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E181C84BD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813153; cv=none; b=J3QNg4NKpE/JN3crK9Bc3wxdKhqHep4IU9boSlStp0JQQSUxmRdPh9lHh5BbLJDVWOvWeW5cKbxVmqAxutDxuDQL/wsUDF2EHrmHfa/EPUhAa1WD4G4/yCtpJc6ivv4ySdweaQqH52PdcOmVVteRISmK670iEaWfLgWv3uEWZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813153; c=relaxed/simple;
	bh=gKqsUY8QiFOiqbi69Ne3X2+9oK3B3tyFLBelCaADXTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EAXFwZA5IBv8ZNKiRwL45vyC8wbU3t8ADhPnw9tYmd9fFU/p7qIpDYDMjdI8wW2MsUEd6IkbzFQYA/4lZTiJxtigeAtOFf8CKIgwvMSAcaRKtfPcgeSELHDUI1GkZaz91/HccQGoSlyc3B0bHFbWBF+cCkEIZrNscBoM/rIofDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRzzLydh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770813150; x=1802349150;
  h=date:from:to:cc:subject:message-id;
  bh=gKqsUY8QiFOiqbi69Ne3X2+9oK3B3tyFLBelCaADXTQ=;
  b=JRzzLydhMuHD76FqSPd67sMo5Dg52raa6k9xgIAMC7sYKobioOZthLYO
   9S+S0GTOTmK6vzp66JzCNDgFwUha1XFm3fS6Lb01uQkr8IQyY2utbsMuC
   9OyxP0LG4y5ndh7ua0zGfMRSRoqNnEytmr3zbQLNWbTBULXk2MZzhHi/i
   y2C5CL0akgQTvTn+0xS5TTrQ11pl+2YCqRrLjZp7DkwfP6/o7GNkACHU1
   chFDvvNqhmsZ0Z+wR16usa6nJztqylplJkjyiZOscChN5sa/XQa9NQ9/r
   k14M5Klue5V+AVGqRauMhASqO3wWfwUFwCBV+ikSEC9T4Rqo5utLe9ntL
   A==;
X-CSE-ConnectionGUID: kL5/kZjHSm2LZaCTjnISWA==
X-CSE-MsgGUID: HBo/x1z5Tji8TR0f6bK5IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82596825"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82596825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 04:32:30 -0800
X-CSE-ConnectionGUID: MXSdDXjsQHijgetgHVpAoQ==
X-CSE-MsgGUID: Afu+bkvdQJ2flQWJHaccJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="217198190"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2026 04:32:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq9OL-00000000pyA-3wbT;
	Wed, 11 Feb 2026 12:32:25 +0000
Date: Wed, 11 Feb 2026 20:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 13/53]
 drivers/gpu/drm/xe/xe_survivability_mode.c:241:17: error: implicit
 declaration of function 'xe_nvm_fini'; did you mean 'xe_nvm_init'?
Message-ID: <202602112026.Di2Vv6FF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28150-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 9354A1245D9
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   7f66ef0ac030a3da0d0a0e8c0dfee1aa9c266dfa
commit: 2f8a7331e1404f4364092565c145c7cf3cd377d4 [13/53] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260211/202602112026.Di2Vv6FF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112026.Di2Vv6FF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602112026.Di2Vv6FF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_survivability_mode.c: In function 'xe_survivability_mode_fini':
>> drivers/gpu/drm/xe/xe_survivability_mode.c:241:17: error: implicit declaration of function 'xe_nvm_fini'; did you mean 'xe_nvm_init'? [-Wimplicit-function-declaration]
     241 |                 xe_nvm_fini(xe);
         |                 ^~~~~~~~~~~
         |                 xe_nvm_init


vim +241 drivers/gpu/drm/xe/xe_survivability_mode.c

5e940312a2ac64 Riana Tauro     2025-01-28  232  
d40f275d96e890 Lucas De Marchi 2025-02-21  233  static void xe_survivability_mode_fini(void *arg)
d40f275d96e890 Lucas De Marchi 2025-02-21  234  {
d40f275d96e890 Lucas De Marchi 2025-02-21  235  	struct xe_device *xe = arg;
1987ea95ac37ea Riana Tauro     2025-12-08  236  	struct xe_survivability *survivability = &xe->survivability;
d40f275d96e890 Lucas De Marchi 2025-02-21  237  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
d40f275d96e890 Lucas De Marchi 2025-02-21  238  	struct device *dev = &pdev->dev;
d40f275d96e890 Lucas De Marchi 2025-02-21  239  
1987ea95ac37ea Riana Tauro     2025-12-08  240  	if (survivability->fdo_mode)
1987ea95ac37ea Riana Tauro     2025-12-08 @241  		xe_nvm_fini(xe);
1987ea95ac37ea Riana Tauro     2025-12-08  242  
f4e9fc967afdb5 Riana Tauro     2025-12-08  243  	device_remove_file(dev, &dev_attr_survivability_mode);
d40f275d96e890 Lucas De Marchi 2025-02-21  244  }
d40f275d96e890 Lucas De Marchi 2025-02-21  245  

:::::: The code at line 241 was first introduced by commit
:::::: 1987ea95ac37ea3f9299d220974676207d5262f6 drm/xe/xe_survivability: Add support for survivability mode v2

:::::: TO: Riana Tauro <riana.tauro@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

