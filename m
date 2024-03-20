Return-Path: <linux-renesas-soc+bounces-3927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00134880CB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 09:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DD341C215CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 08:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B574C2CCA4;
	Wed, 20 Mar 2024 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+zkdaJk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77191642B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710921972; cv=none; b=qugDLzKgWWr8nEzG4KNVLWd6UL5V90X5NUdRAsoZ6uUN1VuG15YLIOVHRF78y0l8yX1L72y4EC3AGfpYUbZA3843mnAZRlpzgf37ME1W9BDb2UAxc3urq2CI+AR/Rl+f7a9rA4xjS0xCdhf7E0IBcA+q96AhF/tmM1NKI83y6C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710921972; c=relaxed/simple;
	bh=3VaEiu7P6Vt47e432Hig0a+pLMJ67V4uuiIr1ehyxTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxD2CTPKmCkVqVq/l9WHhfm+3VtYy/+foMS52NR9OHBT0c/3+LqvqlPdE4koldy0StItviBbxpmHQGhDO8juawLmXkR24E+bpJ+SuAE5Goc+jRfMiFUUotgpYQwoq11QVticEd7AIiF99MJ9e9cHApj+RSIt5ZPYS6/NZpYg1I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+zkdaJk; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56bb33a907bso108035a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 01:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710921968; x=1711526768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SlzyeVESNsQAYLZBivF0TU3lMaCAxvMVcqfOd6RxnXM=;
        b=i+zkdaJk++vt1x7IQvwQOTqVbL+vgHV0ZqOi73m/F3qBDc2wJtWkvHm496DLCyoIXh
         RwN3Z71wefhcaw4UWK+r+jzaUqRFmO5fW+UiBu+SPe/d+Lhp1xL7/Bo5eRSeuWaETdhM
         oMhOfH8L/pJcc5eyov36yQ1Q092nscxEbv3Jf3lUeCssLXvqdsfRH9pJe/gDzOvo6CjD
         Af2APwyQDN4qYw2+QqgktRsoglM0b/iqC/Bxovgl/RaBJ6+NeaCsFdSEcSyl/vh+4l0g
         VMFj7R67JiaTwa4iPInPkpK0MwGH8vdKALYug/tBb2O9jMJhXcOgnn5viadBmY1DCIWn
         Y0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710921968; x=1711526768;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlzyeVESNsQAYLZBivF0TU3lMaCAxvMVcqfOd6RxnXM=;
        b=IAaYhUl0rcLW4xArGxqMPhhifmEcs8BucqcM+L5Ah9md4s1JOFIauzaU7EZT1KUvnZ
         l7yBQHt8N/BDKgxJ0m8whhAjGlThfQ8TDwinf+rW/awSPV8rlOmhl9W93Z2NkmuLfMzC
         0rYlMvASnSsJyPOeCVeKc4tEIZUvx0QKrOPhMDxbLoxVijkI32wVP71shG4N5BXCuLIY
         oxP1wqZGp9Xc01ACD9DlWJ/JioOfhjtmSYLN5dmUVVvT3BKoqTrGywqnUlZN9cZFM7cv
         jaHI1PE7opYvsXXXwyX/J6uPn3EoNsTPXtxIaVPYXPwU1kw7aHhYgun/Zpv1gX8ECUi1
         cyog==
X-Forwarded-Encrypted: i=1; AJvYcCWz0a0e27bQsUL2im7PSejI30yt6awOPo6uQWRAgLPFXiuQdOw6orbXtoWZ91INX/u9DuJawvNwAEQJuwUYF+zQTK19bublPuhNZiL41I92J1o=
X-Gm-Message-State: AOJu0Yw19+beTZGfjTyhuXUxAY4cGkBN/xVX7lwO5rYun4Ku2jtpxQwm
	M8VyuBbx5ncZamDfAyExswznqwM3cKZradAZtUKbFbEi/QKyLQDlsNEihPEn+zA=
X-Google-Smtp-Source: AGHT+IH6EmMnyI9/7MY7sWDDU2aR5lNG12sHgtfcpCwiENfmIWrRyINNt7AJUm8vWKW7hfkG52s/vg==
X-Received: by 2002:a05:6402:3641:b0:568:32f7:6c55 with SMTP id em1-20020a056402364100b0056832f76c55mr13096907edb.9.1710921968157;
        Wed, 20 Mar 2024 01:06:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id cw24-20020a170906c79800b00a469d3df3c1sm5232599ejb.96.2024.03.20.01.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 01:06:07 -0700 (PDT)
Message-ID: <5b87eee4-2b28-48a5-a7c8-6c450be724e7@linaro.org>
Date: Wed, 20 Mar 2024 09:06:05 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: renesas,scif: Validate
 'interrupts' and 'interrupt-names'
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240318172102.45549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240318172102.45549-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db13e305-adc4-4990-b9ec-b1cdcdad4406@linaro.org>
 <010e4742-438f-413f-811f-a033ec104832@linaro.org>
 <CA+V-a8txP39HJJrJcNqCUgw2NkdA3uSvBrbdSzw0bN6r5LpNaQ@mail.gmail.com>
 <51743788-3444-4817-864b-404205a06137@linaro.org>
 <CAMuHMdVWMt_JqpiWasZxS3D8dS5JYgxDU0SKbFxNVV-zWk8D+w@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdVWMt_JqpiWasZxS3D8dS5JYgxDU0SKbFxNVV-zWk8D+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2024 14:25, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Mar 19, 2024 at 2:04 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 19/03/2024 13:43, Lad, Prabhakar wrote:
>>>>>> diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
>>>>>> index af72c3420453..53f18e9810fd 100644
>>>>>> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
>>>>>> @@ -82,38 +82,6 @@ properties:
>>>>>>    reg:
>>>>>>      maxItems: 1
>>>>>>
>>>>>> -  interrupts:
>>>>>
>>>>> I don't understand what is happening with this patchset. Interrupts must
>>>>> stay here. Where did you receive any different feedback?
>>>>
>>>> Look how it is done:
>>>> https://elixir.bootlin.com/linux/v6.8/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L44
>>>>
>>> Thanks for the pointer, as the above binding doesn't have any
>>
>> Yeah, that's just an example to point you the concept: top level
>> property comes with widest constraints (or widest matching items
>> description) and each variant narrows the choice.
>>
>>> description items as compared to our case, to clarify I have updated
>>> the binding is below. Is this the correct approach?
>>>
>>> option #1
>>> ---------------
>>
>>
>> Yes, it looks correct.
> 
> Why duplicate all the descriptions? The only differences are the number
> of valid interrupts?
> What was wrong with "[PATCH v2 2/2] dt-bindings: serial: renesas,scif:
> Validate 'interrupts' and 'interrupt-names'"[1]?
> 
> https://lore.kernel.org/r/20240307114217.34784-3-prabhakar.mahadev-lad.rj@bp.renesas.com/

I have impression that only two variants out of three have same
descriptions... but now I see mistake I made in above. I read that first
interrupt is "Error interrupt" but it is "error or combined". Sorry for
that, I think most of my comment there is not correct.

It could be made oneOf?

    oneOf:
     - items:
          - description: A combined interrupt
     - items:
         - ....
       minItems: 4
?



Best regards,
Krzysztof


