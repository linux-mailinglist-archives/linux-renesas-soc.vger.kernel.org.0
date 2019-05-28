Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDFC2C942
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 16:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfE1Oud (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 10:50:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34033 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfE1Oud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:50:33 -0400
Received: by mail-lf1-f65.google.com with SMTP id v18so14835513lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2019 07:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TN8TOqdAy6MiE2ShAqIty/eimVfaIzRomPHmS/Hvs9c=;
        b=ZoXQ5TJNadOiwFbTo1pRLUOd56s2wGxIiHNWGpxVq04D5brNfcwxMvPJB8oOS2KV66
         ovcWRUMRk26asBS8gDZSRd7fs5b7ebY/C7UTXeopjE9vqBUtMXLf/E6/yPnmk8/s9aWf
         0BCdVNN2f91qS1xkMuHsC2ryCO04t219yfTsWjT+JddIZrZQ+LElEbeEYW/7ekz74Cqv
         +FfQAwcghOWxt1nn3WPSnaMFD+vISEWvS4HiboIImPCOLVVS7Le6wp4zG5nTdVZGznyB
         SSHnr+e5d0gkQuGwdeAmj2GEs+8OOxTKS7G3B3DteRojqxUGwRijj2QMx6DkH7468fR4
         hFYw==
X-Gm-Message-State: APjAAAXCYSYLYjK9+Xji3YyGQTQncX3cV4/BIewc4S2F4CgC4weID9Nk
        lFC9jwjLuipz43pcjYkrjGg8Xmhr0ZQfonKrFns=
X-Google-Smtp-Source: APXvYqwjR+Kwpt8Vf5glMiEHl51oJry2gLDyca0YNP8hP+BKjiE4LjrW7YdY6CKppg45BRulGNh4TljYkXnTdm3oEic=
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr10773310lfm.87.1559055031101;
 Tue, 28 May 2019 07:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-2-jacopo+renesas@jmondi.org> <20190511181618.GD13043@pendragon.ideasonboard.com>
 <20190528123725.bqyutp4lxny4sraa@uno.localdomain> <20190528142520.GA14336@pendragon.ideasonboard.com>
In-Reply-To: <20190528142520.GA14336@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 May 2019 16:50:18 +0200
Message-ID: <CAMuHMdV3ar8JnPo0S-MEUgPdNSDp8jKG95Tq_483ydn0swZqqA@mail.gmail.com>
Subject: Re: [RFC 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, May 28, 2019 at 4:31 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, May 28, 2019 at 02:37:25PM +0200, Jacopo Mondi wrote:
> > On Sat, May 11, 2019 at 09:16:18PM +0300, Laurent Pinchart wrote:
> > > On Wed, May 08, 2019 at 07:34:20PM +0200, Jacopo Mondi wrote:
> > >> Add device tree bindings documentation for the Renesas R-Car Display
> > >> Unit Color Management Module.
> > >>
> > >> CMM is the image enhancement module available on each R-Car DU video
> > >> channel.
> > >
> > > Not on all of them, V3M and V3H don't include a CMM module.
> > >
> > >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > >> @@ -0,0 +1,24 @@
> > >> +* Renesas R-Car Color Management Unit (CMM)
> > >
> > > It's called Color Management Module in the documentation (hence the CMM
> > > abbreviation)
> > >
> > >> +
> > >> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > >> +
> > >> +Required properties:
> > >> + - compatible: shall be:
> > >> +   - "renesas,cmm"
> > >
> > > There's a CMM in R-Car Gen2 with a different feature set, so I think you
> > > need at least two compatible strings. As far as I can tell SoC-specific
> > > compatible strings are required.
> >
> > I assume you meant "SoC-specific compatible strings are NOT required" ?
>
> Correct, sorry.
>
> > Could you otherwise specify why do you think we need a per-SoC
> > compatible, since there are no platform specific data (for now, at
> > least, but considering the CMM seems identical in all SoCs I hardly
> > think we will have any in the near future).
> >
> > Ack on the gen2/gen3 specific strings though.

Usually we do define SoC-specific compatible values in the DT bindings,
unless there is a version register, like on the VPSs.

Why would we want to deviate from that practice for the CMM?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
