Return-Path: <linux-renesas-soc+bounces-12653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625CA2096E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A91F1889DAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6114C19E965;
	Tue, 28 Jan 2025 11:15:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402E71A08A8;
	Tue, 28 Jan 2025 11:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062953; cv=none; b=Utw1eqRiRvqV5Y7H5XlSr9NE9U9+5wsSDVkw07Axgne2ZSCzCWvA7yBb5D2n00gqCnH8Mxtr462zBC/Fg8gjJsqrP1dKCd4EcDZhCvLqbPbxKEMDu5yLxtaCZDbCFamdpHbK3kphxBvKcJZaJw7IaB+Qc00xA0BA/8vkgS3xp+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062953; c=relaxed/simple;
	bh=NRdyjGn5OV3R+uS+xfChrgOn4Bdk0Thfo+rxOyesUhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiWHTUa264brhNMFjTAELIai/S8wxOV4aTDtT+PSs0YW4gGtlM4IdjORm4d/GxX6Te2WZJKR+T1CV1SwKjIBU2IXhzjpA5z/pyEvmYsEq9A3hKi7i1N+z8gL5NIPzIrkwSSCPsIGo8+KzFpYSv3Sf28zo0OycmcMLxy9OCRZ35A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85bb264993cso1080993241.1;
        Tue, 28 Jan 2025 03:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062948; x=1738667748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xyjwP3xl1Zs7RTYUCCxwK/U/H1ETloDVf7n0x723hE=;
        b=Yw3cIEBcc6wcIdB/gQf0UNzlDtjwnnV7seTV0ASyyENfJA6pmIWRpfraGehehDpY7U
         5TocVfpDGQ8WKF2YgLF9yPA9bpzNZ2mtZ5Q97REoG9nShuQKvogn1bsGXgidjMA0eF6p
         E9TVoXwwOX9JxB8/8npvzY/FRxNk5cv8pg0WeTc7zsU7M13c7ZdVziQzhjBrpMRBgb8o
         uDBnQvtGMc1sLi3nEN7W0+zUP45Vz/sqepRx4EQoAWOM4cJ4airfoOE0aRa77tSeRgHL
         HhaVNtBo9o94DNkNW9qfTrAV1P1/IuNYvyf31/seWOkDjdJB8Q3Usn0Nz/Q7iKvidjfw
         9Lqg==
X-Forwarded-Encrypted: i=1; AJvYcCVFSarm68JNCdIeTpWLZTt2MEDjCCjwAQ+LGMTJi3fO3eoIBH19LeDqy8hGJU/Ha8Kcc9Hd3woJshQxIWQnRfhVNiA=@vger.kernel.org, AJvYcCVZXdBFA8HJb6gQL6h0PGLBMjZqJj8kEa2xX/Lp4YkWpePEtR2De8oPmj8SAGBOpYWSHTaVY0hCBCtw@vger.kernel.org, AJvYcCWHCNf/K1v21ggIyNRIbxH6BLo9VRBwI6J4UnpFqZnDvi+jkZWUpHTC0kkM/jtnUWhDUKEiGJfbtqqj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp6lPOSPGkn4mIqzURxdXGIboe7+6MNXxAbA0kxgR1QkrAb3VR
	BqomEed2WqpLmvQEFAZij1A21I9F4GmzzdgdPUHc57wA5+6TPd5WPMEVBKKh
X-Gm-Gg: ASbGnctDy1XqeRVSiQIMuAuIyMsn6WK+Tn+kAwkPBgnAuuOP0sAqcniz54U4KHuhRV8
	lzuHPz/WRlTaRdhOihJ9OzL9TkVhIecqCzFyMhgGy+cCAiLGnyEtzUKnMGz082DyFv6I7vqhMzn
	isyHb93ii2aooKfGFPM6eRAFioiT4t0IwGOWkbt/9sxlIWruowqk+aLKriRa5YW05NeBEv3oigd
	U+vz1ZfNT2UyJ6Kl8X+FaJ5h5O1oD6KTXXLp8o2Ib+6gS814GysGHBXbd0Ypu3oXpCT9+8dm3PT
	08lHR2QSXGled11tovDl6Yoy7rNpSkmvfVFFgNjXvYOcONMPyaM8Ng==
X-Google-Smtp-Source: AGHT+IFVDrbAiVh2H/oAeqD5STO9qftZ+S0I3p6PL7+zimEvEgZSgh+EO6+8VYZtMIQNEfXDdDu4iw==
X-Received: by 2002:a05:6102:38c9:b0:4b2:5d16:f75 with SMTP id ada2fe7eead31-4b690b8b049mr35290987137.4.1738062948410;
        Tue, 28 Jan 2025 03:15:48 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b709996756sm2104743137.26.2025.01.28.03.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:15:47 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85bb264993cso1080978241.1;
        Tue, 28 Jan 2025 03:15:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/7csWEKBN+WUfPhfeuvgqxouT2enDbrYTuaAjqzgRbV4DW/T44xswuwLCqYowTKHFycn7jkEvmpV6@vger.kernel.org, AJvYcCV3lDE7xgacUI703vfIkJG89kylJzs70DyQ8jhUr1Emu9HViMXWIhLdarBuE159EpkiRtcRtSAKYasi@vger.kernel.org, AJvYcCXdNEEYBnh+xWjWFmlMu9/TG/4LxeAYDNRyKrQtO6kZRwI/QdAaf+ugJhSaUbXLLgPoU8Fzt2Hz7UVtIfEBWbuL1Cw=@vger.kernel.org
X-Received: by 2002:a05:6102:2923:b0:4b1:3409:5dcd with SMTP id
 ada2fe7eead31-4b690cd0f26mr35755940137.20.1738062947479; Tue, 28 Jan 2025
 03:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com> <20250126134616.37334-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126134616.37334-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 12:15:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0REPzpb0+ROuUspwfn4nSELk=XdwrKfhSEGzQ2mwi6g@mail.gmail.com>
X-Gm-Features: AWEUYZm-rVyOHcV130JIUe13v-giN2hVh0IRF7UPrSDouKMY5FZHGNA4fY7Ta6Y
Message-ID: <CAMuHMdX0REPzpb0+ROuUspwfn4nSELk=XdwrKfhSEGzQ2mwi6g@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
> of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
> use SD_STATUS register to control voltage and power enable (internal
> regulator).
>
> For SD1 and SD2 channel we can either use gpio regulator or internal
> regulator (using SD_STATUS register) for voltage switching.
> Document RZ/G3E SDHI IP support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -68,6 +68,9 @@ properties:
>                - renesas,sdhi-r9a08g045 # RZ/G3S
>                - renesas,sdhi-r9a09g011 # RZ/V2M
>            - const: renesas,rzg2l-sdhi
> +      - items:
> +          - const: renesas,sdhi-r9a09g047 # RZ/G3E
> +          - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)

OK... but...

>
>    reg:
>      maxItems: 1
> @@ -124,6 +127,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - renesas,sdhi-r9a09g047
>                - renesas,sdhi-r9a09g057
>                - renesas,rzg2l-sdhi
>      then:
> @@ -211,6 +215,22 @@ allOf:
>          sectioned off to be run by a separate second clock source to allow
>          the main core clock to be turned off to save power.
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-r9a09g047
> +    then:
> +      properties:
> +        vqmmc-regulator:
> +          type: object
> +          description: VQMMC SD regulator
> +          $ref: /schemas/regulator/regulator.yaml#
> +          unevaluatedProperties: false
> +
> +      required:
> +        - vqmmc-regulator
> +
>  required:
>    - compatible
>    - reg

Given RZ/V2H can use the internal regulator control, too, I think it
can be optional on both.  Then renesas,sdhi-r9a09g047 can just use
renesas,sdhi-r9a09g057 as a fallback compatible.

Note for the casual reader: as the related pins can be used as GPIOs
on all RZ/V2H SD channels, the initial idea to add support for the
internal regulator control was dropped, and replaced by the simpler
solution of using a gpio-regulator.  Unfortunately that simple option
is not available for SD0 on RZ/G3E.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

