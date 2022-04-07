Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 973B24F7D93
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 13:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239774AbiDGLKA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 07:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235139AbiDGLHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 07:07:35 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6260E21E2E
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 04:05:33 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id z33so8893745ybh.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Apr 2022 04:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Wnce8ncyatyb4gXkJdV081qkC28xHzM2e5a5lY4yi8=;
        b=ytIEiIg3QiP013POiEG2apVS1RqXz3qs+vCRF3uUMKhCGQxRAslFraHUvrNhC94XLs
         1087O6VSv22VakIPvOQE4OpNoz9RyAbLohuvdrC8G/OLNMpELKzlkG8eGkpHWL9oBZY4
         Y+cTGKKfJKumQxF6hQxSHwNZ7Ve9lFYQPOEce1u+HeQ1DIsGjUDUAkasl4isUKoUmJvb
         UmkY67z7j2UCR9uQ7PxlWiEHMZpnBWRDympcyoAuikNMox+Lk8l3rduFFYODex2JOXFJ
         NFSGpJiqzyhkyHaKC8o/zADs8YAJehAdOyXux1FxgOjsf9O+VeinGEM1TGWOhCgn6ADU
         faDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Wnce8ncyatyb4gXkJdV081qkC28xHzM2e5a5lY4yi8=;
        b=5dm8tL6ekQa8xqhUuznAqy9kghlXWCwlFTNP256orJC91tVO+qmuK5c0hb1sOaay3r
         GlWyOP0bdhHfRw1RcN5fa5bFrQqofStrI2aPWBMGhm6nK60RpR71OThiz68K9gdWflTw
         V+AK0O33wud67M92p0WdbI6pvshDl79vMUph1wzpSEtGJQ+oKg3+i/HoRBrcmiElSTS4
         czjNPCWIMLRa5AYNJUNFaZuJEu0dthuyqxP55johXdxWQBv4Zi5MLpD2pOqiIhBHy7GK
         9LI4CvPYaC6o4Ra0hS04mvv88KAmXVAhPMaTQaF8OgjPYS5p+YJZGpOm3QXP0nE36+bk
         6HNQ==
X-Gm-Message-State: AOAM532TW/9hF5sFpKr8TR5eG6HP8WsYBuIOheLTgfBK1cL75z7EMSiA
        c1qqug3fZiYLQnfXO+EBI9IYI0xCmucAE9LrBEAZqQ==
X-Google-Smtp-Source: ABdhPJzzGKIMIRVH84s2AytE2sGYA9B4IzNEPjC3vRlzS+EcJoWlDXej5CaUimsSTSINkFmBjimra7tAENYAvcQZ7vI=
X-Received: by 2002:a25:344e:0:b0:63d:b9af:4dce with SMTP id
 b75-20020a25344e000000b0063db9af4dcemr10320468yba.123.1649329532622; Thu, 07
 Apr 2022 04:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220404174159.571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220404174159.571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 7 Apr 2022 13:04:56 +0200
Message-ID: <CAPDyKFp9KdBRes7Ks2m=qpmrmX0J6ZFVqt1+CuCDM-wGXxOPVg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add linux-renesas-soc@vger.kernel.org list
 for Renesas TMIO/SDHI driver
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 4 Apr 2022 at 23:39, Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Add linux-renesas-soc@vger.kernel.org list entry for Renesas TMIO/SDHI
> driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e98278418d1..64529590a659 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19858,6 +19858,7 @@ F:      drivers/media/usb/tm6000/
>  TMIO/SDHI MMC DRIVER
>  M:     Wolfram Sang <wsa+renesas@sang-engineering.com>
>  L:     linux-mmc@vger.kernel.org
> +L:     linux-renesas-soc@vger.kernel.org
>  S:     Supported
>  F:     drivers/mmc/host/renesas_sdhi*
>  F:     drivers/mmc/host/tmio_mmc*
> --
> 2.17.1
>
