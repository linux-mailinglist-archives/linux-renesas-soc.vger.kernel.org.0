Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDC36B2832
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 16:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbjCIPFl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 10:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbjCIPEx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 10:04:53 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085FB1CBC3
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Mar 2023 07:02:58 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id ce7so1663758pfb.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Mar 2023 07:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678374178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w52L9bYd1Bk6tnZiJ30njJezcD67pXQ479mx0gzX4ic=;
        b=jiI7Xlfv43mVsBRCrivf6VVVUS7KhuPjXox6NR+7xu+z9s/Anbh+SXWWfnWLUYp+Nz
         5wFfne+FDFSlZF6USZ/cHZwFuY0X44974OQOaGKl4EDCaguAmy/gRKdc9/E62sZD+HYf
         WyoMkEaKJbzEQi15K6oK/+PZvRHAMCJrmp4U2OenejuRwyJ1oah1ooydu8v/N9X+cvax
         N/PIdum5sSM1nJePvdDnQwCdIgvseipInSSdkrnTytg7J1+KNmBKJ+h62sQ5+vDQl+B1
         NpsPgKdrpeGsbrmj6veRNJDAWrrrYs9Hj4pUBbtdX8fX6ECvpaIAv4VIJiHEU5Xl6TDM
         YiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678374178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w52L9bYd1Bk6tnZiJ30njJezcD67pXQ479mx0gzX4ic=;
        b=bo/scEyK3oyW5tnC4RkI7+QMN70nv33EiZKaxiMvCQ9bzZgkpvcNMMKIQXE4vOCHjc
         BUOvSnlKyvPhwhaNg5a6GQf8OWT+5FbU3ousTE9oKeJXZkM4PJLIsMDZ0YTS6mOTOMgf
         lTSm2FThcoXjaB9Thh9Xflj4Fb053XJUVu2sxks1+DF8XVAJVJJAkkzX5ZgYLF7g/KVo
         Ei0Pqs5nxPqt7HAbTP94tP+I2Us6jBIvleKsT5rOI+0hSPIiTHxaJmz9H8/q6Z8eKyC0
         RpfLP2Y5+HyiiYcJ2HtbNJEaPKQOGvBJwWKK02PAk8kkCDpfBldTenNjGFOnEuj7er6A
         ysCg==
X-Gm-Message-State: AO0yUKW5YBZvg18laz0Pe6EajQ54TUnYrYyMy3aYuRRBQdS57boLRoTH
        Z4yl36rQ/GkmsbrcSPT1j5iKRoPl6V7lGFHgMkIO40dkgFkxjdvl
X-Google-Smtp-Source: AK7set9vajz4jP/NGsZsd24Uz/GQxHNaDN1S1IbU2x6PLLKhY/MQcMgXaA0Q5HKDXcKWIDYpomT/1YSWtfwWZaEzY/0=
X-Received: by 2002:a63:f91d:0:b0:502:fd12:83ce with SMTP id
 h29-20020a63f91d000000b00502fd1283cemr7999614pgi.5.1678374178256; Thu, 09 Mar
 2023 07:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20230307163041.3815-1-wsa+renesas@sang-engineering.com> <20230307163041.3815-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230307163041.3815-9-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 9 Mar 2023 16:02:21 +0100
Message-ID: <CAPDyKFrsDY428DgQ2Hi+OXkoBJMm6b5ro4gxL9Vod=bFv1u8kw@mail.gmail.com>
Subject: Re: [PATCH 08/11] mmc: renesas_sdhi: remove R-Car H3 ES1.* handling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 7 Mar 2023 at 17:31, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> R-Car H3 ES1.* was only available to an internal development group and
> needed a lot of quirks and workarounds. These become a maintenance
> burden now, so our development group decided to remove upstream support
> and disable booting for this SoC. Public users only have ES2 onwards.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Please apply individually per subsystem. There are no dependencies and the SoC
> doesn't boot anymore since v6.3-rc1.
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index f38003f6b1ca..9ab813903b2c 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -72,11 +72,10 @@ enum renesas_sdhi_dma_cookie {
>
>  static unsigned long global_flags;
>  /*
> - * Workaround for avoiding to use RX DMAC by multiple channels.
> - * On R-Car H3 ES1.* and M3-W ES1.0, when multiple SDHI channels use
> - * RX DMAC simultaneously, sometimes hundreds of bytes data are not
> - * stored into the system memory even if the DMAC interrupt happened.
> - * So, this driver then uses one RX DMAC channel only.
> + * Workaround for avoiding to use RX DMAC by multiple channels. On R-Car M3-W
> + * ES1.0, when multiple SDHI channels use RX DMAC simultaneously, sometimes
> + * hundreds of data bytes are not stored into the system memory even if the
> + * DMAC interrupt happened. So, this driver then uses one RX DMAC channel only.
>   */
>  #define SDHI_INTERNAL_DMAC_RX_IN_USE   0
>
> @@ -222,7 +221,6 @@ static const struct renesas_sdhi_quirks sdhi_quirks_r9a09g011 = {
>   */
>  static const struct soc_device_attribute sdhi_quirks_match[]  = {
>         { .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> -       { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400_one_rx },
>         { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
>         { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400_one_rx },
>         { .soc_id = "r8a7796", .revision = "ES1.[12]", .data = &sdhi_quirks_4tap_nohs400 },
> --
> 2.35.1
>
