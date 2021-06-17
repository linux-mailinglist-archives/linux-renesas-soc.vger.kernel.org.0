Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6653AAD65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 09:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhFQHZL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 03:25:11 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:40638 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhFQHY7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 03:24:59 -0400
Received: by mail-ua1-f42.google.com with SMTP id r9so403792ual.7;
        Thu, 17 Jun 2021 00:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cEv8QQ6il/6NkwppAWjKCYYqz8xPWh7pjmkGPTD+a34=;
        b=WFcpUkbVv+huLPjolyFl3pyD2jSXz1EWKtHwdFT3O2mTkgoRO08UNFW1d1g1QRSdOl
         9ii3T/CI0a5aZVOaqVf851Blx7iw3DpUSiRg1TlBPLKXqsaZOlu2RkRqHRzj/DayM/wi
         rFLLPeLTsDddM0SYS8fw8ic7BM/LHgTwbg/cf7xwhA8RGuGiQWk23f1dQkAeYG1Ra6YQ
         ac/VVlR+eCCvsL/dmZ4fUu2MjUu9j9RfhttkttK2M53YcpF+kq3ovcOs5qIq7NYnllRD
         N9+ZW4z9Co9l+Pj34abGVa+6cWBrLe8dZ/dMO/kFdO5vRBNIHJfQu9WSp7fCf7szKo8n
         lOnQ==
X-Gm-Message-State: AOAM530Kn0kW8iHFqMpEKqf/mS56bdsSsI0Pq32BrtmoD3eRqa2ZjJOW
        LEyS+YC64dVRoWnrDPWi5uo8ZlBlB3krUu0aGbpv4AeXt+2yvg==
X-Google-Smtp-Source: ABdhPJwMcA0YpYRPCJAZ9bnGz/2Pg25idgRHpclYxTS0kaMVMyFb5dPU4W1UkU43d9V5qdplDXdplYoI8kdY08U/tJ4=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr3877741ual.2.1623914572130;
 Thu, 17 Jun 2021 00:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <2da75fd2e971dfab8dd05a2a28bb1d6d9cbe5adb.1619700420.git.geert+renesas@glider.be>
 <YIrU+tdcfQ/6ODRz@pendragon.ideasonboard.com> <YMqsAkFfAU02t4oD@pendragon.ideasonboard.com>
In-Reply-To: <YMqsAkFfAU02t4oD@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jun 2021 09:22:40 +0200
Message-ID: <CAMuHMdWe-84ga-f4GC7h+jZnAPu5ayvV=xnB7mNgQs3XqRVW=w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Make resets optional on
 R-Car H1
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Jun 17, 2021 at 3:57 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Apr 29, 2021 at 06:47:06PM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 29, 2021 at 02:47:31PM +0200, Geert Uytterhoeven wrote:
> > > The "resets" property is not present on R-Car Gen1 SoCs.
> > > Supporting it would require migrating from renesas,cpg-clocks to
> > > renesas,cpg-mssr.
> > >
> > > Reflect this in the DT bindings by removing the global "required:
> > > resets".  All SoCs that do have "resets" properties already have
> > > SoC-specific rules making it required.
> >
> > Should we drop the
> >
> >         resets:
> >         maxItems: 1
> >
> > from renesas,du-r8a7779 then ? And maybe the
> >
> >   resets: true
> >
> > in the general case ?
>
> Any opinion on this ?

Oops, I did reply to this on April 29, but accidentally dropped
all CCs, which made it disappear from your radar, too?

| R-Car H1 does have a reset controller, we just don't have support for
| it in the DT bindings and Linux driver yet.  So from that point of view
| it makes sense to keep it.
|
| Of course we can remove it, and re-add it later if we ever add support,
| as at that time we probably will want to change the bindings anyway
| to make it required again.

And you replied on April 30, also in private:

|> R-Car H1 does have a reset controller, we just don't have support for
| > it in the DT bindings and Linux driver yet.  So from that point of view
| > it makes sense to keep it.
|
| Not sure what we would "keep", given that there's no reset controller
| available :-)
|
| > Of course we can remove it, and re-add it later if we ever add support,
| > as at that time we probably will want to change the bindings anyway
| > to make it required again.
|
| Let's not bother. I doubt H1 will get support for a reset controller as
| that's an old platform, and the DT bindings thus don't matter too much.
| I'll take this patch as-is.
|
| Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > > Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > index 552a99ce4f1280d7..e955034da53b86e2 100644
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > @@ -89,7 +89,6 @@ required:
> > >    - reg
> > >    - clocks
> > >    - interrupts
> > > -  - resets
> > >    - ports
> > >
> > >  allOf:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
