Return-Path: <linux-renesas-soc+bounces-19-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B287F27AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 09:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CD9AB21846
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 08:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE201A594;
	Tue, 21 Nov 2023 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uSq3mAmW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47BC98
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 00:40:45 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40859dee28cso25643885e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 00:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700556044; x=1701160844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsxD9BfYv48OQVamFFAxMDLyeOJr8bobuaBNTZuFtUs=;
        b=uSq3mAmWPHCsxoKSm06sUIHDIP4Pqjh764++gjHWR/jaxUsUfM5pKSxp3yQ0hlHGrt
         uwaX3gphrt9N+9sJRp95Xq9O1bbnA+umsiP7Mmd2k0Cugyt7f7NlcPAz0i5bCKpudnYY
         YY1G50YC/G4w6xFJxCuyML40ZJXBqPHoEeHdXufPgmt64mpAcW9IO3rVVZEZ5UMez8zF
         BvNomFyd6MbUqclqphpOzF8WoE4lSZetxMl9g9F6mH+jNiEK1e36HCOl2UJ7b/qpD57n
         oE7fmq9vYc4oDuX72Rdv/VwFpf/u94IupAeYph94OnaOTMbkU5O0RbnVgeBI9XlL637c
         0C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556044; x=1701160844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsxD9BfYv48OQVamFFAxMDLyeOJr8bobuaBNTZuFtUs=;
        b=RLHvjA9vbTnlz88xUXY0F39FglxEJfhLAaOpkqrlEQen2RlGDeeI0kXlO2kjz0bweS
         ef2weXU8DzrQVllvaGXLiyCx77uzSdd1XpLTZgmcRZNeOvY1ghXBH7lFGwMi2toUZywk
         NNRtWrWTpQT8W9D9eiTxPgrdhz3G6KfKb4/DbnW0LZuHY7FPXUtOSC99TkI8Dpt180uu
         /lLkgRJnmuSETwFTm8m4uwfi+ckSDKOgWM8mECtFc7H6tRyPJYW9jtch+WhDciLYn0o1
         m9sa8xvfmOMvmmt5hly5hzRJL8w+MXShk1FJpTtTCfMBjJOQvfcXgeuTQ5YZeT1fN/8F
         73tQ==
X-Gm-Message-State: AOJu0YyuWro2zLTO1fH8sk3TmcqWjr7BnFtfz3fkpq1y0/ypRJGR+w2M
	UmeocAykX5saFnA5ysB805U5bA==
X-Google-Smtp-Source: AGHT+IEbRsvtuamm0plE03/8r7RAvIadbllOXNaZoqBXYOmNsD272i5eetmdMrGpwal+zKzs0TbZgg==
X-Received: by 2002:adf:fd0c:0:b0:331:6ad1:81ec with SMTP id e12-20020adffd0c000000b003316ad181ecmr6463144wrr.25.1700556044155;
        Tue, 21 Nov 2023 00:40:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id a18-20020adfeed2000000b00327de0173f6sm13805773wrp.115.2023.11.21.00.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:40:43 -0800 (PST)
Message-ID: <c187f8d6-6178-4ef2-958b-16e274a49b91@linaro.org>
Date: Tue, 21 Nov 2023 09:40:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for
 Ethernet TSN
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
 <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org>
 <CAMuHMdUkfyJ9f22joXpAW1Gwk+zE9cqx+hbFqeK7Xc7ZTW1Faw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdUkfyJ9f22joXpAW1Gwk+zE9cqx+hbFqeK7Xc7ZTW1Faw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2023 09:00, Geert Uytterhoeven wrote:
> On Tue, Nov 21, 2023 at 8:45 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 20/11/2023 17:07, Niklas Söderlund wrote:
>>> Add bindings for Renesas R-Car Ethernet TSN End-station IP. The RTSN
>>> device provides Ethernet network.
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
>>> @@ -0,0 +1,133 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/net/renesas,ethertsn.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Renesas Ethernet TSN End-station
>>> +
>>> +maintainers:
>>> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
>>> +
>>> +description:
>>> +  The RTSN device provides Ethernet network using a 10 Mbps, 100 Mbps, or 1
>>> +  Gbps full-duplex link via MII/GMII/RMII/RGMII. Depending on the connected PHY.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>
>> Drop items.
>>
>> I assume you have oneOf above because you predict this will grow with
>> entries with fallbacks? If not, drop.
>>
>>> +          - enum:
>>> +              - renesas,ethertsn-r8a779g0      # R-Car V4H
> 
> renesas,r8a779g0-ethertsn

You can try to make a schema for this. See for examples:
Documentation/devicetree/bindings/arm/qcom-soc.yaml

> 
> R-Car S4 also has EtherTSN.
> Is it identical, so it makes sense to add a renesas,rcar-gen4-ethertsn
> fallback?
> 
>>> +  renesas,rx-internal-delay:
>>> +    type: boolean
>>> +    description:
>>> +      Enable internal Rx clock delay, typically 1.8ns.
>>
>> Why this is bool, not delay in ns?
>> Why this is property of a board (not SoC)?
> 
> Standard property is rx-internal-delay-ps.

Thanks.



Best regards,
Krzysztof


