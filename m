Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12C9296AA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 09:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375935AbgJWHu1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 03:50:27 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45236 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374812AbgJWHuZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 03:50:25 -0400
Received: by mail-ot1-f67.google.com with SMTP id f37so521671otf.12;
        Fri, 23 Oct 2020 00:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=80MGCtuqdgXSLzC9o/8skAQLkLgEFaZM4N6SUIJML6s=;
        b=M2vcqM94+E0S2sHiNAp1UluEm97CkIGxZB2gOoIYe/ED6h3U8hV+ztxAHTlXzKr8Dc
         MTjZMi4HJgZeF2wcTBGbCKW8E9wzbOyfkiNLsytDktoOEmyLL+vsu1tr/Va9HppbAVxm
         o0/bThJ4C6UlLCGPD3ZrzrTObud7h9rrr594LORUNziMbl2h8NdFSq72qiMMkIO91SA7
         hnrY2owgxjmElShhGV5EkW4Bk9jj0G4aM+B3eX8A+Q2Hofm5e32kED8uKm6JvYceBIPM
         qOjkBAXmFStTcRYUQpn54DnJu4je7lkCl67tNW4BZVO1qbdQjWot4co7iiR9yJdmNnqQ
         q/qQ==
X-Gm-Message-State: AOAM531KuC6k10W7qRHSl/MEMl3ZEIdEaz4Wsq40YgiV01w3+onlVK7p
        5N7E5qGL6Z0c6EEUvDUpgeMqu3k0ozI9fUC4KgnC5Hw8
X-Google-Smtp-Source: ABdhPJygCIyDniq+J6r9dcO0uINKDHYXEXUcjbu+wXzUG6X5EbBWpTnbDDRz2KHN+A454VBHeByeNRNihExXw0NUk20=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr606940oti.107.1603439424181;
 Fri, 23 Oct 2020 00:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201020125134.22625-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201020125134.22625-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201020125134.22625-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Oct 2020 09:50:13 +0200
Message-ID: <CAMuHMdXOBBEciHkPsJwnADfveUFL5XmD36GeCz+13C4L=kyC4w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: Add support for MIPI Adapter
 V2.1 connected to HiHope RZ/G2N
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Oct 20, 2020 at 2:52 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for AISTARVISION MIPI Adapter V2.1 board connected to HiHope
> RZ/G2N board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb
>  dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2.dtb
>  dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2-ex.dtb
>  dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb
> +dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb

I'll fix sort order while applying...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
