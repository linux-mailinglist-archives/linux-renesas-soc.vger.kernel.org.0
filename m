Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126243A2DB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 16:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhFJOIa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 10:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbhFJOIa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 10:08:30 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E09C061574;
        Thu, 10 Jun 2021 07:06:20 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id f84so41024340ybg.0;
        Thu, 10 Jun 2021 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tbM+etLOCSLCI1Qw+ID4onOsBsF0/cT0k6PPBLohEEM=;
        b=sYquY0wXd7bW286zgFipmH21BGe2tJ8QWI54e7+eVWyKh6h0yENOIgFADqFeJkJIZo
         d6amP4Oef1JMdmYHIs7YsLfQJbFKlrmWS7hTqCd2AJs2Vj3SyxcMph2dJpI+/WmbitFj
         tPpNuG3c8HnhagusKy71Qou+Hl0NISJ3S1UNbQ+nRHI2ou1XGVTnEF/NzYxb6FzLHbhn
         4O7SHdsW3RVxtRst6231aj9J9N7TmtlEcScDqDuIfCkM1P2voTlm+CtRP6vH6vHpCrH5
         colXVGG1CMWP3/W3hg0ZoeJD/zAOsvTi87ZfLrPmU9d1smRHOOL0fYSb9EuWl/RxwDnc
         OxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tbM+etLOCSLCI1Qw+ID4onOsBsF0/cT0k6PPBLohEEM=;
        b=CMo4hCampgcxww2cg4QW+S2ue1J8vBJQNlF2xx/Erob54ENhf+CaGDjYPI/XMqQ07S
         Lw5bxiXejs/1oc7+VA3l9SyVD3dqRvB6KclPZK3aa+cLaEH/n3tDz0l1tF643wiQ6J3j
         g5H3YTTVK4BgNssioBwGJ8keCO2Ma//1STC7Jo1IrbcOqkFbwWKFJsCpdbZS79CJ0krP
         fMy0WBgIwxDS7CZjD9v2VmxJ20zJjb7quiUO6kgX5ACL8JZtjv93tvXMxw9h418Su367
         VnJBbUF5ZB3djruwN2U2vFewun/RIIXwwb6Tzx6JqdT4zhEIgvZNFmimzP5y5sIMa1Te
         HMZw==
X-Gm-Message-State: AOAM530KxzoaMuiF/lVZdacULDFPm3lxtvJzZnghpgmBUR94hfaMLLVU
        8f0NYS5Ke4abmwq8WZSTiX/W68RnCC+EevyxbZQ=
X-Google-Smtp-Source: ABdhPJwVgOx4sWZ21Ulp8gv1yGtQDABHTAuMufqFhlIMn3eUt/XbKqQiRWeLAqVCJHFTn9uA9OEiwEkIYZ0Erw+UX0U=
X-Received: by 2002:a5b:54a:: with SMTP id r10mr7760650ybp.476.1623333979162;
 Thu, 10 Jun 2021 07:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210609153230.6967-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXR0y7d2hRi35YsTT2rdOtRzFirGwbVnbUVO2d3yV=mwg@mail.gmail.com>
In-Reply-To: <CAMuHMdXR0y7d2hRi35YsTT2rdOtRzFirGwbVnbUVO2d3yV=mwg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 10 Jun 2021 15:05:52 +0100
Message-ID: <CA+V-a8t5pS3BsOVYWk5ve=pitoKnaf+cBK+ZuNMiER+Ya_tp6Q@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Jun 10, 2021 at 2:04 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jun 9, 2021 at 5:33 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add CPG core wrapper for RZ/G2L family.
> >
> > Based on a patch in the BSP by Binh Nguyen
> > <binh.nguyen.jz@renesas.com>.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/Kconfig
> > +++ b/drivers/clk/renesas/Kconfig
> > @@ -182,6 +182,11 @@ config CLK_RCAR_USB2_CLOCK_SEL
> >         help
> >           This is a driver for R-Car USB2 clock selector
> >
> > +config CLK_RZG2L
> > +       bool "Renesas RZ/G2L SoC clock support" if COMPILE_TEST && !ARCH_RENESAS
>
> s/SoC/family/?
>
Agreed.

> I think "if COMPILE_TEST", as all other entries are using, is sufficient.
>
> > +       depends on ARCH_RENESAS || COMPILE_TEST
>
> I think this can be dropped.
>
Agreed.

> > +       select RESET_CONTROLLER
> > +
> >  # Generic
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
>
> > +static struct clk
> > +*rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> > +                              void *data)
> > +{
> > +       unsigned int clkidx = clkspec->args[1];
> > +       struct rzg2l_cpg_priv *priv = data;
> > +       struct device *dev = priv->dev;
> > +       const char *type;
> > +       struct clk *clk;
> > +
> > +       switch (clkspec->args[0]) {
> > +       case CPG_CORE:
> > +               type = "core";
> > +               if (clkidx > priv->last_dt_core_clk) {
> > +                       dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
> > +                       return ERR_PTR(-EINVAL);
> > +               }
> > +               clk = priv->clks[clkidx];
> > +               break;
> > +
> > +       case CPG_MOD:
> > +               type = "module";
> > +               if (clkidx > priv->num_core_clks + priv->num_mod_clks) {
>
> The range of module clocks in DT specifiers starts at zero, so
>
>     if (clkidx > priv->num_mod_clks) {
>
Thanks for the catch, yes the above check should be good.

>
> > +                       dev_err(dev, "Invalid %s clock index %u\n", type,
> > +                               clkidx);
> > +                       return ERR_PTR(-EINVAL);
> > +               }
> > +               clk = priv->clks[priv->num_core_clks + clkidx];
> > +               break;
> > +
> > +       default:
> > +               dev_err(dev, "Invalid CPG clock type %u\n", clkspec->args[0]);
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +
> > +       if (IS_ERR(clk))
> > +               dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
> > +                       PTR_ERR(clk));
> > +       else
> > +               dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
> > +                       clkspec->args[0], clkspec->args[1], clk,
> > +                       clk_get_rate(clk));
> > +       return clk;
> > +}
>
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I can fix these while applying.
>
Thank you.

Cheers,
Prabhakar
