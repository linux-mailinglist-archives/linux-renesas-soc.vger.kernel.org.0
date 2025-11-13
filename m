Return-Path: <linux-renesas-soc+bounces-24570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF72C58180
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FFA73AB05C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC29D27FB32;
	Thu, 13 Nov 2025 14:48:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F84A1A9F90
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045336; cv=none; b=MJ6FlAKXRac8EHvh7e5OdUp9uez1e9jbyPD3XzPlKLvjZ0hXh+JJeoHyEUc+Je22DyUxDLrawPrKRJGatRCXzS3zuBX5A5882nJzHnpOpiXsG0rQvGCojT/ekPIK8k68QmJUSPLb3aWOfEVfUosuKAcIAtHcGnZuxWPMt4sje4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045336; c=relaxed/simple;
	bh=yUTC0EvqYswBfkQQ6OYPcTdAct3w2ul1w7D+PC7nB1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBFLTqC75q7UxHPdkxCoNIRUlLgaMGHCz6tQLjUi6Tu0qsJdAF0RruV17aoF03n0Vbp0oS6+nAFn7C/kn5wHU0Q0mPqba6Y5v29+fmqlVjHypCvSFqU8/pccQFCJ9f1wyRw4GYFbUlCi97i9MLGYF7rJGuYRgXK/UEwbIPDRhKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89018e9f902so503143241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763045334; x=1763650134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+9uOsoz58vq1sUJ8SvSSoBxDJHfhxT++1tWVBAE5aI=;
        b=aWTn7NBmD2uw/fAccnZ352ouM34O1qjc49eIPGogJFVPDIwo/ff9u6SbTVR9gR5ttz
         eM1IhoJ3HB3zRXppsWwVq0XR6dkNWKkgpKHLTTbLMy04hYUx4HZbhEccinx9ys79cUbZ
         qp6rUF/EeGwsdXO8Mmr/zfmmWZdrIDN30rH3BcpPfNwyWuwTqZyQXi3XL+i+bZkDS+aU
         y9+57OF2FF9VtcVdWlhqQVBKGGhxw0gXingjy6qhvlXCZ/plypRxJBpZEQEq6+7o+iHq
         YoaGphDwGuEFSwVlb6yoiBxrkWl27KU1OalTW52vUYDjMI62WKkYW6hxY9i0zot9YLuD
         D3zg==
X-Forwarded-Encrypted: i=1; AJvYcCW4tKS4N4M5bDFTu/xKbvP2BCdirWZ51kPN2CFXbxApoJLUzs0T+BxYbBAkpq+oFPdaEF+s11llR/HHxsqmemzQcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHgaCAbfL63+kpAcGBWyZ34WsYBJY4AGb5puGEwwOqUke+DuSy
	3HULrAv7KHbEqntNPrfVRquQYRTrfvMZcbPEE4SgjHXqY+860ZUt9dF5K16MT/CadZc=
X-Gm-Gg: ASbGncvXeTfe2Hr/sTcStRj2/yiuCfNFS894p5aq1evRq/Y3WabSYzkwnpX93JxOt5U
	4ymLXt0QDJVgHMGXjlGOW0W/KP6ipaY99jAxrcCi1ixhdpVd9XYOyTykxbLF7XBmSKXwFB1AE3A
	36IsVaXga0wZ+1jB9yAwaWO9gMXmFHDzgXEVORCU0YdgLdGkDWyAhaszr7aYlLN3xdTDgMfx7fC
	PoprBXd4C0LC7zrQRubtN77ZrW7umVBC5mb0Xb8Kl8eq1OQ2Qp4nl7HotywtvcG4mW2xvuLFTaa
	eJexNXkzMvS87kCJoZjvFfjOGGPS0Kxxgs772IenGahHavycfWiC7lfkaMKhrxX5qaZULlgNQm5
	uKNVPG+HVrzbVPMOIosQWnhROcATQw6c4LRCvyxYwlA/S5e5axicnBNydWt59Xj41NyfUu8c2M1
	ALLAhNrFLVs59qnHKFukR+rF+58uzLECQcHKi2Qg==
X-Google-Smtp-Source: AGHT+IEWFj4PZ5TiacJ+qptkEad4YL8vkfjh+baZpaBrBUIZBGjHcbWmKs9E2lB1JV20vPs5P1uwMw==
X-Received: by 2002:a05:6102:508b:b0:5db:28ef:3dfb with SMTP id ada2fe7eead31-5de07e5cfd7mr2946832137.34.1763045333916;
        Thu, 13 Nov 2025 06:48:53 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb7232a6esm656463137.9.2025.11.13.06.48.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:48:53 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d967b67003so614140137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:48:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/VfWlt5m3odhG/FZAXABWdZ9pzdsCNjEdgqBS/dlRgCUSIz2VTiCBOnmewKFGJScdCyGjNZxxAp7/+vz6Zr66yQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5114:b0:5db:d60a:6b1f with SMTP id
 ada2fe7eead31-5de07e06ef4mr2746009137.23.1763045333120; Thu, 13 Nov 2025
 06:48:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027140651.18367-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251027140651.18367-1-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 15:48:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXWwGo0bVmDpqxABH7aP0HcNDuqvv7D76xUv2Fa_48zEg@mail.gmail.com>
X-Gm-Features: AWmQ_bkLEJtOlbvS4476ZL74m55cEfNUL-RzWUnhLnjFntgzgnUJvf7opsRO570
Message-ID: <CAMuHMdXWwGo0bVmDpqxABH7aP0HcNDuqvv7D76xUv2Fa_48zEg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add NMI
 pushbutton support
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Mon, 27 Oct 2025 at 15:07, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> RZ/V2H EVK has a user pushbutton connected to the SoC NMI pin, which
> can be used to wake up the system from suspend to idle. Add a DT node
> in the device tree to instantiate the gpio-keys driver for this button.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -9,6 +9,7 @@
>
>  #include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include "r9a09g057.dtsi"
>
>  / {
> @@ -34,6 +35,20 @@ chosen {
>                 stdout-path = "serial0:115200n8";
>         };
>
> +       keys: keys {
> +               compatible = "gpio-keys";
> +               pinctrl-0 = <&nmi_pins>;
> +               pinctrl-names = "default";

Do you need these pinctrl properties? ...

> +
> +               key-wakeup {
> +                       interrupts-extended = <&icu 0 IRQ_TYPE_EDGE_FALLING>;
> +                       linux,code = <KEY_WAKEUP>;
> +                       label = "NMI_SW";
> +                       debounce-interval = <20>;
> +                       wakeup-source;
> +               };
> +       };
> +
>         memory@48000000 {
>                 device_type = "memory";
>                 /* first 128MB is reserved for secure area. */
> @@ -320,6 +335,10 @@ i2c8_pins: i2c8 {
>                          <RZV2H_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
>         };
>
> +       nmi_pins: nmi {
> +               pins = "NMI";

... as no actual pin configuration is done here?

If you confirm, I can drop these while applying.

> +       };
> +
>         scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

