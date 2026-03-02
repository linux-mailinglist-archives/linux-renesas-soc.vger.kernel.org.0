Return-Path: <linux-renesas-soc+bounces-28676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIvcGZ4UpmnlJgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 23:52:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 475921E5F23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 23:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9507434FD92E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 21:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30DF1A6810;
	Mon,  2 Mar 2026 21:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kA8qqLtb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0321C3909B0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 21:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487497; cv=none; b=b+2cfMcpsFDUTFESpu3t/36QqeghBMKrhGAZJGHOe1FsIQebJSVhWJuDpd7zUotV3zhkueHxwjj3JLlRe7IA1TuRSXAFpax6WxnVZToUhba1KfJRLjdVJUPkcAjj8LLgwd3aw1g6Cqn9zw3zUs111mQGKKkGHmd7EjyXsl7NZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487497; c=relaxed/simple;
	bh=MN78PY3Fa0rbLthXJSHNCTGUAFB5zlaRhmEWMWxBcEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bq32XoT2ZYGJFwtD11nGxrhOt9mNWGcsKwy5c8O9qLVMhVZodNjLCqejLnXBN2gko1xL23A/s/QctWVIy1bBg+syWfZdCC9ZHhEd+Lz/sf2hj/SzlZj4TaGYrSLWrS7aMep5R02qt/eDEuAr7LecjGCCV/DsQmHl2oPvwtNEXWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kA8qqLtb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772487496; x=1804023496;
  h=date:from:to:cc:subject:message-id;
  bh=MN78PY3Fa0rbLthXJSHNCTGUAFB5zlaRhmEWMWxBcEs=;
  b=kA8qqLtb8dMvb5fkvYfnIl5VzJ+XrTlyBiENSFhG0nOnprLosOSUa3LG
   QVwmeDgWGQAekjGzu+pb8I1OYYehFMrc2phikQ8YrVjcOBAEwNYFYZF46
   YQVWNmMhv1nx9KIQQT8iAn+W1YRndSdgCDQCZTNT/4HWfmr3tPAFffPYZ
   VBolvk429zPAs+jws7JmxsYRqaF0u7MrGbSyLiVMK/dabHSTDJwpNhHjT
   21Ro4GLmp7HVJKTNXp33ZHsVoZio/TbKPEOEql6aO4+eZIIUPrTw6ER7t
   3V2+NNxI7a3IQEuEeokp0vXVmm4WLAFjmI3phn/fEk/QVb+d/Uqc+7l+v
   g==;
X-CSE-ConnectionGUID: tjDro4d+R16usj7Gl+z1Jg==
X-CSE-MsgGUID: QYm+9nc9QGqNNbzL88MzAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84858693"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="84858693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 13:38:15 -0800
X-CSE-ConnectionGUID: awnsjpTbRV2n9mHtRVr9Hg==
X-CSE-MsgGUID: 0AmjTOQyQQ6QiA19RTuPCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="217018913"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Mar 2026 13:38:15 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxAxv-000000001Q1-2eJW;
	Mon, 02 Mar 2026 21:38:11 +0000
Date: Tue, 03 Mar 2026 05:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 9418ae909bc376942027a6ff3e9a84eb5acaa37d
Message-ID: <202603030539.1IQWVxzT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 475921E5F23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28676-lists,linux-renesas-soc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:?];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DMARC_DNSFAIL(0.00)[intel.com : SPF/DKIM temp error,none];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_SPAM(0.00)[0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	R_DKIM_TEMPFAIL(0.00)[intel.com:s=Intel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 9418ae909bc376942027a6ff3e9a84eb5acaa37d  Merge branch 'renesas-dts-for-v7.1' into renesas-next

elapsed time: 731m

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

