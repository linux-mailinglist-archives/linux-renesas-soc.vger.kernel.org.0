Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFAA50A013
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 14:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386199AbiDUM4p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 08:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386066AbiDUM4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 08:56:43 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA4932ED2;
        Thu, 21 Apr 2022 05:53:54 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id fu34so3126140qtb.8;
        Thu, 21 Apr 2022 05:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+yvTJ4csWlC/K3VvJbfynfftzlHBRUT5FFzoCH9vrA=;
        b=cZJzBnWGnQbZ9W/EVFkjnrF0Pxm3FVeeGxV6tkySoPIZmDAJiCm4PFnIMKODcKd1Bt
         80OFvm6AN/kNBg0F0zr2moW3IhWs/2ewAUkRwtLtaLoArv7th/08CKd+uY5izMi7Vcpz
         aSpAYjMLHuEhqqTdejVFLcU7cmnGVARgJ1FQC0dTaaGvysGacIdEAZ6wJ5o9Zv4VxvxZ
         Pgz8x4JpujT9ODDq88SvZBODuvqM3e8T/T+SsBHJjxdeWdXEXM6gANzcwiuc6kaZy+uL
         ZrZyUN+nrnTAHG0IOkCQJ2LH9sfOewrdHiiOuKAaRGsnb2Rj5nDnRhOkOwEi4hwFvo2s
         nLeQ==
X-Gm-Message-State: AOAM5331jzXghLmFIjsVMtUEucYu59AcfJiqZgAiYdHaWUf/owG+zFOC
        FHqYuoPeKvE5/sMS66ZNRHB0PNCY7YGIURcW
X-Google-Smtp-Source: ABdhPJwU9l6HWy1Cx+Kg1K9P8OWvrBQpu2CabNurh3cWKaWbCS22BeWsb21WPBAtDiFQQvIOUnAEQg==
X-Received: by 2002:ac8:7f07:0:b0:2f1:f0e0:27b with SMTP id f7-20020ac87f07000000b002f1f0e0027bmr17380992qtk.464.1650545633113;
        Thu, 21 Apr 2022 05:53:53 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id f19-20020a05620a409300b00680c933fb1csm3362458qko.20.2022.04.21.05.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 05:53:52 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2ec42eae76bso50814547b3.10;
        Thu, 21 Apr 2022 05:53:52 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr26035446ywb.438.1650545632216; Thu, 21
 Apr 2022 05:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-10-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-10-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 14:53:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRs6LSYo2Yh1ZfkkicYic8TUmXVN5eeL0chBn18qqvdA@mail.gmail.com>
Message-ID: <CAMuHMdWRs6LSYo2Yh1ZfkkicYic8TUmXVN5eeL0chBn18qqvdA@mail.gmail.com>
Subject: Re: [PATCH 09/15] soc: renesas: r8a779g0-sysc: Add r8a779g0 support
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car V4H (R8A779G0) SoC power areas and register
> access.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -369,6 +369,10 @@ config SYSC_R8A779F0
>         bool "System Controller support for R-Car S4-8" if COMPILE_TEST
>         select SYSC_RCAR_GEN4
>
> +config SYSC_R8A779G0
> +       bool "System Controller support for R-Car V4H" if COMPILE_TEST
> +       select SYSC_RCAR_GEN4

Please insert below SYSC_R8A779A0, to preserve alphabetical
order (by description).

> +
>  config SYSC_R8A7792
>         bool "System Controller support for R-Car V2H" if COMPILE_TEST
>         select SYSC_RCAR

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
