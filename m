Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232F028FE58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 08:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394249AbgJPGbk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 02:31:40 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33291 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394244AbgJPGbk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 02:31:40 -0400
Received: by mail-ot1-f66.google.com with SMTP id t15so1508734otk.0;
        Thu, 15 Oct 2020 23:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ROAI7V0cyZg7AP0LFun/mv0zfNkM5pWxF5hFVn1DqmQ=;
        b=HhNvQ53kM4MIULfe4th0W2hbpyrs2hHALwhbOQ9iAF2DNv4CRsimK/7VktEXE3VH9t
         XsgToGTCaD8QhXvR6pC5hE80BVzMVm/easYRKvpVvVZrtvVjYA2AffNtnfO1Kzhrak3/
         mPXDubjvRhPIvrau0DVxqmpuFcqt1PznmJLqCiCpEmQH3924B6mLGtjyV/uxzE+RBprH
         gD4q5X+ehlieu4ax2JMRvwtTO67v3gYeq+27tD/vAVOZOx80FmGHPSmawX9WcyL0yRST
         JwLEBgfIa3hiWyY6ATCd/j6Ux/vXRtgOU0nct/xDEyXLmI/tFTjJlF0vnTCdijhtFUc9
         ZFMA==
X-Gm-Message-State: AOAM532R5JxGKralfZQ2f2eSCpUXhjYIz3ngaf1tf6NdWLy/sBv7PGqV
        jP7XzxdDnFI7ylkpTx+2tZPOS1wexAdG8XJLWf0=
X-Google-Smtp-Source: ABdhPJwiEwJQj2hOFsIxeixjoNWjhOjLsSHgq4tUbeqNWYj/lkUPFTv4bGRDzd1EeBxLflPct8Gw+eUwfvoS1L8oe+I=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr1473765otc.145.1602829899178;
 Thu, 15 Oct 2020 23:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201015132350.8360-1-biju.das.jz@bp.renesas.com>
 <20201015132350.8360-2-biju.das.jz@bp.renesas.com> <CAMuHMdXu3AKFAY3b6SfWgpQL9VBJBC9HL4ZK5EFu=7FZ2zJoXA@mail.gmail.com>
 <TYBPR01MB5309036B8D9960CDE8B0A9BE86030@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5309036B8D9960CDE8B0A9BE86030@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Oct 2020 08:31:27 +0200
Message-ID: <CAMuHMdV00mfk73wyCCZrV8xHLnNmYkfQP2H10Ut7f2VCyoNC7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: cat875: Remove rxc-skew-ps from
 ethernet-phy node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Oct 16, 2020 at 8:13 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 2/2] arm64: dts: renesas: cat875: Remove rxc-skew-ps
> > from ethernet-phy node
> > On Thu, Oct 15, 2020 at 3:24 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > The CAT875 sub board from Silicon Linux uses Realtek phy and the
> > > driver does not support rxc-skew-ps property.
> > >
> > > Fixes: 6b170cd3ed02949f ("arm64: dts: renesas: cat875: Add ethernet
> > > support")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> > > @@ -21,7 +21,6 @@
> > >         status = "okay";
> > >
> > >         phy0: ethernet-phy@0 {
> > > -               rxc-skew-ps = <1500>;
> > >                 reg = <0>;
> > >                 interrupt-parent = <&gpio2>;
> > >                 interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
> >
> > Should "rx-internal-delay-ps = <1800>" be added to the avb node instead
> > (after [1] has entered v5.10-rc1, and the DTS part of [2] has been  applied to
> > renesas-devel)?
>
> Looking at the schematic, it is not needed, since it has "2ns" internal delay  (4.7K Ohm latched to 2.5 V) on the Rx side.

Thanks for the pointer, I can confirm LED2_RXDLY is strapped high
(to 3.3V, not 2.5V though).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
