Return-Path: <linux-renesas-soc+bounces-12850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E25A2855F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 09:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6EEE168414
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 08:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B958921D5A8;
	Wed,  5 Feb 2025 08:17:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED81229B2E;
	Wed,  5 Feb 2025 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743428; cv=none; b=E19eBQut7b7SXs7SYPqqq+4bZ5laAnyglD4YOXsVQoXvEHJ3wh++8J71wNWKcsfBmTavQSRX397SrH+2GaTGjoZouC55ia4BeYjjYkkIv4r3S7m6kfVw+GIonNs6VEAqh22XDN/TQS/qgbaUMINKW5R0RaY+0XWgWIcHJ0F3S34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743428; c=relaxed/simple;
	bh=MOt/1h5n8QTWGRgnXYLnVhQU1pp96cv+p2s1lwEVnVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHrCr2sB+oTkX+I02edcCjuFxfHBZTIZULQneQcN5YoRBupJx0gdZxnYaJ+67KhEIUlfc3UTJcq/Ri7wG9dxpyIlCjrSLoVy61fflbIcm4Hg3mcqD4cNRqX6YQUwE5TF2bs6CI/W3B8jBYUuq8mh1gg2Bc3WUgpHtkaHdJYWaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-866d778e797so1055398241.2;
        Wed, 05 Feb 2025 00:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738743425; x=1739348225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+GGQxRdDlKF2U6aQCZ4kV0Y9j2k/LiW1X1AM4fmKAs=;
        b=KnVfDhCiAV4XotqRKE1EnUEqhm6dm4JZkGbUHyguGd29HxCZ9+Pe6egQcYxBplCLIi
         mZDzjgojT8qGsbukqeen0irDf7J+tJoqRvB2aFDkWOXJFlK9fAwWqqu7IJepHwep7zHW
         x8XsW0to9N+HTauizf4qRJBZRGjr2TE/7c1Mh0WQ+CZmOg2TBU9WxlfoYXoLzzD+sppL
         vn/cosp4uyZ7xHChnYJuY7dZ1E8jnw06NP4WHnGwjFu8+8FIg6Af3Y3Ka7s4uqjTgX6K
         lhxUopy3rVBzdJk3q+KyDBOIfWV/W05L8z0m4s4V8Eqs5/3aSFYEI5oKl8l1rsKFG83A
         N0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxpYfA4hMLlYAYcKXHCcJnDmCv0LYekLOYkAwS2tqpyPuiNFgGg0OIuudun4MHhkK8+aaCNsXeZfXp@vger.kernel.org, AJvYcCWzZ06RosYpidaRg86sltTe88gnz+yiGZxqFVN5Y2HW4LcErRkla+s+fnjHmzIsVjYI+n9ivViN0piQLCvPvIo2paw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzp3AVWGO7s0zoN9bbdchoiYJBhem4Ji+jGLpHCSFjdMDt13ob
	xSeXF+EcLiVxN/macXiahmvVmTMeJStTxhUhD4GFoB7exIIQjosN21zhVNMw
X-Gm-Gg: ASbGnctZ/waRvvaR8QTPZK8SSqcbWAg1rsDkZLPpPcKsjXWzZ1IwfC7Ee48SnqOEwiI
	Gg+KwfTwOPGGcAzYH6+R/d+s+8TETI/vD+py9dZHCIMM1nu+SBLlqlYQZo3gE7gOpdPiD3tp8wf
	aL0W+3bRJChoF8CsUrVKpiNo6FSdVWjp3CsEIL2VcZZQGQZd9ZZhVsuFIHb9JG9nEaEkyPztGtA
	YowmIRIg5Mkg6rfLlj9Zq9CK52Lo0YI7U3NK9Y2Lgi49TKPPZIYsSNsEv/3bTGNJ4aonvlACK1m
	+MSxmON7R+kH+7FmcWmcfJLzu8aJzb8sOYg80y9WsNsC27LmIKIWpA==
X-Google-Smtp-Source: AGHT+IHpHdXSaQTqMVygl8QtVQ0pbzoPnQR7at3hn0PcLFLr/q/JbJGdUnA1Gwb3VDnAW5t5mTvrLg==
X-Received: by 2002:a05:6102:b10:b0:4b1:1b67:6a5c with SMTP id ada2fe7eead31-4ba47abab86mr1432808137.18.1738743425445;
        Wed, 05 Feb 2025 00:17:05 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941f309dsm2418490241.32.2025.02.05.00.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 00:17:05 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-866d97710faso895491241.3;
        Wed, 05 Feb 2025 00:17:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBwbCnd8gk266F4j8UmbKcU39Alg8B4UUm1tzksqJ/sYw3pk7/yL5WeINPZMkZ6SmvhtDGOF4MM4KbC+3ZsBasOog=@vger.kernel.org, AJvYcCWBhyfJvxYuxK7qZtY97NfqRKr9/o4RtVq/9mWi1lRoeN0TnShsm3W3oEceVXorgseA7qcb3vYjcws2@vger.kernel.org
X-Received: by 2002:a05:6102:2ac8:b0:4af:56a8:737c with SMTP id
 ada2fe7eead31-4ba479c50camr1238470137.12.1738743424957; Wed, 05 Feb 2025
 00:17:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com> <20250131112429.119882-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131112429.119882-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Feb 2025 09:16:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnEtoWU5_DTmN6WsftPb1pButHfCzpXEjK1w5OUKzsdQ@mail.gmail.com>
X-Gm-Features: AWEUYZmEd-oRL5NHJoJ1mdYifR3Jp3QiGAYefJefi0121PhZ99-tfT-tE4WNyMM
Message-ID: <CAMuHMdVnEtoWU5_DTmN6WsftPb1pButHfCzpXEjK1w5OUKzsdQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 31 Jan 2025 at 12:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI0-SDHI2 nodes to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Status of internal regulator is disabled in the SoC .dtsi. Override
>    the status in the board DTS when needed.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -410,6 +410,66 @@ gic: interrupt-controller@14900000 {
>                         interrupt-controller;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>                 };
> +
> +               sdhi0: mmc@15c00000  {
> +                       compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> +                       reg = <0x0 0x15c00000 0 0x10000>;
> +                       interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
> +                                <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
> +                       clock-names = "core", "clkh", "cd", "aclk";
> +                       resets = <&cpg 0xa7>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       vqmmc_sdhi0: vqmmc-regulator {

sdhi0_vqmmc? (same for the others)

> +                               regulator-name = "SDHI0-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               status = "disabled";
> +                       };
> +               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

