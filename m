Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702E6E44EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 09:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437334AbfJYHyY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 03:54:24 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38226 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfJYHyY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 03:54:24 -0400
Received: by mail-ot1-f65.google.com with SMTP id e11so1373436otl.5;
        Fri, 25 Oct 2019 00:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KS3PyvGOQVRjhujgYYQHT4eUVn91juOdqv3qbYfKx1M=;
        b=SzErPE9H3IpK6ZgdID0pG0kwtoxtp7F/Oof/SSIFgENzttYP+jGbs8JD+VOoWrF+6t
         lyXIynHSosT7BlOE73lTyuNE/7P7+x3lrMZprtBpxGkd4gPw6kFnA0+dh/X/F/wcOEjs
         4UCZeLm/U0O3f9E93wfg+FxKP6MBGubp6vjHZ+u2xpcHr47utC2u6BFLnrc/SYDhDBCL
         uVgFMKVM91PRZIteQKy2oK6U3yDvUyJ+SmS+yw5WY0MgDqprMhNuaF2gVReff8BMotOW
         aUgEdhhnIgGahTAese4eF5A+bH/gXsapPdlZh2IWU/d+nHYsvFWeckBl9wIhnQvVTtng
         ihAg==
X-Gm-Message-State: APjAAAXXAJpJhhudp47ZrLc3GQk5HhXCwPNcolvIFZapdcEWecwbTFWZ
        P1Joz/41oMkGumnBICgkCnlrzM8m//8i8pKupuA=
X-Google-Smtp-Source: APXvYqzMxXTMtLrRQLX/dEURksOk7PCufo61wOnQ/mZs63v+ADl3uLwP1Tm04da4I4m2aNnuGwiIBNcRO8G3ne3Mao4=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr1618764otk.39.1571990063180;
 Fri, 25 Oct 2019 00:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXuD4trBjqjgvZ3bimtDEHj4VNeG5-5NHFXkrOvYPd4=w@mail.gmail.com> <TYAPR01MB4544AA3E636D8CCF46623B23D8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544AA3E636D8CCF46623B23D8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Oct 2019 09:54:11 +0200
Message-ID: <CAMuHMdX1tGGebY7bRwQAzt5CwPSGtqSXXsB=-J_R2N2zCM0J1g@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: rcar-usb2-clock-sel: Add reset_control
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

On Fri, Oct 25, 2019 at 3:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, October 24, 2019 8:26 PM
> <snip>
> > > This hardware needs to deassert resets of both host and peripheral.
> > > So, this patch adds reset control.
> >
> > If the hardware needs it, probably you want to make CLK_RCAR_USB2_CLOCK_SEL
> > select RESET_CONTROLLER?
>
> You're correct. I'll fix it.
>
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > > --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> > > +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
> >
> > > @@ -164,6 +172,10 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
> > >         if (IS_ERR(priv->clks[CLK_INDEX_HS_USB]))
> > >                 return PTR_ERR(priv->clks[CLK_INDEX_HS_USB]);
> > >
> > > +       priv->rsts = devm_reset_control_array_get_optional_shared(&pdev->dev);
> >
> > If the reset is really needed, you should not use the optional API.
>
> That's true. So, I'll use devm_reset_control_array_get(&pdev->dev, true, false)

Any reason you need the array version? Are there multiple resets to be
specified? No longer shared?

Which brings to my attention you forgot to document the resets in the
DT bindings ;-)


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
