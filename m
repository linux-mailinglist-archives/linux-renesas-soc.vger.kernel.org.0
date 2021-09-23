Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3D4415A7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 11:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240101AbhIWJE3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 05:04:29 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:45712 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239985AbhIWJE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 05:04:28 -0400
Received: by mail-vs1-f44.google.com with SMTP id k10so5738511vsp.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Sep 2021 02:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jLXlumI4j+579UGeRtcYa3gb1lSCZ7FfabuRwwTdX38=;
        b=koSvOi5mBgtSKUju5jdcQBHoj35I+rRGmhi5ULKZ8IgDrxGNvBtTPaWHUrogXOJdxd
         uzLGKEhv1hkCSToE4kBZmA9/VizrGx7N0esCKWd2nULTd1dHJHcfC6R0cz7VS2CT2ZNd
         xASh807HYx3me2jTa/jPPg2wiphd9x3Bc/g47z+GS9PVu+pnNHNDT3i+v7rMZUMeM2jf
         c8GRLfGZTeeGDWO7LittpIgKJbFXyMs4XauO5HJiqAPYyjnz4LSDWAV4Oy6rMqQCOYaH
         6GYjxMBRUBC7Fmsyk/GrQ2Bfz1wZmT9nqxyAjfMMW9/fEKf7TgYZu9dD0ALpizr7LY8s
         i2LQ==
X-Gm-Message-State: AOAM531Deqlk2aGdOTHgmovX1H0KMu4agJL6baELIO5qa3V4RSKyxT65
        EICjk8hOSHWUnAGHSfLPbt7OKMKobgG8Ei6wx3c2i5A9
X-Google-Smtp-Source: ABdhPJyLFEJ1/wVgYOZxr51rkTL0C7wD9T0quSj9euLqlFqWvNrf1FItT6TijEwKseehzzQGhKOF9WAeCMGJ0AOzBMU=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr2910778vsl.37.1632387776692;
 Thu, 23 Sep 2021 02:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com> <20210913065317.2297-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210913065317.2297-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 11:02:45 +0200
Message-ID: <CAMuHMdVb9Jr=AVXdE-_N3_6SS6E8K-mFvQzSuXNhXDmEyhgqYw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] arm64: dts: renesas: falcon-cpu: add SPI flash
 via RPC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 13, 2021 at 8:53 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Comments: The BSP used 40 MHz as the spi-max-frequency. But it is the
> same SPI flash chip as on other R-Car Gen3 boards, so I took the max
> value from there, 50MHz. It worked so far.

There could be a trace spec violation causing possible corruption at 50 MHz.
I think it would be best to verify this with Renesas.

> Probably the boot partition could be described more precisely and split
> up into further partitions. Do we want that? So far, I kept what the BSP
> is using.

It depends: what do you see on the board you're testing on?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
