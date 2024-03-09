Return-Path: <linux-renesas-soc+bounces-3627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 849198770C2
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 12:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A667B1C20B1E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 11:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A812383AB;
	Sat,  9 Mar 2024 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKJmqY+j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4915A381A4
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709984713; cv=none; b=OYi2WT2MXdnK30ot072kLu0IkzY1VFw3o8PTazM66PPOB0xUYuyoq5ZT3umMZzn1alhv3mIJEF9sYr2tkiZNfp6bh+hLbwh7wMzyaUETD9hClXoI6fbRo3U3c2D3b20aY+Omq2121qNjXwYX3IsGwoR5ST6Vp735dJSzApaXfts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709984713; c=relaxed/simple;
	bh=rkRJnn8JPkKRJPe/iLCb7qyuK17IfXIWqBROEdGQxpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mw7Es/OcMBVVsSUA8h0wOF6ZqFViZni1SLS9rUPuakHNpiBvbwEHy4RBk3CPBBVU+16M46pHlQc0+BCwG3qk8H90boiSF8bie4MSVKspGRnOCiXN55Aen0/NNDX0sc5M+9J2W806B1BIKIeNQzL5x/HniCVYj5LctHm3SbemFL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKJmqY+j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-413175397f0so11039265e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2024 03:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709984709; x=1710589509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TnlziD6mLj4o3yYL6g8ZPkBVLpbFOusiwDLFHsf1DQ=;
        b=fKJmqY+jINyJvgZeCAHObwsqIRQV8YpTHH64eAzA25nLfaT8qLIiH3FS163wpAwnAH
         FnGKA+RchxMoANIKK7hYF3D5dRJmePrTjhahiNthvzl607Os8GDUCnYxg9AvEa3UwWYB
         D92IRrCkTTYJsPsKqdVq6AJmSC6iJhsA49UqaKKGkGAYj2klVTNLh0pXpPAAYf0WaVOQ
         j/866cidYhDrrBR8Mqv4TnF0eqXJFuKvq+Slj/XDGrltAap7MqzLF79Q8amikfj5ho3r
         RPqF+WXLlw1H72x1pvEsmZtevspnbxMXdWziMDMgNbFUgI3rqnzjY7S9Jqk8b7j41zuX
         8sNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709984709; x=1710589509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TnlziD6mLj4o3yYL6g8ZPkBVLpbFOusiwDLFHsf1DQ=;
        b=L2Q0TnJH6+g4IvgRx/mVJfCtdpBJMiX1Hj9q1Xx0Oc5udorLCc0k723ifHSUcELRT2
         tagva2h+5t21oOKA8CJB1NSQOXmMVYH1D6aBwxvtxyfuVMWrBOmNUQ8kT5JDwQPDU7Cv
         qNOSoYz29ZnUTQjq/+JG5IJsIu3uCAn3mrM2IiQ/RB7ekEURKSPSLtd2x1QaFdIkA16L
         eakbQqlJ0IY3fjJPMejlQ3/moohOrhJYGvMU+4TPcFbK6pbf1+JcdE4KdoYqC2Z97a94
         wPX3KFEXo1fD4pOWa1OyxyfEE+zjx+OP79TkJ2WIjrxSryRj5HxcpWN3t9mXkzdXbsne
         enqA==
X-Gm-Message-State: AOJu0YwpXr2M/8+ut663DED4WczMz2yxW5ojSK4Ij6/w/DzcstNaGjVZ
	oYy5e0CmbqgcGD9dYZ4FlWq3HLbo1VKuJXAwHeIBX4TKYjj9DlhqDdBIn3FY3mU=
X-Google-Smtp-Source: AGHT+IGm/UNipEUl2Z0zh8bcQfpK2xS3N6sNDfd7iuApChd4h42dv64wT1extiBNn00H5YyniV/tvA==
X-Received: by 2002:a05:600c:4e02:b0:412:ea32:e7b0 with SMTP id b2-20020a05600c4e0200b00412ea32e7b0mr1020818wmq.40.1709984709547;
        Sat, 09 Mar 2024 03:45:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c154600b004131ae36ac4sm4344631wmg.20.2024.03.09.03.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Mar 2024 03:45:08 -0800 (PST)
Message-ID: <1375d840-6e42-4e60-896c-265fe6a21705@linaro.org>
Date: Sat, 9 Mar 2024 12:45:06 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: renesas,etheravb: Add MDIO bus reset
 properties
Content-Language: en-US
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20240309012538.719518-1-niklas.soderlund+renesas@ragnatech.se>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240309012538.719518-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/03/2024 02:25, Niklas Söderlund wrote:
> The bindings for Renesas Ethernet AVB are from 2015 and contain some
> oddities that are impossible to get right without breaking existing
> bindings. One such thing is that the MDIO bus properties that should be
> its own node are mixed with the node for the IP for Ethernet AVB.
> 
> Instead of a separate node for the MDIO bus,
> 
>     avb: ethernet@e6800000 {
>             compatible = "renesas,etheravb-r8a7795",
>                          "renesas,etheravb-rcar-gen3";
>             reg = <0xe6800000 0x800>, <0xe6a00000 0x10000>;
> 
>             ...
> 
>             phy-handle = <&phy0>;
> 
>             mdio {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> 
>                 phy0: ethernet-phy@0 {
>                     ...
>                 };
>             };
>     };
> 
> The Ethernet AVB mix it in one,
> 
>     avb: ethernet@e6800000 {
>             compatible = "renesas,etheravb-r8a7795",
>                          "renesas,etheravb-rcar-gen3";
>             reg = <0xe6800000 0x800>, <0xe6a00000 0x10000>;
> 
>             ...
> 
>             phy-handle = <&phy0>;
> 
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             phy0: ethernet-phy@0 {
>                 ...
>             };
>     };
> 
> This forces to all MDIO bus properties needed to be described in the
> Ethernet AVB bindings directly. However not all MDIO bus properties are
> described as they were not needed. This change adds the MDIO bus
> properties to reset the MDIO bus in preparation for them being used.

That is not exactly what you wrote in the binding. Binding suggests you
have per device GPIO, which in your design is shared but the commit msg
says it is some sort of bus reset.

These are two different things, because in first case you could have a
design using two GPIOs, not one. Then your binding is completely wrong.

Plus, where is the user of all this?

I think you should rather correct the binding to use mdio node and add
appropriate handling in the driver, keeping backward compatibility.


Best regards,
Krzysztof


