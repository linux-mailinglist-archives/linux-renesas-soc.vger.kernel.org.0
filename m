Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD671880D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 11:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfEIJ5x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 05:57:53 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44324 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfEIJ5x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 05:57:53 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DFD1F25AEBF;
        Thu,  9 May 2019 19:57:51 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D94149403F2; Thu,  9 May 2019 11:57:49 +0200 (CEST)
Date:   Thu, 9 May 2019 11:57:49 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a7795: Create thermal zone to
 support IPA
Message-ID: <20190509095749.23b2jnvfks4enkpt@verge.net.au>
References: <20190508115605.13726-1-horms+renesas@verge.net.au>
 <CAMuHMdX3YW0NaDXvN1WjWeNrCH366LALa3UT41REqAHNJk-9JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX3YW0NaDXvN1WjWeNrCH366LALa3UT41REqAHNJk-9JA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 08, 2019 at 03:20:03PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> Thanks for your patch!
> 
> On Wed, May 8, 2019 at 1:56 PM Simon Horman <horms+renesas@verge.net.au> wrote:

...

> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -155,6 +155,7 @@
> >                         power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
> >                         next-level-cache = <&L2_CA57>;
> >                         enable-method = "psci";
> > +                       dynamic-power-coefficient = <854>;
> 
> The dynamic-power-coefficient property is a property of the CPU,
> documented in Documentation/devicetree/bindings/arm/cpus.yaml,
> and not directly related to thermal zones.
> 
> Hence I think its addition should be done in a separate patch.

Sure, can do. Should the coefficient be added to each CPU or only
to a57_0 and a53_0, as is the case in this patch?

I assume the latter because the A53 coefficient applies to all A53 cores
and likewise for A57.

> >                         clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
> >                         operating-points-v2 = <&cluster0_opp>;
> >                         capacity-dmips-mhz = <1024>;
> > @@ -207,6 +208,8 @@
> >                         power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
> >                         next-level-cache = <&L2_CA53>;
> >                         enable-method = "psci";
> > +                       #cooling-cells = <2>;
> > +                       dynamic-power-coefficient = <277>;
> 
> Likewise.
> 
> >                         clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
> >                         operating-points-v2 = <&cluster1_opp>;
> >                         capacity-dmips-mhz = <535>;
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
