Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C592D3B1BB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhFWN6r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:58:47 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:45795 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbhFWN6q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:58:46 -0400
Received: by mail-vs1-f48.google.com with SMTP id u10so1455830vsu.12;
        Wed, 23 Jun 2021 06:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=55QXwvr22S8G1+P0buYR2qozyQS1fW6lW2FrYqgk8aQ=;
        b=talJpful02qswSe5n/zecUVJGcmgoCOszeFvE4O7hh0tuVIVA/NUJn8I8NMYDewCpJ
         Z2YECGjoI3ssPnA6WP3WJQ/ijwlRc3aCkGUyxSi7PcMEk1z9tWNDISxZMiXbfvLIAqdC
         WjtYvGl0tfPK0bGMraLEy/7kJfEoDf8R85J16N3todJC/S1o1o/1qG/hrV7JaiulH4ic
         kC0XdC20sx9BLyMpT4qyVpL6iAv1ae3hNWw2JaU88fEVd0J1I4+3kcBHHFQPYIeLl1/F
         ory6RO9ypxqajMn6ZwlSMIA5/HRmlrRr04IQAwqffY6PDFp1Nbl0RQIksxKZaEMdJm0C
         llSg==
X-Gm-Message-State: AOAM532dx0yhJPiaKcn9/Da3HVivp+FUv8ttfUMBh/s9w95lmiMJRJXq
        XGtC86U9ITZNxjLt6GDaw1atHXstUP6Kp+mdsy0+X9qzSdX4mg==
X-Google-Smtp-Source: ABdhPJynIOS0kQWBBoQ1HEzzM7pwPkpkSYXauN3cD9FTH7VwH1BXAlkoFvLtcyUKa5dsm0E9A3rtdphDO0ILgMIE6aw=
X-Received: by 2002:a67:7787:: with SMTP id s129mr65565vsc.40.1624456587744;
 Wed, 23 Jun 2021 06:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210623095734.3046-1-wsa+renesas@sang-engineering.com> <20210623095734.3046-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210623095734.3046-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 15:56:16 +0200
Message-ID: <CAMuHMdWk4gHc682m1YeAYJ8DLjSVuXaBNNXLfjUR4E=n0ZRJ2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] mmc: usdhi6rol0: : use proper DMAENGINE API for termination
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@axis.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 23, 2021 at 11:58 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

 Looks OK, as this driver uses a threaded irq handler.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Have you tried triggering DMA termination, with lockdep enabled?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
