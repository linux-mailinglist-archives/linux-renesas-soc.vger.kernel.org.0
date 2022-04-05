Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27CD4F23F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 09:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbiDEHOP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Apr 2022 03:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbiDEHOP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 03:14:15 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227556344;
        Tue,  5 Apr 2022 00:12:17 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id s11so9759041qtc.3;
        Tue, 05 Apr 2022 00:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xoGXHDKWjTvAsayLti/sFDJp9QEB6cbn2vaRjDyKRIs=;
        b=e07Xlmwr27N5icXd8wdJKBEVp0cxJHTnPoM7WYJ7AjU9V3TTrcBNckAj4yHDKbUQuR
         z1Pd8BWczCaqFjx3APKYZF3VHjdTeoSkVbQqGZLRKvedM5t+xiSrvOBdwsoRv98OELZ5
         Ts9qH0j9b27ZIl4TTSeVBeWf8KRgSC5uhe137zIwYPiI/IzWSnDFpeap+pBOXs/62Im/
         1f0ZipFE4A9rckcIRtjz1ey4lCg8ZO9GqVPVqHiCmeyE1xvlzXOacelKHhuA2OwKRxUb
         lmtwBWPfIdjCBkMsXJbzX2IWg/CAiwh+W62x6TpYnGcg/FwSNsliu0qM7WRhzr0JVQqz
         +DVA==
X-Gm-Message-State: AOAM532PEgjzVARZ4R8NWXJTE6iFqPAWlnOPb45/lXmOygvD9LTDsoJL
        Ws+tXSOL6PIZAzGiADknm7+FpJGmhlRbiA==
X-Google-Smtp-Source: ABdhPJzVI7IaLaIK9TGsfZxpvt0Kwffyc4HD+SqG4d30uo1/vEfE0ClaD46Y0RGBMmhCwjJo3GohIQ==
X-Received: by 2002:ac8:570e:0:b0:2e2:2963:e2de with SMTP id 14-20020ac8570e000000b002e22963e2demr1717814qtw.123.1649142736091;
        Tue, 05 Apr 2022 00:12:16 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id t7-20020a05622a148700b002eba7850c57sm8520104qtx.21.2022.04.05.00.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 00:12:16 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2eb9412f11dso29680407b3.4;
        Tue, 05 Apr 2022 00:12:15 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr1467836ywi.449.1649142735431; Tue, 05
 Apr 2022 00:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220404123404.16289-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220404123404.16289-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Apr 2022 09:12:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXovC8OzfPwdPQZuC1wPX8UU=EoYOek3inq7i59Jd56Fw@mail.gmail.com>
Message-ID: <CAMuHMdXovC8OzfPwdPQZuC1wPX8UU=EoYOek3inq7i59Jd56Fw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: R-Car V3H ES2.0 gained HS400 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
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

On Tue, Apr 5, 2022 at 2:33 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The hardware evolved, so we only need to disable HS400 support on ES1.*
> revisions. Update the code.
>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: refactored to top-of-tree]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Another HS400 update for a specific SoC. Builds fine. But I can't test
> because of no HW. Reviews from Geert and/or Shimoda-san would be much
> appreciated.

> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -215,6 +215,7 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
>         { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400_one_rx },
>         { .soc_id = "r8a7796", .revision = "ES1.[12]", .data = &sdhi_quirks_4tap_nohs400 },
>         { .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
> +       { .soc_id = "r8a77980", .revision = "ES1.*", .data = &sdhi_quirks_nohs400 },

LGTM.

>         { /* Sentinel. */ }
>  };
>
> @@ -265,7 +266,6 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
>         { .compatible = "renesas,sdhi-r8a77965", .data = &of_r8a77965_compatible, },
>         { .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
> -       { .compatible = "renesas,sdhi-r8a77980", .data = &of_rcar_gen3_nohs400_compatible, },

arch/arm64/boot/dts/renesas/r8a77980.dtsi always had the
family-specific compatible value, so this is OK.

>         { .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
>         { .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
>         { .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
