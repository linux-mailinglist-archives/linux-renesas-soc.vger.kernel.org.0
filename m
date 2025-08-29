Return-Path: <linux-renesas-soc+bounces-21074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F684B3BAF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 14:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A934A01889
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC832D542F;
	Fri, 29 Aug 2025 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KOA5jaaT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D050A229B1F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Aug 2025 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469848; cv=none; b=cWc76AthvwQUxg5mKc+W0fggLp+HN4g8FMAGqBHVU2BKDBJGiL6xypLGdu9DgMh97g7P1vK4idZnXC+AtgPU1iQlZLsd8MbVD3BLIkN6JudXYSvdilbXv93AActYnjxVg5+2XuZzkKzwFxvGJKtIDPTv5Z8/F5EN9IhLeuast8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469848; c=relaxed/simple;
	bh=OxQBCBaYtXRqV/nlXUYGEiK6hmFucXLwO7u1FoLHWCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gyw8Wpvvmyvao1Uh1FGiVY0WCef7a91OlYo88Q0wkRsB5Hv3sxAtX7DpU54TYAKaCKZBGDOdzo3ERy087UnR6cu6cpCSCk2S62T8K0ZtCfuzBPxP7NlPs23GHW90tE3pTgGxl7RqHHz4+mXhepz9v8QnpsqPcSwhQ8SL30UVSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KOA5jaaT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ceb830dd58so733653f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Aug 2025 05:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756469845; x=1757074645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghujH3DI//37KbeCX3UN89JJVzHmH+z7daXWxEwMXg8=;
        b=KOA5jaaT//s/QxevuadiYboUKM69pJkUFCkZOWBpecp4/KVzYS02VoGqDJgR73rCth
         2GI6PIbk6pzMf5c3qj452KIvRaRlAMsGJKCjmwynhPlbenXVlOkvMZl9N3M2kMc8Z3yU
         jCHxYkakMQk6Iiy5MoGOnefZNrHuYUstdyaFMV5Oyc512up0hOPLUvdJJSnVd5vmGRKj
         UTm2GHZyGsAQ8zpR23n7RQn/kLKkrSxZeLhtyoiE7Vf19qIPLxTbAp5eqMVaa23ej48t
         V+DQ1uypkyLvlA0RHaeApDgAb0T4G2QnJp5uBqAgp70O6v7o88KY4g3yz/ZOgoMIgfQP
         DEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756469845; x=1757074645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghujH3DI//37KbeCX3UN89JJVzHmH+z7daXWxEwMXg8=;
        b=D+JaDx7wxvZXBr/BTe23zxTpJgQlkTlxMOxsCZ9H8flfxfzH1CXL3IlJHSBU4E1znM
         5O/fNPNaVe6NTe2zZFNmbK3i1a7TD6bAzxoSHMdvBwTRTep7iiX93cAdKa6A0/LHFLuI
         ZuPhem9aa+ofR24FNk+rrexgOmBHdRVj5GmGEHym+Ij+21oZSydeu6sVX5ZAsh+VjqqS
         MasAKICkZr4nxKrDcEKeWiyErfdC0bCZ3olm60CEo+wg9H0K+N7xMox7xXp/893ttoyw
         kOCxufwh9Fho2ODvxvy7QjODyRr9UTru66n6slAdHvnDdVOCLLKg85vMH3ZH28TVkYI/
         RDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW1bkPGQZuLbGM83W/VncYOsS1lac/b7X5woUaTFj5liBu1n3SRqvjITME9jkIco+a5NtnreVywDd33XLUOz/3EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQujPGUiKw5imUPd4pDjqP6a22UEWD/Lxet8JkBXLc8/BcnrIx
	z3jTSpBvKj+VoTJ5rPK8nXYRQ2GaJb8N403N6xuaLV53G9enfWHa9Qqg9+DDZFJDMO8=
X-Gm-Gg: ASbGncvbxtJX7pWxM/peRGavjCzZqF7K8Gg0rfbo4k991a/KgB0vF2mt8tptEutoGjy
	TZ8z5rWv0XwuvIYpYmrME4tg63aynFdh9s1daoczOGBuOsrUNad65p0R21dhuSQVNwIFIUXDsou
	OdC1PG5riF+5Yi9HtSS8yWcXrpt/HkeoeEb6BIflyHnZ2ib3sqQMHllnO3Bkmj2PAhHSnIU2jDH
	/q86CxR0PImgAyzmq4ZRPOoXu47VuGn0xVKpd8jCE5jxmzA14qm3b4JpgES40I6U7MSl/w4y30a
	LUmSyNx7pC+u4xnKrl16RWzX+1KNZV4J0lUkKJ+qBjv292LQzKQs45fY0P+APCoSALjh1tgLac3
	lS/P0FlU0HJ/yp2nZ7SKphz4MTd2rCrkBskyIY2o01phivV/ab4k5o8HlUWS2+u4je8qaBUKHvC
	+DteL+WeZxwQ63qGAOHCK2g10=
X-Google-Smtp-Source: AGHT+IFYqGiFK1t5MMe09IWoUP29WvEbo5vkf2CXXru7AwbPHex/5v7KOICQ+I5oFXhPL1c8vkkZ4A==
X-Received: by 2002:a05:6000:220b:b0:3c5:921a:f440 with SMTP id ffacd0b85a97d-3cbb15ca670mr10835956f8f.12.1756469845102;
        Fri, 29 Aug 2025 05:17:25 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6202:f400:43c2:4394:d834:def5? ([2a02:2f04:6202:f400:43c2:4394:d834:def5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c751esm3173107f8f.16.2025.08.29.05.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 05:17:24 -0700 (PDT)
Message-ID: <3731e13f-d601-4fe4-a3d2-6dd3289b6396@tuxon.dev>
Date: Fri, 29 Aug 2025 15:17:22 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add initial USB support for the Renesas RZ/G3S SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 biju.das.jz@bp.renesas.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
 <aLAZprjeKtk4pusw@shikoro> <ae53d367-2ee5-49aa-82ba-86f9e84d4d25@tuxon.dev>
 <aLGGmI8bpKNVaSAa@shikoro> <be706ee5-057c-4b0a-b0d3-54ca24087f3f@tuxon.dev>
 <aLGUJbA0szYQ_gN4@shikoro>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aLGUJbA0szYQ_gN4@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/25 14:51, Wolfram Sang wrote:
> 
>>> Yes, I added it and it made the error go away, but still no USB. I
>>
>> The drivers are not probed or you see no activity when connecting USB devices?
> 
> Sigh, I was so sure to have checked OHCI/EHCI but only EHCI was enabled :(
> 
> Checking with the schematics, I get it that only the rightmost USB-A
> connectors on the carrier board are routed. Those two work fine now.
> 
> If that is to be expected, then for the whole series:

Yes, only those 2 are routed on RZ SMARC Carrier II + RZ/G3S SMARC Module.

> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 

Thank you for doing this,
Claudiu

