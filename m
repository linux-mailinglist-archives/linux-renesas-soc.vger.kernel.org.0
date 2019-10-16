Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81949D8B1F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 10:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388867AbfJPIfq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 04:35:46 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34231 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388821AbfJPIfp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 04:35:45 -0400
Received: by mail-oi1-f194.google.com with SMTP id 83so19334610oii.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2019 01:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Gub+KFVoNwF4iDiCY7GyicFuHBxdD3PyaJ+yzMEziI=;
        b=gnJTITIfQ/EunrofmnBfhXgSwDylOVX4RgUL5jnJ+k11K3eEsFlBRjUoG340BGglx1
         viI7+n0d7SnAOTClxWlCmwsScgo208ruqzdebHhBJOeFmtPjdgRLHLFrGS/ThAZb4Oh8
         DHKD7vHTmJSz1JIf+ScYvSPSe6Dc2bLMU3ytpM8OjltWuwPBsqfnz5mjtmTpnrkz/0Yt
         OSYulXfTZH2wGfbWEYXEx/h8ijAzA/gSl7F9CF/Ynpgi6tn9Es/+LYqF1akBTzjhHAb8
         +WoCu30wwiLZu/D82bG01ftnlzmssaEwYVKTbjMOXXsCwa2GEPf56j0Wy1rjm1CmTi22
         7oHw==
X-Gm-Message-State: APjAAAX8SLNEGgNFX85noP4qO/MLicwxqIP0+h2ICoZnU9ejlY6TSdgO
        Iqz4ziyoU4gu+AmV+3qT8nK2KYatFk9TOVK3JigT+J0p
X-Google-Smtp-Source: APXvYqwNg8TjJh2DFGfmtnTFMtgQpnsIEZ+0hlZdCKSdos4cMCWhJnxOPABVV1n03e3dUIvyZqDlNlmcFnpJIQEWdLo=
X-Received: by 2002:a05:6808:3b4:: with SMTP id n20mr2337509oie.131.1571214943652;
 Wed, 16 Oct 2019 01:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191007102332.12196-1-geert+renesas@glider.be>
 <20191007102332.12196-4-geert+renesas@glider.be> <20191014184410.GA10366@vmlxhi-102.adit-jv.com>
In-Reply-To: <20191014184410.GA10366@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 10:35:32 +0200
Message-ID: <CAMuHMdUbNOsKFGfD3Bt_cxJM9n92XjkE9KOwt03Rgn=rFhk8HQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 03/19] dt-bindings: clock: renesas: cpg-mssr: Document
 r8a77961 support
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Mon, Oct 14, 2019 at 8:46 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Mon, Oct 07, 2019 at 12:23:16PM +0200, Geert Uytterhoeven wrote:
> > Add DT binding documentation for the Clock Pulse Generator / Module
> > Standby and Software Reset block in the Renesas R-Car M3-W+ (R8A77961)
> > SoC.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  .../devicetree/bindings/clock/renesas,cpg-mssr.txt       | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> > index b5edebeb12b40638..b9b0927b7c780699 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
>
> [..]
>
> > @@ -42,10 +43,10 @@ Required Properties:
> >    - clock-names: List of external parent clock names. Valid names are:
> >        - "extal" (r7s9210, r8a7743, r8a7744, r8a7745, r8a77470, r8a774a1,
> >                r8a774b1, r8a774c0, r8a7790, r8a7791, r8a7792, r8a7793,
> > -              r8a7794, r8a7795, r8a7796, r8a77965, r8a77970, r8a77980,
> > -              r8a77990, r8a77995)
> > -      - "extalr" (r8a774a1, r8a774b1, r8a7795, r8a7796, r8a77965, r8a77970,
> > -               r8a77980)
> > +              r8a7794, r8a7795, r8a7796, r8a77961, r8a77965, r8a77970,
> > +              r8a77980, r8a77990, r8a77995)
> > +      - "extalr" (r8a774a1, r8a774b1, r8a7795, r8a7796, r8a77961, r8a77965,
> > +               r8a77970, r8a77980)
> >        - "usb_extal" (r8a7743, r8a7744, r8a7745, r8a77470, r8a7790, r8a7791,
> >                    r8a7793, r8a7794)
>
> Not easy to review, but 'git show --color-words' comes to the rescue :)

Exactly ;-)

$ git help wshow
'wshow' is aliased to 'show --color-words'
$ git help wlog
'wlog' is aliased to 'log --color-words'

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
