Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E12458A1D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 08:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhKVHxp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 02:53:45 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:43635 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhKVHxo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 02:53:44 -0500
Received: by mail-ua1-f54.google.com with SMTP id j14so24919792uan.10;
        Sun, 21 Nov 2021 23:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kT5Hh6yPK9g0/wKHmuficJ8QC8SNf9TRKWAOYqxbSfY=;
        b=lsVBN8YmUv5eDLrtVFnV2XySjIH12wBvsJr6ZOow1ErdMkAneuPm5RFnn2omuamCNc
         OsMGcnE7ppKypAS72qzhOYE0KgINVqkaJpc3uFXaKlUKo6+2HNFuhF+5Ied6p1MELJAW
         /3AZWQmQLctRfgw3Uh9Jk737r1j9afaQDqEOureXXcxFMX9H4H9wQdpV94MdtdogMmJF
         zBvR73rqJv1/ZZ+l+UvEn1DraNI0Sh1tkUUG4J+PD8LIXVxPGl9toDml0aJ+sEJVa1FQ
         9YzmU7fB8VQXdigZeHHRKwro86u2pPk6UBJ/kExbd836HHmGVFvw2i+8AaGRvEChkWb4
         I+EA==
X-Gm-Message-State: AOAM532QEr0OxozaWUS83zMEdAX+cDgBzk6VzVG/b7CLcrB6PgH6qitz
        Ozm64KgLHtCCvwJNPO5x+kEMlxv4l4JNEQ==
X-Google-Smtp-Source: ABdhPJwO+LaKdZGLlP1WxivDbOshh/lSX37IcvC+iYanH+ZPDbwzXYqKU+aw2TfafOVN3nIUL+EGoA==
X-Received: by 2002:a67:e109:: with SMTP id d9mr127999943vsl.19.1637567437870;
        Sun, 21 Nov 2021 23:50:37 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id q9sm4042363vkn.44.2021.11.21.23.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 23:50:37 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id p2so34648969uad.11;
        Sun, 21 Nov 2021 23:50:37 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr127486612vsj.50.1637567437054;
 Sun, 21 Nov 2021 23:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Nov 2021 08:50:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTLYn=14RzJORp1mn-TSwC1rk1BO_9L6TG4g9JhH27JA@mail.gmail.com>
Message-ID: <CAMuHMdUTLYn=14RzJORp1mn-TSwC1rk1BO_9L6TG4g9JhH27JA@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Silence clang warning
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Sun, Nov 21, 2021 at 7:05 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch silences the following clang warning:
>
> | drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer
> | type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |           rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fixes: b04cc0d912eb8 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -250,7 +250,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
>                 return PTR_ERR(rpc->dirmap);
>         rpc->size = resource_size(res);
>
> -       rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> +       rpc->type = (enum rpcif_type)(uintptr_t)of_device_get_match_data(dev);

While correct, the cast to "enum rpcif_type" is not stricly needed anymore.

>         rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>
>         return PTR_ERR_OR_ZERO(rpc->rstc);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
