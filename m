Return-Path: <linux-renesas-soc+bounces-16685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3167BAA9443
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 15:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A595D3B1791
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 13:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2676B204840;
	Mon,  5 May 2025 13:21:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F571A2C25;
	Mon,  5 May 2025 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451312; cv=none; b=dS8vokusPDcXcl7H7j6Ww/ulETPCH1h7i9HmoQ1aTC81nEDo1onbIWO/eJ3UQJS0JPaQESlFvwrlgd6EJwqIB0mDiwofb5g8Ck4P92GITOHsWUKANPRurig6VcbVBfbvqb2f78EOqgGxR2gn89zFAlu3H0Jj7KLMQjGa533mrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451312; c=relaxed/simple;
	bh=D9f4P69mV9Gc6KYg0s6RkoVbTqy+PB1mTnqKn0QRUzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/9dSqeXko5Cv574Ov/HfpFtw9qXkwkUy3djoqoRvDZ8+NmgO/EDzDyWeYqYXR9dlnUz/za52WgUKg0RAMBGc6GWh84oVizUCHZSxkDt8Sj5dv1+bKC1hvwwdMQ0zH7lNEwzGa8yvM1b12ULaoPSvBgtulBtQ73mREwh3AG76KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso1051466241.2;
        Mon, 05 May 2025 06:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746451308; x=1747056108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lHAlRJUMtVNsOO3Bq44/DYs6/bvjkxaRXniB3XCy+Q=;
        b=L3AkPI0818hE2+rfT/whZqqMYOEA46ERzz41UlUUwfQfCgMpS2u2S8p33PKruPWBXx
         7rEoUC5Kb0UuJzkj3d0U+o4YatBhfyhvb1s3oH0mCFjMK+TXBTJWdb+6bVbM8FgSyjmQ
         It6SYchgR3ZnpJQUCCzy0Wgf5dSCg69Jp1BsSyoOrR+frCQDefPIA/28LcaBESuoL+0o
         cBgV0saZreeY4ybdbCE+1qJ+N5RBVvzODbCR7GlWJA0iZnd0GhXGN1rP2GBrrN8q2mWv
         CqpVibqlxM4smjJl/B7yqo8AgHtHIBVTwA4Ip6ayAx6ZqDhF05wu/LOxfzrm5TbtX+j3
         ailw==
X-Forwarded-Encrypted: i=1; AJvYcCV6s/0NkW7Ee3rHrAk3cdvJSLycIWrQT7/+5VmpfytgVkzNAS4KUyCj8w9JJDjIGare52sDfVwST3nn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsr59J9DhndiW0QyJYfRMOzJ2LaJevKue5cHuCy/fwSXIASlMC
	VYwbfAUQj3zX1n/8+BbXE2Adbv6ueGIAfeXm+1ZTGp629kJcVpCuuZiqG7RQ
X-Gm-Gg: ASbGncvjoGUeUUkyD7ngAjuiPmx19VwD96LPkXqXOit3A1qX/Sp0ZnGaofYTRoYFy+D
	EprfI18pcjB5CwdRxNI/6l8YjfGNq4uGzc2ORUVS+6AugyHKmPZaIBbHdru3503y4zsrC3UQHVv
	ubGhfA2qOOMLVa5eAVMVuqKfungVgd97Go8LBXRbAK3v+BQbJD73s8n741vE9NDmuwyuQ1uLxaI
	QQHSbx8Rl3ktB8h98Hli5IHzfTlZphtoi68FpPwBng1lNqRISDi8WmPmku/M/AS09bPFpJn0atm
	GjDLQqoCTXPUuSMV1P0wnt+FHjFeBTIq1+2P8eFDRpIGq5rD8AbjRMQikY7WAJg4zP+dGeF38V5
	SjUaAGIo=
X-Google-Smtp-Source: AGHT+IEJal4C4Gtp1tAVZsrpASoxwKYKp81UTjcHdgUchcftEhRCIimDwHWVJ6TlYye9uVABwEGOfw==
X-Received: by 2002:a05:6102:5681:b0:4c5:1c0b:4ee9 with SMTP id ada2fe7eead31-4db149206bcmr3127702137.22.1746451307744;
        Mon, 05 May 2025 06:21:47 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4daf2671ae1sm1410258137.27.2025.05.05.06.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:21:47 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-525b44b7720so1111907e0c.0;
        Mon, 05 May 2025 06:21:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIJ/mf3nxvbOOZ9nrjiVu4kQYoFQgGCkwdL25wCVvM+FByHhiKULhPGkT5H/tdcE+45ur+Rs2UjHev@vger.kernel.org
X-Received: by 2002:a05:6102:8085:b0:4ba:95f1:cc83 with SMTP id
 ada2fe7eead31-4db148eeb9fmr2750575137.16.1746451306702; Mon, 05 May 2025
 06:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414100206.7185-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250414100206.7185-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 15:21:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxRF+xtLkyZAGkZFN3i-zAuHkTkQ2e9GkKQjF1io=Ehg@mail.gmail.com>
X-Gm-Features: ATxdqUGa9qnLHQDn8mvkMO6heiOJXNj7dt5r0rk7Q1FgDn6CzK4-AXwAHakZxZE
Message-ID: <CAMuHMdXxRF+xtLkyZAGkZFN3i-zAuHkTkQ2e9GkKQjF1io=Ehg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Add GMAC1 port
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram, Niklas,

On Mon, 14 Apr 2025 at 12:02, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This port bypasses the switch and is directly connected to the GMAC.
>
> Co-developed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -15,6 +15,42 @@ / {
>                      "renesas,r9a06g032";
>  };
>
> +&gmac1 {
> +       pinctrl-0 =3D <&pins_eth0>, <&pins_mdio0>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&phy_mii0>;
> +
> +       mdio {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               compatible =3D "snps,dwmac-mdio";
> +
> +               phy_mii0: ethernet-phy@8 {
> +                       reg =3D <8>;

Missing blank line.

> +                       leds {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;

Likewise.

> +                               led@0 {
> +                                       reg =3D <0>;
> +                                       color =3D <LED_COLOR_ID_GREEN>;
> +                                       function =3D LED_FUNCTION_LAN;
> +                                       default-state =3D "keep";
> +                               };
> +
> +                               led@1 {
> +                                       reg =3D <1>;
> +                                       color =3D <LED_COLOR_ID_ORANGE>;
> +                                       function =3D LED_FUNCTION_ACTIVIT=
Y;
> +                                       default-state =3D "keep";
> +                               };
> +                       };
> +               };
> +       };
> +};

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

