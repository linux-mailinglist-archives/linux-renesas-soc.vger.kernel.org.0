Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B592F4A08
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 12:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbhAML0M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 06:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbhAML0M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:26:12 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAB7C061794
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 03:25:31 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id h18so903105vsg.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UTamP/ArLqqwGoTYLNMH/RB+OzgOFY7u6lXmJEovIaE=;
        b=UgMjABl95Zcya/xwewD5TR75NWKt5G5GgXaDqG3SLnkwisVB45A4u+L3Ua4kqyacvy
         Bn0yCJVY1CiYWxoqtkyrfRZxztRfJa2aCwS6COtCEMmtJq7FwDpBuEGa+JTivpDDaBJj
         NRR3JPJeRibrwoQNcXKrErfCgTX2GaW0OugPvl4weCufgH2OdmH4BRCXdcY9LPOY1tqB
         NfNmJP+hVexHo1qYOKc0Tef1W/RrKqs+oVGpctpXjtXjpYT/8g1/YwwXEEw5AQX4qC0n
         u7ZR0YL9iEI6PS/a0ycfeo352VhDvgf5V8Nc3FgmEi/4OegCloz+pD5v1thJXv+oJnEv
         HdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UTamP/ArLqqwGoTYLNMH/RB+OzgOFY7u6lXmJEovIaE=;
        b=aLPmCDomtTtdllAG0TpuKCWeXltPlGmOOfsEf/vvJ7BtDljPH+OdTzXeXKBsUhQDGP
         SMrFOliINO4jY7J2v7AeUmsLBWBzyViXTpfz1j1/dbp2AZjB948rafnH4ANezOhTUQrc
         Lqp04DyfEd8b8+LRo9Gr/h864S2ACwjJ+kUEjupSRO0mKTKqEU3jBlkPOyhsZDxs2ONn
         68HRmd/B3TO6MYFY/+y+nsycL2iX1baMpzIOHlUvOQVG4p7VqbhxrS07Trj6Qe7uOuDY
         0CuwMk8hmFeQTPTKqyv6YoldovvihOUomtfpxpjOhDHk0BMScaVCV/ywI1SLaZ5Vhb5K
         pKsw==
X-Gm-Message-State: AOAM530qxO/YoaIIas6GJUyYTSANtA37O2c2wK2rDepMrbBKHW3pzDDY
        I3LCtl92zPOteahAYKQ2aSA3EQzlyZRfI1WL04yfUg==
X-Google-Smtp-Source: ABdhPJwBwHyie480O2xGlwJHrHs3ZflMifx52QfOELTUo6npGeUwrPtutxWDy4YxE8zNu13H6+PTxLqsROPnmyDevQY=
X-Received: by 2002:a67:e286:: with SMTP id g6mr1628197vsf.42.1610537130904;
 Wed, 13 Jan 2021 03:25:30 -0800 (PST)
MIME-Version: 1.0
References: <1608114572-1892-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608114572-1892-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 13 Jan 2021 12:24:53 +0100
Message-ID: <CAPDyKFrE0udk+GY2MnNB7h7GPrdrbLnCwT-U=KunwxUBbdM4qQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: renesas_internal_dmac: add pre_req and
 post_req support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 16 Dec 2020 at 11:29, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> To improve performance, add pre_req and post_req support into
> renesas_internal_dmac. Note that the patch [1/2] is a bug fix patch.
>
> Changes from v1:
>  - Add a bug fix patch for hardware limitation in patch 1.
>  - Remove a redundant argument in the unmap function in patch 2.
>  - Describe the reason why we should not use host->sg_ptr in patch 2.
>  - Rename argument of struct mmc_request from req to mrq in patch 2.
>
> Takeshi Saito (1):
>   mmc: renesas_sdhi_internal_dmac: Fix DMA buffer alignment from 8 to
>     128-bytes
>
> Yoshihiro Shimoda (1):
>   mmc: renesas_internal_dmac: add pre_req and post_req support
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 91 ++++++++++++++++++++++++---
>  1 file changed, 83 insertions(+), 8 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
