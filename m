Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFBC745728C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 17:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235753AbhKSQQL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 11:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbhKSQQK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 11:16:10 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5981C061574;
        Fri, 19 Nov 2021 08:13:08 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id v7so29873800ybq.0;
        Fri, 19 Nov 2021 08:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8t14HGrnLIPpNfLXRwGJimMPguzE1C5wdqxN7ZDgODk=;
        b=YiXPw93lcAEhsf289DUuTbTUMwHqhRtcNEU2Xc3E01GNcGaRaRQf+hBVjwpzS6JqI5
         88LNIRRCStMlO1i+NXTsvWB82eaTirc3xM/eikVw6WKtGIbjD3Jot2d/DNePM9T0ka6D
         E3ISZYv6m+Hj95gfeUu/Cos1FksDhXJx54BcukJj2WTPZLhIY+CdAcLZeGA10W8z+a60
         5zMUEhuJsTz1lvqMxI18KprMM86TeFK0Vo+ah11RrAy/8q0+3ES6ffMPPTWSCmoCid8g
         fNAI44qy2KdbIiffBRP0EmFtdLmg/+QCeeMgc0SDeOmrrq/cLXDFFsryaj1cStFQE536
         cVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8t14HGrnLIPpNfLXRwGJimMPguzE1C5wdqxN7ZDgODk=;
        b=dAOT9Rn+h01RpHTVwgtGv30jG/ZLUqVjzTh4WGwlhlkHWGBshvpR2EJa/CmDX5bBho
         R2wCva517b2gEDhsHHFz00wWqLh0QIdG8zfa4M0miKNOppWQZ/+ED4gcafB/VxNooCS/
         MIb09LSozGZejmsixfQUllkpNiDm8CMKYIg12FTd7vdlw1ImV0gET92ySsdV3rFwBud2
         Ol0UY19sVtGiBsEQWD95MCgG9l5G7VG6h6RSyBuMHrdRKKxdRiad5xN+OUR34Zi6sQH9
         dlXVjvowu9+XmtlYsER80RDHuyzvCSC97pPlvJvZ2ol5VDociwNI2bvT5+rYvS5RMK9T
         Z05Q==
X-Gm-Message-State: AOAM5324Tpa8RVoG4+zq9saitVRGjz9kXLXNOnReEtih4XkHhprbpxQE
        5usa+CBjdsY8ecXQB39JKrtiaRSMTCKaD/pGmfXxogoZsb2pfQ==
X-Google-Smtp-Source: ABdhPJzx3whsvlXZbTQqfQri0g7E29EXGkoOUA216ui7dyt+wCbF97v/17XTOMsDI7RQ7XpE/L2YehNthuku0uDrkuU=
X-Received: by 2002:a25:b7c6:: with SMTP id u6mr37849989ybj.16.1637338387868;
 Fri, 19 Nov 2021 08:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20211119123710.31575-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <e51e2a73-1fd4-d3cd-8973-f7e94ae5027f@omp.ru>
In-Reply-To: <e51e2a73-1fd4-d3cd-8973-f7e94ae5027f@omp.ru>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 19 Nov 2021 16:12:41 +0000
Message-ID: <CA+V-a8s6_bx86FiqkZ+79TVm4ymS=M+DEh4Y=RG9o+SnxiLCHg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc-som: Enable serial NOR flash
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergey,

Thank you for the review.

On Fri, Nov 19, 2021 at 4:10 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> Hello!
>
> On 19.11.2021 15:37, Lad Prabhakar wrote:
>
> > Enable mt25qu512a flash connected to QSPI0.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >   .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 40 +++++++++++++++++++
> >   1 file changed, 40 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > index 7e84a29dddfa..e53c17954566 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > @@ -178,6 +178,18 @@
> >               line-name = "gpio_sd0_pwr_en";
> >       };
> >
> > +     qspi_pins0: qspi0 {
>
>     Not qspi0_pins:?
>
good catch, will fix that and send a v2.

Cheers,
Prabhakar

> [...]
>
> MBR, Sergey
