Return-Path: <linux-renesas-soc+bounces-23809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44972C1755D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64DBE1B2402F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 23:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653B634C13F;
	Tue, 28 Oct 2025 23:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sG3bzq6r";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZJ+eQl5h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CEF2AD32
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 23:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761693544; cv=none; b=f5/tGMhkaIb0C9jc0bxHUMM1pkzppjQmOAAMFPBIIi3nIiEiCR0x0lDgoKxuqi/GOlEfeJVVaDh8juc6h6rW+J1RNfXu4yuIH6+LiFh4DXwkpWXh0LTSPIfjnK1FPpByM69Urw7tbJcU/qlMk8sclyBZ28n0AGcXjiNTsVKQv/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761693544; c=relaxed/simple;
	bh=KkYQmbYAdFcl8pe77udiAEAxpu8mhULO7apIhLmz0Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bratBHwkQ9mwGy3TaQWaWNVK6bsjVvTKGHc2LMtLROklRqGnWpSpFuxjOC4tBhdI3hKP57ONgPTwEEB0L8YSgjhz2kLNKnanIpzySQoGVLe2y7Y0q6e8wI/CxvnAL18FK8BaFjxWZZkU4UlzXsF0r8+vlV1VpqxWf0SxsutlsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sG3bzq6r; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZJ+eQl5h; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cx5sp4T0vz9tDq;
	Wed, 29 Oct 2025 00:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761693534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGEzJTZwXjohvldoWCwc0kmYf463XoC4zA6p6FCOMxg=;
	b=sG3bzq6r9IJF7C8DMGJRnwxLgyVMJFD/MukTipaXKQpX+SU9lG44oFHwmpqWE+hupPfGdp
	NeqWd74TGVGK5PDn2Jq0MJziWNR7t1BfhgtEx/559uO7PG/Fsdufr8cJfd6Sxz2oljthek
	go1eI2u9ZWMquuV8yJIxXjLaJDgAZD5AWrWsS7P6Ht8VokGljfdMAoPkpM+XNZiZLV9qca
	g/tZGq7IgtXEty3VZLm3+OHL+Qd8aEgd2jnXcYneEs7a/t+LOVcs1XCT4dHUz1kPbXjq26
	xaae93czkgy41aeZvW1M4FLuR/kkW9Y2jSfVJbilZfx0py+MHmCQhrb5AlXomw==
Message-ID: <8b4dd48c-ffcf-4e5c-9b31-073c9414176a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761693532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGEzJTZwXjohvldoWCwc0kmYf463XoC4zA6p6FCOMxg=;
	b=ZJ+eQl5hosv/v/+CZBiuc/aMAwEPeZ3HLW2TdvjWLsepttjyUbxnF8IwUYGoCzitkmpRMg
	pCasZ+R6+4c7aFaN0Sy5OaBev4ixAIH/HtHDqYWbiho+awUKsFbMkVl86YxmmUujathVBc
	myS8RXDm8X0ust1EHYTCELStbrNi+R803ObdD18fSqi2Jj3gMcNkX0And8Th6cF+HU0ib+
	0xDTG0zQ+7NpJnf0oNfl2gENxVoh+yo2fo2Go+yiIi3qUJEsyk232qLRYt6pBzfAgwtUuQ
	raHHi7X4BoN+RfBUvdO0Irgcdp8pEanaXVcfTeP6VoGAe+3o/JpdUJZVn5AFIw==
Date: Wed, 29 Oct 2025 00:18:48 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 05/11] drm/rcar-du: dsi: Clean up VCLKSET register
 macros
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <20251005030355.202242-6-marek.vasut+renesas@mailbox.org>
 <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4ieiudtsqbd3ng1izg13thzfd5iug8zd
X-MBO-RS-ID: 1019e97b1a3e2075f79

On 10/28/25 6:15 PM, Tomi Valkeinen wrote:

Hello Tomi,

>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> index 90e8e3de3e580..468f84cd1325e 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> @@ -246,14 +246,14 @@
>>   
>>   #define VCLKSET				0x100c
>>   #define VCLKSET_CKEN			(1 << 16)
>> -#define VCLKSET_COLOR_RGB		(0 << 8)
>> -#define VCLKSET_COLOR_YCC		(1 << 8)
>> +#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
>>   #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
>>   #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
>> -#define VCLKSET_BPP_16			(0 << 2)
>> -#define VCLKSET_BPP_18			(1 << 2)
>> -#define VCLKSET_BPP_18L			(2 << 2)
>> -#define VCLKSET_BPP_24			(3 << 2)
>> +#define VCLKSET_BPP_MASK		(3 << 2)
>> +#define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
>> +#define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
>> +#define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
>> +#define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
>>   #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
> It probably doesn't matter, but just wanted to mention: here FIELD_PREP
> is used with, e.g., (3 << 2). GENMASK returns an unsigned value, whereas
> (3 << 2) is signed.

For bitfields, I think unsigned is the correct option.

-- 
Best regards,
Marek Vasut

