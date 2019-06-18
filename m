Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5912C49E7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 12:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbfFRKpA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 06:45:00 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52168 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729098AbfFRKpA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 06:45:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0322325AED3;
        Tue, 18 Jun 2019 20:44:57 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F357B9408C4; Tue, 18 Jun 2019 12:44:55 +0200 (CEST)
Date:   Tue, 18 Jun 2019 12:44:55 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a77990: Add cpg reset for
 LVDS Interface
Message-ID: <20190618104455.72jyrvwf2vut76hy@verge.net.au>
References: <20190617083704.3941-1-horms+renesas@verge.net.au>
 <20190617083704.3941-2-horms+renesas@verge.net.au>
 <CAMuHMdUu2T2+Ri_xEq+Nr1qD_Dm067TDkfxTDpduX4xia2FGDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUu2T2+Ri_xEq+Nr1qD_Dm067TDkfxTDpduX4xia2FGDQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 10:43:09AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Jun 17, 2019 at 10:37 AM Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > It is necessary to reset the LVDS Interface according to display on/off.
> 
> This is not the LVDS interface.
> The LVDS interface has its own device node.

Thanks, how about a changelog more like this?

arm64: dts: renesas: r8a77990: Add cpg reset for DU

Add CPG reset properties to DU node of E3 (r8a77990) SoC.

According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
level so specifying one reset entry per group is sufficient. For this
reason <&cpg 724> is not listed as a reset for "du.1" as was the case in an
earlier revision of this patch.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

> > Therefore, this patch adds CPG reset properties in DU device node
> > for the R8A77990 SoC.
> >
> > According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
> > level so specifying one reset entry per group is sufficient. For this
> > reason <&cpg 724> is not listed as a reset for "du.1" as was the case in an
> > earlier revision of this patch.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > v2 [Simon Horman]
> > - only add one reset entry per group
> >
> > v1 [Yoshihiro Kaneko]
> >
> > v0 [Takeshi Kihara]
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > index b4318661f35e..84d1f58e73e7 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -1766,6 +1766,8 @@
> >                         clocks = <&cpg CPG_MOD 724>,
> >                                  <&cpg CPG_MOD 723>;
> >                         clock-names = "du.0", "du.1";
> > +                       resets = <&cpg 724>;
> > +                       reset-names = "du.0";
> >                         vsps = <&vspd0 0 &vspd1 0>;
> >                         status = "disabled";
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
