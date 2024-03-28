Return-Path: <linux-renesas-soc+bounces-3531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9FC874B55
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 10:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 332B61F22453
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 09:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0653684FCB;
	Thu,  7 Mar 2024 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrCADoz2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B29657DA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Mar 2024 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709805226; cv=none; b=DtrSiVe32c3MIeBMIM1V8DboKoB6OytDg/bUVrWXp85x4QzH5cU4myAX1tAoliydeD+siU2d4of8rAc91BVm0PmuI2n6ANDi1rvK5hhq9QUwTe5nbam2kbuPYqImMxvDey4wuiYLwfa2AFIuwAMSVLsaPmPQjhhTHB4v1rbCVco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709805226; c=relaxed/simple;
	bh=6lCQPmC2NLod8HFgbwnwGugG2aNAAhdLirkMnWiyG6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uulJYH1bSM7hHNu0YDY2fbFfezk+YQ/Pn/KQ9jvkjofYrv2e8XbOj1wxCgIXOkDQpxiSN7S/A5QY9QvOLnOV6qddZFU/jnHS99GhtoZATExIV/CszZ7Jm9KFwvcVw6rM23SM/3gaVau+k/yL8t+k3R8U3bjckXqLkPBThny/WD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrCADoz2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a446b5a08f0so131131466b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2024 01:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709805223; x=1710410023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JjvVVrgXKtdWF6nAiCXymOryFizeDTs65VKbBWYSOnM=;
        b=qrCADoz2HM4EHlAMEzUERNlgDZKIxY/jEmw4v5S/QNO5gSh3f4uHQGxigXhff/gi2o
         oUX/xay+dIQJyqstwzUJObszlhrV8/5fel0qM1qSEAjTrnsQhWL9ovh/Z25VZUwcNcKa
         RK39re87l8p76xUtFUZIpeGdwXYrwA1y29djbbBJqSSpI9ynq+HVojzB8tfnit5vp0By
         X39r/GJNvEmSzsZJUGaqEN8oLY//A2sFPbcMnSgGfR1NahkEaOQ/VU273CouEwKxxUGR
         16oT0/6Boyk5vx7CYGEOeRv8R1MjTOkS7tWyjkg34pFQWxs2tjIqRL/YBlFXD7Ad5lHT
         OC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709805223; x=1710410023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JjvVVrgXKtdWF6nAiCXymOryFizeDTs65VKbBWYSOnM=;
        b=tM1Roexc1olfD6RRJQIjQH5f0aa0dwuh/l9HWbO11pE3mTMf4ud6bG/J3ZkJI0GV5Y
         +GrzWpbvz6gYmjOXA61/dehe9Ss9I7yohbg+9wz84NlzWOzYoNOhCYHCG/WIT1Nk1wKh
         jSC8hglF5n9kMCiTcll/kPBIQWkL7Wm3P5W28q/CGEkaByKwQHqojXsjoXvF6dSK02MC
         WpwoDlwVAUaJ4U9Fb/VoS8P//6BuDQNcVpem+1/ff53imtL0zjZohq2dEFPi3oOiMp7y
         sIIBUDtNqwcaP6w34HFrifj8s/wmqiVJQWC5TA2F7DBkHigp3zXcnt3ia9jUjzhLUhBT
         h+mA==
X-Forwarded-Encrypted: i=1; AJvYcCWPccwmZnXUeqNDvuZCc9a3L+nlFH4iAh9BvddFuONs0pMze2rF3bGZCU7ChvRlO/+vFiVU3Xt2hF0+eZYGHfIc8TP4N4lgU4DBufsg+k1fIWA=
X-Gm-Message-State: AOJu0Yz/ND4ttQ3BS9j13+bdDVvns9EYTzN3qzg7pKGNxGoaiTuCcNPZ
	GMFiiCmnkGHk2r0C1jPUTCy5/4fXnz9IpmNorP+2G3nxxDprjxsbobGzTyb+85M=
X-Google-Smtp-Source: AGHT+IE7PaSe32aZfYBX0cdNMhJ4wVwuGlMe3nsz7btnGwIzOieGMfx/IFN8NIDZPg1JqImvfE0Qbw==
X-Received: by 2002:a17:906:37d8:b0:a45:7936:d09e with SMTP id o24-20020a17090637d800b00a457936d09emr781412ejc.19.1709805222544;
        Thu, 07 Mar 2024 01:53:42 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id hj12-20020a170906874c00b00a456a97faaesm3891813ejb.86.2024.03.07.01.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 01:53:42 -0800 (PST)
Message-ID: <a3b3ea89-8f4c-4deb-befb-d5219584901e@linaro.org>
Date: Thu, 7 Mar 2024 10:53:40 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: serial: renesas,scif: Validate
 'interrupts' and 'interrupt-names'
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240306231007.13622-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240306231007.13622-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240306231007.13622-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2024 00:10, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> This commit adds support to validate the 'interrupts' and 'interrupt-names'
> properties for every supported SoC. This ensures proper handling and
> configuration of interrupt-related properties across supported platforms.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/serial/renesas,scif.yaml         | 117 +++++++++++++-----
>  1 file changed, 85 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> index af72c3420453..1a5f4568ae4f 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -82,38 +82,6 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  interrupts:

Properties should be defined in top-level block with widest constraints
(min/maxItems). Your if:then: narrows them per each variant.

> -    oneOf:
> -      - items:
> -          - description: A combined interrupt
> -      - items:
> -          - description: Error interrupt
> -          - description: Receive buffer full interrupt
> -          - description: Transmit buffer empty interrupt
> -          - description: Break interrupt
> -      - items:
> -          - description: Error interrupt
> -          - description: Receive buffer full interrupt
> -          - description: Transmit buffer empty interrupt
> -          - description: Break interrupt
> -          - description: Data Ready interrupt
> -          - description: Transmit End interrupt
> -
> -  interrupt-names:
> -    oneOf:
> -      - items:
> -          - const: eri
> -          - const: rxi
> -          - const: txi
> -          - const: bri
> -      - items:
> -          - const: eri
> -          - const: rxi
> -          - const: txi
> -          - const: bri
> -          - const: dri
> -          - const: tei

This probably could be:

        minItems: 4
        items:
          - const: eri
          - const: rxi
          - const: txi
          - const: bri
          - const: dri
          - const: tei

> -
>    clocks:
>      minItems: 1
>      maxItems: 4
> @@ -173,6 +141,91 @@ allOf:
>        required:
>          - resets
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,scif-r8a7742
> +              - renesas,scif-r8a7743
> +              - renesas,scif-r8a7744
> +              - renesas,scif-r8a7745
> +              - renesas,scif-r8a77470
> +              - renesas,scif-r8a774a1
> +              - renesas,scif-r8a774b1
> +              - renesas,scif-r8a774c0
> +              - renesas,scif-r8a774e1
> +              - renesas,scif-r8a7778
> +              - renesas,scif-r8a7779
> +              - renesas,scif-r8a7790
> +              - renesas,scif-r8a7791
> +              - renesas,scif-r8a7792
> +              - renesas,scif-r8a7793
> +              - renesas,scif-r8a7794
> +              - renesas,scif-r8a7795
> +              - renesas,scif-r8a7796
> +              - renesas,scif-r8a77961
> +              - renesas,scif-r8a77965
> +              - renesas,scif-r8a77970
> +              - renesas,scif-r8a77980
> +              - renesas,scif-r8a77990
> +              - renesas,scif-r8a77995
> +              - renesas,scif-r8a779a0
> +              - renesas,scif-r8a779f0
> +              - renesas,scif-r8a779g0

There is no way compatibility strings express it?


Best regards,
Krzysztof


