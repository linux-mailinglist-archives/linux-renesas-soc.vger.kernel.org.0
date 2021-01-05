Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72ECE2EA952
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 12:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbhAELAw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 06:00:52 -0500
Received: from mail-oo1-f47.google.com ([209.85.161.47]:33841 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbhAELAw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 06:00:52 -0500
Received: by mail-oo1-f47.google.com with SMTP id x23so6992645oop.1;
        Tue, 05 Jan 2021 03:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jJeZsSi/01Cav7+K7JwyWm6MMO/wugP5/u44TAzN3Zk=;
        b=bXn/8DQAJvYYNed9CzrkSvhkHrz4Me1NEJST7kXxga5hsfrUicl6b3dVLW9A2/34gP
         I1QBwAkmaLr/Qza4V3X6hVtY2azkBlBnDR3cLcEMYodKBCygk8IuVsVP2Cmk01VIYP+H
         OBLzNS/r9QxXZXqCstEXDkMhHiEZwFN0GTcAMxZ/8MA1DhB0YjpsNGzI2HQ0km940lD3
         8h24faL7uiwX8j0W+VIkcERKYcycAV8lLQmFiaR2gShlMis08VLasZmKXOpNWHTzKc44
         FUt2s+Oe9JB9Mvc5aKNhRaM/whq2rIgNUlTj8Ui1t1b/liT7nGP8j97S9ww+LM5fdLjv
         Rnwg==
X-Gm-Message-State: AOAM531dRMxQ9xwVq7WgEF9khNONEwbYz0RgBc8gc2LA7/Wyc52vALzu
        v++KdH1lSXu8ERiK8D+Aknm4/xRzjp7Ed0DBj2Cr6GYF
X-Google-Smtp-Source: ABdhPJyv3C2eY2G954afrjNLNxBIHalBcC0Idl3e7QMA00wrpLCXxslJNj0HUWj/oVgZ6TDqNWO4sllpP3AnTy9GcNs=
X-Received: by 2002:a4a:ca14:: with SMTP id w20mr52111506ooq.11.1609844411459;
 Tue, 05 Jan 2021 03:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com> <20201223172505.34736-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201223172505.34736-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 12:00:00 +0100
Message-ID: <CAMuHMdW0fQBHvQntbikQo+ywzwrRod9HuJmxCSt9J-X2OruRYA@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: Add I2C support for falcon board
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Dec 23, 2020 at 6:25 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -21,6 +21,34 @@ chosen {
>         };
>  };
>
> +&i2c0 {
> +       pinctrl-0 = <&i2c0_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <400000>;
> +};
> +
> +&i2c1 {
> +       pinctrl-0 = <&i2c1_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <400000>;
> +};
> +
> +&pfc {
> +       i2c0_pins: i2c0 {
> +               groups = "i2c0";
> +               function = "i2c0";
> +       };
> +
> +       i2c1_pins: i2c1 {
> +               groups = "i2c1";
> +               function = "i2c1";
> +       };
> +};
> +

BTW, why not adding i2c6, which also has slave devices connected to it?

>  &rwdt {
>         timeout-sec = <60>;
>         status = "okay";


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
