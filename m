Return-Path: <linux-renesas-soc+bounces-26304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4353BCF4C1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 17:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C1783031670
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 16:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24FB2DA776;
	Mon,  5 Jan 2026 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BIVyRKIA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B78C33DECE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jan 2026 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630880; cv=none; b=eCtgnwghh2PYdhG/w/iSdCRKSlgh+MTWQEa1eInXB138E+MejxCGMFMpmVAmhDpn/F+YPuo62ljbMvd6N9mpX33rvw27gxnYnIiiQmlYihZhOq2ZDxXzXs3dZ5Q3awm4YUbJ0EqXjfh9rWPLeffuTJI4o6PCTct+t/lyfUZ0Nyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630880; c=relaxed/simple;
	bh=ZFoFPkRKpgfglFZuNke8sVTC+dOkII7ngemLZDQdGKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M46hw4TblIOjFCe8SMhgHNU49xshkgYkdF7Oib6OhS/B/QpcCAKy5zJ+6BbETgeB8NNJYa/jUHmYLuyXRvhQk3zsFEFUfUZAmaCvyTZ1cGXGtbRjWIQpgugxsmDOIG1pX0OTKrkWSDgYnG9x4yr8GpkHhYnNGwn+h1HfmmRcWec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BIVyRKIA; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlKdQ0LVmz9tQk;
	Mon,  5 Jan 2026 17:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767630874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qhJ7h8tQ1M7ApNeSHh732JqFfmiwDgOtDBPBZ+jirFw=;
	b=BIVyRKIAx9yStlJk6/RFqtP/ryK6HKjrxkjwB+gtaWVcJ7NZTq8cjMPQjZzj7PzcFggd0i
	rOPLXNRNGcHQ2/wrltWRRvKAWutkTr0/HVE2/JcAEGgRY1Zccgl5dfPIHM5guPAcgzEWVt
	TgX2ZshfKGAEy5Vf4mhPVRJ2VJ96S7uoOZuGpev7EUchI8MQ0NXqVKyJFhii+7A00YsSPH
	8q+CVy6B0jGy8Aj/Zn87Kg6lkEHLcyLQ6nPzjuIau7h/8TJhG74dbyETc0FVEezb1XoE0I
	gIh8PxedLZmTLbfLRfipK3EyAYFTB+66y7CGvxGD1hokSpWe7uBl0xY0WOFWUw==
Message-ID: <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
Date: Mon, 5 Jan 2026 17:34:30 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
 <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: efd2453e431ebab954b
X-MBO-RS-META: 6ep6ign7mmgf1jwjst9tp54jsmqoiwad

On 1/5/26 2:09 PM, Matt Coster wrote:
> On 06/11/2025 23:24, Marek Vasut wrote:
>> Fix support for build on 32bit systems. Include linux/io-64-nonatomic-hi-lo.h
>> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() accessors, and
>> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
>>
>> This allows this driver to bind on Renesas R-Car H2 which contains
>> Rogue G6400 BVNC 1.39.4.1 .
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Hi Marek,

Hello Matt,

> My apologies, this one appears to have slipped through the cracks on our
> end.

No worries.

>> +++ b/drivers/gpu/drm/imagination/Kconfig
>> @@ -3,7 +3,7 @@
>>   
>>   config DRM_POWERVR
>>   	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
>> -	depends on (ARM64 || RISCV && 64BIT)
>> +	depends on ARM || ARM64 || RISCV
> 
> This seems fine to me. Do you know any reason why the single change
> below might *not* be sufficient to support non-64-bit riscv? I can't
> think of any, I just wanted to double check this had been considered.
I do not have any 32bit RV to test this on, I only have 32bit ARM (R-Car 
H2).

