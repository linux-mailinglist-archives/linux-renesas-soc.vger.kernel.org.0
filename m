Return-Path: <linux-renesas-soc+bounces-15-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B76AC7F2696
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 08:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B188282A2D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 07:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA27B358A5;
	Tue, 21 Nov 2023 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sFxT/va/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C8FC3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 23:45:33 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9c603e2354fso988960166b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 23:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700552732; x=1701157532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tdu7V4JOtmo9UDSHdBAvY/BhBUGtCKj5m7xi64q+zFI=;
        b=sFxT/va/FUtW8AF9O5VejYdKIKpIqvaOh+dFPnTQ/9xb/1mnYyMgbv07BOSRLHXDHz
         VFc4jMG961ZaPQ0xJfUxgeuhaqHBbuIzyPGUp9s46/SkhZ8in1GzIGmh3hTCi1xk3CUK
         AWScDF/B6xE9E+88iqwfjKLvktqY7WlbCxlTXpTdNIHS+gsm0l2UFbHlTcq4ybE3rgyK
         Isk+NuCnbyFfI7zKu1W35csvjcdzoMANoGkuzb4/wklyHH+7Wo2jqFheeVatu04Gtu+d
         xVzdq5KF8jjBoH+HiHi/yBcwRgPBlD05aQiq1TXdpwa9yn7k+URQJOgomYQQDjr3giws
         M3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700552732; x=1701157532;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tdu7V4JOtmo9UDSHdBAvY/BhBUGtCKj5m7xi64q+zFI=;
        b=X7LLxopgNqAXsWadHHw3xJeLwgaHDny60ZAGncIM0afgbzp2u5Qg8eu6S5xCDZZ/U3
         pzmq3uOdimiqdeiHIe5Euzc6n6CdL34Y0mGlbHJEIzxIIb0/0RjoJCuPOSVg6FKP+xhA
         y7DSC1FUzLNjWxMeZizdxpvGop0YI1D+tYh68hRY2iCOsyB3RxtUWQzzZR6dGOF22Lht
         hnG/w+hC6rHZRqjTp/YpVTkVSpWV2Gn9/QKcJJ7jbes3sVj3EDJbN4YaKBjsZbwl4H1k
         R6IqP8XodjW4IDSWnNZO82eLTeIJTHZiDEPlHnq1v2/AOY5FALdNKH7tKaeOyuhEUeWr
         r33A==
X-Gm-Message-State: AOJu0YzOvw8jKDYs07QepIOVrDjQ8CodCz62PdGx8oR98Gd5pLwOTsUX
	lnmjjCYl4pvwk2F5KYmZk6JM/w==
X-Google-Smtp-Source: AGHT+IEaaVVkiALP/iu5RycIlbzt/jWJ9fZrCEMJ61A0CCjHf77UghSeJ1SCGdsObImZd5/QvF++OQ==
X-Received: by 2002:a17:907:d27:b0:9ee:462c:7924 with SMTP id gn39-20020a1709070d2700b009ee462c7924mr2332688ejc.9.1700552731935;
        Mon, 20 Nov 2023 23:45:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906b28200b009ad8acac02asm4919276ejz.172.2023.11.20.23.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 23:45:31 -0800 (PST)
Message-ID: <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org>
Date: Tue, 21 Nov 2023 08:45:29 +0100
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
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/11/2023 17:07, Niklas Söderlund wrote:
> Add bindings for Renesas R-Car Ethernet TSN End-station IP. The RTSN
> device provides Ethernet network.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Why do you decide to skip some maintainers?

> ---
>  .../bindings/net/renesas,ethertsn.yaml        | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.

>  create mode 100644 Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
> new file mode 100644
> index 000000000000..255c8f3a5a3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/renesas,ethertsn.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Ethernet TSN End-station
> +
> +maintainers:
> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +
> +description:
> +  The RTSN device provides Ethernet network using a 10 Mbps, 100 Mbps, or 1
> +  Gbps full-duplex link via MII/GMII/RMII/RGMII. Depending on the connected PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Drop items.

I assume you have oneOf above because you predict this will grow with
entries with fallbacks? If not, drop.

> +          - enum:
> +              - renesas,ethertsn-r8a779g0      # R-Car V4H
> +
> +  reg:
> +    items:
> +      - description: TSN End Station target
> +      - description: generalized Precision Time Protocol target
> +
> +  reg-names:
> +    items:
> +      - const: tsnes
> +      - const: gptp
> +
> +  interrupts:
> +    items:
> +      - description: TX data interrupt
> +      - description: RX data interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: tx_data

tx

> +      - const: rx_data

rx

> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  phy-mode:
> +    contains:
> +      enum:
> +        - mii
> +        - rgmii
> +
> +  phy-handle:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Specifies a reference to a node representing a PHY device.

You miss top-level $ref to ethernet controller

> +
> +  renesas,rx-internal-delay:
> +    type: boolean
> +    description:
> +      Enable internal Rx clock delay, typically 1.8ns.

Why this is bool, not delay in ns?
Why this is property of a board (not SoC)?

> +
> +  renesas,tx-internal-delay:
> +    type: boolean
> +    description:
> +      Enable internal Tx clock delay, typically 2.0ns.

Same questions.

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^ethernet-phy@[0-9a-f]$":
> +    type: object
> +    $ref: ethernet-phy.yaml#

Missing unevaluatedProperties. Open existing bindings and look how it is
done there. Don't create something different.



Best regards,
Krzysztof


