Return-Path: <linux-renesas-soc+bounces-23575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041BC05484
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 11:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B62C94E3D19
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0D3306B08;
	Fri, 24 Oct 2025 09:15:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67126ED37
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761297334; cv=none; b=mBgdMn+ohWQTEL6SEOerOTaPV7nrED8Gc5mysXd7+c0RjXgmTkesT63Fu3aKnWKDH+itmW0LgpDUUIS6bLyRHm3xfG9Od433aMVUPU2o+YHVPOI/NiiCXC9pjV9j7vZm0GFqB8X4Za9zTheagh5UYpp/H1+g0gbMrX65NbWaZJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761297334; c=relaxed/simple;
	bh=J8mSVI/f12nth1gkWB8k+uvzYuiJaePL/O3be6q4RNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FClxn2CDQzgmwNk0kq6WIw7a4Ef1hlu9kMAXQbwT3GPCwdBZz0VN1wcJeW5JpUOJ6fNjQKGzVjSAJlxWb5LYbJUpgIeYbLwfhCSnXvf9nyIluxMGR+7fF32XiPGYDdxtl5OkvEMWmWh5E6TrWWqYFEGvO9yXdrd2Z0fz4on/6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-930ff50d181so1539999241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 02:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761297332; x=1761902132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BrBpEYe9bLey+4S4JjtKCcOIac4hS6dnR1uT91EPVAM=;
        b=f3Wb6xqWAsnXPdwFvteJU5Yzt0abJXhmykHZjv/xr9Cn6PEyhd9OIgSR7ZsDwgFJzW
         iA3q6hEqJSLXINbzyACpp7z0HiqyQPsuCTathzoSmfjUQBGUNiK9nmtA04WAihZ8hYKF
         XsJW5pFzUpQsRU9PzoK2gBHZh8xiY9UiEoKHOb+y1XEjwOlEIWR6g24KtayBjVVp4P8L
         gVg6HgpfTeh769AQTBXNAsdiW5zsOG/LeNjVyueAauKpRxUhVmuVUNpixv19WM1RuX5B
         d/oosQClIHQzqJ+loVtZ4hzkDq0awFSgubOPv5gnyBrbq7AaMrIuAttdKiwPCfmXcbbH
         ISww==
X-Forwarded-Encrypted: i=1; AJvYcCVGm8zRyTKoaHSHfGgWuwYXQV9tj4iUDpB5T+o3v17nQAXcPrsdpc0Ta6s75rxEztj1qlIDLyY4MIpBhv6eqp6+/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZGIqQf3lSHsU4EWUBLxzQoxvXt5JkKSUJzh4f8nAmPEHEIKr
	ZPH/qbQtCvZmWGoJwoTqXqjrHrqOBh2jRGnU70H7WX3tvjjH3SEz2ALMr5EuXggH
X-Gm-Gg: ASbGncvFqMLmorRw3KdzL4zOyxxFCTmYc7FYpy2INtIYTRh59NVKDHEZI3zbPgXM8Eo
	cqC9LmngVegOxim7UPfoMnYYbMXUPNOHR5ZFyxr68erlUjBiUgO1bdSFRbpmZ6YFe/1SLvW/Nh7
	DQklHvIIK/zT8mQQZ5kicdgU3FkkSnmI3ohia92rjBJOqChXVF1bjII4P/gkOn3ZpMdOBmxO+sC
	OkpeH8wuU0mSw9QJeCd7Z3E6B60xonHsKtxoDNzITvnJ17mHdKGgeAhcErGRXi7MUSrtpDcWwyt
	odRyOBFsPDzhjbuXYDNUt1fr+YIQVmdZvdH7yDs7YD1vxavILSb9jk2UUNgPsF4ZgKW/ERoKhAD
	FZkO7KwX1BhEhTJV0kzMxBYehULeeiOOoe1dzyLMC0VtjAAeSajoyKGgPiF2F5G5guxgJzN/BfC
	UJ2cNhUiSxBzGD9cWKlkpcfxU8fY//F7Q7B0jbaw==
X-Google-Smtp-Source: AGHT+IEULu6XB3AU4ER0jb//7Nd0hgGHIKJ+g+PfgCMHXnRO9vLoFuInhyDQo3EMhPUknEYfaYqa9g==
X-Received: by 2002:a05:6122:1807:b0:556:9cb9:65cd with SMTP id 71dfb90a1353d-557cef9363emr349418e0c.6.1761297331910;
        Fri, 24 Oct 2025 02:15:31 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bdbe57c5sm1848332e0c.19.2025.10.24.02.15.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 02:15:31 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5db221488bfso2122209137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 02:15:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXV2tehgGRguJMn10dG4YD5eG+jpbXUBX6P4ApTdyWwo5YMSkbcuLbCvvsW54FbU2vNcNP/byciiA9pTCQcXZTYbw==@vger.kernel.org
X-Received: by 2002:a05:6102:12d4:b0:59e:a2d5:2945 with SMTP id
 ada2fe7eead31-5db3f88a5f3mr252149137.8.1761297331043; Fri, 24 Oct 2025
 02:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com> <20251023135810.1688415-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251023135810.1688415-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 11:15:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7ScKUw7bGFW4v0wS9caXKDeT02MXkLWpk2LZfYw8GfQ@mail.gmail.com>
X-Gm-Features: AS18NWAoeA07bJLB0nX88rm2l0IWTdjwxg2U5L-RZOoaf-8oTt8PVHt9R1PDCKg
Message-ID: <CAMuHMdV7ScKUw7bGFW4v0wS9caXKDeT02MXkLWpk2LZfYw8GfQ@mail.gmail.com>
Subject: Re: [PATCH v8 7/7] arm64: dts: renesas: rzg3s-smarc: Enable USB support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 23 Oct 2025 at 20:41, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable USB support (host, device, USB PHYs).
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi

>  &pinctrl {
>         audio_clock_pins: audio-clock {
>                 pins = "AUDIO_CLK1", "AUDIO_CLK2";
> @@ -207,6 +230,27 @@ ssi3_pins: ssi3 {
>                          <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
>                          <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
>         };
> +
> +       usb0_pins: usb0 {
> +               peri {
> +                       pinmux = <RZG2L_PORT_PINMUX(5, 0, 1)>, /* VBUS */
> +                                <RZG2L_PORT_PINMUX(5, 2, 1)>; /* OVC */
> +               };
> +
> +               otg {
> +                       pinmux = <RZG2L_PORT_PINMUX(5, 3, 1)>; /* OTG_ID */
> +                       bias-pull-up;
> +               };
> +       };
> +
> +       usb1_pins: usb1 {
> +               pinmux = <RZG2L_PORT_PINMUX(5, 4, 5)>, /* OVC */
> +                        <RZG2L_PORT_PINMUX(6, 0, 1)>; /* VBUS */
> +       };
> +};
> +
> +&phyrst {
> +       status = "okay";
>  };

This node should be located before pinctrl.
No need to resend just for this.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

