Return-Path: <linux-renesas-soc+bounces-20237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 106ADB20A47
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 166411891246
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 13:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BEF2D94A2;
	Mon, 11 Aug 2025 13:34:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19002DE6E4;
	Mon, 11 Aug 2025 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754919248; cv=none; b=sTFhrhoes2dyxzuYapK2t8WrOieqfUPYb1uRD5LoIY5KR5abWSt7oOacrH8nfTURaGsSnhHNKisXxr6IJcPJpk9hl1rH5CWkBR6hx5wQNGhc2MQZPtAnO3HeC8PULuQmsU0ETv+UWnutJdafJcek0lYt4PYw7/tije4JP0bDC7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754919248; c=relaxed/simple;
	bh=asXgn3f7q2ix6N10I9+1Wdp/MSmoQq/6YkQqyvGRNS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOrENoThlbbTWbSlH2B4qTn/AUw4vUhvl8P3GXNo+0icUBSOO1qihNswSVLx3PFqeMb4KLCIygq8VnClwIdLSEg06EA5IdXaLIDgaCpWNcdzc0L0SZuKeHJanoeiZoS4sFio9uput+X13nxbolySIDdINgRNMAlAhBe8040a9Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-500006b3efdso4077232137.1;
        Mon, 11 Aug 2025 06:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754919244; x=1755524044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjQkspi4MLubyyjI0/WFDwsqdNcqXCarE9lDU/gnxqA=;
        b=wfzicitlPIwlyuIYf0PZqvG6BhSV3u0YTaznsYkkBemKqUFfFhNKhsrOIjLPx3LgYw
         o7n8QYu/+51S6MQjZ+2CnxUpVxFyeJJWf+ehDWIKvSE1t0Dv5lMVzhUnxemcjLDbQ5rT
         uoHIzoAnIwL2XrtCxO4TkXCx6BKNmBQhz7NJviHTF2PQo2pIUrwAT9d7JdeTsh/WhzL+
         f76QwdvULU2p37W5RTv97OFzsOW1/c1xT6OFvMFEQhJftyTI18XxF8Dxe9SckNG5u6eg
         vxUFX05HsbNlm8ovsLwWtGpZMS5UKGNWuUi4w4lWBvg6MiW0DTdCuNm4IuDwzTK9vRKh
         32IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp8m9/15ijmAr1dn2ilb8T78QxnlTMDii0kcqDMB/ZkQ21DaWI3IouHFZK167rgOWJXoCCLG78NStmF+cT@vger.kernel.org, AJvYcCWs36Yk3ej4OPRceGvpoimCKK2SmJxaqxoui3LD0FGqh/PvT618qStZwzCUxRXBG6vEDIQpG62s7zSg@vger.kernel.org, AJvYcCX/0jyoBn6zolwdOO2QtjRqBp4aRk3LgE/m3ZQcHwCBy3pm3uFi3JMVsQNs7ZRr96bSk6/bH+bxteukNVMy26Pdztc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7s+vLKG6GnWQfRmvQOFVZEEz0nXff592O9cmvOkJAHhpscYHZ
	wjG2SFpnaadUBoiU/OYb5tK8e07snfm613iqNFjkIHHRlJf8ZZW6AY4jdrzbwGg/
X-Gm-Gg: ASbGncu5yBbvkFcK/poF9wcBjXzsOuQlpZJOiFs7Wqyal3irDch28O7hneoepa8g/AL
	bNbanNqC8MBDT9B5PfhG0wisiB40LMexE+JsZAyrUuKuZ/KytcDDUVBZcz3gXcw4/OU2yE0CW57
	at3kyYfyOCA1CKX2cZPAwjWLDhX0OPH0+kdyeGHfyLoTMLJS149DxMDYMN56AlgtfCTlE2yHuGL
	AHGlzMFYgjwc4NtnhxQhlkYoN2OKYa5+yLiU1XVYlggwkhKL5iWHsgy5W/94iTk8V114d/aMlbx
	C5RfCJHPABG3kATrp+Y+ONJJ0gGvW4ds6p+R3Hx8cksf+XRRgXmwvqcqM6nZd1eShzGMCrhfrMS
	1tDbf42ueXT/NMR8QEN8//f5cn7nusj/UYL6GIkKMO9UBjYp1zGbqo01JkFYf
X-Google-Smtp-Source: AGHT+IFQ3+nZAnLa7h4sNIKyQ4ihQAZVPwiSZAFySeIYGNo2MFXJ6XPL9h4b9UViE5QOEOy/naB8Ew==
X-Received: by 2002:a67:e7c8:0:b0:4fb:fa84:2e64 with SMTP id ada2fe7eead31-5060eed12ffmr4970402137.14.1754919244461;
        Mon, 11 Aug 2025 06:34:04 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e0268c86dsm1850713241.1.2025.08.11.06.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 06:34:04 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4fc0716d942so3064638137.3;
        Mon, 11 Aug 2025 06:34:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1uhV5+VXUzs/oWBoI1E7UzUh9EKFeXeUVZr/uo566xVPZfFJXJCn4+5t7yr4Sr13UR6OX2ezQaQ1/HoQg@vger.kernel.org, AJvYcCXffNY6H0OVaHJ1Mvi8FVSyG8Gu9XNLUWeWYRl/COEGG3JkADBQ/Pj4Sb048z1DggizxY6bup2QffvwbaDgn0Azzug=@vger.kernel.org, AJvYcCXo7/jfQUm701PtUSTvuY7qWRP4L8YIR0g6BrYxrmjtGf7Zi12RCTDGgPDA0cWghuW2nECI0d9ireey@vger.kernel.org
X-Received: by 2002:a05:6102:5109:b0:4fc:1631:cdd1 with SMTP id
 ada2fe7eead31-5060eed10aamr4511549137.15.1754919243985; Mon, 11 Aug 2025
 06:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250808215209.3692744-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250808215209.3692744-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 15:33:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWo=hYPWPrweoYn5rFC50aV5EV1xqwFHmLp27GRjEADw@mail.gmail.com>
X-Gm-Features: Ac12FXyaruwz2KkVarRF9RjlDkdsU830kR7SxQSLDrclAsRoH40uxlU_2WKaBv8
Message-ID: <CAMuHMdUWo=hYPWPrweoYn5rFC50aV5EV1xqwFHmLp27GRjEADw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: renesas,usb2-phy: Add RZ/T2H and
 RZ/N2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 8 Aug 2025 at 23:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the USB2 PHY controller for the Renesas RZ/T2H (r9a09g077) and
> RZ/N2H (r9a09g087) SoCs. These SoCs share the same PHY block, which is
> similar to the one on RZ/G2L but differs in clocks, resets, and register
> bits. To account for these differences, a new compatible string
> `renesas,usb2-phy-r9a09g077` is introduced.
>
> The RZ/N2H SoC uses the same PHY as RZ/T2H, so it reuses the RZ/T2H
> compatible string as a fallback.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml

> @@ -120,6 +126,17 @@ allOf:
>        required:
>          - resets
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,usb2-phy-r9a09g077
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        resets: false

By the time this hits upstream, you will probably have reset support
for RZ/T2H and RZ/N2H, so you just add renesas,usb2-phy-r9a09g077
to the conditional section above?

> +
>  additionalProperties: false
>
>  examples:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

