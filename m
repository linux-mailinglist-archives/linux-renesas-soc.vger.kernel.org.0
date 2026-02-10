Return-Path: <linux-renesas-soc+bounces-28138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGKoJCZHi2kpTwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 15:56:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9389311C294
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 15:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E390300622D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 14:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97AB30C371;
	Tue, 10 Feb 2026 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caPMy6Gw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5148F3A8F7;
	Tue, 10 Feb 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770735393; cv=none; b=B8NFaMOFkCWjgMNl5/p2mNX7xZUafVXug6ZNUketD6ZedF5hkWu49FkW3Ab3+8Gw1rc3EFNfYwLsh/q6Dqn1y59R9BnZ6g+oOityHQFGt1d8F12RpHinJw5AZYcv70xlAwYy64bzGJXNQyw+RAIAlwHXlp2O6V0ktDMveU2Tyic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770735393; c=relaxed/simple;
	bh=I3z0RieF2cpVQuvDYOlXn/wI309BIjZMJC8vZ6UgamE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOd9zVQc4qER3SP9dferDAtquF1cWpXY8gRScExWCLPFTLUYSdV6aVcYM2HDE6PJbY9x8A5kGWXJHKmRSwI/jP4sl4cumzMMpNo9dvmZ8mcz3ufCAaVweSlIcXieVBUquwuSV8X7U0JZjLFq+Rxf/IVDvQl6mMeRBeBBXnw8qKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caPMy6Gw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770735392; x=1802271392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I3z0RieF2cpVQuvDYOlXn/wI309BIjZMJC8vZ6UgamE=;
  b=caPMy6GwCMCFKb7eYdPbs+n4ROoM/RD71SVaefHNneEC4v7KVSr2p9KD
   jrNop2vJrLfEvOWGOeFu0w3w5+vyOfyXBRnVmMOQ59aJaciTye7NifgRw
   ZcSRcn8NS+i0RErfiD69AyJLphAF7qIttR1cjVnRzXnS0n6grzi8H8dHb
   72hPUkVoKga1ONwHerP+sw+UnuGyJg7qnb0bjqOHaHh3JSupw+n7AxpL4
   VUX5tPxSjnQDRSiLlADv2ZdO+xvnrmLWjeBu65zTHAV8ktQakq9g7XXDn
   DcyqExUTcDBy1FcwPxrOIc6WOUQ2cjq3KBuzuft+JIdL+wx0Zk8XUtSXx
   A==;
X-CSE-ConnectionGUID: OA418yRnTV6OxTu7h3dmjA==
X-CSE-MsgGUID: wXH2ecY7RJWaQQ9pnuyQXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71850482"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71850482"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:56:32 -0800
X-CSE-ConnectionGUID: JOwfHkBGRJWeYxsxBLTXjA==
X-CSE-MsgGUID: gX7C/LNTTpCkGpsrFp64ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216474198"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.39])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:56:30 -0800
Date: Tue, 10 Feb 2026 16:56:27 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
Message-ID: <aYtHG2m61D8fc4vd@smile.fi.intel.com>
References: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28138-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,smile.fi.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9389311C294
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:00:54PM +0100, Wolfram Sang wrote:
> As stated in patch 1, the U8500 driver is clearly unused for more than a
> decade. Removing it allows us to remove generic platform_data support.
> Both removals make the upcoming refactoring (headers and lock
> allocation) in the hwspinlock subsystem easier.

What I like the most is the patches with zero + statistics :-)
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



