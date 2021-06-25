Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB01F3B484F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 19:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhFYRok (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 13:44:40 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:37408 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYRok (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 13:44:40 -0400
Received: by mail-vs1-f49.google.com with SMTP id x12so5885881vsp.4;
        Fri, 25 Jun 2021 10:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yjcOGizjBfQzHAKJEBVRMT/sqhNXvOrL88cmu4CJXo=;
        b=nswAUBIUs/f/jvcFBNrpMlUBYzhCWENSHMrAjEb6YvaUDK7uASm4o+aE7FiYykBVqP
         nGESq54jwvDv5/+ZtjDtRadjt2zPs8kSJtK+UjUUE1nORwOOStnBeptZNM9DlhJw4Uf9
         QiWy/Y/vW2uuRB3ba1y7Nfg25Q+1XUIO+akl2lEkaBf07645kHiwKKcFQZ6MKBfPdnXM
         roM429Q+f29QNqj79e7Bz+QSaGw5xPgndQU7Gp52GwFJ7ayt2u8c/uzkXlMhIoxGz8fg
         rnPRWX9R01JO3wUBGcD0TnHQjQYFAyPcMSaSHPsHKUDmisL4Vt9F+5CUWsG6kaJBz005
         tq8Q==
X-Gm-Message-State: AOAM531jy6f4ecN/m0FZJLuhwG3Nv7y/NvMbj3m5m8olV0ciBpA+OIlC
        TmdcQ0OcTo+ca2iGB8ATJg59vXVGo9CT3hSrUvch5NvAl92Oiw==
X-Google-Smtp-Source: ABdhPJw7ZtODtxUWPp4+KDDII8duWVR+2teiq38uyDi00hyh551oQsN59aivv3gtObkcKGF05gHgi59bo8IRv+VIQBo=
X-Received: by 2002:a67:7787:: with SMTP id s129mr10547808vsc.40.1624642938782;
 Fri, 25 Jun 2021 10:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
 <20210624130240.17468-8-biju.das.jz@bp.renesas.com> <CAMuHMdWHz1RZ9qsbNHC9ded4x3HWCRBdRyFF2qAY4XGzV9hR2A@mail.gmail.com>
 <OS0PR01MB59229982F896C8CE60A64C5986069@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59229982F896C8CE60A64C5986069@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 19:42:07 +0200
Message-ID: <CAMuHMdXic7vHg=-OaZ-CSzZjjideTzggitg9pz7xsLMdFH07qQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock/reset entries
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

On Fri, Jun 25, 2021 at 6:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 07/11] drivers: clk: renesas: r9a07g044-cpg: Update
> > {GIC,IA55,SCIF} clock/reset entries
> > On Thu, Jun 24, 2021 at 3:03 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Update {GIC,IA55,SCIF} clock and reset entries to CPG driver to match
> > > with RZ/G2L clock list hardware manual(RZG2L_clock_list_r02_02.xlsx)
> > > and RZ/G2L HW manual(Rev.0.50).
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > --- a/drivers/clk/renesas/renesas-rzg2l-cpg.h
> > > +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
> > > @@ -78,7 +78,6 @@ enum clk_types {
> > >   * @parent: id of parent clock
> > >   * @off: register offset
> > >   * @onoff: ON/MON bits
> > > - * @reset: reset bits
> > >   */
> > >  struct rzg2l_mod_clk {
> > >         const char *name;
> > > @@ -86,17 +85,15 @@ struct rzg2l_mod_clk {
> > >         unsigned int parent;
> > >         u16 off;
> > >         u8 onoff;
> > > -       u8 reset;
> > >  };
> > >
> > > -#define DEF_MOD(_name, _id, _parent, _off, _onoff, _reset)     \
> > > +#define DEF_MOD(_name, _id, _parent, _off, _onoff)     \
> > >         [_id] = { \
> >
> > Hadn't realized this before, but do you need the "[_id] ="?
> > rzg2l_cpg_info.mod_clks[] is only indexed during initialization.
> > If there are gaps due to not all clocks being implemented yet, they are
> > skipped by the .name check in rzg2l_cpg_register_mod_clk().
> > But I think you can just remove the gaps instead, decreasing kernel size
> > (for now).
>
> That means we need to loop through the array and find out the index corresponding to the ID.
>
> Current implementation, we don't need to find out ID iterating through LUT. But as you
> said it is at the expense of kernel memory.
>
> Speed vs memory. Long term any way we will fill the holes. The max index now is 96.

Unless I'm missing something, this array is only used for initializing
the clocks?  Clock lookup by ID is done using rzg2l_cpg_priv.clks[],
which is indexed by ID.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
