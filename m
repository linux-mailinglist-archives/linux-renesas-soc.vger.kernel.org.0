Return-Path: <linux-renesas-soc+bounces-27372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJRPKLQSdGkL2AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 01:30:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC97BAB8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 01:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A636300C583
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF242F872;
	Sat, 24 Jan 2026 00:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rgON1VOi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81F11CAF
	for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Jan 2026 00:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769214641; cv=none; b=a2Ud6txqKHcCk9vSsvdGK/YuBBw5LtB67JvwYcqUlRQk7+AAjb/W+Lugr6DB7Rk72UIJXEi+mkZd+Qlb2EPOdXWXZ5X/zhbptrF3N9Hk+Zw+URFE5DHD9Xs94Uso4S5A6cNGXthqu6c5pdJAsaw0DZxj9qxL48QGppfhvtzJaBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769214641; c=relaxed/simple;
	bh=bW9MnJrcdynnYpKPBeZpncwMHZOU7v9BlOafMgvjBu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHGPbjVnWzIAV8LHXPI5cZEOj8IZLbiyRtw2jE0tAMq2giWUwPs7d9yrqIDZXAH0y6hMSjlZWPqdeEX3eHg2CVQqNmouZFOBnl7EE/dm818TNmZ61AhG0WTkw8h3yOisTxZCe931vXJwofS5Iyi1OGu3rXw360zh6F06kFxBMrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rgON1VOi; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dybLG2CLlz9vCX;
	Sat, 24 Jan 2026 01:30:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769214630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X5nLpTSobSsBsvLNmzs0aaNv9J2IQXpVoUoZI9CpVTM=;
	b=rgON1VOiJjePsKciUddNxpKdxkIqevXLXSuIAaNz+W+iRlpkrki19csGlzfhIzoJYwdhrh
	wb79HWzXaUKtcwytGE31A/wP7Ye2iHtIa5hPyaGwTGiHIOG9w044qdL3HVMXokwCdSnWjb
	xlQcdHoYlFNomQajDa4UFlfRj8Li9EsoLRidoYo/7Y1pdGAV3rk0nfLGbOcCkOMnP2oPcO
	1Hz/+yhAFZEO8GaWbMC6QVlCf83ej9SP7JysMs6yQsDJ5i3hR8LD6rCmFMvXX9+E50kJc1
	8c3vEBXsKHBqWr0VwTajWyp8oMECZG+hcNeHCsACBylvWNTT5VImty4H1Hor7w==
Message-ID: <f582dff3-92ec-4ac4-b270-3063bd873050@mailbox.org>
Date: Fri, 23 Jan 2026 16:04:22 +0100
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
 <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
 <bcc4b571-3c14-4c2f-8e47-127c35946a64@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <bcc4b571-3c14-4c2f-8e47-127c35946a64@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: yocza3z3cxejzpdpoot5pfbhmdz44kt5
X-MBO-RS-ID: 2f7624c56ab8cff0a6a
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27372-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,imgtec.com,linux.intel.com,kernel.org,ffwll.ch,suse.de,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: E0AC97BAB8
X-Rspamd-Action: no action

On 1/23/26 11:28 AM, Matt Coster wrote:
> On 05/01/2026 16:34, Marek Vasut wrote:
>> On 1/5/26 2:09 PM, Matt Coster wrote:
>>> On 06/11/2025 23:24, Marek Vasut wrote:
>>>> Fix support for build on 32bit systems. Include linux/io-64-nonatomic-hi-lo.h
>>>> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() accessors, and
>>>> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
>>>>
>>>> This allows this driver to bind on Renesas R-Car H2 which contains
>>>> Rogue G6400 BVNC 1.39.4.1 .
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>
>>> Hi Marek,
>>
>> Hello Matt,
>>
>>> My apologies, this one appears to have slipped through the cracks on our
>>> end.
>>
>> No worries.
>>
>>>> +++ b/drivers/gpu/drm/imagination/Kconfig
>>>> @@ -3,7 +3,7 @@
>>>>      config DRM_POWERVR
>>>>        tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
>>>> -    depends on (ARM64 || RISCV && 64BIT)
>>>> +    depends on ARM || ARM64 || RISCV
>>>
>>> This seems fine to me. Do you know any reason why the single change
>>> below might *not* be sufficient to support non-64-bit riscv? I can't
>>> think of any, I just wanted to double check this had been considered.
>> I do not have any 32bit RV to test this on, I only have 32bit ARM (R-Car H2).
> 
> I appreciate that you'd like to work on getting these older cores
> supported in the driver, but as it stands there's no real way to test
> this change beyond ensuring that it compiles.

I'm sure imgtec can produce a firmware, just like they did for the other 
cores, and then it can be tested ?

> I've asked around internally and the consensus is that communicating
> with the GPU on a 32-bit platform requires more consideration than just
> using the shims provided by io-64-nonatomic-hi-lo.h to avoid introducing
> races and other potential security holes.
> 
> My suggestion is that this patch be shelved for now and used as part of
> a larger series later which adds basic support for a core on a 32-bit
> platform.
What exactly is missing ?

