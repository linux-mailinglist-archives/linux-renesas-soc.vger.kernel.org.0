Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7671B45C92A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 16:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344869AbhKXPyI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 10:54:08 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:37796 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242021AbhKXPyH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 10:54:07 -0500
Received: by mail-ua1-f41.google.com with SMTP id o1so6049390uap.4;
        Wed, 24 Nov 2021 07:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AqdjLPevtkpLJ208GAm/lw/k/TcIvnCN7h4y57XOZ6o=;
        b=Ym0ve3pRmXzYGeWeutp9ln+ep/0484wVuhPSAt8n+zs7+d8cbNWXCH8iyknwM0ZmWK
         og1E1tM64OCjvg+nSZ+lQvmdS9CSCQiR/IWEeQexhNloAQHKciVHMnvLr1m7J4ldYZxd
         ftIpMPhUhJLblBki0BYnpqasezDfMl7vZ3U97B0D6jqUXCVpBOpP5UEj0xTMnpj/0sWK
         uU9T/4UsJL4mloUDK0fshYmCV1HDkmaZZrmZFXXZPv/+n6OS4sD6th3EzbCbqkAKZX6d
         ZTqvERyNEAx83WEEo3pK9TWQxV4kW9m1x1Gteyx9r6FHWv+m3nWbFZGSb8CoM3QG7Xmi
         jB7g==
X-Gm-Message-State: AOAM532j8fOeS9hdRvvukY8UjRymOCyCdHYSU5swyM1JvNzGT8WyZyV9
        qWqaJPTAo5CeoOXV4RAu5YFJFh/HF8g5Jg==
X-Google-Smtp-Source: ABdhPJwv/c3uWVtNxh5K+icYPrFl5r4iqoYN1NL4mhiVuF3dfEKgtfkhYbxqo/t0A9D5G8A+DZe4Kw==
X-Received: by 2002:ab0:2041:: with SMTP id g1mr11875774ual.131.1637769057394;
        Wed, 24 Nov 2021 07:50:57 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id b11sm147714vsp.6.2021.11.24.07.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 07:50:57 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a14so6179829uak.0;
        Wed, 24 Nov 2021 07:50:56 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr25048289vsb.9.1637769056684;
 Wed, 24 Nov 2021 07:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20211124154316.28365-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211124154316.28365-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 16:50:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNCb6OaQnjuz2PPcDGZ3QPe412v-Sh70HXn6V=a4w9jw@mail.gmail.com>
Message-ID: <CAMuHMdXNCb6OaQnjuz2PPcDGZ3QPe412v-Sh70HXn6V=a4w9jw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r9a07g044: Add OPP table
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

On Wed, Nov 24, 2021 at 4:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add OPP table for RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Fixed dtbs_check warning. changed node name opp_table->opp-table-0
>  * Added a blank line after opp-shared.
> V1->v2:
>  * Fixed typo cluster1_opp->cluster0_opp

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
