Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541FA198A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 08:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfEJG44 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 02:56:56 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:40473 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbfEJG44 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 02:56:56 -0400
Received: by mail-vs1-f68.google.com with SMTP id c24so3001617vsp.7;
        Thu, 09 May 2019 23:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BB5siklsF44BfaawevdOHnkTt75qgf4I3rkavQlxspU=;
        b=dEbf7q/WoT7LQNwW+nXI9Om3HIJFC41ZjFmOVJlgWWTX2PK5EgUMllXllKElVaLXOm
         LfGSVu2x9dPwetuI2L7mStW1r+tsCVQgyumDhnQn1tkcTaZCdKbvr4t9nN/Le/5557WC
         wpAMj8rfAcdXCG3ZEMGhMpDPn6ibZLEsky82LCqv079OVB8FUehfiX1R0U8q1Ij6rPud
         Z+TgwAkZ9EmrZhizYOikVe9Sd6Hk6W5Vm1ZRFrMfQ84v48tYOWIWI7OSmJR+eRIaX0Ew
         SkYTjZ7EiHAnDr34R0qwv7jLY6SLmhtLlELeshPxjryyR1fohJTGJ4hlcRE5juU0NtA7
         65iw==
X-Gm-Message-State: APjAAAUnQ1tPi3d6b7ck+jBvadl1e70Q+xGPvkKKz6pclAw/7fj+E20R
        I33zPDI9ffNCeKZ/hWGV5QwduLloDa/UzXTwwpsJsfVy
X-Google-Smtp-Source: APXvYqy7gN4hKP3UMbyTD4P8fo1IG0Orwin/8bdbTXWOAkycjpapzoEu10/qLffh4lxf+5D45t/DIRSuWEpX9CJYxeE=
X-Received: by 2002:a67:f956:: with SMTP id u22mr4732353vsq.11.1557471415201;
 Thu, 09 May 2019 23:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-4-chris.brandt@renesas.com> <OSBPR01MB3174905587AC3953FD2063EBD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174905587AC3953FD2063EBD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 May 2019 08:56:43 +0200
Message-ID: <CAMuHMdVvVG64YRg-vWAGDNjuU+_FE_0cC4L38baWVXov1ewoMg@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1 clock
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simoda-san, Chris,

On Fri, May 10, 2019 at 6:17 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Chris Brandt, Sent: Friday, May 10, 2019 5:12 AM
> >
> > The RZ/A2 has an optional dedicated 48MHz clock input for the PLL.
> > If a clock node named 'usb_x1' exists and set to non-zero, then we can
> > assume we want it use it.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---
> > v2:
> >  * use 'usb_x1' clock node instead of 'renesas,uses_usb_x1' property
> > ---
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 14 ++++++++++++++

> > @@ -630,6 +637,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > +     usb_x1_clk = of_find_node_by_name(NULL, "usb_x1");
> > +     if (usb_x1_clk) {
> > +             of_property_read_u32(usb_x1_clk, "clock-frequency", &freq_usb);
> > +             if (freq_usb)
> > +                     channel->uses_usb_x1 = true;
> > +     }
> > +
>
> We need to call of_node_put(usb_x1_clk); here.
>
> By the way, we can also use devm_clk_get() for it like the following driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/renesas/rcar-usb2-clock-sel.c#n135

+1

devm_clk_get() and clk_get_rate() is the way to go.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
