Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461CE3A0DBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 09:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237146AbhFIHbC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 03:31:02 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:43915 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235591AbhFIHbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 03:31:01 -0400
Received: by mail-vk1-f173.google.com with SMTP id d13so758085vkl.10;
        Wed, 09 Jun 2021 00:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2GQq0HPTJ2S5Whofw3MbEI39luBeTQHQ03bcxw7FiEs=;
        b=Z8CQNsq3FYJr1hbN+IssQmPjQ29wzGTA+aJLzJIiMgXsN5k6Ry9zaM8bpF+gKnWxUl
         oy2QiP9CzEhQFIJ7iGSItvaf7j0DjTSjYAjDhJUuyjg1Az6227ND9SLgxdSC5o3fL8Zw
         tVAxmtRzbRoDKTfNPf421Yxf2vK4gJADm8kfxPdsZehOHgPH4ExgwB/2pu7I6/WaXNPA
         ZMI+RqaJbENGufiTPvV4HS6NHIwENZNlV16iMkE3mXZGUVM8sV7+pSsvBlAr92Xq+pAh
         Gx/b/JEzUAxzq+pOWGHMkm0CYq6CoabnPH1wZh0ziktXQjPQWkrGIsRLFbYv3/KEl01d
         T+Aw==
X-Gm-Message-State: AOAM5321WzEnF9XOsSVlWwpkPx5hKAbI658T/sknLT+rrNUAv2W7sj3w
        jP6ZFDvy+gvc9SpjsBHAYm2CAQJHXJP5iGgD0hE=
X-Google-Smtp-Source: ABdhPJziCLEP431k48WCC7B+LZ8k5p0faJVZqOWFQw/t9DCPOWyPwGLZckFtp5qsJ1L/rYCu7BihFN7CjlkWEXuQ580=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr3278940vkd.6.1623223747300;
 Wed, 09 Jun 2021 00:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210604180933.16754-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210604180933.16754-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 09:28:56 +0200
Message-ID: <CAMuHMdWxo+ROeQxGVpARP0aJN+FX8JhA5WSzzHsgYcatzAK1Pg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a07g044: Add SYSC node to
 RZ/G2L SoC DTSI
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

On Fri, Jun 4, 2021 at 8:09 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add SYSC node to RZ/G2L (R9A07G044) SoC DTSI
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
