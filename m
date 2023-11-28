Return-Path: <linux-renesas-soc+bounces-348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E097FBCC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 15:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 132CE282B82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 14:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34075B5BD;
	Tue, 28 Nov 2023 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o58wpfIG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C5118E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 06:32:26 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54af0eca12dso5909997a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 06:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701181945; x=1701786745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7qFjUDU/ylY38gTuTByVrY13B/ebGSVezLwD0qp/3g=;
        b=o58wpfIG1W2hsVfwcJIl/PlBjlTOvX1FfZVxFNcVDu19fDh9onD/095bJHH2wag/L9
         BsMaLFU3XTaFZ9Y/i8MGi+HyyS5dYU8TfLMswuyNDHXtL1ziGyS7+06A03Eah0Ds1Wto
         KqgGduAb5ZEZsV1h0xJZtN5N3/jCUCeoRqx07e00SvfIFJwi0nfljBMoObdhtJGXVxsY
         Zyetet+KPB8RBR+X44ueWZHc7YEOVSdIE6KEo4ae8Kfd1GUQ85Q/A2LE/5gVTSQ6bnNA
         2w0LcArfHUEQN5gz7i85/W4udrcGEm/YRDeVELovFODfwPuopL7ghfNCFuAZctksR0Mf
         mBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701181945; x=1701786745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7qFjUDU/ylY38gTuTByVrY13B/ebGSVezLwD0qp/3g=;
        b=Ru4OBwthlYVQIQME5HEAismf2hiTwYGuMRMf3Xrn/Np6fomJOyZhQhV/CdItZuUxaS
         sU5gst+dQNlgHf8ItYLh4i+Gj/crVGWEC7QvR1kaMP5zL8yZk2Gh6o/46YcFpmZgdKg7
         3/5KLCDriLIzrHszVctjNlYQP0oozLUmL8Do2Mc8FQKrE1LclcadPF/Ni6bc6M0W3koA
         PiBip6KCcrc4HPntpw3NA0XM9+RTs1mY5ydKi0S5tUPx0BfSv5AqGp9D/axsYy3qeuTt
         qdBg7CudMunvRHpvateFhMjDIOHkFXA3UIz6EiLxW/CWCQUX3pxQiJISw8JYR68pTMVP
         Z4mA==
X-Gm-Message-State: AOJu0Yx4c+0UGzrMBFv1Non28+JjlZ7OrgAA6hO6QfVjcwmbf7Sc/+d5
	qi3laNcTg1ASxejw4o3W+tiCBpqnO2Rj9dMj/yU=
X-Google-Smtp-Source: AGHT+IF2ePQfYSDNOzlLd8fYACXpU7vpOg7ZxSIY6JL46sLD87if+5UtVs/GQfXeRbEENDdboDYnrg==
X-Received: by 2002:a50:bb02:0:b0:54b:28e9:b283 with SMTP id y2-20020a50bb02000000b0054b28e9b283mr8378435ede.14.1701181944943;
        Tue, 28 Nov 2023 06:32:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id er21-20020a056402449500b0054b2040ea46sm4109154edb.61.2023.11.28.06.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:32:24 -0800 (PST)
Message-ID: <c6c3c356-e0dc-469f-aa24-6701fa06fba8@linaro.org>
Date: Tue, 28 Nov 2023 15:32:22 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: renesas: Document preferred compatible
 naming
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20231125232821.234631-1-niklas.soderlund+renesas@ragnatech.se>
 <deacc7ea-6fad-47d6-978b-3f639aa5da35@linaro.org>
 <CAMuHMdUcbr--3Cs4+2m=hOehXJt0WqiuYqV_j0DBmR+YgoEb-g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdUcbr--3Cs4+2m=hOehXJt0WqiuYqV_j0DBmR+YgoEb-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/11/2023 11:32, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Nov 28, 2023 at 10:51 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 26/11/2023 00:28, Niklas Söderlund wrote:
>>> Compatibles can come in two formats. Either "vendor,ip-soc" or
>>> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
>>> policy and enforcing it for all new compatibles, except few existing
>>> patterns.
>>>
>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
>>> +      # Legacy namings - variations of existing patterns/compatibles are OK,
>>> +      # but do not add completely new entries to these:
>>> +      - pattern: "^renesas,can-[a-z0-9]+$"
>>> +      - pattern: "^renesas,dmac-[a-z0-9]+$"
>>> +      - pattern: "^renesas,du-[a-z0-9]+$"
>>> +      - pattern: "^renesas,ether-[a-z0-9]+$"
>>> +      - pattern: "^renesas,etheravb-[a-z0-9]+$"
>>> +      - pattern: "^renesas,etheravb-rcar-gen[0-9]$"
>>> +      - pattern: "^renesas,gether-[a-z0-9]+$"
>>> +      - pattern: "^renesas,gpio-[a-z0-9]+$"
>>> +      - pattern: "^renesas,hscif-[a-z0-9]+$"
>>> +      - pattern: "^renesas,i2c-[a-z0-9]+$"
>>> +      - pattern: "^renesas,iic-[a-z0-9]+$"
>>> +      - pattern: "^renesas,intc-ex-[a-z0-9]+$"
>>> +      - pattern: "^renesas,intc-irqpin-[a-z0-9]+$"
>>> +      - pattern: "^renesas,ipmmu-[a-z0-9]+$"
>>> +      - pattern: "^renesas,irqc-[a-z0-9]+$"
>>> +      - pattern: "^renesas,jpu-[a-z0-9]+$"
>>> +      - pattern: "^renesas,mmcif-[a-z0-9]+$"
>>> +      - pattern: "^renesas,msiof-[a-z0-9]+$"
>>> +      - pattern: "^renesas,pci-[a-z0-9]+$"
>>> +      - pattern: "^renesas,pci-rcar-gen[0-9]$"
>>> +      - pattern: "^renesas,pcie-[a-z0-9]+$"
>>> +      - pattern: "^renesas,pcie-rcar-gen[0-9]$"
>>> +      - pattern: "^renesas,pfc-[a-z0-9]+$"
>>> +      - pattern: "^renesas,pwm-[a-z0-9]+$"
>>> +      - pattern: "^renesas,qspi-[a-z0-9]+$"
>>> +      - pattern: "^renesas,rcar_sound-[a-z0-9]+$"
>>> +      - pattern: "^renesas,riic-[a-z0-9]+$"
>>> +      - pattern: "^renesas,rspi-[a-z0-9]+$"
>>> +      - pattern: "^renesas,sata-[a-z0-9]+(-es1)?$"
>>> +      - pattern: "^renesas,scif-[a-z0-9]+$"
>>> +      - pattern: "^renesas,scifa-[a-z0-9]+$"
>>> +      - pattern: "^renesas,scifb-[a-z0-9]+$"
>>> +      - pattern: "^renesas,sdhi-[a-z0-9]+$"
>>> +      - pattern: "^renesas,thermal-[a-z0-9]+$"
>>> +      - pattern: "^renesas,tmu-[a-z0-9]+$"
>>> +      - pattern: "^renesas,tpu-[a-z0-9]+$"
>>> +      - pattern: "^renesas,usb-phy-[a-z0-9]+$"
>>> +      - pattern: "^renesas,usb2-phy-[a-z0-9]+$"
>>> +      - pattern: "^renesas,usbhs-[a-z0-9]+$"
>>> +      - pattern: "^renesas,vin-[a-z0-9]+$"
>>> +      - pattern: "^renesas,xhci-[a-z0-9]+$"
>>
>> No, wait, you basically listed most of the SoC as exceptions. What SoC
>> blocks exactly are you going to cover in such case with your rules?
> 
> As Renesas was an early adopter of DT, there are a lot of compatible
> values that do not follow current best practices.
> Unfortunately there is not much we can do about that...
> 

Hm, ok, given how many exceptions you have, just please consider whether
this schema will be of any use. IOW, how many of new SoC blocks you have
which are not covered by the exceptions?

Best regards,
Krzysztof


