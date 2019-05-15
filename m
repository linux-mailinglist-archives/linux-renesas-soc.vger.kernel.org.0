Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1361E94A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfEOHnO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:43:14 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:45500 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbfEOHnO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:43:14 -0400
Received: by mail-vs1-f66.google.com with SMTP id o10so1039721vsp.12;
        Wed, 15 May 2019 00:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+nyg34l7umLRooKLpD6LR2N6RbwcTaVbT1Lho1rrOzY=;
        b=eldogHOgV7xVSzUvNf9C1ApnbR1lZSHMQ5PU1yLiTTC9I2FQt2BNSVlrsRhV7Px350
         U6PGOrrmL9Hl7VG+i8N9DO5Y5y9Yk6ESav/ptoepitr4ZeiVrR3eXRVHmlRjChe6Vy4V
         3ss+DUM/Tbsn5ml8/n2/3+1ULcIiW01uqVPFV/2fy5oqKGmkr9lMsijY748aQcMJBUAq
         rdaymSebVFw55KMCYp8glwqj7ARmL9rDGepSWaonW0UD4NuJkSv/1Y7R/G0V8i8xQb6o
         /PvrrCTujVNXRXxLup04sVgI+9xS9PB8HTj0d6xwmlIgDyrEXHAEIA9H0ySr4MjhDvcS
         pPJQ==
X-Gm-Message-State: APjAAAVaYtsMalE7DpqPDkSmFXsSnGvXx/c7B7s1uZWCsWZMxdo7DODQ
        uXLhSqkHwT5A/+i59aPa//p4/4WIv/2v37S/4dE=
X-Google-Smtp-Source: APXvYqyCJafREmknwPtrrzMr9RERxrPzAtBYt66NmZTOk9S0oumS5+mQwR4qSCuUQRl0lqoKEZ5ErNFt1MelrNP/B3w=
X-Received: by 2002:a67:fdd4:: with SMTP id l20mr15055645vsq.63.1557906193357;
 Wed, 15 May 2019 00:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-3-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-3-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 09:43:02 +0200
Message-ID: <CAMuHMdWctj6bEBQ9OF93T6h10Chb-ankN4QRaY+UPLLQuBJDHQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] ARM: dts: rza2mevb: Add 48MHz USB clock
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Tue, May 14, 2019 at 4:57 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A2M EVB has a 48MHz clock attached to USB_X1.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> @@ -58,6 +58,11 @@
>         clock-frequency = <32768>;
>  };
>
> +/* USB_X1 */
> +&usb_x1_clk {
> +       clock-frequency = <48000000>;
> +};
> +
>  &pinctrl {
>         /* Serial Console */
>         scif4_pins: serial4 {

BTW, it looks like this file can use a sorting sweep.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
