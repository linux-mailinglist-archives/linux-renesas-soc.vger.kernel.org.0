Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5698E449F7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 01:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241197AbhKIA0G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 19:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbhKIA0F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 19:26:05 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4088C061570;
        Mon,  8 Nov 2021 16:23:20 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id j75so48268117ybj.6;
        Mon, 08 Nov 2021 16:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cG7Wupb06Z9xQF0G4D6a+jrtwJKY3UKarR+wT8MzPqY=;
        b=SB+WZ9U2mWplqjm+cyh8nfhNH60Zg/SaeljbkjA2iWlE76Eg9pEPWPblsxbPtdmyZZ
         sdrLFrO75CESRmzL/Rw8p9WrVsz9mJHuuND4t+13PWP/JTqo1xFt4+iW8/r/06H7OUaD
         zdFDdQTHJrv7fe3le59BnKfDzmhf2/xXQo6X4NS7fcuVV3U+aC1ugudapmc99C2waWaf
         011C9eyczem3e2EDWPYow3zafR9eXEQkQiaMk0kPSMZkAOkxUla1pZZCrkq6KQolBs0U
         msGx46O5/fzwfQj7siac9ixFHkfKK3zV1kx8YBlNqSlGc3ulftJaswryD22w4qT9vvte
         VtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cG7Wupb06Z9xQF0G4D6a+jrtwJKY3UKarR+wT8MzPqY=;
        b=XghSwXyLiHscd5gduK7eImiz/D2pdcdUbJxhBCk0jBiwwXrE9mFQaAphiobXa8qh0y
         u1J/fEAoiut9GQo5zeRJTZOD5fjzyfVmFngo9+OSUh4nLDntfAtylkDR325WfGvuL8wu
         w30VgRumGYC2rKF8PqSmGZxx1ncCoX5nlLkCZzuIaV/oSENCPYWdvxGiJ799sx2rSHiK
         RHd++VFTjEvjiCZkioyJxNEse8m9udG2ZbZuvXnIDzujXCvgPEzPcPzNikauTLAWZ8WV
         pfTYTWv9T1ahkAY4+znko8s/01Irh4CjblBRglXiG3BKtIPhwWmPZMusLZm4Jsi3VcIC
         Irfg==
X-Gm-Message-State: AOAM530Gi1WXTGE7Ca49T1s64k2HX1LeFxx06YLSUSU68m4vmcm/mpr7
        8H0xlSo9yajq1Ml8sjGojaDgyTBtcKbgdf6EYODft8XL5/w=
X-Google-Smtp-Source: ABdhPJw6KwXDI8ymK1Z5/o5VRl79NB+E6t/J7YN+r4Py7WtDNudwFMHYUpXPqg20KwLM9hjbZUGw1F/UxY39ryJ5WEg=
X-Received: by 2002:a25:56c3:: with SMTP id k186mr3764465ybb.543.1636417400147;
 Mon, 08 Nov 2021 16:23:20 -0800 (PST)
MIME-Version: 1.0
References: <20211103195600.23964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211103195600.23964-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVjXrAhOm0JvE=RH5nARjuv03UKmo45vzRECDSWoXNbtw@mail.gmail.com>
In-Reply-To: <CAMuHMdVjXrAhOm0JvE=RH5nARjuv03UKmo45vzRECDSWoXNbtw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 9 Nov 2021 00:22:54 +0000
Message-ID: <CA+V-a8vbj=3e5xhV8x69ROFfdC35Env2Rev7CXDCYFoEDFOxtQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a07g044: Add SCI[0-1] nodes
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Mon, Nov 8, 2021 at 4:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Wed, Nov 3, 2021 at 8:56 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add SCI[0-1] nodes to r9a07g044 (RZ/G2L) SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> > --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > @@ -176,6 +176,36 @@
> >                         status = "disabled";
> >                 };
> >
> > +               sci0: serial@1004d000 {
>
> Please keep sort order (by unit address, but grouped by type).
>
Oops missed that, will fix it in v2.

Chers,
Prabhakar

> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
