Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A594E3B1AC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhFWNLh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:11:37 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:40545 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbhFWNLg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:11:36 -0400
Received: by mail-ua1-f45.google.com with SMTP id r9so828025ual.7;
        Wed, 23 Jun 2021 06:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2GyvRMqzd0j7dU3QjG5cKA3SND3uzGcIE5fba+nRyaE=;
        b=VSmcRh4MftvCjl9E1F1HLcutSXjgX9Vt474J0i55jARkgepTWyfhCb4LDCikvqS9uG
         VX0DbKBXly9p2BfiWzCDsSYNO7BFSDyQmhoEHWMyT1CcrgFkDj183O8qrhnUZCoJr9du
         IhD7hId0I2qZMD+0NgKQO/JS6WkVAH9EAjHYvlAWfSZ69aP/xndgx7wr4XEax+8Jeoi+
         oDZ9/nt3q9FAuE4qxxtxQ6ms/KNb67+zkpvye02ZRQrnZ2Z57asV3xfkXlItorYuB4qr
         7zW3GS9XbExwT6DnSQqcGTybtxmz4wIGIZb0eRSTQAtioTkSUB/R0eCErPZJR6Phtk6C
         YZjg==
X-Gm-Message-State: AOAM533ng+XxvaNb0bBgtD9tRMM8GTKv0ZomdnQohh2Ds5DR0S1uuOMy
        Qhp/SQdhXkjM7UFTjdtGMzxyOjl5cM4CJpchA2E=
X-Google-Smtp-Source: ABdhPJy7fEj+42hR8loz80KZeBpk8m6cSVSkPMGaM+vOPsqzJ7EuBgra5HjzbA2XO5FoOuNmfwqhB3mqOHbBdX7nzSE=
X-Received: by 2002:ab0:1e4c:: with SMTP id n12mr4441015uak.58.1624453757600;
 Wed, 23 Jun 2021 06:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com> <YNMv2KSjbwX5aAK2@pendragon.ideasonboard.com>
In-Reply-To: <YNMv2KSjbwX5aAK2@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 15:09:06 +0200
Message-ID: <CAMuHMdXJTCyfMX3nN6pbAHeqqf5OCqJR4+7GJ=71+o1iKRrHhg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Provide bindings for r8a779a0
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Jun 23, 2021 at 2:58 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Jun 23, 2021 at 02:53:33PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Jun 23, 2021 at 1:11 AM Kieran Bingham wrote:
> > > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >
> > > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> > >
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > @@ -39,6 +39,7 @@ properties:
> > >        - renesas,du-r8a77980 # for R-Car V3H compatible DU
> > >        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> > >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > > +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -774,6 +775,57 @@ allOf:
> > >          - reset-names
> > >          - renesas,vsps
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,du-r8a779a0
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: Functional clock for DU0
> > > +            - description: Functional clock for DU1
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: du.0
> > > +            - const: du.1
> >
> > The hardware block has only a single function clock for both channels,
> > like on R-Car H1.
> >
> > And what about DU_DOTCLKIN?
>
> As far as I can tell, there's no DU_DOTCLKIN in V3U.

See Table 6.13 of the Hardware User's Manual, pin IPC_CLKIN.
Note that the register bits to configure it are present in
drivers/pinctrl/renesas/pfc-r8a779a0.c, but the actual pin group is
missing.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
