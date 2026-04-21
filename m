Return-Path: <linux-renesas-soc+bounces-31478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCcpAAkF6Gl2EQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 01:15:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C6144078C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 01:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F23FB3030EB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 23:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05B637B033;
	Tue, 21 Apr 2026 23:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUJUfTs0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC2259CB9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776813296; cv=none; b=VbMatKErqv8AioxtglXjipnvU/SZhnJLY3mIeqM2EGocgUUA1CYowJr25QhV3I1Sy5WXgn9V8RiHh0Egvtkf9BvbhOCXiaIDoS0jtlDNE0py8Wf6Dsi4zrlc1q9Qwt+drcgmVUJe8KeplgirLd7/mQHjinIuZqI54dS+SB60JNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776813296; c=relaxed/simple;
	bh=A+h4Ai4tsAiZiWiY5iGIOrzePIuVAlEEqlz7iB+hraA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ojWPiVh3dwBcbjfxX7RJm2I/YtxY6nih3oKws+ebxTXn+W393qsRlc1PCWrKTkumrXgqDqIuen4KQq688VKONECNlaWjq+gqv9bPlTv8xe2RGNHzlI0U6HbY8F2m1f+/+V4EfHVvWSvlvzJKy82B03rKEL/bSdK4px5qoltn008=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUJUfTs0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776813294; x=1808349294;
  h=date:from:to:cc:subject:message-id;
  bh=A+h4Ai4tsAiZiWiY5iGIOrzePIuVAlEEqlz7iB+hraA=;
  b=XUJUfTs0s2ZtCL3j6STAuLa0ZVpU7ssQBqNhh3JaiFJ+Xg/W/am5MbsC
   VFxjqQu3ghN4jRm0bPvgCda0DbazIUE5aoRlo6NhzlD8VSVoexgsRZEZI
   JHhB071sS/o7HEZOc4ySwvD4I8nAca8Zde34eyz6eyL1wDMf7CXJBygHA
   KmT9O/uLtE+Oec+y3OVXDsFrf23Ijp3CettTcKsKvKJ40pwqXy1AYUW3B
   OyCs3N3nhibJP2lLNoz8swmbMY8E50LHjEUzSRc+5Wyh3UreUjxf7gBDQ
   7wJoLZtOyhL4WvC9bzkDjB6wEYI0REYTGYbnoq1Nv7DN448yxE4CIOiqC
   Q==;
X-CSE-ConnectionGUID: PV2QC7gLSA+jT50MleDtxg==
X-CSE-MsgGUID: Yg9q4Fk+TqSncI0S1DYBDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88831597"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88831597"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 16:14:54 -0700
X-CSE-ConnectionGUID: mrH3WatRTXiuN4sWLkqZfQ==
X-CSE-MsgGUID: UWQERvCZTiCnYg8aYYUZnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232039045"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Apr 2026 16:14:53 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFKIs-0000000042e-2T2r;
	Tue, 21 Apr 2026 23:14:50 +0000
Date: Wed, 22 Apr 2026 07:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: 
 [geert-renesas-drivers:topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v1
 62/71] Warning: drivers/firmware/arm_scmi/driver.c:3514 bad line:
Message-ID: <202604220739.gMKG4Fmt-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31478-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D5C6144078C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v1
head:   258e1985bfa75ca0b3c98bd083628f9b6c7887fc
commit: 72e2a0e7a5abda02fe36b3f5851842f7a77b2593 [62/71] firmware: arm_scmi: Add scmi_get_base_info()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260422/202604220739.gMKG4Fmt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220739.gMKG4Fmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220739.gMKG4Fmt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/firmware/arm_scmi/driver.c:3514 bad line: 
>> Warning: drivers/firmware/arm_scmi/driver.c:3514 bad line: 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

