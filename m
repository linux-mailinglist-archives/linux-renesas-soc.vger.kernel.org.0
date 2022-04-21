Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B609650A08E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 15:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbiDUNTt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 09:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbiDUNTt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 09:19:49 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BD3AE68;
        Thu, 21 Apr 2022 06:16:59 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id x20so3615342qvl.10;
        Thu, 21 Apr 2022 06:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdrpbIr4ixaOqxSs9jtnnn2sf4I8o4aZzI3XC684CAw=;
        b=COlR8byjH39Q5LSt6OMrvwPtq5olSRAXChEHh6kb+ItFjKi9QDHbnveKxu+aIZvhcM
         0kA/3wcrK3gd0z45G7lseCR/borcduys0bYiar7jXTkVhWFYsqir2xQdSGJ7/S2hy1/P
         WfbCDBgpkpin6Piirrh92aMrOtdWxAKEyfiZiZw8RlwBp4b0HjC3BoHSFf5rIWQNUlC+
         tr9Yvj763eGSPqQpyQAzyQqqfYmIQ+veOi4zoh24DZt360F8bdpGgOJaKlndgZi7dZ6o
         5eMA3mvSyZwscJFXRX+n+4TBKK0cqUDsCtMouc8XdNbJgEh3XoRXp9u05B//nYmK+LGg
         EDhQ==
X-Gm-Message-State: AOAM532H00MnW8c++N4JOBbmMnh23rJWFeZQK/h8UNHPKx6xzJpgP0+b
        BzaTfTTGKOgdfKuCpC7rgTYwx/ibd6Tk2KAI
X-Google-Smtp-Source: ABdhPJySxaTlVvMAOi0y5iiVOGnOfFkrGAKbIE1V8EpPDSyW9joZkmn7viRyTlY9G1UIc1hkFUYkUA==
X-Received: by 2002:ad4:5aa2:0:b0:446:4a8a:3fd9 with SMTP id u2-20020ad45aa2000000b004464a8a3fd9mr17903895qvg.97.1650547018479;
        Thu, 21 Apr 2022 06:16:58 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 9-20020a370909000000b0069ea2d5bfc2sm2834774qkj.134.2022.04.21.06.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 06:16:58 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2f18982c255so51754617b3.1;
        Thu, 21 Apr 2022 06:16:58 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr26153395ywb.438.1650547017921; Thu, 21
 Apr 2022 06:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-11-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-11-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 15:16:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsO_UPPBumad2-=F7fdPSfCFirE8nNePfXahYAHL83rg@mail.gmail.com>
Message-ID: <CAMuHMdUsO_UPPBumad2-=F7fdPSfCFirE8nNePfXahYAHL83rg@mail.gmail.com>
Subject: Re: [PATCH 10/15] soc: renesas: Identify R-Car V4H
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for identifying the R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -247,6 +247,13 @@ config ARCH_R8A779F0
>         help
>           This enables support for the Renesas R-Car S4-8 SoC.
>
> +config ARCH_R8A779G0
> +       bool "ARM64 Platform support for R-Car V4H"
> +       select ARCH_RCAR_GEN3
> +       select SYSC_R8A779G0
> +       help
> +         This enables support for the Renesas R-Car V4H SoC.
> +

Please insert below ARCH_R8A779A0, to preserve alphabetical
order (by description).

>  config ARCH_R8A77980
>         bool "ARM64 Platform support for R-Car V3H"
>         select ARCH_RCAR_GEN3

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
