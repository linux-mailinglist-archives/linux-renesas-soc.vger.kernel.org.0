Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF2D44F1420
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 13:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbiDDLzT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 07:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbiDDLzT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 07:55:19 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462B43DA45
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 04:53:23 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h7so16794679lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Apr 2022 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/prrTENUf6pzL4WCzSMy1jrFtdQ4Xcb5kDF2mfqB7zs=;
        b=PYFydnzxYQAlPMnClgqHFUDkvNDiEch29pfJ2qtwzNHKU6okojwI1RM1/DIWWwSMsc
         uE+v2Hb+ee4XPmbHHnrMZpmbSVsf7BRaFl2Nk01OcbSnFuOV+ZR2xKxO0NwVTLCADhko
         r9x262PyhrJEvkFS0R5KTdarUuGGUHaV27TtqyFYtErTn7Bz6AMGBEedb53QNgrm8/75
         hZcpPBNpGHZHTzkBKNHxxjWIk5SnrHJK3g5Y3ehEkhDnM+YopV8WM0Sk6aU/8BTPhoZl
         rUQwue/E9Yk4/yMb8fSZAP47k+JRHdExk/3eKHMEpKSPIf3DSf/cqoT8rDHVorN07Js2
         VOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/prrTENUf6pzL4WCzSMy1jrFtdQ4Xcb5kDF2mfqB7zs=;
        b=FokAzZXR4zKhP6xpjUhYE0DDmGL29eCSn8+6dV+LYW7VxFOWa01e3vgJnPEiPQgvYh
         0fnfgw4pNEkeCaESqUIOlqaRCNLZa5rcXhNRLmHItjh2cBowDq3352LKnvyjGKdHMRz+
         DpsgsQKNvjeHnpQiZ7zjmKRPyXcKCZVygcnEsPGdLaUB4Ui0gS+ARF9DxP9OjzA31vC3
         /d8KjGcmWN8cH696VXCz2fRFbUAyp+vTYsglDg3Yn9SsKA/FNiD/yx1/la7lTFyWKTT/
         fgb8vJvQFYkBOPIJsT1nG5tAdNlegQgv/40aLbpa/CehIcVgL/qsjQ0FKMWrCuDmUzzZ
         vjRQ==
X-Gm-Message-State: AOAM531So986LUwOfNypU49YBORk6ZMMNylW2zBhGl6ekErmDA2KKLV/
        RuycybAadScXahOo1Tw5nKF+zS1SjM0EdVCPLJUhOg==
X-Google-Smtp-Source: ABdhPJzW6vSwrioMRqk+1JgnalXH4WrypHHLHS9iQphGdQYJVekyA1LtqRSxNH7DUGi0rpWrvs2hIHtqdbIU10Nxebw=
X-Received: by 2002:a19:5012:0:b0:44a:a22d:2d49 with SMTP id
 e18-20020a195012000000b0044aa22d2d49mr22572934lfb.254.1649073201469; Mon, 04
 Apr 2022 04:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220404105831.5096-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220404105831.5096-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 4 Apr 2022 13:52:45 +0200
Message-ID: <CAPDyKFrc_Rrm48Q6WM_OchTQvFX3fzGerQ5jY2HgW19uc7n+PQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: R-Car V3M also has no HS400
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 4 Apr 2022 at 12:58, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Further digging in the datasheets revealed that R-Car V3M also has no
> HS400 support.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 9dd01c220e93..2cd81d22c3c3 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -235,6 +235,7 @@ static const struct renesas_sdhi_of_data_with_quirks of_r8a77965_compatible = {
>
>  static const struct renesas_sdhi_of_data_with_quirks of_r8a77970_compatible = {
>         .of_data = &of_data_rcar_gen3_no_sdh_fallback,
> +       .quirks = &sdhi_quirks_nohs400,
>  };
>
>  static const struct renesas_sdhi_of_data_with_quirks of_r8a77990_compatible = {
> --
> 2.30.2
>
