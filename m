Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B567280FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jun 2023 15:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236223AbjFHNQx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jun 2023 09:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235638AbjFHNQw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2023 09:16:52 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94912121
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jun 2023 06:16:49 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso771487e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jun 2023 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1686230208; x=1688822208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LudNDk6FdhPSPtnr+V0hEtCLBosEpaT8SIcj+24RvDc=;
        b=D5oElduGN0gusMKKe2l8SitFd0ewaa7/U/8QbU3xM+o/ppgOUQupQGfdqTHPHX4a8u
         kh/bRKXN09E4Vh8XniUJe04/mpehtMkxvgzM49Ii+2uCZ15i4IKCzYOQCYLUjKI6gTnM
         /QFP1J/3yDnYIlvYGB4aPe1OJ2V1lA21KRhtc3j1pYnT0AhQ6ejrNlWy8kZ00bt/XVp2
         +63zu/S0URxn8i2dfjqTdxusiBD0bCwZQroP+4X6nyBnp7WRCuXpieWjbjWqfa4sTb4/
         SpQiRxQvYY/pNZuskY4LM8KzTN9KdLWzKbUyhfxZvsJex2wn0uw1j5Kc2AU/DdvS6xe/
         nxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686230208; x=1688822208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LudNDk6FdhPSPtnr+V0hEtCLBosEpaT8SIcj+24RvDc=;
        b=bFNDvwQM7qRpDOwYnW6MG79VRfD7kZ3SijLt4MhON5LmNBUEjUUhCpgEBZFfrXuAS9
         Vw7sj+Mwlc/hXJ5bnADTVe5Di6MfNrwMxlQmSB1B4HGrQHBKkUoIV5mqAu/H6iLb7/L1
         MpT3XMoUTVte2BXPYF9/1VSDNUAz2OUO1sDDHhyRUAEK1nnnokIuIz5HaG0jvaoJF7Nq
         xciYW1yO7hjil8ik6MzjP46I1Xaueki2qLJQUOeHGF4iaID46s6IC2rpUObrezFvA1Dp
         gh/s+ybryBChkjHuKXLgHnQihxO4uekLjybGybohoTWxL519l7c1yE/WujtVNPholpfi
         Hdzw==
X-Gm-Message-State: AC+VfDwWnJslUdna0oV2zXjEO0YzqLk5bzgA9wnpbwpz+zhJLCEaNeZi
        byLxI+SERsvKhtEEpXdsqaKo8R+EfRw4h05PvlU=
X-Google-Smtp-Source: ACHHUZ5CC4LchXagRv4PgKVy82xBj/NdEyFDc0N+1kH1Ef/g08Xdg0onnbeYDpHjtK2NecXP1WIPTg==
X-Received: by 2002:a2e:998b:0:b0:2b2:5d2:ce5f with SMTP id w11-20020a2e998b000000b002b205d2ce5fmr1692165lji.50.1686230208107;
        Thu, 08 Jun 2023 06:16:48 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id k26-20020a2e241a000000b002ad8fc8dda6sm252463ljk.17.2023.06.08.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 06:16:47 -0700 (PDT)
Date:   Thu, 8 Jun 2023 15:16:46 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: draak: Add overlay for CVBS
 input
Message-ID: <ZIHUvqYh1c6Rz_Ry@oden.dyn.berto.se>
References: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se>
 <20230211165715.4024992-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW2ZUJXmYeKck5xaD04j_EtEtw7ndQfho-ynbd=-4mXig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW2ZUJXmYeKck5xaD04j_EtEtw7ndQfho-ynbd=-4mXig@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2023-06-08 08:54:26 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Resurrecting this thread...

I still have to resurrect work on this series, but it looks like I have 
to do so in next quarter. I will then try your suggestion of disabling 
the node, thanks for the suggestion.

> 
> On Sat, Feb 11, 2023 at 5:58 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
> > both connected to the same VIN input. DIP switches are used to select
> > one of the two devices, with the HDMI decoder being the default. Add an
> > overlay that selects the CVBS decoder.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > [Niklas: Inverted it from HDMI to CVBS]
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -87,5 +87,6 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
> >
> >  dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
> >
> > +dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-cvbs-input.dtbo
> >  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
> >  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> > diff --git a/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
> > new file mode 100644
> > index 000000000000..b833c58c2029
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
> > @@ -0,0 +1,33 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2023 Ideas on Board Oy
> > + *
> > + * Device tree overlay for the Draak board, to enable CVBS input. This requires
> > + * setting DIP switches SW49, SW50, SW51 and SW52 to OFF, and SW53 and SW54 to
> > + * ON.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&adv7180_out {
> > +       remote-endpoint = <&vin4_in>;
> > +};
> > +
> > +&i2c0 {
> > +       hdmi-decoder@4c {
> > +               ports {
> > +                       port@2 {
> > +                               /delete-node/ endpoint;
> 
> I'm afraid deleting a node doesn't work...
> Does it work if you change its status to disabled instead?
> 
> > +                       };
> > +               };
> > +       };
> > +};
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund
