Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7DB4F9152
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Apr 2022 11:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbiDHJIi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Apr 2022 05:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbiDHJIh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 05:08:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FF4100753
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Apr 2022 02:06:33 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j9so5859647lfe.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Apr 2022 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZTgTrO8kYm9f4pu/QJrfNd/0CjpbX6Q1P+5MHmfotqk=;
        b=i2envguo4E6b4pLxv4XJXo+T/VB92G0yxDyRf6C4Zynw809rRjG4TPgiKQW4iUdAv3
         0tw/FwIqX9NFRcxNywh1A2CkXqBeDO3z4zaJ1HWc81YOpnbcYUz2HphICFC28YyT8dRd
         rnL5rspaX1Anjxgpb5DF1oPVz0MJGGmd0zEMMkm7FLJmnWzCBJfKcnhRsqBP3rZAGVnH
         UJIRsQeHZCYIOFRUoxrDZxh0DeotCHIgMIdzstU0UQd+Nxv5L1bQcdKzr7r++SlNCXpe
         QgXC9KKAMxXCuoM3kGDuy6rRVjV0ECnVx9rKx3YmL5/KKn+bFgar4zwneztVZ0fKeyNS
         qQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZTgTrO8kYm9f4pu/QJrfNd/0CjpbX6Q1P+5MHmfotqk=;
        b=PZTpHti3ZIN3TyU1hGh9Fml1aP2EIC1SYcRTjE4S2BfOIsDxhkZ0ENpPHrc3Pr7yG2
         P6Lj8OjjI69y9mHR1nwY2Ee5H0MtPSiW49aj7xes1TUXwJJorRMXigWsZOa5PcaxPJ4R
         zP59zl3bHccF3z8lpdQkIT3dsq3Paq9MMAG3VH6NQX8bV3gbKPAknaNZnPyzL7P8R7kQ
         BcAnpigZU7VQXV6ef3pQc2YmgQkd/Ot7SqrJ8BZuujjLL6TqtKi6IUYw33fBxQd1hExP
         wFbw5yDa39BI97mOBSxRaYAGYPI8CpN6zulDX29IjIufJq6wd22y89bhhLqymwM4tpj3
         a8ew==
X-Gm-Message-State: AOAM532pttzQqmliFRx72yb5R1Hgd/hPP1fITu5ll+XF6i9nfasn9B5i
        syhgBQon6agY/o3I+oee36rtK0NbvSvw0ni9FwuYjp+OvOc=
X-Google-Smtp-Source: ABdhPJxJkWFAtOiYY7lH9mD1xE8veW54kPfgnqaEUsfjr6zNHODKBpmFl1OMxUDn+3CZnMq6R8G5Xp9HAI1SN+XENZ8=
X-Received: by 2002:a05:6512:2627:b0:44a:f55c:ded9 with SMTP id
 bt39-20020a056512262700b0044af55cded9mr12460116lfb.373.1649408791888; Fri, 08
 Apr 2022 02:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220408080045.6497-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220408080045.6497-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 8 Apr 2022 11:05:55 +0200
Message-ID: <CAPDyKFpaMy7ATDm6PCnYBxS_6-TZ-TF+gfHbp_o0nTo-6RaGdQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mmc: improve API to make clear {h|s}w_reset is for cards
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        ath10k@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
        brcm80211-dev-list.pdl@broadcom.com,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        SHA-cyfmac-dev-list@infineon.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 8 Apr 2022 at 10:01, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> As discussed in 2020 [1], Ulf and I agreed that it would be easier to
> understand the {h|s}w_reset mechanisms if it was clear that they are for
> cards. This series implements that by changing the parameter to mmc_card
> where apropriate. Also, the callback into host drivers has been renamed
> to 'card_hw_reset' to make it obvious what exactly the driver is
> expected to reset.
>
> I tested it with my Renesas boards, so far no regressions. Buildbots are
> currently checking the series.
>
> This series is based on mmc/next as of yesterday. A branch is here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mmc/reset-api-v2
>
> Looking forward to comments. Happy hacking,
>
>    Wolfram
>
> [1] https://lore.kernel.org/all/20200916090121.2350-1-wsa+renesas@sang-engineering.com/
>
> Wolfram Sang (3):
>   mmc: core: improve API to make clear mmc_hw_reset is for cards
>   mmc: core: improve API to make clear that mmc_sw_reset is for cards
>   mmc: improve API to make clear hw_reset callback is for cards
>
>  drivers/mmc/core/block.c                             |  2 +-
>  drivers/mmc/core/core.c                              | 12 +++++++-----
>  drivers/mmc/core/mmc.c                               |  4 ++--
>  drivers/mmc/core/mmc_test.c                          |  3 +--
>  drivers/mmc/host/bcm2835.c                           |  2 +-
>  drivers/mmc/host/dw_mmc.c                            |  2 +-
>  drivers/mmc/host/meson-mx-sdhc-mmc.c                 |  2 +-
>  drivers/mmc/host/mtk-sd.c                            |  2 +-
>  drivers/mmc/host/sdhci.c                             |  2 +-
>  drivers/mmc/host/sunxi-mmc.c                         |  2 +-
>  drivers/mmc/host/uniphier-sd.c                       |  2 +-
>  drivers/net/wireless/ath/ath10k/sdio.c               |  2 +-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/sdio.c  |  2 +-
>  drivers/net/wireless/marvell/mwifiex/sdio.c          |  2 +-
>  drivers/net/wireless/ti/wlcore/sdio.c                |  2 +-
>  include/linux/mmc/core.h                             |  4 ++--
>  include/linux/mmc/host.h                             |  2 +-
>  17 files changed, 25 insertions(+), 24 deletions(-)
>

Patch 1 applied for fixes and the two others for next, thanks!

Kind regards
Uffe
