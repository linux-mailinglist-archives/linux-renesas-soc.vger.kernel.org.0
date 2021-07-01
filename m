Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64493B923B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 15:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhGAN2r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 09:28:47 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:36556 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhGAN2r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 09:28:47 -0400
Received: by mail-ua1-f46.google.com with SMTP id g21so2449847uaw.3;
        Thu, 01 Jul 2021 06:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+LMKfGX5QiIIJW0VnS8uP0FcfMP24ahqqhP+VT+slI4=;
        b=t2mVnXUoi0HTpuS+22jqAyrAn80iqILFKLBDCoKv2BSMTZyEz8uOlTexnyMzzb36qh
         7O1Q6IQcD+s3AqYzhnGPdhvbjgwTcjDaZiWZgKrdhpEsB8/SNKVFPzeKgGgfvUiE3VKd
         KHubLkJeHZW4wKmjT+kpRAqzv4MVLkIpurJEF3Fi/hisYL27EBNdmtaAz33Q2d843cil
         ryGT74tYmJtClLWfWAZznoPlb6wG4HALTXFk6e0xcRGlrNs/Prcio2FTlkc3x/7o9NiP
         CUWMmiwR/edAEjsa+Rj0eO1w8z2v/N+GYb50LhoD3EfzgdzBQs/yzJBmKq9G8uX0wE6r
         6YWw==
X-Gm-Message-State: AOAM530xrmFYRIlYLzdeqgc8czq0qTa5zRewo36uxkV5GSsERQQgZxMF
        deGna/pO0pdL8eNeonCKMbeeeYZawValPBafJZ0=
X-Google-Smtp-Source: ABdhPJyJAvVepGKfk4LFxCPn2cnXU5wZukB39aB+9YncTHlHo2Pe6suiWAKgaxw4130D3BN/MKTNHiQs++oaYb9qJkY=
X-Received: by 2002:ab0:647:: with SMTP id f65mr38948623uaf.4.1625145976138;
 Thu, 01 Jul 2021 06:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-5-biju.das.jz@bp.renesas.com> <CAMuHMdV8sH6LnBXmVWO7ua+bHOqhbvmQ4XUbv-_UGCwfa83WOg@mail.gmail.com>
 <OS0PR01MB59223D3E0DA71C15A780BD8086009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59223D3E0DA71C15A780BD8086009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Jul 2021 15:26:05 +0200
Message-ID: <CAMuHMdXZrDx++iiiQTaSeQf4zUJVRmbFOVt-JdgQM-J-Yvu9XA@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks/resets
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Jul 1, 2021 at 2:41 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 04/11] drivers: clk: renesas: r9a07g044-cpg: Add
> > USB clocks/resets
> > On Wed, Jun 30, 2021 at 9:30 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Add clock/reset entries for USB PHY control, USB2.0 host and device.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v2->V3:
> > >  * Added reset entries.
> >
> > Thanks for the update!
> >
> > > --- a/drivers/clk/renesas/r9a07g044-cpg.c
> > > +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> > > @@ -96,6 +96,14 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
> > >                                 0x52c, 0),
> > >         DEF_MOD("dmac_pclk",    R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
> > >                                 0x52c, 1),
> > > +       DEF_MOD("usb0_host",    R9A07G044_USB_U2H0_HCLK,
> > R9A07G044_CLK_P1,
> > > +                               0x578, 0),
> > > +       DEF_MOD("usb1_host",    R9A07G044_USB_U2H1_HCLK,
> > R9A07G044_CLK_P1,
> > > +                               0x578, 1),
> > > +       DEF_MOD("usb0_device",  R9A07G044_USB_U2P_EXR_CPUCLK,
> > R9A07G044_CLK_P1,
> > > +                               0x578, 2),
> >
> > The names are not really used, but the lock list spreadsheet describes
> > this clock as the usb0 function clock, so perhaps "usb0_func" is more
> > appropriate?
>
> OK. Will change it to "usb0_func".

No need to resend, will fix that while applying.
i.e. will queue in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
