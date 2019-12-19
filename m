Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB42125DB9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2019 10:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfLSJdt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Dec 2019 04:33:49 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45534 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfLSJds (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Dec 2019 04:33:48 -0500
Received: by mail-ot1-f65.google.com with SMTP id 59so6444584otp.12;
        Thu, 19 Dec 2019 01:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Itgc1DJzsEvBHkSe6A7L+muBojC3hvR2dVcWBCiTB90=;
        b=BCQ/qceUyp9XIm3vrIa/j/ISB5xY/1ec3MvlFIM3uG5jrrvBniTJFi/HoY4Sru41KJ
         5OpHxNYF/POi9IpjF5IQ0yziCZx740djQ5Yd8X+NJ3Y4zrC7UnCd0KXrr6kWfq/Q5Nkn
         qHuMzlGSWSsV04XNcfIqCQUiESN4f1JYLQvGALqhxdpLzESCf49/ae6b+94zNQpOxFUi
         xDWUygRG9uaG0QQpZUE3S7aLxfaKs/wQgmTiynmhhgyiauvHop8JzOm6yvvZIo1uHXmh
         XBpbak0F5/A4EEn/nOWkLVghLQ9BNxyNWaFZan/up38yvrl+n9z3zw+Mim87200wlVNY
         yyPQ==
X-Gm-Message-State: APjAAAXlPLQAn9MZhqX+2tr9mG5N9hp3qoLg5tvDm0OJuUtYcnOXFmvl
        aOvCSD62vnue43lWGpglEeMqpz3YD8NjMWIZP/JMiA==
X-Google-Smtp-Source: APXvYqz+b/l1UyOL/G78QFesbR1f9uv8LKNCZ4hGUaZ9p6mG72cwUUIiD1cVj3Ik063i2NFU0R+0Ata+TSpyMa0lLfQ=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr7991127otm.297.1576748027939;
 Thu, 19 Dec 2019 01:33:47 -0800 (PST)
MIME-Version: 1.0
References: <1576673984-37752-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1576673984-37752-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Dec 2019 10:33:36 +0100
Message-ID: <CAMuHMdVcf7gsnrDfqTD0MpxBj_iPt_pFnuddfp_BeYpGF8-taQ@mail.gmail.com>
Subject: Re: [PATCH V2] clock: renesas: cpg-mssr: Fix the typo
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 18, 2019 at 2:01 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch fixes the typo %s/r8a774a1/r8a774b1/.
>
> Fixes: 10003938a0c64 ("dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1 binding")
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
>  * Incorporated Sergei's review comments.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.6, with the oneline summary
changed to:

    dt-bindings: clock: renesas: cpg-mssr: Fix r8a774b1 typo

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
