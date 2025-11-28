Return-Path: <linux-renesas-soc+bounces-25326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEA7C92298
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 14:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7EB24E3E02
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 13:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB1E32D42D;
	Fri, 28 Nov 2025 13:41:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6315E325703
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764337281; cv=none; b=TExQn2YESZzHwaNKYlaz7njA9oj8RCe8zK0kYUw80gjzw1R/IAmVCYsIbEA6g8ZUFw7emuxYdDMGint570MBDHBy+Z0ImpJ3Bp9KJ8Bjdskw+kz9ZGCN9woL/N8116nWDWj16A7luUeVSdx0sJMaKWK2f9fma1uFF8WxujFw6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764337281; c=relaxed/simple;
	bh=/1wVI+iuc0gFZ8+A7nHo4n1BMQMwbsV9wxbEtR/EQMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvIOUo7SsRIuZeAc5D8Rv/TPd9VHeLQQXZEvRZq2TFtV1Nq+d6LXbkSuHPma+Hs/7HvfK2BplOWG4mmPXfojfaArvTJJUbSgi4JYztMJTQa5RQueu7/X2IRe2/kBLWsh0ncrL9utT24lWLe734mWhQzW8bOqgtbXec0VTz3uNzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso1122042241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 05:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764337278; x=1764942078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvQV5mJknlf/F/i/hi54Q0gVHnAOGRFZnf6lqryPBFQ=;
        b=NhqBo+DBYV6RtLAdvnGlTHmI9lg58TRMp/y0Sabz1euX2AcuSNM3dEoQR7x5UoM4ar
         G4nTw8r+1TrFi5LoSQt6vbaJ6K5eKCyjpSY1+MpeJusC4YWXFzX+VYOdHoYhf7ztQNX4
         y+KqnqyaxsUl6JAtyRDFk+bFOlr8dBb+HjeTKv7PGSxqLWYxdgH52fBRfy35kl8W5LKK
         +0cWjVyhD6/ih6lX2dOPs5JJlA7jcRc0EVfBIzV3GH8kHR+TInGjQICLnH5AyQZYWOfA
         cYoAMC82rjadJRQ+00iwEAhWaGmgFJklxoAqaxQU9gYBQ2fFESfxlYJKqz6XPFo1HAHW
         jTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4QAewZ//xclB+mVe3LOtuXfSfY0ZTQTp7/bp3Yq7NHxu6sWOhDMS5YIk92KVS/1c8DkqgvTpcIXDWAiiSMTolbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM3YaJhNJql2KfoYkKs6wCS3aU+OQCnqjODaGZTe0A06Iei8Cw
	mrr1E0TEKEgtTzhH8/d6JFZj3Do3HS3L9QwFu6Xq2zpBTyUQQPpn1u10NgnggoDr
X-Gm-Gg: ASbGncs/CC6zqCsQ/Frm+CzvR8ZBRhx6hAT+FpdoskMVDPgv82PQj5I/t82SB8oUzJy
	XRlQJbwQNnRqDAobCETL5yoM0f809dvXYIGTGbGsj+L6LOXswk0GTmlY73X8t3/qnFQruRYKGlP
	9GOxNDULrR1I5YlWUTPfDhAd6vSj6iiqgy1d5FPAcz6k1ZV3Ur77HTOZDkbw0au8jyiOzhpXmDd
	Gv9WZIjgRmc6cGRQRblLfl1ihigzcNymC6YyqBDsq3RrQoTSJZVE6saL85pqf1X+FMFjPuPp9/Z
	8XLmXIshdBe0bbmoISnyxJLPdPPYFDeqn8SCiGfEB8GY/2jUwVG7hHdHQgEONtEOG/9DUcn5ZCX
	X+5qomGGanWy5UJEP0Wa/ga4uzNqAq/HmPt7wCje5Xbqw2pat/d7Jg57Iar7Mjg3ebHS7lb3oO/
	fcEMAVTVtI7BApXZKWlhP7EnocpS0e3NrNZl+nyeqs4QiiVK49
X-Google-Smtp-Source: AGHT+IHK+ndRtn8F9C5ZSkbckpI4+jhcuPXjUzgHdHj7IUInQKBVryKtQ4OK2ujeae8sZqimFoEfQw==
X-Received: by 2002:a05:6102:4424:b0:5db:23d4:feb1 with SMTP id ada2fe7eead31-5e1de00d78emr10650217137.2.1764337277873;
        Fri, 28 Nov 2025 05:41:17 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d94f2d2sm1679361137.8.2025.11.28.05.41.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 05:41:17 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dfae681ff8so1185073137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 05:41:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYey+wfG6s41cuaFxF1AgcShybR0UuiMmdniihUD5huQXX9fawRUuxpzeiRno9fd4P/mg7QW1PsuE/gy3kT2l8jA==@vger.kernel.org
X-Received: by 2002:a05:6102:a4a:b0:5d6:12fc:76e1 with SMTP id
 ada2fe7eead31-5e1de088f11mr10211448137.17.1764337276827; Fri, 28 Nov 2025
 05:41:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com> <20251027154615.115759-20-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251027154615.115759-20-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Nov 2025 14:41:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWMMaUV92mGF8u4E+FsyKQ5_JbQhm9pbUwzSr58ZgNHw@mail.gmail.com>
X-Gm-Features: AWmQ_bmVZy7Igy0rQiiUUnku2WyRTS7pf9zUlS2EAWatubJ3zFTBdy-9_bBU1nU
Message-ID: <CAMuHMdVWMMaUV92mGF8u4E+FsyKQ5_JbQhm9pbUwzSr58ZgNHw@mail.gmail.com>
Subject: Re: [PATCH 19/19] arm64: dts: renesas: renesas-smarc2: Enable
 rsci{2,4,9} nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 27 Oct 2025 at 16:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable device rsci{2,4,9} nodes for the RZ SMARC Carrier-II Board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -38,6 +38,9 @@ / {
>
>         aliases {
>                 i2c0 = &i2c0;
> +               serial0 = &rsci4;
> +               serial1 = &rsci9;
> +               serial2 = &rsci2;
>                 serial3 = &scif0;
>                 mmc1 = &sdhi1;
>         };
> @@ -141,6 +144,26 @@ nmi_pins: nmi {
>                 input-schmitt-enable;
>         };
>
> +       rsci2_pins: rsci2 {
> +               pinmux = <RZG3E_PORT_PINMUX(1, 1, 1)>, /* SER2_TX */
> +                        <RZG3E_PORT_PINMUX(1, 0, 1)>, /* SER2_RX */

Why not order by port number?

> +                        <RZG3E_PORT_PINMUX(1, 2, 6)>, /* SER2_CTS# */
> +                        <RZG3E_PORT_PINMUX(1, 3, 1)>; /* SER2_RTS# */

These comments reflect the board signals?  Usually we put the pin
functions ("TXD2", "RXD2", "CTS2N", "RTS2N") in the comments.

> +               bias-pull-up;
> +       };
> +
> +       rsci4_pins: rsci4 {
> +               pinmux = <RZG3E_PORT_PINMUX(7, 7, 5)>, /* SER0_TX */
> +                        <RZG3E_PORT_PINMUX(7, 6, 5)>; /* SER0_RX */

Why not order by port number?

Pin functions are "TXD4" and "RXD4".

CTS4N and RTS4N seem to be wired, too?

> +               bias-pull-up;
> +       };
> +
> +       rsci9_pins: rsci9 {
> +               pinmux = <RZG3E_PORT_PINMUX(8, 3, 5)>, /* SER1_TX */
> +                        <RZG3E_PORT_PINMUX(8, 2, 5)>; /* SER1_RX */

Why not order by port number?

Pin functions are "TXD9" and "RXD9".

> +               bias-pull-up;
> +       };
> +
>         scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;
> @@ -172,6 +195,23 @@ sd1-data {
>         };
>  };
>
> +&rsci2 {
> +       pinctrl-0 = <&rsci2_pins>;
> +       pinctrl-names = "default";
> +
> +       uart-has-rtscts;
> +};

Shouldn't this be wrapped inside an #ifdef controlled by new defines
SW_SER2_EN and SW_SER0_PMOD?

> +
> +&rsci4 {
> +       pinctrl-0 = <&rsci4_pins>;
> +       pinctrl-names = "default";

uart-has-rtscts?

> +};

Shouldn't this be wrapped inside an #ifdef controlled by SW_LCD_EN?
The port seems to be available irrespective of the setting of
SW_SER0_PMOD, which merely controls routing to either the PMOD or the
M.2 connector.

> +
> +&rsci9 {
> +       pinctrl-0 = <&rsci9_pins>;
> +       pinctrl-names = "default";
> +};
> +
>  &scif0 {
>         pinctrl-0 = <&scif_pins>;
>         pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> index a296c2c1c7ab..305215cdaeb3 100644
> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -89,6 +89,18 @@ &i2c0 {
>         clock-frequency = <400000>;
>  };
>
> +&rsci2 {
> +       status = "okay";
> +};
> +
> +&rsci4 {
> +       status = "okay";
> +};
> +
> +&rsci9 {
> +       status = "okay";
> +};

Given "[PATCH 18/19] arm64: dts: renesas: renesas-smarc2: Move aliases
to board DTS" because RZ/G3S does not have RSCI interfaces, why are
these added here instead of to r9a09g047e57-smarc.dts?

> +
>  &scif0 {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

