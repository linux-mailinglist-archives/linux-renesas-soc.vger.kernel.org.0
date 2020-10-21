Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D5E29493E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Oct 2020 10:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502232AbgJUISs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Oct 2020 04:18:48 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:42489 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408552AbgJUISr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 04:18:47 -0400
Received: by mail-oo1-f68.google.com with SMTP id l18so336546ooa.9;
        Wed, 21 Oct 2020 01:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UhV6rB6vz5Ss3V8I93H5xdVqOfQ6DPWLt6i7PXT4tlo=;
        b=fJIDFGGBqaSK17iwvcid8aOqhufb8+I7xilWS4uEBpuxGrHJUbCCItximiA49kcZO1
         85XFgSjQWMfmqb+oS7goSitpLZMOFKsr6gubUycQahBsLTTyCwldWl9FRNTJW8pvSh5V
         dpbY1t5nGp2E+hr8vqBjmnOlXO6LBv9EL7VRkBh7U6SwRRiVs4yX9HFyFQdsKvm9zqR+
         hgOPlyMbk9KSxslm0Fx/SH4g1kiYqi0dmDrg+3/jIgff95wPoimiWLLXNvWBeHG2i6B5
         68GMjnDyQzqteOr57JDUKd94bEISRA2HvdcDXdQEZlMBJyJ3L9IVVbSjgGYH9796flX0
         iZrg==
X-Gm-Message-State: AOAM531IitroOQQx5+c6MCYzrNjkSAupQ2mSPjzhPMJo3mrdRlX1WfIK
        qfDu7eqniBTDTlXycmZhc0JdKrRGWOmqpklC81WlpSpV
X-Google-Smtp-Source: ABdhPJxaK2I+18d1lZPLPi1oQBCvTZ+2D5JfVYWQzi67WRMoQJgl3Z0d/tOwAPLQouaQQIQJc4xJeNNsNvcZfpmPp2M=
X-Received: by 2002:a4a:4f17:: with SMTP id c23mr1657321oob.11.1603268326494;
 Wed, 21 Oct 2020 01:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-4-geert+renesas@glider.be> <TY2PR01MB3692A94AF01CE95C4E206279D81C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692F7578166FE096586FB18D81C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692F7578166FE096586FB18D81C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Oct 2020 10:18:35 +0200
Message-ID: <CAMuHMdW_5FJmjfCzWYomBHTNT3ij4WqqKSgbEAtBvC2qPaWi_A@mail.gmail.com>
Subject: Re: [PATCH/RFC 3/6] clk: renesas: r8a779a0: Add PFC/GPIO clocks
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Oct 21, 2020 at 10:07 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Yoshihiro Shimoda, Sent: Wednesday, October 21, 2020 4:41 PM
> > > From: Geert Uytterhoeven, Sent: Monday, October 19, 2020 9:06 PM
> > >
> > > Add the module clocks used by the Pin Function Controller (PFC) and
> > > General Purpose Input/Output (GPIO) blocks, and their parent clock CP.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Untested on actual hardware.
> > >
> > > Note that the BSP uses MAIN instead of EXTAL, just like for the CBFUSA
> > > clock.  However, according to Figure 8.1.1 ("Block Diagram of CPG (R-Car
> > > V3U-AD)") in the R-Car V3U Series User's Manual Rev. 0.5, the parent of
> > > the CP clock is EXTAL, which matches earlier R-Car Gen3 SoCs.
> >
> > Thank you for the patch!
> >
> > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> I'm afraid but, since the upstream code doesn't have the following "vin3[567]"
> lines, we should remove it from this patch. After fixed it,
> you can use my Reviewed-by :)

Right, I had marked Jacopo's VIN clock patch for application to
renesas-clk-for-v5.11, but haven't actually done that, only in my local
tree.

But probably it does make sense to reorder the patches, and apply the
GPIO one first.

> >@@ -180,6 +181,10 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
> >       DEF_MOD("vin35",        827,    R8A779A0_CLK_S1D1),
> >       DEF_MOD("vin36",        828,    R8A779A0_CLK_S1D1),
> >       DEF_MOD("vin37",        829,    R8A779A0_CLK_S1D1),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
