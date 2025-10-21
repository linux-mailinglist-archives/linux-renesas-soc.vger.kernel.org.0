Return-Path: <linux-renesas-soc+bounces-23380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C9878BF65EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 14:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B55B1346872
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 12:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48EA35504C;
	Tue, 21 Oct 2025 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xo7yB7yI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98157355047
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761048814; cv=none; b=VDa67mWNmnmGQG14y3h5BX0vw5QLygvgrZ5vKnMhhp51V9Xfx1i0hEv/oIKsabCT/5n754c6HaUb/8Oa4k1TywGClDkUtS2/bJYRBmWKUabqlvMpxHh/e6V/VBbN6LlF+Sz++a50A2JNAwW+xHr1Q1EELena9PGFj2W6zWpyfik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761048814; c=relaxed/simple;
	bh=rd7smmrcz/XOU/pd5zYO5EmX1ePjXQLSAixXYSfCpCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/ozjeb1A7qk1LVqMtjnaQ2ITa0hLLC9wgvIxTWQx63bCmhN28NqA6K3YoGrVLTx5du20C7B17xzTZuXgtF8crEX4khpJ1VYtbS8JIEMisDzywAeW4fBvSw3kNZLPwc/NjAeos/x3YNnMyxmLcu9PJ/4rD8QuDdiAqvIlEXnnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xo7yB7yI; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <854006a7-82da-416c-b8cb-bf8921653f0a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761048800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wA1yHLZrr4GTSwbwaWsRNsgn9CXHGBEBriAxhfBY17Y=;
	b=xo7yB7yI6BjPaexmjYxfXKqnhTbJIBJ/fM2zwY9heMYwZUSVegHsu2+fZcXpnw4+WOp4j4
	Sa48fDMwp4perNaj+8jcdTGIaGWi7sl0PhuKyM5bH0lVp9m8mPQbBl0bleRVHsZ9/T6KPh
	7bWPMidDE5qYLG1/3Jqcjt5KpepHjM4=
Date: Tue, 21 Oct 2025 13:13:14 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 6/6] net: hns3: add hwtstamp_get/hwtstamp_set
 ops
To: Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Tariq Toukan <tariqt@nvidia.com>,
 Brett Creeley <brett.creeley@amd.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org
References: <20251021094751.900558-1-vadim.fedorenko@linux.dev>
 <20251021094751.900558-7-vadim.fedorenko@linux.dev>
 <c5c44697-b6d4-4e6d-9e4f-8e5a57504232@huawei.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <c5c44697-b6d4-4e6d-9e4f-8e5a57504232@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 21.10.2025 12:10, Jijie Shao wrote:
> 
> on 2025/10/21 17:47, Vadim Fedorenko wrote:
>> And .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks to HNS3 framework
>> to support HW timestamp configuration via netlink and adopt hns3pf to
>> use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
>>
>> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
>>
>> v1 -> v2:
>> - actually assign ndo_tstamp callbacks
>>
>> Reviewed-by: Jijie Shao <shaojijie@huawei.com>
>> ---
> 
> This shuould like this:
> 
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Reviewed-by: Jijie Shao <shaojijie@huawei.com>
> 
> ---
> v1 -> v2:
> - actually assign ndo_tstamp callbacks
> ---


Yeah, your are right, messed a bit with the commit message

