Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A94296A97
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 09:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375900AbgJWHuH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 03:50:07 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:34266 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S375896AbgJWHuH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 03:50:07 -0400
Received: by mail-oo1-f65.google.com with SMTP id f1so134791oov.1;
        Fri, 23 Oct 2020 00:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dBu3xGKmCIZKjN+rxKusMJ7EuXQb1fjmv21uJSpwG4U=;
        b=F8poJbb/2uZmID8z+56JdFDSCuz3PbVOivjm32jf0Lr4ADjPF4Eq25Lm3NDOqXtmYL
         e+k42ZzXUi6DyDncgs2nfr1O772QEqQdtC7V36XddEmBKYEyC/fElJgx7bXPol/dMoHm
         ukXTe1IOSVFWd5hmU5X5qTT6uzO6ppqkHqbNLNDnSthAj7d3NneSunp1AzhqBREMi4DZ
         4Nr98qp5ZrHln+HfoqTg7Xwc5FprIDQhv/HP5bMcZ713FDCTJTwlT6W2XQUgzLcOMM+1
         y5jlnmUz65bem/9NRZ/hZ9owWi7nJswvOgkB5h8TEbFKhdaOSbGFNaUdK+OssDJa4yDa
         CrkQ==
X-Gm-Message-State: AOAM531YK/s9dw6mP/70szHsF8i4zdUySAbgLoO1x8rHIP+NU+frTKrQ
        XiNAcPl8qKzoR6Z1Fzkfaz7yV0UykoXg9TIHQ/Y=
X-Google-Smtp-Source: ABdhPJwBN/vgJicaLLafyDTU6salTVZ9ZWS6DXYq/svxYSt9rtMi0FUlk/Gc6TiJJm90BWp9IBOCbvPyccbhMli2/ls=
X-Received: by 2002:a4a:5d84:: with SMTP id w126mr619322ooa.1.1603439406064;
 Fri, 23 Oct 2020 00:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201020125134.22625-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201020125134.22625-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201020125134.22625-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Oct 2020 09:49:54 +0200
Message-ID: <CAMuHMdUtD8mwiDT98dv2BRbhXM=9j3HvFO7KXvPZypVqRR-=Lw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: Add support for MIPI Adapter
 V2.1 connected to HiHope RZ/G2H
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Oct 20, 2020 at 2:52 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for AISTARVISION MIPI Adapter V2.1 board connected to HiHope
> RZ/G2H board.
>
> Common file hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi is created
> which will be used by RZ/G2{HMN}, by default the CSI20 node is tied to
> ov5645 camera endpoint and the imx219 camera endpoint is tied to CSI40.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Looks good to me, so:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Review from an R-Car CSI/VIN expert wouldn't hurt, though...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
