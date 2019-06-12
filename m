Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3C17420C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 11:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbfFLJ3f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 05:29:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33588 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408714AbfFLJ3f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 05:29:35 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so8601355ljg.0;
        Wed, 12 Jun 2019 02:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+wZR/U26LxMZZsL2pq8tos5i0sdTQA0mmAhtC4aOXiU=;
        b=GvAvRyUTpOM+hYKYOvlr5Aq4P0ltvy8y6706W5H3QYbdfqna/29jFs7TqUDO2+0Ht/
         0juEeHkNhaNHrfgfg0lrapLVZIk3bzNWY4ZhS1mDtyRX/hyTir2qGhOLyAd1Yk48Ot30
         /TeeZ8xibuNg5wqy2Rh9jz3qN8u34ar53zb3fnCdCUQw6C2+mhouuKbI3B71+jqrQ+v+
         prB+NO5P5CCR+/mX4UnRmijmlu7IC2dtEKT5cUXgdqEdlN1BevFj4UXeCJrWx7xnakKE
         eTpqff/fI1L2zZjVs1NkByTwda0YWUeZhfJ0jcqlmsGEI6Les5hCfTAXeWC9qU7HydEb
         /X+Q==
X-Gm-Message-State: APjAAAXhhaZr4n6bOzQLAfKahk/gtqRcnWPTJonF6Ra2P6SKxOyF1mhS
        f1quv6q71vzHrqMAR/wFPgSpJaez5uVTargBdF4=
X-Google-Smtp-Source: APXvYqxXk5JFsr9ROImutyZqBLsvJNkJzw8a08dkiITIztEndboaoP3iA2APoKTI/cEw7zGBjcfuxsX2Nb7BgIGSiK8=
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr18667922lji.133.1560331773070;
 Wed, 12 Jun 2019 02:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com> <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 11:29:19 +0200
Message-ID: <CAMuHMdWcTKAC8V5S0=asvs2eekc4dH72G3rMT5dxqRd8ouPNBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Wed, Jun 12, 2019 at 10:39 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 12 June 2019 09:28
> > Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
> >
> > On Fri, Jun 7, 2019 at 10:14 AM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > This patch adds uSD and eMMC support to the HiHope RZ/G2M
> > > board.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> >
> > > +&sdhi3 {
> > > +       pinctrl-0 = <&sdhi3_pins>;
> > > +       pinctrl-1 = <&sdhi3_pins>;
> > > +       pinctrl-names = "default", "state_uhs";
> > > +
> > > +       vmmc-supply = <&reg_3p3v>;
> > > +       vqmmc-supply = <&reg_1p8v>;
> > > +       bus-width = <8>;
> > > +       mmc-hs200-1_8v;
> >
> > Does the eMMC support HS400, too?
>
> The eMMC does support HS400, but if I list it here the eMMC won't work properly as the SoC can't deal with it.
> Wolfram's patch blacklists HS400 for the RZ/G2M (revisions "ES1.[012]"):
> https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg40630.html
> I was thinking about sending a follow-up patch to list hs400 here after Wolfram's patch appears in a RC, would
> that be okay with you?

Fine for me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
