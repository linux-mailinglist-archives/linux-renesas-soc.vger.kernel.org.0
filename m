Return-Path: <linux-renesas-soc+bounces-11957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F81A05B08
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 13:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AB8618888B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 12:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619801F8AF6;
	Wed,  8 Jan 2025 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5OOwu4h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECD81F758A;
	Wed,  8 Jan 2025 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338180; cv=none; b=SSoLdPEnoHQ8HCHAc3fyRGNiOW2fCAO2jx1BI0T6fvimzb0k3kvNSxCigPNEfWdfZd34SWf36CyibYhAB+mN0G45wgCCB6EzU+CP3N1UykAMljYNg11CSvpQvS15tPEnd0r70N+1hb548g8Qf/greLMUw+bNxnMJ3Y8/KIJqB9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338180; c=relaxed/simple;
	bh=YqHndkqCZGZQ1m1wA55w0BgPMQve6HjzYGQpFNVSOH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhgLUnooULWx1Qt9Guu6H9wR2SpjUeCddDw2stzRBzDnKww74BddKlBMcyQW8coxPFV8WLufgbDHmd9ny27bjYF6LLlsSATy2mEDNa3piDEYYiQExn5J3RTuAXqVpbsiU/8IxsZ70UAMyaNMx/Qj68E+81VqvDLYPBU3B1hKLC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5OOwu4h; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736338178; x=1767874178;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YqHndkqCZGZQ1m1wA55w0BgPMQve6HjzYGQpFNVSOH4=;
  b=I5OOwu4hYbl/BMlwYwQz4f1zVgn0gNPr1ikEH7mhsr3ZGFqHj3WOEXcH
   LcjCrj2inZdfD4Hm5NwcZclXOO+/5T0bv6ATa94Pj+KppDAU/Itnm2PNA
   ap3MmAtcXUovKW3d2G0AJTzLU4zBVkDlsrbjzAzHegKDkZZCO6H7ZGl/c
   So/YyT58EnHWjkvYHy2a7jA/PUI+mesBKKTQrNGdJ2ZAi3rg+h3ezfrL1
   OzknrtUe92lcjz96KC34gF+Kf5I8zvdk8b+rHkX1WnUdYUoL1ZVs7j1/7
   t735+Rzh/7IWhXmU4arY1WrjqbF+2QrWuSOJgPRVFj8W/HIVcSiJWlbuV
   A==;
X-CSE-ConnectionGUID: zEVyJx9rSV2NmgvMNtlHBQ==
X-CSE-MsgGUID: W4yBHOhhT+WEoltqiAvPxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="39379679"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="39379679"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 04:09:37 -0800
X-CSE-ConnectionGUID: wiU198vIQwuRhmomtyW7SA==
X-CSE-MsgGUID: HMlxTK96RfSbrPMvx0YhOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103568196"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2025 04:09:35 -0800
Message-ID: <3117d2d9-260a-4e02-8c22-4e078e01ddd5@linux.intel.com>
Date: Wed, 8 Jan 2025 14:09:34 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] i3c: mipi-i3c-hci: use parity8 helper instead of
 open coding it
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
 <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/25 11:02 AM, Wolfram Sang wrote:
> The kernel has now a generic helper for getting parity with easier to
> understand semantics. Make use of it. Here, it also fixes a bug because
> the correct algorithm is using XOR ('^=') instead of ADD ('+=').
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> 
> Change since v3:
> 
> * updated commit message to mention the bugfix
> 
> I intentionally did not add a Fixes tag because this fix depends on
> patch 1. The proper fix for backporting would change this to XOR, I'd
> think.
> 
Stable rules allow also cherry picking additional patches. To me picking 
patch 1 and 4 sounds better than an intermediate fix since bug has been 
here from the beginning. IMHO not so urgent than a regression.

Looks like we have been lucky. First dynamic address is 0x9 and previous 
algorithm gets the same calculated dat_w0 value for at least for the 
addresses 0x9 and 0xa.

