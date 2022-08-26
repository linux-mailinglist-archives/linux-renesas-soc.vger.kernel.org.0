Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A698B5A240A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 11:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245606AbiHZJS2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 05:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245319AbiHZJS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 05:18:27 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D90D743E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:18:26 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id w4so375554qvs.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NokreEZ2VLpaP4jKnc/82slZ7mwc94qhaWIDZYOW0Mg=;
        b=UXdAm/8nPbdRrO/EBCbshjvQFa89AI5xUEQu0Ikw0ZqyIfHbHVQLEMl0PWBPa+G4y2
         yceXcmSQ50xe0WI/jkKnA8tJ5MMdCOeNyncPZWMmGqY0sw+cwf8+B1Bg8HUaZKz70BCr
         SCmp+yf8tKWw+MIB4N8JMr9JVE5QZvaDE3oWHnUKau+AZXCEAOpdR5wlFhqfDKkBbV/N
         syP4SZztJ2I5QkfRJKSHfSZ/b57AJlxpvrdoZxNm9UCest8nSpeqei8FpmPPxV+7EXpU
         DriWqkpIfPhGFZPyn01QgMan74wBslrPFvvhGu2Ns+rw92v/8QgVFZ73B09fbyw04f/w
         2nwQ==
X-Gm-Message-State: ACgBeo3MCoatRKnKYV+GgNHUnC2LqWDldQSHHhd+XB0ISwxEMpSvq4oF
        RRSNfUfP219znlOz0oK1ArPGMX5ft38H0g==
X-Google-Smtp-Source: AA6agR6KnTs8C0tfG477G+rDtKqSuCMiqHTjH4w1vtSCjRGvSJtaiuog+VgQhw/AkOKx+xqziYo+Pw==
X-Received: by 2002:a05:6214:21cd:b0:496:db6f:1068 with SMTP id d13-20020a05621421cd00b00496db6f1068mr7126876qvh.45.1661505505758;
        Fri, 26 Aug 2022 02:18:25 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id bi15-20020a05620a318f00b006b9b7879964sm1508271qkb.28.2022.08.26.02.18.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:18:25 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-33dbbf69b3dso21500607b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:18:25 -0700 (PDT)
X-Received: by 2002:a81:1e45:0:b0:336:bade:e0 with SMTP id e66-20020a811e45000000b00336bade00e0mr7828803ywe.358.1661505505273;
 Fri, 26 Aug 2022 02:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com> <20220824103515.54931-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220824103515.54931-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 11:18:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4q+NNf1Q=eRE3Qb8QvidJ5u_LZT8he+Aw76T45cmYWQ@mail.gmail.com>
Message-ID: <CAMuHMdX4q+NNf1Q=eRE3Qb8QvidJ5u_LZT8he+Aw76T45cmYWQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: spider-cpu: Add MSIOF node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Wed, Aug 24, 2022 at 12:36 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> @@ -101,6 +101,12 @@ &mmc0 {
>         status = "okay";
>  };
>
> +&msiof0 {
> +       pinctrl-0 = <&msiof0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};

I assume you added this becomes Spider has an MSIOF pin header?

> +
>  &pfc {
>         pinctrl-0 = <&scif_clk_pins>;
>         pinctrl-names = "default";
> @@ -116,6 +122,12 @@ mmc_pins: mmc {
>                 power-source = <1800>;
>         };
>
> +       msiof0_pins: msiof0 {
> +               groups = "msiof0_clk", "msiof0_sync", "msiof0_rxd",
> +                        "msiof0_txd", "msiof0_ss1", "msiof0_ss2";

MSIOF0_SS2 is also used as the VDDQ18_33_SPI voltage selector, which
is used as the power source for various components (but not available
on the MSIOF0 pin header?), so I'm a but reluctant to add this patch...

> +               function = "msiof0";
> +       };
> +
>         scif0_pins: scif0 {
>                 groups = "scif0_data", "scif0_ctrl";
>                 function = "scif0";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
