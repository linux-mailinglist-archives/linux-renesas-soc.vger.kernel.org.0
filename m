Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFD42EF2D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbhAHNAh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:00:37 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:39053 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbhAHNAg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:00:36 -0500
Received: by mail-oi1-f180.google.com with SMTP id w124so11240994oia.6;
        Fri, 08 Jan 2021 05:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O3IR7iq4eo3wda6A5dtI0hW3IkSRK0oNkzH9O22jj6E=;
        b=ppLmuuWGhsO+bQESDPHyDGddclcqz1COhn+1y93vDcnAMq6VQdYdGvbMq3LZbwo5xN
         0Yr1k+FiGaMqe7EmJdeHQMWgiETboqtYV5waD1JluCsjxoyn3wm7W1357wlJTjrB71U9
         yVvkA0R+HrYJONi/Sxz9/Kr1wKTkQDgvSDLJhbH8J60C+myTArnR4DmgOPx8wrLtEDXz
         rTyeUL0hECuEUQcjVbnT10bKDSPt5vzZhxND7T3Z7GljLLujiv78VFJh4E2JPhZnBqpf
         IOd2f9z+MVWo2trqR1yFoyafq0eLuFeGiqtX04XtUE5rXCy4+RTKPBVUqQs5XghvFF6x
         Pt8w==
X-Gm-Message-State: AOAM533cCVweJnAgEw+KXmVfewN7yvCTIz/1t5Cg8MyzKLwae+I4PR9A
        vpFDVUq/6F0nd3fh6RMMLNdCZsVDQ3e0isQEE/I=
X-Google-Smtp-Source: ABdhPJwuJMp7mU+ha1XsYXrf9H43msqffFgUOpFoQK6aCpTTkb1K/oFpkIZmYSr/YLjZEythcim+psnkXcVKqzLgPlg=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr2234490oia.54.1610110795372;
 Fri, 08 Jan 2021 04:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com> <20201227174202.40834-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227174202.40834-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 13:59:43 +0100
Message-ID: <CAMuHMdWt-s==dwMefvZXPvSEV76mZDU1KsZguE+jbVoe9QwD+w@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: r8a779a0: add SDHI support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 27, 2020 at 6:42 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We use the shiny new CPG library for that.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
