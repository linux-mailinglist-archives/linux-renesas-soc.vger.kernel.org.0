Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECF4A9FBD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 09:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfH1Hcg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 03:32:36 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34554 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbfH1Hcg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 03:32:36 -0400
Received: by mail-ot1-f67.google.com with SMTP id c7so1842548otp.1;
        Wed, 28 Aug 2019 00:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QD99J6UIVZGmimTy0Hqij9Z3+TZVwBN/634gcbM0Yv4=;
        b=tDQid61jgy0USX448UoUhool+fmWA2rlC+OBvIvYMUgwqscUcuzBCgZwBJIf+JLwo+
         T8K2Wu/72AQ/7ZuDHHOQiiiBTw2poGVCf5MXNMoIZizGEq9u2oyOoxkc0eLu9yz0sIeR
         FoyxgBuAGIJaDgQO/FiSb9PNsVDJFlx0jSZ0LVSth7Uph4gliyP0u61oL7CFn9LHzhn8
         ad0G0aBKggbyB7/F2GUhOFvNKjuTGluWqeybHryaZxDCW96IomGXrs07hRl9xTSzSFMq
         Otrkm96SuGhDELg3uTpAZZ187LNmUenIvXQ1D3K/efAt4V84x7kf3SkFGwhqOw/96cZ1
         t73w==
X-Gm-Message-State: APjAAAXhza930UKeP+mBlh8m/qcWb/9tHedApuyBHlLxd0R/EZNcek/G
        DDfHdv5E2rtQs5/rCKRVZ2mF2uY6DJciYOObO+c=
X-Google-Smtp-Source: APXvYqyjpqxjoBfQdEroCM3USq4z3WK8KF4ynWsTexmjyyVEiyc1iC6TSH5m59LwXn2dzLN+wuwlk6qaA8SwDNUYR5U=
X-Received: by 2002:a9d:2cc:: with SMTP id 70mr2099177otl.145.1566977554932;
 Wed, 28 Aug 2019 00:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-3-jacopo+renesas@jmondi.org> <20190827202945.GA3488@bogus>
In-Reply-To: <20190827202945.GA3488@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Aug 2019 09:32:23 +0200
Message-ID: <CAMuHMdUP1kZF4z=NkAb5LCV74dyCMw9pZACMYjOTFE=r2vvR3A@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: display, renesas,du: Document cmms property
To:     Rob Herring <robh@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>, Ulrich Hecht <uli@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 27, 2019 at 10:29 PM Rob Herring <robh@kernel.org> wrote:
> On Sun, Aug 25, 2019 at 03:51:42PM +0200, Jacopo Mondi wrote:
> > Document the newly added 'cmms' property which accepts a list of phandle
> > and channel index pairs that point to the CMM units available for each
> > Display Unit output video channel.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > index c97dfacad281..c2265e2a1af2 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > @@ -45,6 +45,10 @@ Required Properties:
> >      instance that serves the DU channel, and the channel index identifies the
> >      LIF instance in that VSP.
> >
> > +  - cmms: A list of phandles to the CMM instances present in the SoC, one
> > +    for each available DU channel. The property shall not be specified for
> > +    SoCs that do not provide any CMM (such as V3M and V3H).
>
> renesas,cmms

So I guess we really wanted to have the prefix for the vsps property, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
