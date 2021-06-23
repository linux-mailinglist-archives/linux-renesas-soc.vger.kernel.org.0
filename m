Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C4E3B1BAE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhFWN6K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:58:10 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:37433 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbhFWN6K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:58:10 -0400
Received: by mail-vk1-f176.google.com with SMTP id o198so525768vkc.4;
        Wed, 23 Jun 2021 06:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ahtRRokg3yDOqqCXUZvHVEkraTmmSQqzB4YruA7miw=;
        b=YrjwUWn/tvrvku2aXnYzOOF5o6O6DW4vgQNFOfEDZ4b429FP+6ObdseWWY3zCmc3YJ
         pNgviDiMBbGpxSnEttpzuuAJMtnBp4ZeasnX1EqO5/LsqY0W8sTGIETWG8S6+PLjP/Ml
         qNrsB/sLjtRNp60aRLPdXVXr3lTFTmR/DIrHjFUbiRvuEtWJNon0qRN895z4EOqkZpyt
         0I3Z43bxHTVffei070PS32jtd96FDxEk2WXjR30Dg1uCyJvRIXEGakpeFvU8fVoduNoH
         4D/X+G7tHpE1tlK9odmgpBtTaClpAjhUtxCwu3zCEPb6vNIZCkw0JNiuMyKO6Va0CgqF
         xexg==
X-Gm-Message-State: AOAM530iuIOKrGedLjrDzhQRqTizr7euk9oClkD+e7HNZio/i/Te0sGX
        tOmYLt4N/yKY8HVK2x6cerEgaGVFOtIiDGR+eJc=
X-Google-Smtp-Source: ABdhPJwrBbGVEjgg6mlm9xRmaOGLgwNPSIOLeOhPKLe0eF8/M7KdOEGwhUT1wvFna7dMOCKd5TCAjpk5HjYorgjQ2Oo=
X-Received: by 2002:a1f:d8c3:: with SMTP id p186mr23538101vkg.1.1624456551487;
 Wed, 23 Jun 2021 06:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210623095734.3046-1-wsa+renesas@sang-engineering.com> <20210623095734.3046-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210623095734.3046-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 15:55:40 +0200
Message-ID: <CAMuHMdWeW7L4x9Q+h5RrR8JzKN9WagtSm47vFGg8Xh59f-EwkA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: sh_mmcif: : use proper DMAENGINE API for termination
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Jun 23, 2021 at 11:57 AM Wolfram Sang
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
