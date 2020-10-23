Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3CB296A9F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 09:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375920AbgJWHuQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 03:50:16 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38709 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S375898AbgJWHuP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 03:50:15 -0400
Received: by mail-oi1-f195.google.com with SMTP id h10so935428oie.5;
        Fri, 23 Oct 2020 00:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NEFKGMFztXrtLM7V+Dzt+kj+SJdV5KpwZ6Pprgtcfz8=;
        b=JAuBx7yU6WjnskNrbWTanGcCe0Rmn/8QOFScmXFf2534cpKKS6vTVZn1f5TUT+aVYi
         HACqAZ7GpVCWyH6xd2GxE0dRLchPY/u1PrzWsPF4VgjowakX5nToEfO7sIGXAQdABFyr
         HMPnzftJOikqyMkKhPB2sPSmqlD9OkLmfKvbyKRUfWN8gBRFCXPI3zVxMzR2tvPTji41
         7sY70l7lriIjmROjgOrYCsxVpuxywkSnW4/w1PAvbVpLfovY8JFiqGCvPsvUQq4djpr8
         NGn/Do0EG8TxqV5LyNWPZ133IJHhAH4cd/sr+Rt86vqnEv2a1BhZnv1pGtj9EFHNzVB5
         QJdQ==
X-Gm-Message-State: AOAM531I1axWizeHsl0WimwQchUpbnr2blY/J4z240mSL+RvDlnwaMj+
        lgBm6VItRilrXtdiNBgzwTEKbyMz+D8r2VgRu8U=
X-Google-Smtp-Source: ABdhPJxiu7QCXa82UKjRREGTfH8LGAKF/rOF0/sI6lMPX0airvcxDQe5I4HNnayWH0c+Sqy1hDiLvce45ZUPmOVmCoo=
X-Received: by 2002:aca:f203:: with SMTP id q3mr715940oih.148.1603439414434;
 Fri, 23 Oct 2020 00:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201020125134.22625-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201020125134.22625-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201020125134.22625-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Oct 2020 09:50:03 +0200
Message-ID: <CAMuHMdWM8uh3Rm4ghn94ZwkTE6rjOmHAThYCL_oh3=Fg+OpHgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add support for MIPI Adapter
 V2.1 connected to HiHope RZ/G2M
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
> RZ/G2M board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb
>  dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
>  dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
>  dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
> +dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb

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
