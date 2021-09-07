Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF16402E7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Sep 2021 20:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345981AbhIGSqJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Sep 2021 14:46:09 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:40827 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240131AbhIGSqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 14:46:09 -0400
Received: by mail-ot1-f45.google.com with SMTP id 107-20020a9d0bf4000000b0051b8be1192fso283386oth.7;
        Tue, 07 Sep 2021 11:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ozglVsUKCNW9AOVGz1ChJ1oIECijqYJsLQAW6GlHXA=;
        b=HHK3qIjiuBhX5XrSrghL3Dpzy91xQD5+CVYWRV13dPUDBr8Pl6rHLLA5LkZkM+s5qc
         jmajsoaEhWJI0NTlc0Ldcazj9DsYntq0JzpsP0cAtkd0JiMABxPeZVtkexPZWLF0k2Yg
         XyGzU4hQtD147jRBPUKTNJzVKoPbjo9NyOKwZTaAa/Ev3MAswDsteGHJgV7Or3PeYv+5
         V+nDwpmvUxH+KBnwpWMpqVgUhHesLdaF5CFind/4cP1+ZB3qDUrpuiHLWpvHPQfmFHjL
         /AshcV3XGbyidGfVVGFsbPnV/TC2goUPjcaaCZVcjpgT9lGBbhukdxK5fxIj0iM2lqV9
         8ISA==
X-Gm-Message-State: AOAM532Rti4dQOjNuYCwHtTWdD7aLJznrFT6fLtsk02l9pDMKBc5RL2O
        v7+1mT25JrLgZBMgqqWT4A==
X-Google-Smtp-Source: ABdhPJzYfyQYhTlPJRunicK9T4KLeQ7LacWk2jQ8/+ZtVlzLbmH3PCTii/qTGzUldxiE+8Ob8aXc+A==
X-Received: by 2002:a9d:74c5:: with SMTP id a5mr16153497otl.205.1631040302219;
        Tue, 07 Sep 2021 11:45:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t1sm2555364otp.9.2021.09.07.11.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 11:45:01 -0700 (PDT)
Received: (nullmailer pid 133935 invoked by uid 1000);
        Tue, 07 Sep 2021 18:45:00 -0000
Date:   Tue, 7 Sep 2021 13:45:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: renesas,du: Provide bindings
 for r8a779a0
Message-ID: <YTezLHrRt/YpOlJZ@robh.at.kernel.org>
References: <20210901233655.1602308-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdXHAfg3_VoeXUBT2-QceLR9KQ3pWjz+5=-wK1QRxK14bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHAfg3_VoeXUBT2-QceLR9KQ3pWjz+5=-wK1QRxK14bw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 06, 2021 at 10:13:07AM +0200, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Thu, Sep 2, 2021 at 1:39 AM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > v2:
> >  - Collected Laurent's tag
> >  - Remove clock-names requirement
> >  - Specify only a single clock
> 
> Thanks for the update!
> 
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -39,6 +39,7 @@ properties:
> >        - renesas,du-r8a77980 # for R-Car V3H compatible DU
> >        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> >
> >    reg:
> >      maxItems: 1
> > @@ -773,6 +774,55 @@ allOf:
> >          - reset-names
> >          - renesas,vsps
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a779a0
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Functional clock
> > +
> > +        clock-names:
> > +          maxItems: 1
> > +          items:
> > +            - const: du
> > +
> > +        interrupts:
> > +          maxItems: 2
> > +
> > +        resets:
> > +          maxItems: 1
> > +
> > +        reset-names:
> > +          items:
> > +            - const: du.0
> 
> This is now inconsistent with clock-names, which doesn't use a suffix.

But it is consistent with all the other cases of 'reset-names'. The 
problem is 'clock-names' is not consistent and should be 'du.0'.

Ideally, the if/them schemas should not be defining the names. That 
should be at the top level and the if/them schema just limits the number 
of entries. That's not always possible, but I think is for clocks and 
resets in this case.

> 
> > +
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DSI 0
> > +            port@1:
> > +              description: DSI 1
> > +            port@2: false
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +
> > +        renesas,vsps:
> > +          minItems: 2
> > +
> > +      required:
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> 
> Same here, as clock-names is not required anymore.
> 
> > +        - renesas,vsps
> > +
> >  additionalProperties: false
> >
> >  examples:
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
