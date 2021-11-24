Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B747545C82E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 16:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhKXPGC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 10:06:02 -0500
Received: from mail-vk1-f177.google.com ([209.85.221.177]:45748 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhKXPGB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 10:06:01 -0500
Received: by mail-vk1-f177.google.com with SMTP id m19so1691158vko.12;
        Wed, 24 Nov 2021 07:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G6ZMQ9Rz/OPa3hw4pVyjTqe1id7qBK4ax+xJjcP300s=;
        b=xxwUdPI5BMSWuTOjPaa48ptx5uhS6WXRorGr02v94IxyLDOLJF2th/qsQRzvtNgMTb
         EI+rU5xWE8okeqengToRvKQMO1rt+Dfc20DddzxGiQCclGWhnZcZyIZDfyJb1BsrXRE3
         PgsLGUsooWl2HB06baCeQNvniPl0IAhiATvmgHGOSkwDH9V0/kNtFrKBVWtkcCztTzKW
         ++LDnlhLribfJkxLDLxCVlgk4ZGzG1Eu4eX3jkLGWWQfuUq4PQf2F9Djs179W3jvWlXm
         5DGw+OAG+HaRVJcvb96RMwqbb4MWnSZAz259VCNqd0gotRZNoYnutC0NWRlr3608PLD/
         2qgA==
X-Gm-Message-State: AOAM531CrskLSyf4mplBVZ+uKawUW+BcaluvgRKQCN+fV4DZ0iQ5HnJx
        iiZWxqevEyFKhK8nsnZZ3MHsAKpEM4PSpQ==
X-Google-Smtp-Source: ABdhPJw+vzF+7poZQVCgbiw05o1LETLiJoqmrMpICt1FE8ILeQ9R8I8qRqgIQLG76IrY4YnzWmvdIA==
X-Received: by 2002:a05:6122:16a3:: with SMTP id 35mr28144508vkl.12.1637766170961;
        Wed, 24 Nov 2021 07:02:50 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id f132sm8213535vkf.18.2021.11.24.07.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 07:02:50 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a14so5862059uak.0;
        Wed, 24 Nov 2021 07:02:50 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr25221573vsj.50.1637766170369;
 Wed, 24 Nov 2021 07:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20211112081003.15453-1-biju.das.jz@bp.renesas.com> <20211112081003.15453-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211112081003.15453-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 16:02:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5EfhoWRCrEa0qO4q6yAqwGu1SC-9En6xttM8i06g=8A@mail.gmail.com>
Message-ID: <CAMuHMdU5EfhoWRCrEa0qO4q6yAqwGu1SC-9En6xttM8i06g=8A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: r9a07g044: Add OPP table
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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

Hi Biju,

On Fri, Nov 12, 2021 at 9:10 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add OPP table for RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> V1->v2:
>  * Fixed typo cluster1_opp->cluster0_opp

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -42,6 +42,32 @@
>                 clock-frequency = <0>;
>         };
>
> +       cluster0_opp: opp_table {

"make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/opp/opp-v2.yaml"
doesn't like the node name.

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
