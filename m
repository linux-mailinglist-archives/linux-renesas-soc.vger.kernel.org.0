Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7A942891F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 10:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbhJKIvU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 04:51:20 -0400
Received: from mail-vk1-f178.google.com ([209.85.221.178]:33439 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbhJKIvT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 04:51:19 -0400
Received: by mail-vk1-f178.google.com with SMTP id t200so7153440vkt.0;
        Mon, 11 Oct 2021 01:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gp22OVwfQOs9NnhqyrR1Tj8g/5KKGlZIxZikJgYPcPM=;
        b=TP1HREGRQmgn6v0+Bj9QFvI39CeSiIgi7gSRKNROmxsjQP3le+ByfQUKEzl9VXoxux
         C1H5pcnMHr59BPwsWDdCEImIrg0Wnnhk0qaJRCM37E1jrimVVyiYUlrPXxhqFHeKnTaR
         SwH3OSvcZPujgcxbAHOtao7BQTdhgHgDnPhLJG9BTSFShiOgN9/CCgpOjL0l4Jmyvu6R
         ij/nINgNzEHk2lox4ZPKb+PO5q3gRAe5hG2+GpuhyPyiNa8/Ht6Cjzh2+YEgxyOAS+8r
         m/iU1COmMUl0p11UtLnVb1wgbSAcaGPGmKd+7OC4yO2BTzm//nQ3Ihn9FcHfeSjR7hOK
         BbHA==
X-Gm-Message-State: AOAM531rg/gI7Mn0S7jcQ6R+x8OsW0eB7ry4tqrg2jhb8yeyRmepfiwc
        swge2NWVj1RzXhhA5vr1vWcxAjKkbL5f8sHq1dc=
X-Google-Smtp-Source: ABdhPJy6iT8kKerNVnoeZwyHq7HU8CdeqaMVxdEOm+PRljXKk5qiZSwo1sfdJ44LJvCfiO+mlbdAc7ZeeImSeWd0/TU=
X-Received: by 2002:a05:6122:a20:: with SMTP id 32mr2717641vkn.15.1633942159417;
 Mon, 11 Oct 2021 01:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211010142520.21976-1-biju.das.jz@bp.renesas.com> <20211010142520.21976-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211010142520.21976-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 10:49:08 +0200
Message-ID: <CAMuHMdW9arkEu3+wTFatcr_+22L-PYzLkDk-9tWwh91JYmMgQA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: renesas: rzg2l-smarc: Enable microSD
 on SMARC platform
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Oct 10, 2021 at 4:25 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch enables microSD card slot connected to SDHI1 on RZ/G2L SMARC
> platform.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch has dependency upon [1]
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211006171605.6861-1-biju.das.jz@bp.renesas.com/
> v3->v4:
>  * No change
> v2->v3
>  * No change
> v1->v2:
>  * Used angular brackets for states
>  * Removed extra space from power source
>  * Fixed gpio-hog node name

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
