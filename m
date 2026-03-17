Return-Path: <linux-renesas-soc+bounces-29599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NH9EcVBuWnp9wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 12:57:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6E22A95FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 12:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28CE13013451
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28013B5851;
	Tue, 17 Mar 2026 11:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6OrwfOa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFEE3B6364
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 11:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748674; cv=none; b=rWmVZRBlR9xpGssfsLg63wKLV5TS2Li134LJQXs+BgysCUk7Q8lTfx+KDWdKg7HiY3TVo+uBySWY0dLR99aqyf3FbJUoWimWjR08H12ZD+YN7qW813p8MuYNhCDoG1tzaKkrE00TIgTTRu/pxatubwJS3YTSt3bvmmZo4m23JnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748674; c=relaxed/simple;
	bh=COw7GMXOAmkLh/y6f16oDevXVEJz7vXq4dOnrVBJBj4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERDsK7LlkfLOzUEFcYDWay2nYMeYxF+uY1epA4xewJBRbTQKnkZVRe4RUf98jJeIbuNNDXd6qs/HFfkdaHqG8hv9ZBiSvQVTDatFIRfSXPrJ39dNBsVoU+oBkHJ81tbqjQ8zxedS7Itpsyze89fzYduf63nNomAeFcdEyuWyT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6OrwfOa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773748673; x=1805284673;
  h=date:from:to:cc:subject:message-id;
  bh=COw7GMXOAmkLh/y6f16oDevXVEJz7vXq4dOnrVBJBj4=;
  b=e6OrwfOan5ssnt9LmbsauOH77zQc4khMVPsHLYwaek1Cr4PLwXagTru1
   d3HGfpqpJywkLOGxz7hc3Z1L3IxBmdPRXXkiwJZTXtChsKYFhkkVzfQiQ
   4ePWb3JpM4AgHvInjAb3rI+pTHdl7IT31gtln174sTFLpK6pYeTVOKORx
   FOvsyBaUBhUVfmI3deFRJcxotpy4wPoqGbIFipn/AbHIyHb0eIswySPF+
   ajkIESHdb5oGXzkvU2Nc6KJ0NhQag9h5D6hRDUDlRlWlgv2AvIUNNE4sx
   5UL4OCALdD5y+/9YpW+Nxg7TvmZE7DDt8i2YYXGchuxpGdpA76Kr0yHhE
   Q==;
X-CSE-ConnectionGUID: U/6uCEmqSm+0nPbDEcacFA==
X-CSE-MsgGUID: 13DoctweRjWOWuYgSrdwJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77387536"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77387536"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:57:53 -0700
X-CSE-ConnectionGUID: OX5vb7+eQua4q4+di9uyBA==
X-CSE-MsgGUID: Q4FRXSUHTc+xg6KPhiF55w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226714577"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 04:57:52 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2T3V-000000000Lh-2ZPy;
	Tue, 17 Mar 2026 11:57:49 +0000
Date: Tue, 17 Mar 2026 19:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.1] BUILD SUCCESS
 a1310b78ad797f1c43faf522f7aafe40de53edd7
Message-ID: <202603171925.h4Wu1qj8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29599-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA6E22A95FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.1
branch HEAD: a1310b78ad797f1c43faf522f7aafe40de53edd7  arm64: dts: renesas: Add pixpaper display overlay for RZ/V2H Kakip board

elapsed time: 1524m

configs tested: 4
configs skipped: 194

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm     allnoconfig    clang-23
arm    allyesconfig    gcc-15.2.0
arm64  allmodconfig    clang-19
arm64   allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

