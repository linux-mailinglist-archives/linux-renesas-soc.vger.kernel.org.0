Return-Path: <linux-renesas-soc+bounces-8452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE99627D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 389081F251FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6BC184118;
	Wed, 28 Aug 2024 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wRfL4wUO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DB0184535
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849551; cv=none; b=VnLZoK6Xfg42yv2DHXrVn0wMyZ8XECRk+j5eBwTyXyX6oFebTxHpkOZuv3JHepaTxPWmVPzgIFk5LU8Gd76te+StrOf+xoaMBoReivd/F1Q6CZAYBFUPdLIuyWElif3XF6Hm6gdAUwtTVhifaO6kCfthE0yfUd0cK5+Vro8jPcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849551; c=relaxed/simple;
	bh=wbs2N9y5zb1aTXW0ejhzZicpJGJO5L0rTNhz8ZRDK4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fia/+GRew7PwG4G79791DkyYv5DUT7R5jv0pw29U28IsRLivynnFi9/sxTt/EmWZMbQwsoVm8r60pyycHoI949k/7nWBaumxxO1cWR4uLSV7pPMNWkkbXGmL6Q3VLKg2SLseXp6ijSCHz0a61cNNkNAPp5VCWHlnxCPKIYOtBJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wRfL4wUO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5befecad20eso1053209a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724849548; x=1725454348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Br3Ox6T86F7fsBUN1c97VxeysY/BzeyxH0SfRJR/WAY=;
        b=wRfL4wUOEc+7slTiTf1gXNgS8loM2NIi+RdJPX0ZkJN/Bx7WY2T4xufVQa19agfUEW
         vJ3pOuuohWzWkGhj4Cpw11n1Q454REbgtw885DAfsqVvM66GML8ppnF7fqLiQExJYybK
         +WtZTTD1axNY4wSbdPxOTzI5mYsi2MiJwKvjIdLOimT+R6wy4kv8hd4GQ1yfUzLOYrb1
         PtO5XWHPuGXCfb3t9Ww6miAEAZtjUbEZGzxLbcSb18ZxxSYFuHwoMSDP2tOlKSYuwHel
         j14F1wOK0wWkqweH67iM+btXTQ2txawKn6G6SV/5/e3R1dccMNSeepO+DjdQ1tPTV+q2
         7+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724849548; x=1725454348;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Br3Ox6T86F7fsBUN1c97VxeysY/BzeyxH0SfRJR/WAY=;
        b=SQFlYX6yXq9XgcPNsglutreMBIv+r+JPqamQRNxTsYqWDtDiLC7EHX5+codNCPU/Gi
         HfXaZEYvWL85gxuGXx+jyYW60yZg56W1om1LUcH1xLSUk1NvI42U5LyG8kre7DRFEteY
         2cY2SVGNXueMSy+3N6uCnG5/8AZOtsfn0934OIknIyAF2RiJryNSN6VP4cdcmdwpDyee
         wRO6RH0hTNaL8bXECD75oM/C+OX3yFBv6A9deKU/FbxMtwsa/wy0A2M5aqN9crbMtcxm
         AkocZGgFve1StlNyB/+D+zLqv7DTM+11pK/KlJKvR2NhfDEoLYc6NvzFpp0EGrnCIU0s
         1Qjw==
X-Forwarded-Encrypted: i=1; AJvYcCUM3e5Yy7PKCRowH7cE39KOfRAe0RRgPhobQL6wGLkl1POcwEq4yNYFAJ79ky6HDwDKKmOFVrAlz6QaBi9Ed0LnVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7XNlJ2+YQoemvYY0fYEQlVTpUa0crk0JClCRbar9ca2+ZuOSk
	PdVTSZEIJaJMam7f+Ppo17TyOwIWRW6IJzGSdSfNduNErJV3ElZBHDjo0p/gX1M=
X-Google-Smtp-Source: AGHT+IGlJWBpStWWEiN32Z+CxfSzH+ptbBN1MlD6NKxqublxi5KvsVDNsnzdH0pZCpsTN+24twVOnw==
X-Received: by 2002:a05:6402:350a:b0:5c2:17a3:95b5 with SMTP id 4fb4d7f45d1cf-5c217a39656mr852769a12.6.1724849547657;
        Wed, 28 Aug 2024 05:52:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb471bcasm2254902a12.75.2024.08.28.05.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 05:52:27 -0700 (PDT)
Message-ID: <3aa885c1-d653-4d73-98ab-3d4d3d214235@linaro.org>
Date: Wed, 28 Aug 2024 14:52:25 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts
 and resets per variants
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
 <20240818174137.GC29465@pendragon.ideasonboard.com>
 <4615f52b-4e4c-4fe4-bfef-a66e196410d7@linaro.org>
 <20240818175118.GF29465@pendragon.ideasonboard.com>
 <526b6f56-7807-4bb6-9365-077b1cc490b2@linaro.org>
 <20240828124517.GA23978@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240828124517.GA23978@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2024 14:45, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Sun, Aug 18, 2024 at 08:48:54PM +0200, Krzysztof Kozlowski wrote:
>> On 18/08/2024 19:51, Laurent Pinchart wrote:
>>> On Sun, Aug 18, 2024 at 07:44:22PM +0200, Krzysztof Kozlowski wrote:
>>>> On 18/08/2024 19:41, Laurent Pinchart wrote:
>>>>> On Sun, Aug 18, 2024 at 07:30:02PM +0200, Krzysztof Kozlowski wrote:
>>>>>> Each variable-length property like interrupts or resets must have fixed
>>>>>> constraints on number of items for given variant in binding.  The
>>>>>> clauses in "if:then:" block should define both limits: upper and lower.
>>>>>
>>>>> I thought that, when only one of minItems or maxItems was specified, the
>>>>> other automatically defaulted to the same value. I'm pretty sure I
>>>>> recall Rob asking me to drop one of the two in some bindings. Has the
>>>>> rule changes ? Is it documented somewhere ?
>>>>
>>>> New dtschema changed it and, even if previous behavior is restored, the
>>>> size in if:then: always had to be constrained. You could have skipped
>>>> one side of limit if it was equal to outer/top-level limit, e.g:
>>>>
>>>> properties:
>>>>   clocks:
>>>>     minItems: 1
>>>>     maxItems: 2
>>>>
>>>>
>>>> if:then:properties:
>>>>   clocks:
>>>>     minItems: 2
>>>
>>> Where can I find a description of the behaviour of the new dtschema
>>> (hopefully with some documentation) ?
>>
>> No clue, but I feel there is some core concept missing. Your earlier
>> statement:
>> "I thought that, when only one of minItems or maxItems was specified, the"
>>
>> was never logically correct for the "if:then", except for the case I
>> mentioned above. That's why all schema used as examples had it explicit:
>>
>> My talk from 2022, page 30:
>> https://static.sched.com/hosted_files/osseu2022/bd/How%20to%20Get%20Your%20DT%20Schema%20Bindings%20Accepted%20in%20Less%20than%2010%20Iterations%20-%20Krzysztof%20Kozlowski%2C%20Linaro.pdf?_gl=1*kmzqmt*_gcl_au*MTU2MzQ1MjY0Mi4xNzIxNzE0NDc1
>> all constraints defined,.
>>
>> My talk from 2023, page 34:
>> https://static.sched.com/hosted_files/eoss2023/a8/How%20to%20Get%20Your%20DT%20Schema%20Bindings%20Accepted%20in%20Less%20than%2010%20Iterations%20-%20Krzysztof%20Kozlowski%2C%20Linaro%20-%20ELCE%202023.pdf?_gl=1*1jgx6d3*_gcl_au*MTU2MzQ1MjY0Mi4xNzIxNzE0NDc1
>>
>> Recently, I started using other example as "useful reference":
>> https://elixir.bootlin.com/linux/v6.8/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L132
>>
>> That's nothing. All three above reference examples I keep giving are
>> already there and repeated in emails all the time.
>>
>> So aren't you confusing the entire "skip one limit" for top-level
>> properties? This patch is not about it all and dtschema did not change.
> 
> There must have been a misunderstanding indeed, I interpreted "New
> dtschema changed it" as meaning there were now new rules. Is that
> incorrect ?

For the binding with a property defined only in top-level properties: no
changes, no new rules.

For the binding with top-level and if:then:else: dtschema since few
months changed interpretation.

> 
> If you don't mind clarifying, what is the current recommendation to
> indicate that a property has a fixed number of items ? Which of the
> following three options is preferred ?
> 

Answer below assumes we have clocks defined in top-level properties and
there is no if:then:else customizing it.

> properties:
>   clocks:
>     minItems: 2

That's wrong, because items are unconstrained.

> 
> properties:
>   clocks:
>     maxItems: 2

This one is preferred.

> 
> properties:
>   clocks:
>     minItems: 2
>     maxItems: 2

This one is correct, but less preferred.


Best regards,
Krzysztof


