Return-Path: <linux-renesas-soc+bounces-7255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA32492E52B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 12:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90B40284291
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 10:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7C215886C;
	Thu, 11 Jul 2024 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="o4aLvvEN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55301158DA1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720695329; cv=none; b=VkmZAZRbsYOnxyDLFhFEQkoXYq3jZbeWGhQNahyECPamv65h0Dkm2zzJmbK9EFCaBTx9aXQ/fbyzuYbEmuIm9+iKG6ctJvKy5c98DmEBZeS0alU3PpYSRcD5AS6Gzsm4HcBsS6+sDMhnO7BSUqh22OHPTBSMYNI1LqgJJgvhNZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720695329; c=relaxed/simple;
	bh=ObMpbEximSI8alc70FW/UfPZ4bMtmbUEXU+rnP6lHYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfFs79MMe9AHSyINi1MfrqsyJ+kDo+VpRtv+CZaPIl2flFhVKTDhShIQWqKpw+s9onfhsf4IvgcoYCAZCsMwHNJS1IX/otlPDRmAKb63OfPbBLz+HPsW1RymDkAMEPgJ9uNRuCdOUCG3R6mbeY/vaj9jaL+cwQ8HtnCQSKnoUsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=o4aLvvEN; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e9c6b5a62so790100e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720695325; x=1721300125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4SjRvd/Gf0tvdBBNCaypISbkCCPsgLpujJHRu2p8Vw=;
        b=o4aLvvENk6rCATrGKLwBCRtm7ksXTzrZjAuHMXh17yA/jSyJRctRSPJItByRaJtXYT
         0Pft3liimlgdkZvhFwT9AYgu/OsWK/bk+S0otmRGqspnI+usOnOILlMR1fWxRkIVzawy
         Wb16rMe+B1Uyq3EAWbCs5GvCgFJd7FiEBDlw5x9yqw29jUNWFATiLM6W7uOFIt1FvsWM
         X+yQWW0sVrSdgBrDh/CQZFeaG8fuixy+lrX/GM9ngSNttGx9u6/6uyTvt44SuIMfHG8o
         /Y9u3grBrdJyU9e5+E2cS9VAE+AqV+t8J992T4r6of+yTmSftEkmYxBqoGfKbomxArj1
         6Vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720695325; x=1721300125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4SjRvd/Gf0tvdBBNCaypISbkCCPsgLpujJHRu2p8Vw=;
        b=VKbwZOFbenOwjNN+kCuFjkxlSLNKQeQds/W+38+L2dNaerXRFRmHFj9UtY5nWUV6LY
         IOB8elDazquOFbjTy4aBVJqHgenUuRamdl0neamIBavVnHcmsDbLh9hxx93Avm9nZMD2
         twtsRPjkUcdYpx65MGjk5kRWxrA09fwy6WmwdJyX8ZlMi4XMwTD7SA0wKMUvCTXroXnF
         HETrKfATFhFRygf22vGsSXge+CICy4lxCAxcg/BUt5dE9vlX/sFXFoOjrUF6ZHELaWwp
         KW04n2giUWgU6+oOrr9PVtAwoAEuSnaDBSbMCMJ8HrJSxn3O42Vl7Iz4Mh6SKcRARknn
         8rsg==
X-Forwarded-Encrypted: i=1; AJvYcCW5H9GRdJCZjVzHx2MlkeNFNDwFskZoSp9tVsziqoaV+hrHVJ/G9PSpgSZpJfvasX5orj7dpUuqboaYRofN5nttVW1199XZvRM4fk0Ksu5Vv90=
X-Gm-Message-State: AOJu0Yys2MYR9czOkDSs1OIN0HROHIJdakj8Q2bNQirVntJwJUuGrWcW
	JAZZcGYJIMw1dbrM7ZWEX1mbcOMKzBCmWe4uJts/cRDe2zFr0SvDWN0/MsJeHBWCBVnGOz5eZC8
	X
X-Google-Smtp-Source: AGHT+IFyURXGCB/ZWatM2zsqpItEbE9ARS0oWeAG/0s7yJAUURbplkg2wS4Wiw1poVUzIJzmirJqIA==
X-Received: by 2002:a05:6512:1388:b0:52e:9caf:d2fa with SMTP id 2adb3069b0e04-52eb999a6e4mr5924441e87.19.1720695325216;
        Thu, 11 Jul 2024 03:55:25 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741fa6sm115097855e9.45.2024.07.11.03.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 03:55:24 -0700 (PDT)
Message-ID: <beb2082e-b7fb-462f-be14-8be4f1400404@tuxon.dev>
Date: Thu, 11 Jul 2024 13:55:22 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] i2c: riic: Add support for fast mode plus
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-10-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX4hWou9OtdE8XgU7-U0ghJ6vk2kVqgT90U0ZjsxzR5DA@mail.gmail.com>
 <22db23bd-5872-49a0-990f-2a0e5f51bfb5@tuxon.dev>
 <CAMuHMdWTYfK6aVi5BzBtQg_zQWjuZX7d7QHr3a4GAb+dQOWyvQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWTYfK6aVi5BzBtQg_zQWjuZX7d7QHr3a4GAb+dQOWyvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 11.07.2024 10:53, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Jul 10, 2024 at 4:20 PM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 28.06.2024 12:22, Geert Uytterhoeven wrote:
>>> On Tue, Jun 25, 2024 at 2:14 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Fast mode plus is available on most of the IP variants that RIIC driver
>>>> is working with. The exception is (according to HW manuals of the SoCs
>>>> where this IP is available) the Renesas RZ/A1H. For this, patch
>>>> introduces the struct riic_of_data::fast_mode_plus.
>>>>
>>>> Fast mode plus was tested on RZ/G3S, RZ/G2{L,UL,LC}, RZ/Five by
>>>> instantiating the RIIC frequency to 1MHz and issuing i2c reads on the
>>>> fast mode plus capable devices (and the i2c clock frequency was checked on
>>>> RZ/G3S).
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/drivers/i2c/busses/i2c-riic.c
>>>> +++ b/drivers/i2c/busses/i2c-riic.c
>>>> @@ -407,6 +413,9 @@ static int riic_init_hw(struct riic_dev *riic)
>>>>         riic_writeb(riic, 0, RIIC_ICSER);
>>>>         riic_writeb(riic, ICMR3_ACKWP | ICMR3_RDRFS, RIIC_ICMR3);
>>>>
>>>> +       if (info->fast_mode_plus && t->bus_freq_hz == I2C_MAX_FAST_MODE_PLUS_FREQ)
>>>> +               riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);
>>>
>>> Unless FM+ is specified, RIIC_ICFER is never written to.
>>> Probably the register should always be initialized, also to make sure
>>> the FMPE bit is cleared when it was set by the boot loader, but FM+
>>> is not to be used.
>>
>> Instead of clearing only this bit, what do you think about using
>> reset_control_reset() instead of reset_control_deassert() in riic_i2c_probe()?
>>
>> HW manuals for all the devices listed in
>> Documentation/devicetree/bindings/i2c/renesas,riic.yaml specifies that
>> ICFER_FMPE register is initialized with a default value by reset. All the
>> other registers are initialized with default values at reset (according to
>> HW manuals). I've checked it on RZ/G3S and it behaves like this.
> 
> RZ/A1 and RZ/A2M do not have reset controller support yet, so calling
> reset_control_reset() is a no-op on these SoCs.
> 
> However, I overlooked that riic_init_hw() does an internal reset first
> by setting the ICCR1_IICRST bit in RIIC_ICCR1.
> Is that sufficient to reset the FMPE bit?

Yes, that also restores the content of RIIC_ICFER register to the default
value (including clearing the FMPE bit). Thanks for pointing it, I
overlooked it, too.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

