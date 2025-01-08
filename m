Return-Path: <linux-renesas-soc+bounces-11965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D34A06026
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 16:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7A9E3A03B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 15:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8189F19309C;
	Wed,  8 Jan 2025 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIHWm3Ae"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1BC18734F;
	Wed,  8 Jan 2025 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736350346; cv=none; b=ZQMCuPDSZ3MUhbyEPAMBv88Cthfk6DL988JAV7VsjAU60QJBMktZWMAVvLcbMea7VbtWnCjHK9FOOh0viRmtDC8qwCjk/Ud0W4CWTG1qsNPo7+MGogjt6pABae9rr283x6MKHnUW5GVwdkhMgHDjQ6bV0GnhyDd386ziqqFtEXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736350346; c=relaxed/simple;
	bh=Mv9/7UyhAiH/KvxM0sRy2lV0OTrW9v178DpkMXDK9rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YXw67ByaFnFXrXm2oIT+fxejmxPLO9fH4VvNw43/dKtGp+fCJuYrEDX3OZoUy14hOwp9rM8B5vh+lvQOIpDg4jp92TLhF+EwqMAO8hVc4FedlNLodoGM6m0/FG+Z30VrFPqTLg7kkkdorNmhiJLnZrOolFIk2WOoWMoyUqwXsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIHWm3Ae; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736350344; x=1767886344;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Mv9/7UyhAiH/KvxM0sRy2lV0OTrW9v178DpkMXDK9rI=;
  b=oIHWm3AetFzKmAREMVIQUsEg62uIuZw+Jx12AxG0pmN1gW3vWol5HHuZ
   DwAZ9MukzSkt3hLR3u8RXg1ZP5ls/BYLa7fsVmBwkdnFGEcHRbbojg63O
   EaEl3CaAlv40d6zLUXUMPTcJQX2LA6cQNr5BgobowMiuHMrSIoHpqlFN5
   GupLZmKhefCbAt2AJ9Xvyfoq0rb4UIJznPf4MGF/rrkFGJecvGWt1yVWQ
   iiYcbz9QOkus+rIO4NBxhwRccdu4R+wuw/089BQ9K7jclfLLpglQcOwp/
   0EY8jB6OjNLcHP7jCS0vJ9Xqj3cI0KjL3J8FOmFqD4eCq22Zute3vHaEN
   Q==;
X-CSE-ConnectionGUID: IJxYBMR4S0yfzHtRkKnSPg==
X-CSE-MsgGUID: 5nzVwOSmT7uv4UyFkaITIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40524500"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="40524500"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 07:32:23 -0800
X-CSE-ConnectionGUID: mACxqiaaToug0Q9J7RYGkA==
X-CSE-MsgGUID: bwngNOGnQvOnlUXzIkY7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103055332"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jan 2025 07:32:22 -0800
Message-ID: <cbd9bbf3-843f-42ea-9651-c35071089210@linux.intel.com>
Date: Wed, 8 Jan 2025 17:32:20 +0200
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
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
 <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
 <3117d2d9-260a-4e02-8c22-4e078e01ddd5@linux.intel.com>
 <Z3515cBvz3yChGoL@ninjato>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Z3515cBvz3yChGoL@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/25 2:56 PM, Wolfram Sang wrote:
> 
>> Stable rules allow also cherry picking additional patches. To me picking
>> patch 1 and 4 sounds better than an intermediate fix since bug has been here
>> from the beginning. IMHO not so urgent than a regression.
> 
> Even then, doesn't that mean that the series needs to be applied
> upstream first before it can go to stable? How to describe the
> dependency commit id otherwise? Either Alexandre adds this when
> applying, or some interested party ;) sends a backport request to
> stable. Or am I missing something?
> 
Yes, the latter case was in my mind that whoever runs this driver on 
earlier stable kernel and has enough devices on the bus where previous 
code will calculate wrong can request the backport or at least be vocal 
about it :-)

I'd say backporting back to 9ad9a52cce28 ("i3c/master: introduce the 
mipi-i3c-hci driver") is also needless because driver needs other fixes 
in order to be really usable.

