Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A704A591F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 10:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235905AbiBAJV6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 04:21:58 -0500
Received: from mail-vs1-f49.google.com ([209.85.217.49]:42947 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235902AbiBAJV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 04:21:57 -0500
Received: by mail-vs1-f49.google.com with SMTP id b2so15213977vso.9;
        Tue, 01 Feb 2022 01:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cEieHSsNvvTiSUOgOYiFLLIk/h28Bm0pZlamIVyWX78=;
        b=DA2SaVCKVAlv7/jBMYL5amAtbRsZmW2pQjLpxT1ynGVfsFbcl9oP6pMES9qVGiDDkA
         uFQ/ziUDmVXl2exLiHfDDSuJADcIdeAKqoxOl32Hzfnm6Lq3lw1/YYB3hPt4tFWOo8Jc
         HdSw9pqUN/wfg3Vu/g2H3GSr985Wpgr2fXOnX9Ww3TILJqZ5vWCRQEa+XWYBlB84v5/y
         caPF86u2SSTOyQOyuNeLGZDCQpp9k2qSle6y1K2TXlfmd915/d8QnLI8yS/QA7cqcAvt
         BCsqCSu1ma+oxnz/5LuWURVcVdCYRyFri9pdgy3x2VGDSsR6xXf54OwzTh1BkMJuZI+r
         sWYQ==
X-Gm-Message-State: AOAM533KXvgvrFIgRUlCRTgjBaPPQDv6PrWyPhMp5Crl+tT01WFuIDRx
        wI0PSeXO54A2zN9et0cRGV29Yh0x40FH8w==
X-Google-Smtp-Source: ABdhPJzYPtAQ6FO4YDVEwhixLCt51PttWHqgmQmckB8WwFl6CDPJoDPZZz3VbP4z2qQI29/zb3SQMQ==
X-Received: by 2002:a05:6102:32c3:: with SMTP id o3mr9130908vss.4.1643707316523;
        Tue, 01 Feb 2022 01:21:56 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 67sm4040775vsh.9.2022.02.01.01.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 01:21:55 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id p7so13470110uao.6;
        Tue, 01 Feb 2022 01:21:55 -0800 (PST)
X-Received: by 2002:ab0:6cf9:: with SMTP id l25mr9738634uai.122.1643707315447;
 Tue, 01 Feb 2022 01:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-10-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 10:21:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXpUXssu8O3g-NjJme_rN2g_8g6JN_q2nE4g1idcddMA@mail.gmail.com>
Message-ID: <CAMuHMdWXpUXssu8O3g-NjJme_rN2g_8g6JN_q2nE4g1idcddMA@mail.gmail.com>
Subject: Re: [RFC 09/28] clk: renesas: r9a07g044: Add DSI clock and reset entries
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

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DSI clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
