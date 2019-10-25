Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501B4E44CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 09:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437153AbfJYHrQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 03:47:16 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42681 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfJYHrQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 03:47:16 -0400
Received: by mail-oi1-f194.google.com with SMTP id i185so921163oif.9;
        Fri, 25 Oct 2019 00:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8zZtV2+T6wNs6wwQzlNZ1qpgoJVUirP0Vg0dJEJ2LHU=;
        b=MHxrOpqGq4xo2+2n54Zv07nd8+wD33s5MSB9p5hig9053aIh1VzVnKhdPl2RPyoIhg
         TCa10jY5nfKHiR7lp2VP41IV8Pvt0c1JEvDgeabkWGXmW7C+qVHu7OPCmJZ3TLIP+AHP
         ivTrc8TwGR6H9cR2O+073confFc37sI++1kGu6GivUIWIfCItq4EsHXJnb6yVJ2pSKrx
         kf3xfdBmwgWx4stDFIdDVm8VPm2FM+M5VOTN7PSsOt3WEmBfhdS9baC0kHImt4zG1aa5
         V7n52Vy8boCURcHqStzQ+Wm8VqzwaqgT1eCiPCkALyJfFAW3RB0TzZFaE/RN0ulzx7ZI
         Bdxg==
X-Gm-Message-State: APjAAAXlmPwRly66QOWc8F+AvJlvz0pMzUBfSp0/z52GRzhiSsUebnlC
        BdZoDb4Xduvzw8yKLt4LiUROOn5E61AJllBfADw=
X-Google-Smtp-Source: APXvYqz2j1UKxPbK8D0J/lYB0lvG5GuWdZkQfM2ar/MyijONb1BrRq7aN1+gUIH15B2ywbc4PnGj5rJ7bKq9QfnqEE0=
X-Received: by 2002:aca:882:: with SMTP id 124mr1813914oii.54.1571989635617;
 Fri, 25 Oct 2019 00:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU=58w=4A0WcqytFfyV_Q11BgYaDNsMsA8Z15mnm--ang@mail.gmail.com> <TYAPR01MB4544D5F2A77FBBA7B0AF7EBDD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544D5F2A77FBBA7B0AF7EBDD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Oct 2019 09:47:04 +0200
Message-ID: <CAMuHMdV7upJi78CymxVYKzDdFWb-qHrnohfnULbNfXjF-QXKRA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rcar-usb2-clock-sel: Add multiple
 clocks management
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

On Fri, Oct 25, 2019 at 3:36 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, October 24, 2019 8:35 PM
> <snip>
> > > --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> > > +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c

> > > @@ -131,6 +156,14 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
> > >         pm_runtime_enable(dev);
> > >         pm_runtime_get_sync(dev);
> >
> > pm_runtime_get_sync() will have already enabled the first module clock listed in
> > the DT "clocks" property.
> >
> > If you want the driver to manage all clocks itself, perhaps the PM Runtime
> > calls should be dropped?
>
> I'm thinking PM Runtime calls are related to power domain control so that we cannot
> drop it. Or, since the hardware is the Always-on domain, can we drop it anyway?

That's right: if the hardware block ever ends up in a non-always-on
power domain,
you won't have a choice but to use PM Runtime.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
