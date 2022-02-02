Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6E04A6DE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 10:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236838AbiBBJhD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 04:37:03 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:45894 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbiBBJhC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 04:37:02 -0500
Received: by mail-ua1-f41.google.com with SMTP id b37so17946560uad.12;
        Wed, 02 Feb 2022 01:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f7pw+B6zWmFJaMU+pROxATX0iaRAJWkl6aIXWssYesQ=;
        b=xlAWGSdFKSspX9HpyE1vRtVpikQLl5zjvfqnprqzlU5XMZEsNhg6AMP3kfiDQoUK4H
         rY+c2Ap0iwhbcPvk1v6JWtIAnNs+LGZmGTwZ4UoGLVFmdqRKQEzS65zhA1KHWuoA4bhG
         TOJlKkaCW+2Y4ddm9HOv17LmN/y2IWxeNrmzCUtpjcxD1nlfmj8StSJHRGxxQFoXhPQ1
         SEmLXGrue3O9Pheunhg/3ixpsvEDxuqQQKJTi0TqMFeV/RZbFZwmCxksYV7V2AVxxTTo
         C4WC9vCDYcIYzlslv9VTZSNIaD+cSHA5HZUp5rgS+GEbXRg27txXbsuD7SH3EqnbIfo7
         LaWQ==
X-Gm-Message-State: AOAM531g6KiQjOATM77Y7qBs82njSj0LrKzaBBZIfHLki3thC8YIW+Ba
        rc+KE6n5NGxFFi/LZuDUonm9OejgobIDtw==
X-Google-Smtp-Source: ABdhPJzLfXnpjC6NFAn3pCeCCsU1x+ni5GJzGHo3f5IFKewtqmLYFx7zViRXhcSXVFLe2TcTG28JBQ==
X-Received: by 2002:a67:d917:: with SMTP id t23mr11088243vsj.48.1643794622062;
        Wed, 02 Feb 2022 01:37:02 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 67sm4826833vsh.9.2022.02.02.01.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 01:37:01 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id m131so12232912vkm.7;
        Wed, 02 Feb 2022 01:37:01 -0800 (PST)
X-Received: by 2002:a05:6122:c8f:: with SMTP id ba15mr12396345vkb.39.1643794621176;
 Wed, 02 Feb 2022 01:37:01 -0800 (PST)
MIME-Version: 1.0
References: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
 <20220125125602.4144793-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXgg8XApJETkN1oDDSy=N01kJaTz4DADyD9ZOM0ZXXttA@mail.gmail.com> <TYBPR01MB5341EA35142A1AFCF75F591FD8229@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341EA35142A1AFCF75F591FD8229@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Feb 2022 10:36:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSCpu0djVJeirGZP-WDSuzvnaWAHWG5wAviX9+Kt2aRQ@mail.gmail.com>
Message-ID: <CAMuHMdWSCpu0djVJeirGZP-WDSuzvnaWAHWG5wAviX9+Kt2aRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779f0 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Jan 28, 2022 at 1:09 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, January 27, 2022 8:06 PM
>
> > On Tue, Jan 25, 2022 at 6:33 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Document the compatible values for the IPMMU-VMSA blocks in
> > > the Renesas R-Car S4-8 (R8A779F0) SoC and R-Car Gen4.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > > --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > > @@ -44,6 +44,10 @@ properties:
> > >                - renesas,ipmmu-r8a77990 # R-Car E3
> > >                - renesas,ipmmu-r8a77995 # R-Car D3
> > >                - renesas,ipmmu-r8a779a0 # R-Car V3U
> > > +      - items:
> > > +          - enum:
> > > +              - renesas,ipmmu-r8a779f0 # R-Car S4-8
> > > +          - const: renesas,rcar-gen4-ipmmu-vmsa  # R-Car Gen4
> > >
> >
> > I'm wondering if we need the family-specific fallback.
> > For R-Car Gen3, we don't have it, and match on (all) the SoC-specific
> > compatible values instead.
> > Do you remember why we decided to do it that way?
> >
> > At least R-Car V3M/V3H/D3 have slight differences in the register bits,
> > but I don't think that was the reason.
>
> I don't remember why... Maybe, we had never discussed this topic?
> I searched this topic a little on the ML archive, but I could not find it...

Indeed. I also couldn't find a discussion, and most IPMMUs on R-Car
Gen3 SoCs are identical (although there are differences in parts we
don't use in the driver). The IPMMUs in early R-Car Gen3 SoCs also had
issues, so that's probably why we never went with a family-specific
compatible value. And adding it now wouldn't gain us much.

> Since upcoming R-Car Gen4 SoC's IPMMU is the same specification with r8a779f0,
> I believe renesas,rcar-gen4-ipmmu-vmsa is helpful to support it.

Agreed.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
