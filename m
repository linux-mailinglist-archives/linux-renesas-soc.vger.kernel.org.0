Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC72A429665
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 20:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234100AbhJKSGk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 14:06:40 -0400
Received: from mail-vk1-f181.google.com ([209.85.221.181]:34729 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJKSGk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 14:06:40 -0400
Received: by mail-vk1-f181.google.com with SMTP id z202so7877509vkd.1;
        Mon, 11 Oct 2021 11:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ewoQSRmc/Gfm8On0Kw+znQTtcJ7yHTxEpTqsNKKjkrM=;
        b=UGxj2kYG463GhIWWpHmTDbJlohvaL9QdGW3HYpNUdq2YFJPav/VLrAc9BrJro9hYnq
         INyrbiyDBrGxAjI8eElLmnAxp6vqA6/ODGFvqYdDrLDMO1U7zEgn604Mm3UeS2V6m1DA
         VpT/8SoYBNavol+WPMySEy6WtKSFi2BfUcI+01fBi+j7TCYwJDb9DlhlaIkLVT2i7Q+J
         WvyXlUC7LlCB9VvM9yIL8iJXXvwU4+81wy4t/3KHGTbZOFilnqL1g7xMTGuEIZ5ZWusk
         22FTxoQTY0iiFkJRrH6WtwiHiQlBj+rL2R4faBCy5zV9gHNB+1byET6pSX2ZGonetRUs
         CMnw==
X-Gm-Message-State: AOAM530iaozvn/6vRjqE0hACY0fDHhm5eOvgyengXI+lfLdw0AIRQ/ma
        Z2QFWqoXfe2unp/2Je7W9DBJU1HD/5q3bPy6NKQ=
X-Google-Smtp-Source: ABdhPJyS90BOnDdZXtm2v0yL619hCKeSilj8F7M0Ju0kF8USNYHMTrSJge3cn7fPbLIS4gVQZGn53QRYyFOylFPWJw0=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr21456245vka.19.1633975479180;
 Mon, 11 Oct 2021 11:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com> <20210928200804.50922-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210928200804.50922-10-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 20:04:27 +0200
Message-ID: <CAMuHMdXCtOY_d9XntP6Tb48iKJ7EaogZz2xpBES3LwmMssp2Og@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] mmc: renesas_sdhi: parse DT for SDnH
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 28, 2021 at 10:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> If there is a SDnH clock provided in DT, let's use it instead of relying
> on the fallback.
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
