Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAD0E466B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 10:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438120AbfJYI5s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 04:57:48 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35066 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfJYI5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 04:57:48 -0400
Received: by mail-ot1-f67.google.com with SMTP id z6so1526366otb.2;
        Fri, 25 Oct 2019 01:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNHqqS4Uc9aqlwR5IUsahyveCLTdtc01wm1P+k/r7h0=;
        b=uOH5WMqc0j/GBrfMhauo4B5kZSMX6KMnz0uJSYZZcc0i5RSUN73uGrYC0/Q/F21lyQ
         bOSBMDYd+OJFR/MMyYCONd+5cnzaYqqVWxXMtX3Smz/morDlG2SzXwTE9I/4sCA4L2ti
         MH/K8/4ucucscwF4oAx0KGfEZqRgTGg5kZ0G5L9cxjJIWfa1O9CE47/KBclZ7RNNe30D
         mM1hbIAexEbW6op8EsNBesfpF5+MF1ttj/F87P+9KSJM6pARV/AVnWcawmWnNRVCX3Xi
         3JJUzHC+Rpiyxg4U2GIKVjOFGkYulR1WpIqRtDE7NNjWGD4BVEH46pNmMC7UPpXpMMeX
         LN2w==
X-Gm-Message-State: APjAAAX1puTDH4ezYay+BE+FfBAsU87o3A2q7lCQN1Pa/nNowpDSDbr6
        uRJiMqmcUb11GVdcTVSreFRNSs8XSIt0sqfvHPw=
X-Google-Smtp-Source: APXvYqwXZ5hSYo/AaHShqXVhnQPKDDrnniy5ZvaPofKAgeVdRshvXovvQWZivoZJvC/1yJ44x0fPG9nRDYpCtv3h8RQ=
X-Received: by 2002:a05:6830:1bc3:: with SMTP id v3mr951363ota.145.1571993865998;
 Fri, 25 Oct 2019 01:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU=58w=4A0WcqytFfyV_Q11BgYaDNsMsA8Z15mnm--ang@mail.gmail.com>
 <TYAPR01MB4544D5F2A77FBBA7B0AF7EBDD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAMuHMdV7upJi78CymxVYKzDdFWb-qHrnohfnULbNfXjF-QXKRA@mail.gmail.com> <TYAPR01MB4544D173479B25DB73CBFF3CD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544D173479B25DB73CBFF3CD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Oct 2019 10:57:34 +0200
Message-ID: <CAMuHMdWJSjG9h_T75br2OHh6bGeUt2o=MrP1sFdA9f_jm47Hfw@mail.gmail.com>
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

On Fri, Oct 25, 2019 at 10:44 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Friday, October 25, 2019 4:47 PM
> > On Fri, Oct 25, 2019 at 3:36 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Geert Uytterhoeven, Sent: Thursday, October 24, 2019 8:35 PM
> > > <snip>
> > > > > --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> > > > > +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
> >
> > > > > @@ -131,6 +156,14 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
> > > > >         pm_runtime_enable(dev);
> > > > >         pm_runtime_get_sync(dev);
> > > >
> > > > pm_runtime_get_sync() will have already enabled the first module clock listed in
> > > > the DT "clocks" property.
> > > >
> > > > If you want the driver to manage all clocks itself, perhaps the PM Runtime
> > > > calls should be dropped?
> > >
> > > I'm thinking PM Runtime calls are related to power domain control so that we cannot
> > > drop it. Or, since the hardware is the Always-on domain, can we drop it anyway?
> >
> > That's right: if the hardware block ever ends up in a non-always-on
> > power domain,
> > you won't have a choice but to use PM Runtime.
>
> So, should I keep the PM Runtime calls?

I think they're good to have.
Just make sure the PM Runtime status matches the state of the other
clocks.

> # In such the case, I should add to describe power-domains property into
> # the dt-binding doc though :)

Indeed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
