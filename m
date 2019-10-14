Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E681D5F48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 11:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730922AbfJNJtM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 05:49:12 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34413 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730677AbfJNJtM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 05:49:12 -0400
Received: by mail-oi1-f194.google.com with SMTP id 83so13238011oii.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Oct 2019 02:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nf+fM/3PuyBlhAi8/6Sa2Tnn3eMSHcjqaBNGv0oGHEI=;
        b=T1gsMCMfJa7YKV+LZtvuf3bd5nq5kxSVVxBCutW2/1/5v4trA6g7yfARbFzOTdsdmn
         3OiGEMwqlicaXKvKT3y4zaK/DNUNHLtw3/eyy6VOjh8E+2sRSUofrtisX3CsRLPpLOv+
         T0anGF8CjyKONHufJs9ZjfquhcR+bbAgTL50tJ055VC6VTpNSEaXyGraXnM9/eKmFCrI
         Uud4ZihRdUPFrepsNDCHAzB+R4ki+zb8DYMhelkZOJ/JiDskPN8lWPKlfgt72ovmdF5x
         KGJopvn1bUNo2EbjMcGTslJdE1q4rPPSJj6wZKB5I1Lw1y6mgbHHMBtjJyNLhUu1EL4e
         7ebQ==
X-Gm-Message-State: APjAAAW2B9P4JLnuK51TX7kOZYVyvZ+k5hJUQi5tFnmIJSUTmF13l+6M
        Flxhauue5LKY6Xz9bnfo6LM4q4iiJBbVTtSjGzE=
X-Google-Smtp-Source: APXvYqzVYeqv+gWs2Cm43LxJGpJOApp3dlSavsD0SWzQRyhQE7Faa+SQwG42GSLTMXNTV1lSFrrtZ2MmaEIQ6XnLNNM=
X-Received: by 2002:aca:882:: with SMTP id 124mr23822787oii.54.1571046549873;
 Mon, 14 Oct 2019 02:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191008060619.30237-1-nobuta.keiya@fujitsu.com> <20191008060619.30237-2-nobuta.keiya@fujitsu.com>
In-Reply-To: <20191008060619.30237-2-nobuta.keiya@fujitsu.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Oct 2019 11:48:58 +0200
Message-ID: <CAMuHMdUfbFADaFXTgL98ii_sf12RdJCn88JjM=Z_4Mc2gcqTHQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: pfc-r8a7795-es1: Fix typo in pinmux
 macro for SCL3
To:     Keiya Nobuta <nobuta.keiya@fujitsu.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 8, 2019 at 8:06 AM Keiya Nobuta <nobuta.keiya@fujitsu.com> wrote:
> SCL3 is assigned to GPSR2 bit7 referred by IP1_23_20 macro.
>
> Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
