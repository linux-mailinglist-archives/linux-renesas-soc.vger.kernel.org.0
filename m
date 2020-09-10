Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47812640FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729971AbgIJJKr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:10:47 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:36431 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728709AbgIJJKi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:10:38 -0400
Received: by mail-oo1-f67.google.com with SMTP id z1so1268070ooj.3;
        Thu, 10 Sep 2020 02:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rA2+XQB/EdSPP3NHBy9dTOy3jgbFce8Gbypr0acksc4=;
        b=rUiPW6T4PLKenfUJgLwp9lOcj68uoOAQY2sB1neyNSuquBe8EWnAwBz9o3zWZlQSlr
         dvNAfugUyPHrvztp7PW92YA487yI0U+y6r0IU+RwtkTnPBzooOdo9oAz/xK6ka7FZZMJ
         X0u/+quDDkgpYnwtiY3+nN83Tcq1FPNf2m4/MLSWWWdFdW7upEpgPccmJh4gGDTvhv4r
         PPK3lM8OlNVkQXWdu1GzDLYvkIdRwy9BA0vaoplmi2W6nMFATKcpuxWUZef9jabWrM/a
         rL+9ZZO+1iuWbDdA1JDZpt6HQL0MD3I3esKihylQerdTVGVp59kb1FDEQkSQanT9jDH+
         IYmw==
X-Gm-Message-State: AOAM532QPWOY+MTm3GsjRSyIkK01PndcOjkaWm2HWss60K7psPFHghNU
        iFvPQFtq6pItKNi5Gd59K/L2YYwTsm4udIe5WBM=
X-Google-Smtp-Source: ABdhPJyvXlcZo89pVdXKPNxwROy/i/l7foRHt6CRCj8jT0NFlecXcHFwbiO8WUHwgUvF5kN473rZLpqsmj3Pa9Eq5mA=
X-Received: by 2002:a4a:da4e:: with SMTP id f14mr3733302oou.40.1599729037227;
 Thu, 10 Sep 2020 02:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX_be=+3soDGQBxPGvjF5Ty40wDEPaki3Z=SwbDToPA3g@mail.gmail.com>
 <TY2PR01MB3692F7496EE91E633E9EF68AD8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdUUqdqf0unaT5efUL-VmSD8Vh1PH69qOqiWZZFLmTGGDg@mail.gmail.com> <TY2PR01MB36920EF68291EF53EE91D2E7D8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36920EF68291EF53EE91D2E7D8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:10:25 +0200
Message-ID: <CAMuHMdU4s_yBDCfxZtsYSa1m_CGWKtXDjNL+OHni3XoPJfKrJg@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas Falcon boards
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

On Tue, Sep 8, 2020 at 10:45 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, September 8, 2020 4:12 PM
> > On Tue, Sep 8, 2020 at 3:01 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Geert Uytterhoeven, Sent: Tuesday, September 8, 2020 12:31 AM
> > > > On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > Add device tree bindings documentation for Renesas R-Car V3U
> > > > > Falcon CPU and BreakOut boards.
> > > > >
> > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > > > > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > > > @@ -283,6 +283,9 @@ properties:
> > > > >
> > > > >        - description: R-Car V3U (R8A779A0)
> > > > >          items:
> > > > > +          - enum:
> > > > > +              - renesas,falcon-cpu # Falcon CPU board (RTP0RC779A0CPB0010S)
> > > > > +              - renesas,falcon-breakout # Falcon BreakOut board (RTP0RC779A0BOB0010S)
> > > > >            - const: renesas,r8a779a0
> > > >
> > > > How is this intended to be used?
> > >
> > > I intended to use "renesas,falcon-breakout", "renesas,falcon-cpu", "renesas,r8a779a0"
> > > in the future. However, if so, I should fix the description like Kingfisher.
> > >
> > > > The above means its users should declare either
> > > >
> > > >     compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
> > > >
> > > > or
> > > >
> > > >     compatible = "renesas,falcon-breakout", "renesas,r8a779a0";
> > >
> > > I understood it. I mistook the description...
> > >
> > > > However, falcon-cpu.dtsi has just
> > > >
> > > >     compatible = "renesas,falcon-cpu";
> > > >
> > > > Who will use "renesas,falcon-breakout"?
> > >
> > > I intended to add falcon-breakout.dtsi and the file intended to use
> > > "renesas,falcon-breakout" like Kingfisher + ULCB in the future.
> > >
> > > However, I realized a combination between the cpu board and
> > > the breakout board differs than ULCB + Kingfisher like below:
> > >
> > > - The ULCB without the Kingfisher can work.
> > > -- So, some .dts files exist like r8a77951-ulcb.dts.
> > > -- And, r8a77951-ulcb-kf.dts includes r8a77951-ulcb.dts for ULCB + Kingfisher.
> > >
> > > - The Falcon CPU board without the breakout board cannot work actually.
> > > -- But, on this initial patch series enables the CPU board hardware (memory nodes & SCIF0) only.
> > > -- The breakout board has some hardware like Ethernet and CAN.
> > > -- The breakout board also has some connectors for sub boards.
> > > -- So, I intended to add falcon-breakout.dtsi to support Ethernet in the future.
> > >
> > > In this case, I wonder if we should describe just "renesas,falcon" only
> > > because we will not have r8a779a0-falcon-{cpu,breakout}.dts files.
> > > But, what do you think?
> >
> > What kind of connector does the Falcon CPU board have?
> > Perhaps it can be plugged into another base board, too?
>
> The Falcon CPU board has 2 EXIO connectors. The EXIO connector
> has 400 pins. So, I think it can be plugged into another base board.
>
> > What about modelling it like the iwave,g22m SoM, and the iwave,g22d
> > SODIMM board?
> > arch/arm/boot/dts/r8a7745-iwg*
>
> Thank you for the suggestion. So, I'll fix the patch like below.
> ---
>
>        - description: R-Car V3U (R8A779A0)
>          items:
> +          - enum:
> +              - renesas,r8a779a0-cpu # Falcon CPU board (RTP0RC779A0CPB0010S
> +          - const: renesas,r8a779a0
> +
> +      - items:
> +          - enum:
> +              - renesas,r8a779a0-breakout # Falcon BreakOut board (RTP0RC779A0BOB0010S)
> +          - const: renesas,r8a779a0-cpu
>            - const: renesas,r8a779a0
>
>        - description: RZ/N1D (R9A06G032)
> ---
>
> And, I will fix the compatible of r8a779a0-falcon.dts in the patch 14/14 like below.
> ---
> +       compatible = "renesas,falcon-breakout", "renesas,falcon-cpu", "renesas,r8a779a0";
> ---
>
> But, what do you think?

Thanks, looks good to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
