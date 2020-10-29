Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE6F29F409
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 19:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgJ2SYH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 14:24:07 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39798 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgJ2SYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 14:24:06 -0400
Received: by mail-ot1-f68.google.com with SMTP id o14so3207751otj.6;
        Thu, 29 Oct 2020 11:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4IEYVtSqduzhGKS9TyBWfCcxOVUYCwSEwdK+Y1cmD9g=;
        b=QdMx1xV7BZ61iQAQ0kpE65veH9yeMKRjW1dgKYmc6COpJZq9+8m9llRJeoiVEXgPsm
         ifOaiuBeXdRNRs25xUTIT8R3zGZUS9JHr+Ab0Yft3Ca8jAnw7EYn3eE9FdUkoCOCJ8W2
         vGO4Dijsr0bwpDoVGrtmFYXnUiQwSS3J6H9fornWYODFiRwKqhwSzFZEvffRnds4UNSS
         VkRwETbiKD+w3XJn0YByCN2mpmDTbWkOTPnULZwQXGUjN5xZlSR3CFyX/BjVieBDou9R
         PMGRsUlROni9MJdQSjjQS0gIXI3L/J54PFFcTeQGgVEZoMg6spgCF6eyLPWmeiegmoqH
         7suQ==
X-Gm-Message-State: AOAM532JplyHMm5N2KU+nH89FITNwsDYWFw1R2WDOGt74mWglF1Vrm06
        3Gmcr732TlA8pt64Jzv2jLtgs60NYg7OfTYSUPA=
X-Google-Smtp-Source: ABdhPJzdcG3i35C8JpSQjiJAt0AYBSzBfVI22Cmxbvt5f6BbGMnt3YyMb5pTRGJoLY7Dz/YMWPRgYGqb4ryIfkaf0K0=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr3962567oti.107.1603995845494;
 Thu, 29 Oct 2020 11:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201029133741.25721-1-erosca@de.adit-jv.com> <20201029133741.25721-2-erosca@de.adit-jv.com>
 <CAMuHMdX5pCtR-LMbuSJQvDNyVOwcipt7zZOF3c3J-d-Bq98NQg@mail.gmail.com> <20201029163213.GA12422@lxhi-065.adit-jv.com>
In-Reply-To: <20201029163213.GA12422@lxhi-065.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Oct 2020 19:23:53 +0100
Message-ID: <CAMuHMdXbwfPk5_dZEzjLuUZx6ysxdmu6hKbd54Ev6jTQUObTCA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77961: ulcb-kf: Initial
 device tree
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Thu, Oct 29, 2020 at 5:34 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Thu, Oct 29, 2020 at 03:09:10PM +0100, Geert Uytterhoeven wrote:
> > On Thu, Oct 29, 2020 at 2:38 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > > Create a dedicated DTB for M3-ES3.0 + ULCB + Kingfisher combo.
> > > Inspire from the pre-existing ULCB-KF device trees:
> > >
> > > $ ls -1 arch/arm64/boot/dts/renesas/*ulcb-kf.dts
> > > arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
> > > arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
> > > arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
> > > arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
> > >
> > > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v5.11.
>
> Thank you for the prompt review!
>
> > > +       compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
> > > +                    "renesas,r8a77961";
> >
> > Can you please send a patch to add this combo to
> > Documentation/devicetree/bindings/arm/renesas.yaml?
>
> I would happily do so if you resolve below concerns.
>
> Since the inception of the Kingfisher extension board description in
> v4.15-rc1 commit 5418a900412699 ("arm: shmobile: Document Kingfisher
> board DT bindings"), nobody attempted describing the SoC+ULCB+KF
> combinations in spite of four of such DT configurations being actively
> used and maintained, i.e. r8a779{50,51,60,65}-ulcb-kf.

I'm a bit confused. We do have:

      - description: Kingfisher (SBEV-RCAR-KF-M03)
        items:
          - const: shimafuji,kingfisher
          - enum:
              - renesas,h3ulcb
              - renesas,m3ulcb
              - renesas,m3nulcb
          - enum:
              - renesas,r8a7795
              - renesas,r8a7796
              - renesas,r8a77965

> So, if we start documenting the r8a77961-ulcb-kf combo as a board, this
> raises below questions:
>
>   => should the missing 4 SoC+ULCB+KF instances be documented as well?
>   => should a new compatible string be created for each such HW combo,
>      e.g. "renesas,<soc>-ulcb-kf"?
>
> I feel none of the above is really needed, based on the patterns
> established in Documentation/devicetree/bindings/arm/renesas.yaml,
> but I might be wrong. Thoughts/suggestions appreciated.

I don't think we want to add new compatible string to describe each
combo. Just add "renesas,r8a77961" to the last enum?

> IMHO one thing which is certainly worth clarifying and fixing is the
> KF revision currently documented in renesas.yaml, i.e. M03.
>
> Shimafuji released at least M04, M05 and M06 revisions of KF (nicely
> compared at https://elinux.org/R-Car/Boards/Kingfisher#Change_point).
>
> The question is, does the community intend to support M03 through M06
> (in which case all of them might need an entry in the documentation) or
> anything which is earlier than M06 has to be considered deprecated (in
> which case renesas.yaml would need a simple s/M03/M06/ update)?

I'm not that familiar with KingFisher and the various revisions.
Do these differences have an impact on the software side?
The diodes and filters probably don't.
The I2C repeaters are PCA9548ADB on M03, hence they use a Linux
driver. By what have they been replaced?
What's the nature of the MOST ↔ GPS Function select register change?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
