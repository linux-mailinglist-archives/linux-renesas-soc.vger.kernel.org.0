Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D072429652
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 20:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234280AbhJKSFl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 14:05:41 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:38911 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJKSFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 14:05:40 -0400
Received: by mail-vk1-f173.google.com with SMTP id bb12so5829453vkb.5;
        Mon, 11 Oct 2021 11:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R3MOSa3Q2F4PNWqNn/XmjDVVvN/iG14KyrHBNlpjdIs=;
        b=yn5iiMe48tVjLZxtfxTOaJXaJ+gIwsK6ZHnESWWXuFqJEETuhi815Yvv4CcdakynZw
         ZHCcoc4OZwsac2JeeJVRtbPOR8L+3GDlA5VgJyB+bSbBNz2+4NLoIV7yEmUwC2YvCIKr
         yCmk5MeULDJL7WRelFpIs9uiYfXUQUp4Bjzn0ZFUjY0BbYwvKjnNJLIWZbDepZTztpfx
         8uOiZBCRnKIGcNG4VQcWjzoO0soZkKyuv6eRjZ367ii6Batx3QLIS7fjz790gD63LVJJ
         WNSHRLY/AKq8T08AZZsGfs8sWWrZZLW7mu70O+N5Uqa+dMsDdzQsW4jZZRO3IYGGkZk9
         CuGw==
X-Gm-Message-State: AOAM530dLBzCAxuenlHIUwsstzARtSCZJWb5NegYx45VXoFQ/cK0q6gd
        J5WnwKkmckwnXzNKTjf38y+anxjDRKa4hXZ0DHq5VOC5
X-Google-Smtp-Source: ABdhPJyBMWRUOQdKeDFmUPrZZaa/qRAv9EU1NCYJvUMYA2VOVv5Lqp163845l8UGixMo+KQEJcmQnW1c1K3SzKuCEE4=
X-Received: by 2002:a05:6122:a20:: with SMTP id 32mr5611408vkn.15.1633975419406;
 Mon, 11 Oct 2021 11:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com> <20210928200804.50922-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210928200804.50922-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 20:03:28 +0200
Message-ID: <CAMuHMdUx0c2YEQc6ho_rR07NYvuGfMN=PL1TdapcmCMbGQnAOg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/9] clk: renesas: r8a779a0: add SDnH clock to V3U
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 28, 2021 at 10:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Currently a pass-through clock but we will make it a real divider clock
> in the next patches.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
