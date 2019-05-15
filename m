Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A56011E917
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfEOHf5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:35:57 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38304 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOHf5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:35:57 -0400
Received: by mail-vs1-f65.google.com with SMTP id v9so1050710vse.5;
        Wed, 15 May 2019 00:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L0hlAmWhNMH82t3v1FNn27wRVsbD0sLEXB2gDS1meZQ=;
        b=RsU9YZIm16rt9Ar7GkeccaUNVWjHuay9V9OsvvOaLztODOL43DnfIZJVvNX+A+MMHe
         PKTJU3epGhcSvUhKlcDZ7CvouKQbD2hrwm08t4YMF9C+Xj0RsuJZI7rjDMF0E+/EFhkk
         TBbB1LqkVJ5cw9jBostmqW1KmBOgE5Vw35TNwGmJSBn8+D4mtEk5SD5Ir9vGBB1JcP6P
         YEowLnksRbkhfxgKjEt2nzM1vGIQukY7C2GHjvk7gL980fhPG/iVEmbLmaItIVDoxg9P
         YKQhY48dwrIeqAsJrqKwnt5zjNnsbH8J/0asBX/DFUn+8nIu4awEWHWMxC+f1k42ERdG
         lN0A==
X-Gm-Message-State: APjAAAWfvvsK/jX/2+BtSUvMcn2PJjCHCaPZtZprSF9NwPd2zsvHR/g2
        ghmy3FccsdOZa+dB5+8flTeA8rFeJv1PrmgGkxM=
X-Google-Smtp-Source: APXvYqyIeTFh5taXcHAP5AgB+dEGf0JuNto7JIrdWY/w/6+FdLPzAOp064TaF526k5Ya/Fg2h4xdWRjKEOWmlUDW+dc=
X-Received: by 2002:a67:f303:: with SMTP id p3mr8033034vsf.166.1557905756178;
 Wed, 15 May 2019 00:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-5-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-5-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 09:35:44 +0200
Message-ID: <CAMuHMdVVu23_8=8CLwM46QAJsxUbYyN1TYQaAzoE+d2uM3YshQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
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

On Tue, May 14, 2019 at 4:57 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Document the USB_X1 input and add clock-names to identify
> functional and USB_X1 clocks.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -28,7 +28,11 @@ Required properties:
>               followed by the generic version.
>
>  - reg: offset and length of the partial USB 2.0 Host register block.
> -- clocks: clock phandle and specifier pair(s).
> +- clocks: clock phandle and specifier pair(s). For SoCs that have a separate
> +          dedicated USB_X1 input for the PLL, that is also listed.
> +- clock-names: Name of the clocks. The functional clock shall be called "fclk"

Names?

> +              and USB_X1 shall be called "usb_x1". If only one clock is listed,
> +              this property is not required.
>  - #phy-cells: see phy-bindings.txt in the same directory, must be <1> (and
>               using <0> is deprecated).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
