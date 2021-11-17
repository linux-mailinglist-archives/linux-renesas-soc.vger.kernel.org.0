Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E744544B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 11:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbhKQKNy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 05:13:54 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:37814 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbhKQKNx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 05:13:53 -0500
Received: by mail-ua1-f44.google.com with SMTP id o1so4706394uap.4;
        Wed, 17 Nov 2021 02:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qevdWOqC+tLNVkrAWY5Ram6wKwTTrGq6c/WGLRh1MTs=;
        b=JHeDgYBoobloEOzmS4UsTslPHFV5UL8l84pQoXJowfSE7B1ycW9Vif7aX3DbyGEa+6
         jdSnvJUVrCsqqWwWjaVHxlB1oDkXkK765o9RQnT7vIGPjoJ1I4OT7tlqliQBA8SZU8bp
         kV2jxkKASgk9PiQ6XCf/DXfGVK77qHT/HRdqkzc+Q6rz1ZRAi8KAw01cyEZNVFVqGAfk
         KB4raA+Z2UnDuATLq2LKqioYwb/Rbu4yxib00IiKHqCyy7q7yqErsueD9L6enpTQVN4R
         aPpTIHSX20MDYBQgDfVOQuGnTu6BWdoqpq2121VFXO6s9Uk3507HpJlC20joqosl3YsD
         ZJOw==
X-Gm-Message-State: AOAM531HdK9XcQJ5UGm7lTDOAuQO4myOpDMQlMBA5NQXRuixBBWmadF0
        6JPWbrIJ4VLM7WNOlbkNP8CyFBxMdZvktQ==
X-Google-Smtp-Source: ABdhPJz2IKejb+wBnv4SXliW3evzzzQtJ688e1/e9Ys3/LihZNn1vJlFel5SHVKVIQBiKdbm24OO1g==
X-Received: by 2002:a67:d61d:: with SMTP id n29mr67070534vsj.52.1637143854405;
        Wed, 17 Nov 2021 02:10:54 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id l24sm11528127vkk.37.2021.11.17.02.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 02:10:54 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id e64so1300450vke.4;
        Wed, 17 Nov 2021 02:10:54 -0800 (PST)
X-Received: by 2002:a05:6122:20ab:: with SMTP id i43mr86278652vkd.19.1637143853825;
 Wed, 17 Nov 2021 02:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211117011247.27621-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211117011247.27621-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Nov 2021 11:10:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbd4e=Z4+s3VOTCSwitdG=wYV8M+MotWBiK=HwhwuopA@mail.gmail.com>
Message-ID: <CAMuHMdVbd4e=Z4+s3VOTCSwitdG=wYV8M+MotWBiK=HwhwuopA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg2l-smarc: Enable RSPI1 on
 carrier board
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
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

On Wed, Nov 17, 2021 at 2:12 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on carrier
> board, This patch adds pinmux and spi1 node to carrier board dtsi file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -31,6 +31,7 @@
>                 i2c0 = &i2c0;
>                 i2c1 = &i2c1;
>                 i2c3 = &i2c3;
> +               spi1 = &spi1;

Do you mind if I drop this while applying?

>         };
>
>         chosen {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
