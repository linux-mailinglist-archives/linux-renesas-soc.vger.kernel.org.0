Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1CC41363E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 17:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234063AbhIUPes (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 11:34:48 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:38582 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233985AbhIUPes (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 11:34:48 -0400
Received: by mail-vs1-f50.google.com with SMTP id y141so9185788vsy.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 08:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C9u1GsDydJLbzflhtnxfbEVEuQt/Z51b1Gp56YSE/z0=;
        b=0dC7IPR4PPAF7zXUL6ctvH5wYtfJHa2GnumZnU1Y+fhHENrx7YZDvUFdNuc0yutOhT
         X6UcXwelDCmFDuvo8GG9vNTx2yvB45SH+5r3yDjavjudLpvvVuvHUQWAlwRee08mcecD
         L/N4wLvmCdA3EbaWp1kJUEXbQfHdjuPXrd2HR3OiQ3vgj+0ARphFor35S9VtFckvGiQ1
         GwTlRFo5hQDBYrBCer/zTj/4IIWE6u4AAAP/079NmAdS/Y9l054zoBDtm4IcdAhbLwd5
         UU0A3xk8bH45EySPMGhuA6ohCQrjqPZvvX0u/U11NiuJlbTu5eV5Fxglb2fch4DWdpaF
         HAAQ==
X-Gm-Message-State: AOAM531IJ/PHB26wjnydkUpiPHYE9IbGPr9Fu8LwoCmgHakP+riGGaf2
        LniEVN0GBEVlodoOqRGBYEYTWA1NZ5GAqDAPySNrURIkPK0=
X-Google-Smtp-Source: ABdhPJyGhJ7cHzQW+Djwn4g0AdqtXoQi6nAv3sCSM2p5bKrT04+ahe+S0+GwF4DcAaT9Pc8vtMAzLkybdJveIrnuZUA=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr21662599vsl.9.1632238399415;
 Tue, 21 Sep 2021 08:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210826142451.495578-1-aford173@gmail.com>
In-Reply-To: <20210826142451.495578-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 17:33:08 +0200
Message-ID: <CAMuHMdUkU0KT9fz9qGHrKVx0bVwTvM1JgHnt6RJ2Jn57qxPjww@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Fix usb2_clksel
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Thu, Aug 26, 2021 at 4:25 PM Adam Ford <aford173@gmail.com> wrote:
> The clock driver only sets the bit when extal is available and
> xtal is not.  Remove the xtal references to properly set the
> clock selection bit.
>
> Fixes: 56bc54496f5d ("arm64: dts: renesas: beacon: Fix USB extal reference")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -323,7 +323,9 @@ &sdhi3 {
>
>  &usb2_clksel {
>         clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>,
> -                 <&versaclock5 3>, <&usb3s0_clk>;
> +                 <&versaclock5 3>;
> +       clock-names = "ehci_ohci", "hs-usb-if",
> +                     "usb_extal";

According to the bindings, there must be 4 clocks/clock-names.

>         status = "okay";
>  };

Looking at the driver implementation, it determines the presence
of the usb_extal and usb_xtal clocks by checking the clock rates.
According to the schematics, USB_XTAL is left unconnected.
Hence shouldn't you just remove the usb3s0_clk clock-frequency override
from arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi instead?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
