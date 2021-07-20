Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5043CF745
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 11:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235544AbhGTJRO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 05:17:14 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:38415 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235368AbhGTJRN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 05:17:13 -0400
Received: by mail-ua1-f46.google.com with SMTP id g4so7856897uap.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jul 2021 02:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eJGM0RL5AN+h+vqFmyVhrYwvPstbguOVmw1vvv/X9nQ=;
        b=Nx0zhTmwmy7IchgnZv+aWUF0a73BqGQTqmOf14GAxuKsFXABg+vUMDdCDOhWqXZdZz
         YwXwlEhgKebngxG/BKw1Y/oZwO87PZliLjtxZcHJgbsrlNLS9gpkkzHRik+ZxPI6FPOr
         fdEV4f+Lc3l22jr0ReQ/4XVxtm5j4TSTC6xmfMWYT0+oSy/B2wvMuvYzCXd/KFdtlPI8
         UnvgkhpQFLQ9LpreL+pfBeIrDEmhn9mTBfHIR07sYSP8Rm2RxhOQXtuxVf2Ht9FJJeRa
         HVnHGv6/ouD9dtkAsUIkG5Lq+08RKXKXGwxpZhE1nEJm5z9boCiFgOTcrkMguOSK2qJX
         t8pQ==
X-Gm-Message-State: AOAM532zz/PgLm0AOXY5i5C7Da/0wSFmsJGr5R4YxB4CPAf4xmil9m3I
        1vJ1dCSVSVpcO5MHCKc0rl9Gm4TK2yNpWLsKSCo=
X-Google-Smtp-Source: ABdhPJyxjSTjcCC3q1+chNBc2dgfFtqHNKvgcywOC8BfkjjlY3Gzjn8/vT6Xz9Pg5lWgRXNjTgN320Zq5LydgfkuFlI=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr7224714uam.106.1626775070742;
 Tue, 20 Jul 2021 02:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com> <20210719134040.7964-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210719134040.7964-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Jul 2021 11:57:39 +0200
Message-ID: <CAMuHMdV1f3TM3pKsftNkaOrFifAMdLkEcKdWs=wL54uFhEKoZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] sound: soc: sh: Add RZ/G2L SSIF-2 driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Jul 19, 2021 at 3:40 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add serial sound interface(SSIF-2) driver support for
> RZ/G2L SoC.
>
> Based on the work done by Chris Brandt for RZ/A SSI driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/sh/Kconfig
> +++ b/sound/soc/sh/Kconfig
> @@ -45,6 +45,16 @@ config SND_SOC_RCAR
>         help
>           This option enables R-Car SRU/SCU/SSIU/SSI sound support
>
> +config SND_SOC_RZ
> +       tristate "RZ/G2L series SSIF-2 support"
> +       depends on OF || COMPILE_TEST

ARCH_R9A07G044 implies OF

> +       depends on ARCH_R9A07G044

Is there any hard compile-time dependency on ARCH_R9A07G044?

Perhaps you meant

    depends on ARCH_R9A07G044 || COMPILE_TEST

?

> +       select SND_SIMPLE_CARD
> +       help
> +         This option enables ASoC sound support for the RZ/G2L MPUs.
> +         The simple-audio-card driver and the RZ/G2L built-in serial
> +         sound interface (SSIF-2) driver are used.
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
