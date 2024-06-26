Return-Path: <linux-renesas-soc+bounces-6773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E18159178C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 08:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ECA91F23865
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 06:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3136C14A61B;
	Wed, 26 Jun 2024 06:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="entcXhZ6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879AE13A869
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719382750; cv=none; b=PdM/8x9ZW9pprtDwd4idBt3vP8GPb2//ZneB+kgjliH4GM89eUc5DDjgR0+bT1FvGPuDDXZlPi8IHqY/H9ofQiSCQK3n1keBOs1fILKwpEAR5dZ4F0etrxJXfWXcHUaH5dzpYIIqVpVx7e0mpoX51JNPqxDhkHgnOl6pmUM22wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719382750; c=relaxed/simple;
	bh=RQgSOJkMb9wk/66oDuy8ptZw9rvSHU+xcTyKg1i/qb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ale85ymA0WczSPfWWSXcZ3Mmyglp3mnU71QmEuWW25cjGn52BGJ2CVTIw7Keo9bgxQIij4ZWQ8UMhUiyH+NwVQNclIAwBERB7ZP0mc/cEnXd7GYa62MgQE0zmANIZ13Nx/eCiT8JiIY6NIoNGXfD+1E+u41x3G4a102K2h06Fb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=entcXhZ6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-363bd55bcc2so4986920f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 23:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719382747; x=1719987547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkDCCBpCvvJAl1mues32HQC3JjD1PKnxT92s3ylApLc=;
        b=entcXhZ6g5YpyCxPkyEcOiNTr1piy+QzhF14cuLNh2BHyrIpS/r3CxO54Ite4pE9Yk
         Eb8CLiveJarL9Jj9I/gb62edkiYoc2Cfifx7w1PAmscVkutI0jRZO4lwBYv8j9b1MEm7
         v3SZVUDhFY8I1UW4w/lEQXKs/95iEEG6ABestoDT0ZX5Wi+8ucC6hQ1o5f+z0u6MD24o
         /17fO/vv1DbgASJtJDBdh/1ohxjOGqKCWNVXUvqxqS8nyqjdXgBaLOTIJdl0x1OAjLo3
         UAU76e+1pz1Cudyr82pc52n3r7UU+fYwrVfbVQkW4jrvVApjhpSuEJVBIOWYIqbC+VeZ
         aVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719382747; x=1719987547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkDCCBpCvvJAl1mues32HQC3JjD1PKnxT92s3ylApLc=;
        b=QXTL//0Mig/7jgPnrF1mQgMRsEGktDjPp+me0uyUfTkz/uttkhRlOk2+l/w6BUX0vR
         PODQHL7EcV2Wlq+HhWOIjDNUz+Qwbh4DVovnxshzQ4/c/2+yZ7uL4FZzqXgxME0jehqG
         qyiTrW1LfSy0NBHHGhioYi9A1ugVePJWk/CxhdKPsf/dQ8QttuX6y3h8wVdy/BvZ/jek
         CqV6KHTV7+pG/hdZQOfL+KeiiS+3BlZym3IrClyl7OIMR/m3A75TVInVhdKOMtY24rae
         Q4QRjP3QaD03YSimCubxy1vpsXVK7CrT3lX9mTjMj98hfXwXHOzEajFZJKB186ThXPxj
         Q4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWaa7OFnT/lIONcoCE1u0iFC1AIYgE2h9fbigNVhvrQ14ik1Iiu6WT9SAWXtT60OCUDfTeKqPYB66m+udq3zfFPaQ/GjtFninVxp4k/lSBXqbM=
X-Gm-Message-State: AOJu0Yw2nuKhDvHfKmR+b7dGPNbK6n+DquCunT88uQzB2098kIyh9wYJ
	HSnEmCo/Acfu9nH/YwkEVzwOdDjgaMjJVMAGO0f7jc1rGekX/vc5cKU7a+xNdc4=
X-Google-Smtp-Source: AGHT+IElg9j81NmwVS1BHYzIBgjJfkqTeofPf8r35hmT1PYbcAE7HyZz9tEX7CppD5OTfr/qatZgzQ==
X-Received: by 2002:a5d:64c4:0:b0:366:f64b:289 with SMTP id ffacd0b85a97d-366f64b03f8mr5631215f8f.33.1719382746927;
        Tue, 25 Jun 2024 23:19:06 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c7499sm14792850f8f.90.2024.06.25.23.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 23:19:06 -0700 (PDT)
Message-ID: <dda01e59-3172-449c-9f2f-574a82b94a4f@tuxon.dev>
Date: Wed, 26 Jun 2024 09:19:05 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] pinctrl: renesas: rzg2l: Clean up and refactor OEN
 read/write functions
Content-Language: en-US
To: Paul Barker <paul.barker.ct@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
 <20240611113204.3004-3-paul.barker.ct@bp.renesas.com>
 <CAMuHMdXe8aaweQJ2=V7ksKTqcJCnqewKhSrrO4h7X924Vbk-_Q@mail.gmail.com>
 <6416f18e-f4cd-41da-9b46-b3b1f67d7170@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <6416f18e-f4cd-41da-9b46-b3b1f67d7170@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25.06.2024 22:56, Paul Barker wrote:
> On 17/06/2024 13:02, Geert Uytterhoeven wrote:
>> Hi Paul,
>>
>> On Tue, Jun 11, 2024 at 1:33 PM Paul Barker
>> <paul.barker.ct@bp.renesas.com> wrote:
>>> -static u8 rzg3s_pin_to_oen_bit(u32 offset, u8 pin, u8 max_port)
>>> +static u32 rzg3s_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, unsigned int _pin)
>>>  {
>>> -       if (pin)
>>> -               pin *= 2;
>>> +       u32 port = RZG2L_PIN_ID_TO_PORT(_pin);
>>> +       u8 pin = RZG2L_PIN_ID_TO_PIN(_pin);
>>
>> It's OK to use RZG2L_PIN_ID_TO_PIN() unconditionally, as RZ/G3S does
>> not have any dedicated pins with the OEN capability, right?
> 
> I thought about this a bit and came to the conclusion that no, it's not
> ok.
> 
> For RZ/G2L, only mux'd pins have OEN capability (Ethernet TXC/TX_CLK
> only).
> 
> For RZ/G3S, OEN capability also exists on XSPI/OCTA pins which are
> dedicated pins. We don't currently support OEN for these pins in the
> driver, but we should put a check in place now to be safe.

Just my preference: I would avoid adding code that is not currently used or
cannot be properly tested.

Thank you,
Claudiu Beznea

> I've done
> this in v3 which I'm about to send...
> 
> Thanks,
> 

