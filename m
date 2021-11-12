Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD5F44E8FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 15:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbhKLOfM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 09:35:12 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:36446 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235151AbhKLOfL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 09:35:11 -0500
Received: by mail-ua1-f46.google.com with SMTP id e10so19266879uab.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Nov 2021 06:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D0vY1FDDbyAxoGnEQl/YfJkEasJDtDM2anmXCA23Ib4=;
        b=6boKSBn2Xgvfv2KLXa/e71K8/cL3Vl2XsB9t1C9oVtH4o5OXQoUQ7IYxxQ5gY0/QD0
         UkieUV5PUjOd2kYrGFkoABkd35CeqkA38ZYAW4/tCiz0G3dxqkBBdtXySqJQXcZrPbWH
         f5mu28Qj5ZG2NyhPHZArEHFqMHDZ3Mo+GA5HNClNojVWDl+yOW+9otTOds0l0azwhvR1
         5P6VmGSPFVZ02IwKurynjFZ3eup6WmHepOBHc4mO9AVEgMK9jqp/HN2meEvfuvP50gPa
         39/FH2n98Y4EbRH9kJ1uGUco5Dci5tWI54gXhinxavIFaebyL5/eSozP2icvHdr2iish
         NgWg==
X-Gm-Message-State: AOAM533V+6zD+QUfAOHKO8HzLPXr7jtkSR7LKUmKTXU29EMolCag6J7W
        IpomSCm/iAJMwFjZ68XBhvulaUVy2oOcfw==
X-Google-Smtp-Source: ABdhPJxM1NgkV0edu5PJuUB/YFudDREV+W1vZsJHabT91vSoEtorI/a6j/forECd+OtVkOk0u/zrKA==
X-Received: by 2002:a05:6102:3588:: with SMTP id h8mr10287994vsu.7.1636727540205;
        Fri, 12 Nov 2021 06:32:20 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id c21sm2453328vso.21.2021.11.12.06.32.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:32:20 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id az37so19128811uab.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Nov 2021 06:32:19 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr10639054vsl.35.1636727539601;
 Fri, 12 Nov 2021 06:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20211110084232.652-1-biju.das.jz@bp.renesas.com> <20211110084232.652-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110084232.652-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:32:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqLXiKobS-w3OyK-uUP2z=1Zq2y=rXiJn7SOfyDRoQFw@mail.gmail.com>
Message-ID: <CAMuHMdXqLXiKobS-w3OyK-uUP2z=1Zq2y=rXiJn7SOfyDRoQFw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drivers: soc: renesas: Enable RENESAS_OSTM
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Nov 10, 2021 at 9:42 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable General Timer Module (a.k.a OSTM) driver support for Renesas
> RZ/G2L based platforms.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -286,6 +286,7 @@ config ARCH_R8A774B1
>
>  config ARCH_R9A07G044
>         bool "ARM64 Platform support for RZ/G2L"
> +       select RENESAS_OSTM
>         help
>           This enables support for the Renesas RZ/G2L SoC variants.

As RZ/G2L uses the ARM Architected Timer as system timer, enabling
the OSTM is not mandatory.  Perhaps the RENESAS_OSTM symbol should
be made visible instead, so the user can enable it when wanted?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
