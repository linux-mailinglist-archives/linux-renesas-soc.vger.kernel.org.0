Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13BFD1648A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 16:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgBSPaQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 10:30:16 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40554 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgBSPaQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 10:30:16 -0500
Received: by mail-ot1-f67.google.com with SMTP id i6so498559otr.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2020 07:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=shBpwPxzVyVQAaD0oYTNTwZVsvu6OfaMaEjn1dFyQ28=;
        b=WiM6odiI2z9fEbS6X6JUTIXNR8fqUQmdhVqbMpCsDa9pJNRfvdlBDW/jeoqIL8o2oV
         yM9c6PJM4tOOHgkpZlfKdKy3xIeybckm/4AAD2F9edK3+o/YhcuSRYGR2I5Q6WGKA8WU
         YamryqpypbuEQapp2i1vNT2G7Louo1mzZOwHl/SfYHIoODNrszwyD/DbTZ+osGAFvj3E
         dKIDJmbuaaL5vK2vRHEyJWFMF/w+zuVWqDDqStcPNhTaiTHCC9pV7/qXUn9U8XTl/pEK
         tDbs9bKvqOaJb71dhhMTrKDAb5LwtbQyk+uFovHuaINt+bkkY7kji21O3FgMFue514Lq
         /4+w==
X-Gm-Message-State: APjAAAWCVsKPvtTgCYELUTvlnNuF8ouNi2NqTxSuDPkDSc9dPnIjoj1U
        ADxHIZZ6VLguz6bgO8iYJ35eUbLRvvFbciCwQb0Ilw==
X-Google-Smtp-Source: APXvYqywY31zIL7CUSdv7ZV3QK0x0lsBl24rQPzCQmfsh68PXiEqDefgOyoG1LNgFAuKCPZ/8hXGHJTiHsbtJNn5ZdE=
X-Received: by 2002:a05:6830:1d4:: with SMTP id r20mr5840149ota.107.1582126215565;
 Wed, 19 Feb 2020 07:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20200218133019.22299-1-geert+renesas@glider.be>
 <20200218133019.22299-2-geert+renesas@glider.be> <20200219152728.GR5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219152728.GR5070@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Feb 2020 16:30:04 +0100
Message-ID: <CAMuHMdXoH6H6HiEFgANi8WMzTj0wFVr01-5-Ha9768MrPePKXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: rcar-gen2: Add reset control properties
 for display
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Feb 19, 2020 at 4:27 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Feb 18, 2020 at 02:30:16PM +0100, Geert Uytterhoeven wrote:
> > Add reset control properties to the device nodes for the Display Units
> > on all supported R-Car Gen2 SoCs.  Note that on these SoCs, there is
> > only a single reset for all DU channels.
> >
> > Join the clocks lines while at it, to increase uniformity.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - New.
> > ---
> >  arch/arm/boot/dts/r8a7790.dtsi | 2 ++
> >  arch/arm/boot/dts/r8a7791.dtsi | 5 +++--
> >  arch/arm/boot/dts/r8a7792.dtsi | 5 +++--
> >  arch/arm/boot/dts/r8a7793.dtsi | 5 +++--
> >  arch/arm/boot/dts/r8a7794.dtsi | 2 ++
> >  5 files changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> > index 334ba19769b998ac..e5ef9fd4284ae436 100644
> > --- a/arch/arm/boot/dts/r8a7790.dtsi
> > +++ b/arch/arm/boot/dts/r8a7790.dtsi
> > @@ -1719,6 +1719,8 @@
> >                       clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
> >                                <&cpg CPG_MOD 722>;
> >                       clock-names = "du.0", "du.1", "du.2";
> > +                     resets = <&cpg 724>;
> > +                     reset-names = "du.0";
>
> If there's a single reset for all channels, should it be just named "du"
> ? Or maybe skip the name completely ?

Doing so means the bindings should be updated first to reflect that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
