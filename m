Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A84D469659
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 14:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243659AbhLFNOh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 08:14:37 -0500
Received: from mail-vk1-f171.google.com ([209.85.221.171]:35796 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241808AbhLFNOh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 08:14:37 -0500
Received: by mail-vk1-f171.google.com with SMTP id q21so6744578vkn.2;
        Mon, 06 Dec 2021 05:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOGnAE7aWIZUaAPnqbyXVVw3Fo9nupe2iDaTMJ1nbm8=;
        b=lv4YT8B22or3CQnaab9zryXoaOHMesx2m9xIZrVpnmc/J+UtB3TaYr9IH9l5RTZ6gx
         RODB1nFQRosennlU98oX0P5gcee+zmG+IKTucbvrNp+VlyVI8cdOZpq+K8RJ7wE66WUn
         QMudBVFdouT7vbha/aYllCjbCkHxK1GEXr49ItS5xEsZCAZhygWUy+IfiVXI9b1zY8H1
         UczQQBkykuSgUnquZ5ilIUjgVFpGuC90Gq0k8jTiTdFxvTWZphLKThcks25ihPpGlSk6
         y6wzhS+AuaaTueR4GedbUq1Q/heBWZVQRTvFXHVYVX6h2Zjmb8d2igpITFZQp72Rszov
         ozlA==
X-Gm-Message-State: AOAM530oWrf8RGu7mKKC72xycAjV9Ivbr0PCYHGiJMdUmRsErzMWtq2h
        ugpNMwn0H23iGHv9MPaI3/u93hxSlahwEQ==
X-Google-Smtp-Source: ABdhPJyaHegtz24D41WIY57tphpBg1BzI5zLflz9YR174IeZV/cMu3mH0XSjOZNXC3i0dtBlk2Y8Fw==
X-Received: by 2002:a05:6122:1812:: with SMTP id ay18mr41537336vkb.18.1638796268195;
        Mon, 06 Dec 2021 05:11:08 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id u145sm4233377vsu.25.2021.12.06.05.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:11:07 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id l24so19451452uak.2;
        Mon, 06 Dec 2021 05:11:07 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr39088850uaq.114.1638796267553;
 Mon, 06 Dec 2021 05:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com> <20211203115154.31864-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211203115154.31864-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 14:10:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHBs_N4dgU595oxhVrM-ubsBP8BX+uQONPWBpDzeYHpw@mail.gmail.com>
Message-ID: <CAMuHMdXHBs_N4dgU595oxhVrM-ubsBP8BX+uQONPWBpDzeYHpw@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: renesas: r9a07g044: Add GPU clock and reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 3, 2021 at 12:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add GPU clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
