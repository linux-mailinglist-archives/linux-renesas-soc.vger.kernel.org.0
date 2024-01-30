Return-Path: <linux-renesas-soc+bounces-1964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0318841C4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 08:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 263B51F26BF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 07:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FDE54F93;
	Tue, 30 Jan 2024 07:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CEybdmyF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CD054667
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jan 2024 07:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706598229; cv=none; b=KzT9fg6DQ9mZcEt67G0mbG/k+vQmdYHMhkZyIlS6Hn73AKb3JVOWtyt0AXhADNKtj3TTWtgkqRMUiWK84qGkXvJ2ivlimYhAQQSLoO/INUbZa3ftfgc5u4LhTw9OZ34PC/8SDPYa8cCEXEIrmQAEt+4mcclzxrAA3Hh588wi528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706598229; c=relaxed/simple;
	bh=vZf6m7RI1eROTzwOQTlH8TlWjwZoOveQcIvorFpjbgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kuZLiCKyiLH0CyrQOBf11TIOeFLpxX76t/IaMneIPMKVA+I7Dxb4AU0XiMYzF31YvSKaNTnGsHOIVhu0FCpwrsv5kqILCMI2ewoNCR2mylpbVUnPlc9zRSN/AOIaw3wSsJxucD2D77K2IN9YU8myM8vocnKfchrrUpB/TGrXCX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CEybdmyF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a357cba4a32so273331766b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 23:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706598225; x=1707203025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3uX+Nzh7GD/qkGDd2hkrqkUgxPvy6pwsK/SiuinutU=;
        b=CEybdmyFev54cg3wEbAo1PAZ2L8O3tucAkD5JSJKHqLPgiZTtH2ukGUZOE2pT9CmO/
         Xy3qPFRVVJ7GdABkCPHL4s3nLFzOfxfwDOaOmfj8rNzHkqsoFAWPqSN+iuzgG02s7R9X
         cA2K1Xxkywfn5LhfAFF3PKbABfJ9vpSfEdEEfzLClct7rTaouiAbaU6T0WjcOg1DVsvj
         cJNliUqKLUernQp6etn9Nzz57EQvr5HYGGXnuc2vLZ5qon59GH12qNLsd5kidwQ0OA19
         ptHzF6cQ2rzRc/MrI+DgzdSaUsOjlTXESTgIy/qMOBYva9D61B3mMe07dhcaKRVbqvGm
         DYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706598225; x=1707203025;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3uX+Nzh7GD/qkGDd2hkrqkUgxPvy6pwsK/SiuinutU=;
        b=tG6iV3jYcjYx+KvC1f77gHxQDw8RVRWwbQV1EHIwQ25Zh40QlmKOC9P1Kx+GOrDmCu
         OVMiKNHpNYtmX1I6zqKGWQGhGRuGlsPglfIxTPzVyNtFcK5yIf9hTJQiqcl24H5mhQRy
         J4LcV0y48HxYZy2ixadR/KV+hYAUjs3OSPxqLyiq2cnkMTKDJyqGhcKmhEZoCmbaeWFk
         S7lYOs9K8OfqzciU406OgHJNh876yWtSG2I/tVpEEBvJAaoVtFryO9GJWXXrUcg0XAE6
         rdK+mpSrH5qvOL/7t6+lb5+DNvMXK4mg2TgrnvOegcjhvmyvANL45bIzrpfaKH6vVV6U
         2/4w==
X-Gm-Message-State: AOJu0YwhtvguQDt/5hQk2h7s9SKOqpOoYWXH4slpBH03e7XtXbHuPRon
	aeyrmTXFqXyRKRkNtHK4h2iyR6Khd4i6CKqNtIbJbHNsXYD50DxEFJUsq4fa8DA=
X-Google-Smtp-Source: AGHT+IF32AfkB/h3vblysAegHlLs+WOawjFp8f423iOnx9b8d8IDG3ZpuywWvYTwN4QZvJHwVwcuag==
X-Received: by 2002:a17:906:1b0b:b0:a35:965d:5988 with SMTP id o11-20020a1709061b0b00b00a35965d5988mr4193192ejg.11.1706598225229;
        Mon, 29 Jan 2024 23:03:45 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vb5-20020a170907d04500b00a351d62309esm4109108ejc.39.2024.01.29.23.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 23:03:44 -0800 (PST)
Message-ID: <345bc392-cf28-479a-9453-5bc89f635759@tuxon.dev>
Date: Tue, 30 Jan 2024 09:03:43 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: renesas_sdhi: Fix change point of data handling
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, ulf.hansson@linaro.org,
 takeshi.saito.xv@renesas.com, masaharu.hayakawa.ry@renesas.com,
 yoshihiro.shimoda.uh@renesas.com, linux-mmc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240117110646.1317843-1-claudiu.beznea.uj@bp.renesas.com>
 <ZbeEPg1jc5qWJa5m@ninjato>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ZbeEPg1jc5qWJa5m@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 29.01.2024 12:55, Wolfram Sang wrote:
> Hi Claudiu,
> 
> but one thing I can ask already:
> 
>> Investigating it on RZ/G3S lead to the conclusion that every time the issue
>> is reproduced all the probed TAPs are OK. According to datasheet, when this
>> happens the change point of data need to be considered for tuning.
> 
> Yes, "considered" means here it should be *avoided*.

My understanding was the other way around from this statement found in
RZ/G3S hw manual:

"If all of the TAP [i] is OK, the sampling clock position is selected by
identifying the change point of data.
 Change point of the data can be found in the value of SCC_SMPCMP register.
Usage example is Section 33.8.3, Change
 point of the input data."

> 
>> Previous code considered the change point of data happens when the content
>> of the SMPCMP register is zero. According to RZ/V2M hardware manual,
> 
> When SMPCMP is zero, there is *no* change point. Which is good.

That was my understanding, too.

> 
>> chapter "Change Point of the Input Data" (as this is the most clear
>> description that I've found about change point of the input data and all
>> RZ hardware manual are similar on this chapter),
> 
> I also have a chapter named like this. If you check the diagram, change
> point is between TAP2 and 3, so the suggested TAP to use is 6 or 7. As
> far away as possible from the change point.

My understanding was different here as of the following hw manual statement:

"As the width of the input data is 1 (UI), select TAP6 or TAP7 which is

*the median* of next TAP3 from TAP3"

I understand from this that the median value should be considered here.

> 
>> at the time of tuning,
>> data is captured by the previous and next TAPs and the result is stored in
>> the SMPCMP register (previous TAP in bits 22..16, next TAP in bits 7..0).
>> If there is a mismatch b/w the previous and the next TAPs, it indicates
>> that there is a change point of the input data.
> 
> This is correct.
> 
>> To comply with this, the code checks if this mismatch is present and
>> updates the priv->smpcmp mask.
> 
> That means you select the "change point" instead of avoiding it?
> 
>> This change has been checked on the devices with the following DTSes by
>> doing 50 consecutive reboots and checking for the tuning failure message:
> 
> Okay, you might not have a failure message, but you might have selected
> the worst TAP. Or?
> 
>> +			if (cmpngu_data != cmpngd_data)
>> +				set_bit(i, priv->smpcmp);
> 
> Really looks like you select the change point instead of avoiding it.

Looking again at it and digesting what you said about the tuning here, yes
it seems I did it this way.

> 
> However, with some SD cards, I also see the EIO error you see. So, there
> might be room to improve TAP selection when all TAPs are good. I need to
> check if this is really is the same case for the SD cards in question.

Maybe better would be to change this condition:

			if (cmpngu_data != cmpngd_data)
				set_bit(i, priv->smpcmp);

like this:
			if (cmpngu_data == cmpngd_data)
				set_bit(i, priv->smpcmp);

?

I need to check it, though.

Thanks for your input,
Claudiu Beznea

> 
> Happy hacking,
> 
>    Wolfram
> 

