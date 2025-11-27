Return-Path: <linux-renesas-soc+bounces-25268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B02CAC8E658
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 026D84E7925
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32C129A1;
	Thu, 27 Nov 2025 13:16:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220918859B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764249378; cv=none; b=DjIQEI3FjgGIFnr5oqA66IMiT/ZboAE2k9gbRA/UnBn3y5cNPAs2TRKA9flrxkGxp4+Jng+Kt9lFKq+fSkEe1ce1KtIkXfB+M5DbwyiFhfGzKJFasmdpUXFr0H0R+IZLOySGJhX2olqAWnZLTQiURBREi27+T4YQ+HqcNfDEhtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764249378; c=relaxed/simple;
	bh=i0+NI2Bud3BlBikNUo49+8Zo8rRsxq05UxY0PW6sYJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mijM8RdAIoeS6QXfvbRAWrKCLWEKYWrKVSi/M0XP68bsiZolzk0bBbMkmYHiRWMV7uKrxj96Lz0S7UK760Gpegsf4SXbDB7yDaA5Aq57CbyIqxtJ5WKgsWRVE03RivmuJoAq5gmqpY6oAWzz1mUvq+FwWicYAQ/2ir2npORKsAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbd1421182so641908137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 05:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764249376; x=1764854176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/la0b8NwFw52ANl4NaAU+Zs/xhH8L5L8IfhP5J6VHSo=;
        b=BvLdCDOQBLH0gPzOMZ1BSQpFn2FtGMjVDWfOn0pUokRuAkrDDjkzO41sUDz3e0PLeX
         HktMXXuwWxaR/HF43uZU8SbWzwrkSlgdABP4JIP27zuu39CwsotKpaQvbqV+B8TxITR5
         y3VoOuTpEPhxvELzG1VLZER1HR/HmgPNiIMD1lLkaWXpwcKBIkhg/jjrJpoLzVSC3KK9
         GHhkDuxl6c5HTo/OPPzMJJRAwsB1bh9vF6dYzO4dQdmkNqDYAN/EajpURn8QhmjhW5wK
         yE7fhsMfjdQPFOn81If3upQYpUpVOtFWNkVPiTIV9U6uDPrktKkIg/e7KIccYrLZDoog
         cMXw==
X-Forwarded-Encrypted: i=1; AJvYcCV6iB2Tuazrxn+rYZ7wVsnubMhUqtGkwocYbC+8mqXzcE37JzxjOLVKqZm39l01JTfJIFZQ+0vcl7Y3ggbscJoDaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz42mSjm4DgVmnWaK8j/nF6j3CfYWoz3tTcPDpxJl4qLvUa2oTb
	CrcPqFO2NEIe6cAENDbAyD/aIwx1ktgHaS73EMiurv7A1vnsgr/SjcEPPh8WBFyG
X-Gm-Gg: ASbGncuFV57jYFZougMxFF3ZO+jV4dwb09P4bcHP9T9xNxmY0G8ztDrRiFgad2LAiK/
	x/FT1U0E5o4titIViMoi1Ilp4Hy/7J/EfV2f+2XB2lNvolI0besGdbTyvIoDD09MjFt26XxgpsY
	suEk2hNOzgtbD4W9zArn+ZbKl9eDdkcYjCCGKWbvGkTDBwR6hPic5PVeXAr3j0ZzHl3hG+ltNCt
	1tfhmIx3eqnKCjZohg/WJwDDno9FFv/FOqlFXMBZGU+GkowH2b5hYU/xkB0dkjWRUtmCJ7gCXQy
	dxxs7CPJAU7j2D2MVYMS5wM2ADfvTGotICCg8WpXl3vbOvGJslQMkceXYeWFwrr8fE6GLhU4v6Z
	OSOjw4tp0pKOBod+MHrQPRrzrJlr8OBx93Rr3IRwVBS8aoqDvM743QLCmzt/s8aCxBiFHdnDdeq
	tq/TLCY8Zr+fY8UaG4d6O2xc4r1uvcuUjW35NZdW/4Lp8XU6p5
X-Google-Smtp-Source: AGHT+IE5cZ9uB0rnNMZ0u73sfcAVuyDru/p96F7VQZ9r2720+sMxQ0waAk8SeBiLYjQ8MmNWwVh64w==
X-Received: by 2002:a05:6102:32ca:b0:5db:9ab3:4291 with SMTP id ada2fe7eead31-5e2243dca66mr4398017137.33.1764249375602;
        Thu, 27 Nov 2025 05:16:15 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-886524ec1aasm9554086d6.22.2025.11.27.05.16.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:16:13 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5e243d73cebso547959137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 05:16:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8yv3OQ7y/SkmJFyYa7PAOCBRQDIHn2CCQS7uMYtJGUwiwvj1mfgSpV5onlaq0qsWKrjazOzXelEwkNuDBDUfoCA==@vger.kernel.org
X-Received: by 2002:a05:6102:5e93:b0:5db:ceaa:1dbf with SMTP id
 ada2fe7eead31-5e224417a9bmr4411857137.41.1764249373279; Thu, 27 Nov 2025
 05:16:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251121113553.2955854-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251121113553.2955854-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 14:16:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtxLCRHdhj5=iOHyDJFQUfALYj8MXGLA+bT=YSvWtbbQ@mail.gmail.com>
X-Gm-Features: AWmQ_blYrSklJ3vMkio_CRlMnvD_t9kp1obUj6YpfU6Kqg0TYQcNKUPeqWm26t4
Message-ID: <CAMuHMdVtxLCRHdhj5=iOHyDJFQUfALYj8MXGLA+bT=YSvWtbbQ@mail.gmail.com>
Subject: Re: [PATCH net-next 04/11] dt-bindings: net: dsa: renesas,rzn1-a5psw:
 Add RZ/T2H and RZ/N2H ETHSW support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar, Cl=C3=A9ment,

On Fri, 21 Nov 2025 at 12:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Extend the A5PSW DSA binding to cover the ETHSW variant used on newer
> Renesas RZ/T2H and RZ/N2H SoCs. ETHSW is derived from the A5PSW switch
> found on RZ/N1 but differs in register layout, clocking and interrupt
> topology, and exposes four ports in total (including the CPU/management
> port) instead of five.
>
> Update the schema to describe these differences by adding dedicated
> compatible strings for RZ/T2H and RZ/N2H, tightening requirements on
> clocks, resets and interrupts, and documenting the expanded 24-interrupt
> set used by ETHSW for timestamping and timer functions. Conditional
> validation ensures that RZ/T2H/RZ/N2H instances provide the correct
> resources while keeping the original A5PSW constraints intact.
>
> Use the RZ/T2H compatible string as the fallback for RZ/N2H, reflecting
> that both SoCs integrate the same ETHSW IP.
>
> Add myself as a co-maintainer of the binding to support ongoing work on
> the ETHSW family across RZ/T2H and RZ/N2H devices.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml

> @@ -73,14 +145,48 @@ properties:
>                phandle pointing to a PCS sub-node compatible with
>                renesas,rzn1-miic.yaml#
>
> -unevaluatedProperties: false
> -
>  required:
>    - compatible
>    - reg
>    - clocks
>    - clock-names
>    - power-domains
> +  - interrupts
> +  - interrupt-names

FTR, this causes warning for RZ/N1:

    arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: switch@44050000
(renesas,r9a06g032-a5psw): 'oneOf' conditional failed, one must be
fixed:
            'interrupts' is a required property
            'interrupts-extended' is a required property
            from schema $id:
http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml  DTC
arch/arm/boot/dts/renesas/r8a7740-armadillo800eva-con15-quad-7seg-red.dtbo

    arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: switch@44050000
(renesas,r9a06g032-a5psw): 'interrupt-names' is a required property
            from schema $id:
http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml

Cl=C3=A9ment added the interrupts to the binding, but never sent a patch
to update the DTS.  I have submitted a fix:
https://lore.kernel.org/53d45eed3709cba589a4ef3e9ad198d7e44fd9a5.1764249063=
.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

