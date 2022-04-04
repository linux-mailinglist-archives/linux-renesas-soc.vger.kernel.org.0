Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9494F1487
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 14:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241140AbiDDMQU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 08:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239892AbiDDMQU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 08:16:20 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9396F63E9;
        Mon,  4 Apr 2022 05:14:24 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id i10so9000329vsr.6;
        Mon, 04 Apr 2022 05:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DFQwdlgVo4Np4THBiahP9w0qnaRpXkcrLpkFZvy/ApU=;
        b=p6jbZ8ikNEzkqYU+jPBIldhJN2i3RJXw2rv2n+YnpYAQ8uV70JQhbehhvSu8yxRwU+
         w+jCEa2tY+JDSGeqrklVSntIXqoJYndZDMU9yoQ6frJOmEiie1l2ES9qDCZ6lOdbjgRM
         VFVwJk46TLhcxMzL0H6+xNmTuEmt1Y56dRoFI1DNI19I1kfhItkKdkPU0Fwc5nN5AA4U
         +zlRutfyd0X5eeHQRy1CCiI1SdT5khW3LQAL8NvD1++9RFy3wKCzeiU+8Ua9f5AQIJES
         9ASYzdoefkKVRgGawqo/Lf64OS3oZwkUDwlSyZxELcGjahp3Y4BKRIzq/Bk5M+mcNr92
         LoYg==
X-Gm-Message-State: AOAM533vJX8fmKOGW4jBnlMv44I19DBOIb0Xyph6TEtxpk0tZaUe6xkn
        uO91oZ7fNByaTcBjLOnMe266jkXjRDOTxA==
X-Google-Smtp-Source: ABdhPJwiHT4+dbUe7i0Zmht7+pNZT2pBOrBc1trQ5QgEZ6b8MTMfjMJ+Db8818hLW7y4ZHDB3jp+rQ==
X-Received: by 2002:a67:e20b:0:b0:325:6153:341e with SMTP id g11-20020a67e20b000000b003256153341emr6446399vsa.37.1649074463356;
        Mon, 04 Apr 2022 05:14:23 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id d68-20020a1fcd47000000b0032db22e6d18sm1394910vkg.50.2022.04.04.05.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 05:14:23 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id i26so3596689uap.6;
        Mon, 04 Apr 2022 05:14:23 -0700 (PDT)
X-Received: by 2002:a25:d044:0:b0:63d:b49f:34ae with SMTP id
 h65-20020a25d044000000b0063db49f34aemr6155436ybg.546.1649074452331; Mon, 04
 Apr 2022 05:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220401124523.42892-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220401124523.42892-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Apr 2022 14:14:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ7r1RXgoHAP1+RLtm11XMFzs1zht7+KQnUss=Rx4sBg@mail.gmail.com>
Message-ID: <CAMuHMdVJ7r1RXgoHAP1+RLtm11XMFzs1zht7+KQnUss=Rx4sBg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: special 4tap settings only apply to HS400
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Apr 1, 2022 at 11:49 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Previous doucmentation was vague, so we included SDR104 for slow SDnH
> clock settings. It turns out now, that it is only needed for HS400.
>
> Fixes: bb6d3fa98a41 ("clk: renesas: rcar-gen3: Switch to new SD clock handling")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

(after fixing the typo)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -144,9 +144,9 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>                 return clk_get_rate(priv->clk);
>
>         if (priv->clkh) {
> +               /* HS400 with 4TAP needs different clock settings */
>                 bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
> -               bool need_slow_clkh = (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) ||
> -                                     (host->mmc->ios.timing == MMC_TIMING_MMC_HS400);
> +               bool need_slow_clkh = host->mmc->ios.timing == MMC_TIMING_MMC_HS400;

I'm wondering if we've lost the critical mass for keeping the bools?

>                 clkh_shift = use_4tap && need_slow_clkh ? 1 : 2;

Unfortunately I don't see a good way to rewrite this, without inflating
source code size...

>                 ref_clk = priv->clkh;
>         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
