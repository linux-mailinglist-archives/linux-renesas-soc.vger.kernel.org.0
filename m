Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAF7E3122
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2019 13:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439173AbfJXLp5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 07:45:57 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34745 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438939AbfJXLp5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 07:45:57 -0400
Received: by mail-oi1-f193.google.com with SMTP id 83so20341217oii.1;
        Thu, 24 Oct 2019 04:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xapP1tQVHBFB4u5IRo6bt1XmdgDLSW79Eo21jhd+1ys=;
        b=nKKitKBFfQliYORkF6LbkqaGtHQ1U88yd8yLJUYHhm4OdFsk9ukOyOukGSuSNP7fB+
         y5Y/be9GePk+mKJd0x7APc+NAK0hjuxJOsL9sz3a0s4/Fy6rxFTRn1LhsGSFayfVEJiy
         3h4TUBARcNmJNMuCp6aU2zCYU2Zn0Jlj9f7NQyNyo98GP0S0oJ3m5B6tVY0IVWyic6Nw
         xT7MIl9a9A9o8oUJhPkqHv0uBSyHJXsFdCDKRjUL2KLv52kQaq/vvmuzg4UrQ/nzQDZ5
         ggIEfzoSG4cPEBWP8wp7dFPQf+WAedDfIbmkRmOWvFCu39HBWa3DD5e2gvSg5bcPe/Fc
         7N4w==
X-Gm-Message-State: APjAAAUAl9GPHSXOa+jkj7yafy4N33OGWxHrAOry2HT2xC5QbJHVcT+r
        So9Ak4qvFYAphLZEWZ/OZT+0nLB98gef+w34aDM=
X-Google-Smtp-Source: APXvYqyYrTTKmO7hOqrCTJfyf96D1kruRxrWcBoOiIEfJhdm5CfrfxUVO0e52Qb0mTkw6VqHzQVre7gs5e1H2KbWLpI=
X-Received: by 2002:aca:882:: with SMTP id 124mr4319026oii.54.1571917556040;
 Thu, 24 Oct 2019 04:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1571915821-1620-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Oct 2019 13:45:45 +0200
Message-ID: <CAMuHMdXLOh3j-CFb3008DkXVAmq2MWCSW0SqzPoBBeq5v1qwoA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix
 clock[-name]s properties
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Oct 24, 2019 at 1:17 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since the hardware requires to enable both USB 2.0 host and peripheral
> functional clock, this patch fixes the documentation.
> Fortunately, no one has this device node for now, so that we don't
> need to think of backward compatibility.
>
> Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks four your patch!

Looks good to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'm just wondering about the inconsistent use of "_" and "-" in clock
names, but I don't have a better suggestion ("hs-usb-if", "usb_extal",
and "usb_xtal" do match the datasheet), so let's ignore my OCD ;-)

> --- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> @@ -38,7 +38,8 @@ Required properties:
>  - reg: offset and length of the USB 2.0 clock selector register block.
>  - clocks: A list of phandles and specifier pairs.
>  - clock-names: Name of the clocks.
> - - The functional clock must be "ehci_ohci"
> + - The functional clock of USB 2.0 host side must be "ehci_ohci"

"_" means "and".

> + - The functional clock of HS-USB side must be "hs-usb-if"

"-" means concatenation of terms.

>   - The USB_EXTAL clock pin must be "usb_extal"
>   - The USB_XTAL clock pin must be "usb_xtal"

"_" means concatenation of terms.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
