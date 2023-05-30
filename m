Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C117156DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 09:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjE3Hej convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 03:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbjE3HeW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 03:34:22 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B09E10FC;
        Tue, 30 May 2023 00:33:29 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-565de553de1so37770767b3.0;
        Tue, 30 May 2023 00:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432008; x=1688024008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7iyMopwXqfUGzT29EQG9rJ3RGW+uo/AYfLgt0y1pc8=;
        b=ctKJzrCQXe0qxqFMvn0i2oqSpTloDW4+0pzakl+NO7V5QDBS4MM8+KvLvJ7DLQROd4
         UdVB9M5015wAvfR9pkVZuBSjDHUJ4ZOnjgGc1kELaPrMhpKkrZ2JySMRFI/sA+tEHta1
         bLJInerUg9l5kriIf/6SAJ1k6zVfGEPI/FIj17JSObbbnBIANryL0HTLradvOECT42oF
         EshHAQSGYctGSkIeeSNTpuwSyimRx+bHWEroNG9u0uL4BNFNX1okdym71j/b8RD3ixO3
         Sf6OZJ9G4hKx5SIcnYzn7cCNbXQh1c7jE1KlC58Q0pRnS4eiId1MiyQjPYTzk9a6/m1q
         Ou0w==
X-Gm-Message-State: AC+VfDxb4tab9oxruy8yX/JN8xdYj71k1TWF+F7w/y2vfV2RPyjGKynW
        RamPtrk98J9Wz8y48vLRTYeZ25s4QuaJ0w==
X-Google-Smtp-Source: ACHHUZ5pCRQckc1Qt9a+ItPRglkuMY+1n48fCMQm+BYsLl9oo/ZNe/0miZhPa1UqAfXPsbRlbTcoQg==
X-Received: by 2002:a05:690c:f83:b0:568:b105:751 with SMTP id df3-20020a05690c0f8300b00568b1050751mr4338153ywb.2.1685432008279;
        Tue, 30 May 2023 00:33:28 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id j187-20020a0dc7c4000000b00561b76b72d7sm4257704ywd.40.2023.05.30.00.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:33:27 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-565de553de1so37770497b3.0;
        Tue, 30 May 2023 00:33:27 -0700 (PDT)
X-Received: by 2002:a05:690c:84a:b0:561:fc3a:30f3 with SMTP id
 bz10-20020a05690c084a00b00561fc3a30f3mr11642082ywb.8.1685432007266; Tue, 30
 May 2023 00:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230529080840.1156458-1-yoshihiro.shimoda.uh@renesas.com> <20230529080840.1156458-6-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230529080840.1156458-6-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 May 2023 09:33:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsu+aZG9Vhb5fPwzR9J8uPPQ658Kz_g1hZXAzB5qi2+Q@mail.gmail.com>
Message-ID: <CAMuHMdVsu+aZG9Vhb5fPwzR9J8uPPQ658Kz_g1hZXAzB5qi2+Q@mail.gmail.com>
Subject: Re: [PATCH net-next 5/5] net: renesas: rswitch: Use per-queue rate limiter
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, May 29, 2023 at 10:08 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Use per-queue rate limiter instead of global rate limiter. Otherwise
> TX performance will be low when we use multiple ports at the same time.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -156,22 +156,31 @@ static int rswitch_gwca_axi_ram_reset(struct rswitch_private *priv)
>         return rswitch_reg_wait(priv->addr, GWARIRM, GWARIRM_ARR, GWARIRM_ARR);
>  }
>
> -static void rswitch_gwca_set_rate_limit(struct rswitch_private *priv, int rate)
> +static void rswitch_gwca_set_rate_limit(struct rswitch_private *priv,
> +                                       struct rswitch_gwca_queue *txq)
>  {
> -       u32 gwgrlulc, gwgrlc;
> +       u64 period_ps;
> +       unsigned long rate;
> +       u32 gwrlc;
>
> -       switch (rate) {
> -       case 1000:
> -               gwgrlulc = 0x0000005f;
> -               gwgrlc = 0x00010260;
> -               break;
> -       default:
> -               dev_err(&priv->pdev->dev, "%s: This rate is not supported (%d)\n", __func__, rate);
> -               return;
> -       }
> +       rate = clk_get_rate(priv->aclk);
> +       if (!rate)
> +               rate = RSWITCH_ACLK_DEFAULT;
> +
> +       period_ps = div64_u64(1000000000000ULL, rate);

div64_ul, as rate is unsigned long.

> +
> +       /* GWRLC value = 256 * ACLK_period[ns] * maxBandwidth[Gbps] */
> +       gwrlc = 256 * period_ps * txq->speed / 1000000;

This contains an open-coded 64-by-32 division, causing link failures
on 32-bit platforms, so you should use div_u64() instead.  However,
because of the premultiplication by speed, which is 32-bit, you can
use the mul_u64_u32_div() helper.

Combining this with the calculation of period_ps above, you can simplify
this to:

    gwrlc = div64_ul(256000000ULL * txq->speed, rate);

> +
> +       /* To avoid overflow internally, the value should be 97% */
> +       gwrlc = gwrlc * 97 / 100;
>
> -       iowrite32(gwgrlulc, priv->addr + GWGRLULC);
> -       iowrite32(gwgrlc, priv->addr + GWGRLC);
> +       dev_dbg(&priv->pdev->dev,
> +               "%s: index = %d, speed = %d, rate = %ld, gwrlc = %08x\n",
> +               __func__, txq->index_trim, txq->speed, rate, gwrlc);
> +
> +       iowrite32(GWRLULC_NOT_REQUIRED, priv->addr + GWRLULC(txq->index_trim));
> +       iowrite32(gwrlc | GWRLC_RLE, priv->addr + GWRLC(txq->index_trim));
>  }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
