Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899CB39FA84
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 17:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbhFHP05 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 11:26:57 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:42752 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbhFHP02 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 11:26:28 -0400
Received: by mail-ua1-f46.google.com with SMTP id w5so11694546uaq.9;
        Tue, 08 Jun 2021 08:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IBGR5ejB/dxl/FW55EzoAlwiWItXDc9ITlsShJNBY9w=;
        b=l3En7gXGLsUjzG+MreMzl6V/z+3xW8ZzWzsp5Fxs7M33J+h31MaaGVPSLdKR7veWio
         l/lvqm2spGiTsSijU5uihLysd8zwlVS05WWDpxgUKsb5NxuBUdz1e/03LLgILDq+XcSE
         NixjIe98mzdafibGB7mkqocVLXPkQD4dAqwg0Xf1TBHHhqSFi2Sz8haVohlbDgITnCZ4
         NWmgN5eoBunPpGQzX6pWfL1jcIc9XqVMrzNTH8KU9QcTKTg26WBwwowfRCt8s5kUeA7n
         GBIOdacaNa2MRcG0JUIex06swmfDDw1L51uoGyo3vOEg5Rv42kv1ZYW8PGE5Z8PEmofJ
         /dEA==
X-Gm-Message-State: AOAM530jmaG5J+IZF26sNMYxdKCSHYGHJdhNW8A6lqlw1T0QgJGO2aVY
        dwRftKpEJo1A3SRTkUv5fovTCvAn7i+KIma1ZPE=
X-Google-Smtp-Source: ABdhPJw3bFt52EWfQSJxaDegrbjgh/Y/tlHQw5DPNKV8+7btGc0HyEv6h40v0XQgtiM/7LfCVT8LvYK3loF5OK87f0k=
X-Received: by 2002:ab0:b09:: with SMTP id b9mr8529551uak.58.1623165863831;
 Tue, 08 Jun 2021 08:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210603221758.10305-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jun 2021 17:24:12 +0200
Message-ID: <CAMuHMdW6Cv9N2qMSSB2-QAV6x5mJCQPHZmm2pWhhBeo7c3R_ug@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] soc: renesas: Add ARCH_R9A07G044 for the new
 RZ/G2L SoC's
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 4, 2021 at 12:18 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add ARCH_R9A07G044 as a configuration symbol for the new Renesas
> RZ/G2L SoC variants.
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
