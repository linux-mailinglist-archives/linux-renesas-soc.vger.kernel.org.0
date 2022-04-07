Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40D64F7D43
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 12:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244549AbiDGKwn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 06:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238155AbiDGKwc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 06:52:32 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79996BF958
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 03:50:29 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id x131so8794531ybe.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Apr 2022 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TySKIjPSj/26zImOFZFRX5P+kH16cuqo+d2bY9GL/jE=;
        b=sDi6+LYW3GQ815U4o+QsBKbPRStQ55Jp+2afvDxBuD8uHNobxa/rMbKWiHJN5jKJpK
         de9RYkpleTJGc01iClyP4kXpQ9Dausi/kVmz8b+TANzv3y+JASYLdgNnMv/oKD8GoBgf
         pVtVxhwa3UH/CXzfWqbQbxfORSYHT7VVwyklQuJnN1R3eiPuc0vvMR0XpmCruSDte8Q+
         U2BuWgdQQmwEdmG4sf4iKUAgvYZ9WyGRlaGLeC812jxPr5+VAPYvPDMkmjJ1t6AAmo3B
         k7VGjls6tVh40KE1bEivj6SbA77LVFeVhymUcf9bnfr0cnsUoaqbz/Tfd+n1uOU/O0Ck
         cJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TySKIjPSj/26zImOFZFRX5P+kH16cuqo+d2bY9GL/jE=;
        b=594pfIhPA9puA8f36MNco1QD4P6fg/ATLJ41fv8zI3xixBunajA7jjXTCXtN8HOmc5
         gJR43pSokEWao73Tzg8ibsgFS1+XdiBHBTUEf1hfjXQ7CgUnu/55bpMsXI9PTNRqPJXV
         Ny5ruBSoegMhMaITc9OPF2sc2IB5tGJLDd8XBeCTKfDsmjJgBOFc4kU1Tl6RBcoOxauu
         U6FnruynixYQQjqbkbEhL0UuTDBtenmrv1IPBiHvW6xMDnkjs4eD9+80Mn6n0SEdtbC+
         TeSN94KpxRAznh9jtWHEFW3F2GXD2dCWIsY71Z9ZPdE1lUnsaH6Y7RXh2cIyNLqLJg6f
         QsHA==
X-Gm-Message-State: AOAM5309c7YH7YbH9bOCSJ237ybaTNsnp0Mgw0Y1biaTKNkbkA8gRvUH
        CX1eE2hZ9AQvbw2MXCOZUmWTnUbpklng2U8rhHKu8A==
X-Google-Smtp-Source: ABdhPJzuBD862kdaPvyksHZYhwRWe3mGONoTotSTBfyiEfUFjfH124D9rzHq4d+IcMj5sSUSUsPZz0zanwoh8HnWjBE=
X-Received: by 2002:a25:8244:0:b0:63d:a262:c1f3 with SMTP id
 d4-20020a258244000000b0063da262c1f3mr9323520ybn.397.1649328628742; Thu, 07
 Apr 2022 03:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220404114902.12175-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220404114902.12175-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 7 Apr 2022 12:49:52 +0200
Message-ID: <CAPDyKFoL1ew7wNXu_XjCMxQ4kTR05fdHqvwKVtfnDSFrpL4qOA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: don't overwrite TAP settings when
 HS400 tuning is complete
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

On Mon, 4 Apr 2022 at 13:49, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> When HS400 tuning is complete and HS400 is going to be activated, we
> have to keep the current number of TAPs and should not overwrite them
> with a hardcoded value. This was probably a copy&paste mistake when
> upporting HS400 support from the BSP.
>
> Fixes: 26eb2607fa28 ("mmc: renesas_sdhi: add eMMC HS400 mode support")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>
> Lightly tested with a Renesas R-Car M3N SoC. I think I can't really test
> it because my TAPs are usually stable in my environment. The fix should
> be obvious, though. Shimoda-san, are you happy with it?
>
>  drivers/mmc/host/renesas_sdhi_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 89d21231ec5f..4404ca1f98d8 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -394,10 +394,10 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
>                         SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
>                         sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
>
> -       /* Set the sampling clock selection range of HS400 mode */
>         sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
>                        SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
> -                      0x4 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
> +                      sd_scc_read32(host, priv,
> +                                    SH_MOBILE_SDHI_SCC_DTCNTL));
>
>         /* Avoid bad TAP */
>         if (bad_taps & BIT(priv->tap_set)) {
> --
> 2.30.2
>
