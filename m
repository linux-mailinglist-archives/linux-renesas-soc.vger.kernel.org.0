Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2474E98EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Mar 2022 16:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243632AbiC1OG4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Mar 2022 10:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243637AbiC1OGy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Mar 2022 10:06:54 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF96E1CFD6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Mar 2022 07:05:12 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id e203so17354045ybc.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Mar 2022 07:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=53hfCds/HOn34hVWrA7541rRTz3YTdreaZ+mvzS7WRE=;
        b=Cx62eGgcgtXYkGjFpRxnw9cG3E1PTmxLGrWqwA/zYtPl9JBOdDem519S2UoyoOHnJ2
         7JnULEL1svsTOyITUGi25DlUzszhdXc4um0N5RXWQZ71aXnLFdRokP3kEujq97AXymtV
         75IAs+4jax2YMyu/9YkSOg4nN64rFw55wbkMc/xPJj39M0o7ibOT2rCoGSPGDZzW99Eb
         MznbzLtmE/j4qrTSAAX3arhLaVYiSVp9HKe0Xc7OMSt7d7EKmLEqCqk6WpE+N0/2UjZV
         5InW4u9eqLKk0kPwrUgWWEd+AtPRHc35XU3RqIJQzMVdZIPsskNQKDpYCiE2LU1Faslx
         5QBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=53hfCds/HOn34hVWrA7541rRTz3YTdreaZ+mvzS7WRE=;
        b=Gx4lY/jJlgSKFinB2p95LplOdd3wKs0qyHcqHH5zykAb8aEYnN/DXmLpQWgtLGJxl+
         rn13QqnW9Ff2pyvmM4OPdubmeuS6oo/BkEu8jS5X9/jXXKw1CmR2vMXxbJmc7GnbkVSs
         sKr5DPTlj1zuQ/QjbllPlXt1DYWtc010GcCIfdr6h1hfxj2zg55dTI55vjvVYEiSiPJe
         l2xaGR9W1mEsHa9qc8dSgIiQKy4pEOdAimq8TW4yaglvv3SIsZToP99ye1IiYHE/QyMy
         EhT5sAmdMmoSLDHKfeYopWt/dmzt+NU4flRc1J/TxSLedXjNKYAPdzkfIvWGtLhs/i3K
         8AJA==
X-Gm-Message-State: AOAM530Zpz/XOTXfGyyKvcz4ZqMCcGK4WQSn1iuAlz3iE4qEo5Grvk2S
        LSZ7z2OyWHP/ctdr7UMmvJ2WAmXxYiTdZYyroLwNDw==
X-Google-Smtp-Source: ABdhPJwS1cf/SA/NQaVx2IlTtQpE6Zm6uckyjLWileFFOnVlhsE+7jQYLkUhbPoSZmGhmdocSjQLYT/bWvm/mPvTQSQ=
X-Received: by 2002:a25:4289:0:b0:633:7135:1689 with SMTP id
 p131-20020a254289000000b0063371351689mr23074419yba.397.1648476311808; Mon, 28
 Mar 2022 07:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320123016.57991-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 28 Mar 2022 16:04:35 +0200
Message-ID: <CAPDyKFq=f3R_37nLq=Vm+6ZaDCqOU_9q-4A1X0r55z9uLT27XQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: renesas_sdhi: internal_dmac: updates after refactoring
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 20 Mar 2022 at 13:30, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Shimoda-san's much appreciated refactoring of the quirk handling allows
> for further cleanups which you can find in this series plus some other
> improvements found on the way. Finally, 'soc_dma_quirks' can be removed
> in favor of regular quirks.
>
> The series is based on mmc/next as of today and was tested on Salvator-X
> (H3 ES1.0), Salvator XS (H3 ES2.0 as well as M3-N).
>
> Looking forward for tests and comments.
>
> All the best,
>
>    Wolfram
>
> Wolfram Sang (6):
>   mmc: renesas_sdhi: remove outdated headers
>   mmc: renesas_sdhi: R-Car D3 also has no HS400
>   mmc: renesas_sdhi: make setup selection more understandable
>   mmc: renesas_sdhi: remove a stale comment
>   mmc: renesas_sdhi: make 'fixed_addr_mode' a quirk
>   mmc: renesas_sdhi: make 'dmac_only_one_rx' a quirk
>
>  drivers/mmc/host/renesas_sdhi.h               |  2 +
>  drivers/mmc/host/renesas_sdhi_core.c          |  2 -
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 70 ++++++++-----------
>  3 files changed, 33 insertions(+), 41 deletions(-)
>

Queued up on the "devel" branch for v5.19, thanks!

Kind regards
Uffe
