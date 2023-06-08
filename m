Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87B557277DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jun 2023 08:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235056AbjFHGyz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jun 2023 02:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbjFHGyn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2023 02:54:43 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D169E2680;
        Wed,  7 Jun 2023 23:54:39 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-565aa2cc428so2366587b3.1;
        Wed, 07 Jun 2023 23:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686207279; x=1688799279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEoeDNF2Fh7Wiior4zfd1rkZJuiDb2KtfdrhPqnHNAA=;
        b=GsZ9sRudq3aYcweHkQkVpnH4yUag2Q5NqSKX0pNGMc45/laX9Gp7HWpWr5mZisYBUK
         m7gifWm58ddlKwzfAjXCsRSvqJzI7IMUnVOvLqalZuaHz+xDZedJkFa15GeyoApIaNbW
         8QUcAsNmdz7RH8Vm0OAWl/yeJZHKNrkJG6R9k2uVOQv8cCmobENli0VwVJ2CCSGrwHgF
         pqV/iZ08u/o/Pomwt2ftlbrnp+HBple9FmCYjf7ruBbiQZdJ08708cJFbheFqH6g3wSd
         CQOD/SCFMgeIoJRNB1dg/tzQEE8lzl8DQpDTiYPU77pbrfTkMT1WF2wHdLEFdFjgVEg/
         DzqA==
X-Gm-Message-State: AC+VfDx7BacXB3WzGAbiUN1zbyYb2w4kCQnXCHIILCuloPtbPf9Rflmo
        CNpykhBglqGx6Obq82NJAal6O56oMlO0RQ==
X-Google-Smtp-Source: ACHHUZ6TSu1yt5e3DgnDIdaplYyWDTlLE6NF/Cg6u2tpn77ZoyZKlpHb4XeAroCfd0PTbjIPYcH7HQ==
X-Received: by 2002:a81:6356:0:b0:565:bf0d:e26d with SMTP id x83-20020a816356000000b00565bf0de26dmr6171263ywb.51.1686207278837;
        Wed, 07 Jun 2023 23:54:38 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id m63-20020a0dfc42000000b0054601ee157fsm200443ywf.114.2023.06.07.23.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:54:38 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-bb15165ba06so329872276.2;
        Wed, 07 Jun 2023 23:54:38 -0700 (PDT)
X-Received: by 2002:a81:49ce:0:b0:55d:3e67:2c6f with SMTP id
 w197-20020a8149ce000000b0055d3e672c6fmr8780692ywa.22.1686207277960; Wed, 07
 Jun 2023 23:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se> <20230211165715.4024992-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211165715.4024992-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Jun 2023 08:54:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2ZUJXmYeKck5xaD04j_EtEtw7ndQfho-ynbd=-4mXig@mail.gmail.com>
Message-ID: <CAMuHMdW2ZUJXmYeKck5xaD04j_EtEtw7ndQfho-ynbd=-4mXig@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: draak: Add overlay for CVBS input
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

Hi Niklas,

Resurrecting this thread...

On Sat, Feb 11, 2023 at 5:58 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
> both connected to the same VIN input. DIP switches are used to select
> one of the two devices, with the HDMI decoder being the default. Add an
> overlay that selects the CVBS decoder.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> [Niklas: Inverted it from HDMI to CVBS]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -87,5 +87,6 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
>
>  dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
>
> +dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-cvbs-input.dtbo
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> diff --git a/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
> new file mode 100644
> index 000000000000..b833c58c2029
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2023 Ideas on Board Oy
> + *
> + * Device tree overlay for the Draak board, to enable CVBS input. This requires
> + * setting DIP switches SW49, SW50, SW51 and SW52 to OFF, and SW53 and SW54 to
> + * ON.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&adv7180_out {
> +       remote-endpoint = <&vin4_in>;
> +};
> +
> +&i2c0 {
> +       hdmi-decoder@4c {
> +               ports {
> +                       port@2 {
> +                               /delete-node/ endpoint;

I'm afraid deleting a node doesn't work...
Does it work if you change its status to disabled instead?

> +                       };
> +               };
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
