Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF89262754
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 08:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgIIGrq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 02:47:46 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40325 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgIIGrp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 02:47:45 -0400
Received: by mail-ot1-f67.google.com with SMTP id e23so1400275otk.7;
        Tue, 08 Sep 2020 23:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cf0vX7GvijMmMESRM5VUB6x75pchWY6zKNqJHJGGkks=;
        b=RmsSnUGgft4hivTHElhypKPBXnZ2tJx1elbyfIg40hAqjRRO+YeZI3qzsx0fQyo8qa
         IeNTJKGyc/eDnweCCA9NS3osfTOtgl2634Oz1dGswLiWcwdDnlcjJNKmQng+X5Pi01ZW
         7E8nm2bOdA+0T/nexxErZzZWS4NSZL09oB7LJzfyAp18HroRLxmCHyHTdK8+UVnaQfoR
         Nm5/8/1r+w4I4sAv54Beh190ccNMKjB8AENX2R3GIFFBTj4LHhkdbDVpqNB+d4aXE/dI
         X7aC7iMR6nw1t9v3tIdu9CGGjvD42Xx0iHpcKZ/+hTJ0JX9qzNqycKuNpTSMk3KOHi58
         Wy8Q==
X-Gm-Message-State: AOAM532/RmuswlxFBva91OAeDfiOMAe6vwZ3RrC/7CB783TQSe+QKTVK
        LSAOg4o3p659Opkzd6fvevbAoCcTwToSQMSCEbM=
X-Google-Smtp-Source: ABdhPJymwPzT0Y1bq1L93rE2cyEHTa0TX67bo9ysk7iAS4dhG6PZAtSyly6t8XORivDaIHykU6xwflZbpzuAlhL7HZY=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr1840135otp.107.1599634064085;
 Tue, 08 Sep 2020 23:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVAgN69p9FFnQdO4iHk2CHkeNaVui2Q-FOY6_BFVjQ-Nw@mail.gmail.com> <TY2PR01MB36926058A1379C68CDC6BFD6D8260@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36926058A1379C68CDC6BFD6D8260@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Sep 2020 08:47:32 +0200
Message-ID: <CAMuHMdUanmLr=1dA=3=S5nMnSYoKoQs+W7aaL=CZXfkXZ45gBw@mail.gmail.com>
Subject: Re: [PATCH 12/14] clk: renesas: cpg-mssr: Add support for R-Car V3U
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Sep 9, 2020 at 4:53 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, September 9, 2020 12:22 AM
> > On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Initial support for R-Car V3U (r8a779a0), including core, module
> > > clocks and register access, because register specification differs
> > > than R-Car Gen2/3.

> > > +struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
> > > +       const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> > > +       struct clk **clks, void __iomem *base,
> > > +       struct raw_notifier_head *notifiers)
> > > +{
> >
> > > +       case CLK_TYPE_R8A779A0_PLL20:
> > > +               value = readl(base + CPG_PLL20CR);
> > > +               mult = (((value >> 24) & 0x7f) + 1) * 2;
> > > +               break;
> > > +
> > > +       case CLK_TYPE_R8A779A0_PLL21:
> > > +               value = readl(base + CPG_PLL21CR);
> > > +               mult = (((value >> 24) & 0x7f) + 1) * 2;
> > > +               break;
> > > +
> > > +       case CLK_TYPE_R8A779A0_PLL30:
> > > +               value = readl(base + CPG_PLL30CR);
> > > +               mult = (((value >> 24) & 0x7f) + 1) * 2;
> > > +               break;
> > > +
> > > +       case CLK_TYPE_R8A779A0_PLL31:
> > > +               value = readl(base + CPG_PLL31CR);
> > > +               mult = (((value >> 24) & 0x7f) + 1) * 2;
> > > +               break;
> >
> > Perhaps CLK_TYPE_R8A779A0_PLL[23][01] can share a common type, encoding
> > the register offset in cpg_core_clk.offset?
>
> I think so. If so, should I add a new macro in the r8a779a0-cpg-mssr.c to set .offset?

Indeed, a new macro similar to the existing DEF_GEN3_SD().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
