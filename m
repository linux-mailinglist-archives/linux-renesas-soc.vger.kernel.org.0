Return-Path: <linux-renesas-soc+bounces-25787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D7CC1AE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 10:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B9E1300B934
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 09:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1DF30DD2F;
	Tue, 16 Dec 2025 09:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e6Ae6j8V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3DE2E413
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875840; cv=none; b=IiczkdsAjDa3M4jMf7mpzmGzi2IpEYr7MEzvVSokTPky+gCSDy1GiFKfZpBa2f6o7EmjSFw3uhdlqTBz0xIpcRkwndH+Mrz155ncAFwvt0Y+7UZ1JLOtDm3CzfsfwoK7d0ymCmAmnklNMoBmrPwinbpOgXfXW2DJBqmDjmchG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875840; c=relaxed/simple;
	bh=i9mu82VmE04PfNnD/qysnyH2w0m8QZb6icO8PtkEWY0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AnMQ7ldTGx1OcfX116kFrPUWDfafqKNQWNaGkjFbGNf/94r4W62OseFQdKH902xzqCbVpyEa3tAyqYPC13Ywoe4XY7ERtmySd7n8Ny52r8MSf1azTgCoC9Up0lDNusNe+np3Ll8rMLO+ybcqER9H8QO7WfSLPLoq7xJ5sJQg0OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e6Ae6j8V; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42e2e77f519so2215413f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 01:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765875836; x=1766480636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eEqpMcb6cgS7Ln6t+LliR4h4opbfD57z16EbPlvJgKU=;
        b=e6Ae6j8VY+a5MvetBoOPGPXMDSPqiI8XdQoRZ4ybNIG/SfiTCb6nJA09xH/kAFxcSy
         SoELfAY4PHYzjt6CF1sO/0rDQx3m92UU7NlbzYmLLsGB2zt7wvfYubAal4caK8HhkOaP
         vu5vTJVDNaLulN7MhDIBoHtamHdsUhSXtoiq7gbocHG7kqGGCHqdijqfCunETuX+Ah5n
         poDZFDfdn8SZi6bUFkHTdVh1aJ01ia2Zr4kOrP3m/xspoGC89Y+JM8GPgN8GgwKtekgR
         /5eIWyYpr6rbWdOyheEQwCRPlb9kzBEd5fMv9Rtht+LVb4ScOb/IvvJUoHN3cR3Qyf4M
         Az8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875836; x=1766480636;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEqpMcb6cgS7Ln6t+LliR4h4opbfD57z16EbPlvJgKU=;
        b=nHuuDRAPhpQaXRWeM1mhsmYK/2R/qsHJA4y8ffrLp/EpXDnyfE08FH6+KeHX4xtN8G
         lEiDE9y7pU8cBoIp8d6C0Nt0yh2HH1rJR0NcK/Svs9+XwdUb1E4QJAhvbvX71xIbYD3u
         wi/YivhcaxIinAP3hPbTM5a6sC2VnMZb7MLQJN2i7TOrtTESOy62rUeqOs4UTE7wButV
         2YpOZLzeTxCChkAhf4kxdb/uqEN7X+QecVsd2cZQ4jM1qdbUbUnFx9ttafm3RWz3SvJT
         O1o8/z/15QWIsXw4rxSTgZxBBhzcK1vFcZCq7DPI8PhArpvdIWiKVVZRelWri+5wU7pu
         07FA==
X-Forwarded-Encrypted: i=1; AJvYcCX1iVK6bRCvX17Gk/Qj7aVY6BrihEuMl/3bIgvQfjdNQUsXe/Kw1aJevfs5GnJWnDUMBjkH70E5iy1TihIxVqCCRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyey4tGqLrwveTCopeZKmyIkX0y2BTNRw8RgVm/qhEk4zRR+t0r
	byD0YYpHOpnAXAcfpD7H/gCDwkgx43z/Cn97+kaqKCKHsdkXMYNrVdqT+9sdI8RctWc=
X-Gm-Gg: AY/fxX5dCy+2sXyHby3JUskoa23oxX7DG9ow6uKS9sG6xptCa/EFpM/6AuaQRF/SWQL
	oet94sE7fmeUaGwasEXb0JJWfwCwT+MDC64RNNwGcClU2XXSK5lJU11tYr9kLTxdGv7cCdslWfs
	cE/JoF3CTaCd+6+G5IA7DMN6YDKVhEI7+tmXbeuM+6sBG3Al9kgV+NiYkR79BL3y2Utl//t9cOw
	srb2FOnaY9U9YNcmZsmRDiIz1e3gfpod9tQBnZANR3URNPLqboMwdiuBW/ItluH05daH/R+I4zP
	gQKv7INZUm1qF9uHde6SdLp7uXW9iXp0eJkyV3tqPdxb1NaaPnsoHpmsOIjxF/iq3snAT6VvJAL
	88nZrCQNoiW6/G39F+D27WFKs1fbVgwux611xfP6IXTcw8wGWxetcjbV3sq46o0/LidrXlKJ5hq
	IOCc4AzYEXmOZKnuoZNps=
X-Google-Smtp-Source: AGHT+IGvVbwc1Eu7YoUxDT3wnjEfax+tXv3FU38gBaWbleBqN1eUAIUnZs+hZhE6/kmwuoCwhjCwzQ==
X-Received: by 2002:a05:6000:d82:b0:42f:b9c6:c89b with SMTP id ffacd0b85a97d-42fb9c6caccmr12457455f8f.50.1765875835567;
        Tue, 16 Dec 2025 01:03:55 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb7118267sm26928277f8f.27.2025.12.16.01.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 01:03:55 -0800 (PST)
Message-ID: <3d8896c7-9ba8-43f2-8464-a94acdf82ba3@tuxon.dev>
Date: Tue, 16 Dec 2025 11:03:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346D053263D4E4C367F1EA186A5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346D053263D4E4C367F1EA186A5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 12/7/25 13:02, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 05 December 2025 10:00
>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM support
>>
>> Hi, Biju,
>>
>> On 12/5/25 10:53, Biju Das wrote:
>>>
>>>
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: 04 December 2025 18:26
>>>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to
>>>> RAM support
>>>>
>>>> Hi, Philipp,
>>>>
>>>> Could you please let me know if there's anything I should do for this series?
>>>
>>> If rzg2l_usbphy_ctrl_suspend() fails, What is the probability that it
>>> will suspend again without any issue
>>
>> How can I measure this?
>>
>> The idea with this code was the following: if any instruction of suspend fails, the suspend is
>> aborted, thus code in rzg2l_usbphy_ctrl_suspend() is trying to restore the runtime state of the HW so
>> that no runtime users of it to be affected. This is also how core suspend code is doing, e.g.
>> suspend_devices_and_enter().
> 
> After rechecking, the cleanup() in the suspend code making usage count unbalanced.
> 
> Eg:
>  Suspend returns error with the following usage count incremented 
> 
> static int rzg2l_usbphy_ctrl_suspend(struct device *dev)
> {
> reset_deassert:
> +	reset_control_deassert(priv->rstc);
> +rpm_resume:
> +	pm_runtime_resume_and_get(dev);
> +	return ret;
> }
> 
> 
> The suspend error code invokes device resume[1] and in that you are again calling
> reset_control_deassert() and pm_runtime_resume_and_get() which makes the usage
> count unbalanced forever.
> 
> So, looks like the current logic in the Add suspend to RAM support patch is wrong.

Seeing [1], [2], [3] being posted by you, and [2] following the same
pattern as proposed in this patch, are you still considering the approach
in this patch being wrong ?

Thank you,
Claudiu

[1]
https://lore.kernel.org/all/20251207124742.96526-1-biju.das.jz@bp.renesas.com
[2]
https://lore.kernel.org/all/20251208152133.269316-8-biju.das.jz@bp.renesas.com
[3]
https://lore.kernel.org/all/20251208101356.101379-1-biju.das.jz@bp.renesas.com

