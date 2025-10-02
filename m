Return-Path: <linux-renesas-soc+bounces-22577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9D9BB3DEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 14:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEB9916A6D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 12:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6533101AB;
	Thu,  2 Oct 2025 12:22:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8236330FC26
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759407748; cv=none; b=VtVkbMDX7jMFa+NTwnWEL+JujZuPrtkubJumwK1wyfVJjK6Bk+EKyLpVhX+Em5ZPSrspiHh2x54ozZUahm6t9l+wmpke++EYXYQfYpogUpbC4r6kU/W45tv/PAvUcU5cjL4Xn0wY3/K+6mbmuYuwMb0CD/NAfg+69X0FksPbQRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759407748; c=relaxed/simple;
	bh=ZCLWknI3Oohh8zMZTDOwt7rdXpb2pywh5AbVWLK0g3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrakRhNdzU8ZqgjnSu/Qr0K8Mv3K0YVrQVTNmx6pvPyOfImkesuXcITstyQoeTMUvdhvzQ6iKg0W9v1JJ4xFH+ZKnmLYi8Q0dk4vOvdD/nZz5KIpknnV1Tcf04/8obLb03qahgq5zXsH3RovF4QFSJKZ+YV7ilT+TEbZA7yjFmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so2098557a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759407741; x=1760012541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pY10gBxAlncLft1B4e8e0H+E3DPfeVQijK8Ci3Ekn1c=;
        b=PnJC6zvBnXwMdwQ5a8mAnD+z+OOhoWQOR+7Rk2jQUEHnwiLKJ4EVY447uRak/79bEU
         HmimjlbjQQ+xy1ph0jLKo/+xUQiOvgO7G5CT8HgrT/FuNPNmnecrGrLVFsYtluigUrce
         HAnn6LmYkYMsx7SbOeynmdRfikk7V11uEXzVNR2edrDohsBDtoRhQ4P/kdEmcbfMlcNA
         oRK5bsw+PO9+3/FnwIdkv7oa1xtBWMSOWFfC7xOxama9mr/09M3njU5sSdRITvgls9Al
         p1/F67kZtoysUX6ZoQ/glNcljPAwOGv+47kc7Va6BfrK0qoeMoTXtldiIGHkLYZK/gvQ
         npWg==
X-Forwarded-Encrypted: i=1; AJvYcCVj0Rb0Kv2pjbjEWMVvUVpyB6398D3kU6SNlbRCCFPyk9XA9T/sgyd/lEMJ0Y8i9U16UqCD9hk3LmAJHcVB+ZXe1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwnaMbfIxA6cAL99Ofjrq+590ohHcQqrhqOwjvEMOYFX8Xlpor
	kkZ8MW39M5LZx/UO/u9FoW1vHOODrdHSEAwO0bVwTdo4oJr5ke76JWJ1UOUyzpGcOyc=
X-Gm-Gg: ASbGnctWecl0eYt1wPnLGk9wXkZ2LikWYAeq4i4JWC4GI0rv0pYy1H6R4AiWrgYW8id
	6VsIRQi467BeaQyH9UFcHQteXnENbTYtDR+mpq7/BwAcTvh7El/zBh/fkHR+DiVzJ4iE4TJWbM9
	GRP2b2ZUUslsYcy3lJFI4rTmuVsu3sPnCDjuygamN8osTyxIuaPzN7M/E7G+pL1WNsf5KnZ5aiB
	8vDwstCiP7wGiSe0BacujbZIbFKsVQJ1Zsse6aPHDyGjYHQd3EGMRERw+wVPzki4tO+yCAclKRu
	PEemTNIFH9zqpr/smAqKHtnHQt1446asxTYO8OIKSNfGIZD2Ipk3UOap67R00/TRYCpyqoFeozB
	aiyHSZPF70Z1RWK441b1kpBwa27Qd5RVDMVTgxvrKucXs/AsZPE888aokVbciH8J1aMu1IbHRxR
	ZvKE7dYoirJSaFRSowABU=
X-Google-Smtp-Source: AGHT+IETas6ME6MwerX5QO8iDylEy79w9ylgcEed1y9ScDC04iW7SvWJy/e2nZBDvFnB+uO/8I/clg==
X-Received: by 2002:a17:907:3e8e:b0:b2b:59b5:ae38 with SMTP id a640c23a62f3a-b46e603734dmr953553766b.40.1759407740810;
        Thu, 02 Oct 2025 05:22:20 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa637sm196229066b.12.2025.10.02.05.22.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:22:15 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so2098138a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:22:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwu68mtOq8sxKf/fNgxy7KO1fg2QQa64mS8V/BZzJfyasBjsVjYjkREuVvOE+bMJZrlbpkv44rLjAvibBMULrQ0g==@vger.kernel.org
X-Received: by 2002:a05:6402:2748:b0:634:a32f:abbc with SMTP id
 4fb4d7f45d1cf-63678c7876cmr7743508a12.25.1759407734935; Thu, 02 Oct 2025
 05:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001122326.4024391-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251001122326.4024391-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251001122326.4024391-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:22:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOWMvyGLz8HGEvosrGY070e2Xtm+dFTcd0EDTq+55nmg@mail.gmail.com>
X-Gm-Features: AS18NWABtGa2D2TwMrIq8k3cqO5ssX-ZOaNtMz3MgD0zeopDW4rX6Xc3PgPqoFQ
Message-ID: <CAMuHMdWOWMvyGLz8HGEvosrGY070e2Xtm+dFTcd0EDTq+55nmg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Wed, 1 Oct 2025 at 14:24, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Document the A/D 12-Bit successive approximation converters found in the
> Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> RZ/T2H has two ADCs with 4 channels and one with 6.
> RZ/N2H has two ADCs with 4 channels and one with 15.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/T2H / RZ/N2H ADC12
> +
> +maintainers:
> +  - Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> +
> +description: |
> +  A/D Converter block is a successive approximation analog-to-digital converter
> +  with a 12-bit accuracy. Up to 16 analog input channels can be selected.
> +  Conversions can be performed in single or continuous mode. Result of the ADC
> +  is stored in a 16-bit data register corresponding to each channel.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a09g077-adc # RZ/T2H
> +      - renesas,r9a09g087-adc # RZ/N2H

Given the number of channels is now handled completely through the
number of subnodes, I wonder if this should be changed to:

    oneOf:
      - items:
          - const: renesas,r9a09g087-adc # RZ/N2H
          - const: renesas,r9a09g077-adc # RZ/T2H
      - items:
          - const: renesas,r9a09g077-adc # RZ/T2H

...

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-adc
> +    then:
> +      patternProperties:
> +        "^channel@[6-9a-f]$": false
> +        "^channel@[0-5]$":
> +          properties:
> +            reg:
> +              maximum: 5
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g087-adc
> +    then:
> +      patternProperties:
> +        "^channel@[f]$": false
> +        "^channel@[0-9a-e]$":
> +          properties:
> +            reg:
> +              maximum: 14

... and the SoC-specific restrictions above dropped?
The number of channels is instance-specific anyway.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

