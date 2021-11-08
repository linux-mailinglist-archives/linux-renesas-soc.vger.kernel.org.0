Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79323449B4A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 19:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234045AbhKHSDe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 13:03:34 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:46000 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234353AbhKHSDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 13:03:32 -0500
Received: by mail-ua1-f44.google.com with SMTP id ay21so33145745uab.12;
        Mon, 08 Nov 2021 10:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xD5WpE/i491cIQ4EgharPHzA4o0LFhXY8KT9/B4S85o=;
        b=j67Nuc83Jj2FAlpIzM1cjI8uHmYf3iuJZ0J6LcdVfsf9sM/wHqzT1sE2hC4rzOMcnn
         ODQRDRwjRt7bt4rr5WJPLzEuAde5TCAy5VuxU+hYF+WAJzNzNmgmm4FK3ZIyDpbgYRBJ
         1onuwIZ16fFsIdEIGwJF0Wbx3DwVmu4J/IGgxr1OOEn7kpjF8DUbo1CQUEucmdj9yYuY
         InilwO4NaKkZKS2YT8egK7Fssp4IYw2K1+uXKNd5JguJYdXwXf4DobFDLDKCT43OI9eg
         SFm1TMmxmutAR918lWupG/M1ybV3v7ykvlhJzex34qhlVJjnYOAR6e3sEbbsawhrw2jl
         CxtA==
X-Gm-Message-State: AOAM531rRdB9voF6TX65IvBO+0UA41hFNIyQplgnHDenBBtPQlFxsDZI
        CO+LbUYkj9nPA0qQo/f482N/DzXN2UrReS69
X-Google-Smtp-Source: ABdhPJzTusuChGW2wE96HobRbeikcsZSx6BrppM619o1n5k8B0nc7CfNG5zuozLhvAQMUd9FHB15bw==
X-Received: by 2002:a05:6102:242f:: with SMTP id l15mr1295735vsi.11.1636394447379;
        Mon, 08 Nov 2021 10:00:47 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id h13sm1636858vko.41.2021.11.08.10.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 10:00:47 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id d130so8689832vke.0;
        Mon, 08 Nov 2021 10:00:46 -0800 (PST)
X-Received: by 2002:a05:6122:1350:: with SMTP id f16mr1449846vkp.26.1636394446787;
 Mon, 08 Nov 2021 10:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20211103195600.23964-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211103195600.23964-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211103195600.23964-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 19:00:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbpJGiJym+nbF_wmF6Ft+=eWt0P_JNK0ok1wiY_pJngA@mail.gmail.com>
Message-ID: <CAMuHMdUbpJGiJym+nbF_wmF6Ft+=eWt0P_JNK0ok1wiY_pJngA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable SCIF2 on
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

On Wed, Nov 3, 2021 at 8:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> SCIF2 interface is available on PMOD1 connector (CN7) on carrier board,
> This patch adds pinmux and scif2 node to carrier board dtsi file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
