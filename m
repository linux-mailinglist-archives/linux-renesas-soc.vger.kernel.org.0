Return-Path: <linux-renesas-soc+bounces-28675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDXLNWoHpmkzJAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 22:55:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A91E4512
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 22:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EA9C32B4036
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 21:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC08389010;
	Mon,  2 Mar 2026 21:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dg8NTDlq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492C03909A6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 21:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487436; cv=none; b=BQVdGW8Krunz/6Roqgkn6iEQATFrGfgbP+Hl9iBqG9zrF5uQ09OkFP9cS+XjPDbYntDc3XbE5w6PwY4veTD3DaQ6cRV1BNgzDItW5QpyQ4dbLtSgzSLDDHvdPOAheRCENa+gzncU6TmmCsfnh19GdenbgLoI1PP64DlUmHkkhHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487436; c=relaxed/simple;
	bh=bssoiaoYzMWhqaaxqoquRpuliOO8sw+UfXvKJnlsXqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rmkRLvjGdD+ViLBvPLxC39hrMuKliNL3MCuG4NcyS4IbCAdTht+81ZJPCWQxKHJngyzWU9YAIi054nN0AOG2mIb6pLimL4zfWylrsZ3BKDNyTAG44VZe1aqIn4/X1wztcoF176bicDbarAnTKnL1flUDCzo+SKyF2OLrolktu88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dg8NTDlq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772487435; x=1804023435;
  h=date:from:to:cc:subject:message-id;
  bh=bssoiaoYzMWhqaaxqoquRpuliOO8sw+UfXvKJnlsXqU=;
  b=Dg8NTDlqE+ITdB7OvNzdA3TcF8kep4kz9bORBir6/xUns0jf6fyZsk1k
   6hT6YSV0UdaI6aJbX4DkrpOTNgrymVdcdzRQt5bVdsvktrb+JfRYEtlww
   Z3Idxx3zp5ema313gwVmMyivXwDxHZUTELY2cWFaLA6f0l/g/Uzom0bD0
   b1i/pjh4BtaIByR7BF89TZw5of1UABQmCMg+X7Q0Bjbi0tFUbiEazxWk+
   HTz2XS0MH+DLl2wYTel64+YfCrSItFTH4iw1pvDp6vE+MJtDuUJcT7+St
   0khT/wwjVBUfoHIVOrWGPeQUyd0mefOUKNNpZw1xK1HPnJlCXNQz2QZlL
   w==;
X-CSE-ConnectionGUID: ZRHiUEzbQ2ytuOqD8axDrg==
X-CSE-MsgGUID: xMMldaoWT2Ctjb/+IuhSTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84147758"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="84147758"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 13:37:15 -0800
X-CSE-ConnectionGUID: 6oqNEiXyRbOkZLZyaFayZg==
X-CSE-MsgGUID: BAtZNof3SeybEWctooSA5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="220817220"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Mar 2026 13:37:14 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxAwx-000000001Px-2OK2;
	Mon, 02 Mar 2026 21:37:11 +0000
Date: Tue, 03 Mar 2026 05:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.1] BUILD SUCCESS
 80fe165c9a5b640f1f26dd55a6cf073a34be509b
Message-ID: <202603030546.RYr9vbKP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 660A91E4512
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28675-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.1
branch HEAD: 80fe165c9a5b640f1f26dd55a6cf073a34be509b  arm64: dts: renesas: r9a09g087: Wire up DMA support for SPI

elapsed time: 730m

configs tested: 2
configs skipped: 53

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64  allmodconfig    clang-19
arm64   allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

