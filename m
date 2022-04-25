Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E6F50E477
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 17:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242809AbiDYPfr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 11:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbiDYPfq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 11:35:46 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3E121E10;
        Mon, 25 Apr 2022 08:32:41 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id v2so3867724qto.6;
        Mon, 25 Apr 2022 08:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+loJLq4BQKFZyMUOov9xeSvRnoM3sJ2gpEra5Io5aY=;
        b=gRbqWdtuuBXT/isFKeGKzqvktWk+g0W9f9W+jX068J6jbtmx66crXu5uHQ4qrnnSFd
         1llw6W+k7X+Z/0v8oQb9fPppwoOLrWgXbX1P2T/JBL7CUY+yJNV4kKTl0/6aNOdsEKj9
         9CVDEcJf0QO2xpgpGCYkIGQOUSGLb5GGNBmCBcE1FQDaWWR3tAbcV8211hfCWcfWpj1a
         QKqCqT5aHqwr3rzYKFlIK87CZMYS8ewGaw9pLgned0dV2y7iRem4vRtrhqdsnWt1Ywy2
         NJfOvFXjggK6QWCg4guDh0enCMU5q06oel8k2IBCXm/q7KsMDz70zqboyiWdKnfjZwKW
         IB0g==
X-Gm-Message-State: AOAM530ShjMAwo2+udc7PeiKQe0d4nSM7xqYcrCc0Cgf/rmF03BW62LM
        sLV51mS+x2o1vC/SacahpxW0ibtCUhtsFg==
X-Google-Smtp-Source: ABdhPJxcuHW2akzDXi+4yDYmFM6Ge1UFoZI2+3tmFlpwyAKvfrZ+RfHRnOYPgbhQ3X5iRLwp/RV3/g==
X-Received: by 2002:ac8:5a84:0:b0:2f1:f687:df63 with SMTP id c4-20020ac85a84000000b002f1f687df63mr12080476qtc.307.1650900760371;
        Mon, 25 Apr 2022 08:32:40 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id b126-20020a37b284000000b0069a11927e57sm5072449qkf.101.2022.04.25.08.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 08:32:40 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id r189so27725508ybr.6;
        Mon, 25 Apr 2022 08:32:40 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr16461851ybq.342.1650900759836; Mon, 25
 Apr 2022 08:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 17:32:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRQYLK49pMKJ6b-SVK91brrEJvD52cyyLWTwAT0z3Cmg@mail.gmail.com>
Message-ID: <CAMuHMdWRQYLK49pMKJ6b-SVK91brrEJvD52cyyLWTwAT0z3Cmg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] treewide: scsi: ufs: Add support for Renesas R-Car
 UFS controller
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, avri.altman@wdc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Apr 20, 2022 at 8:17 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch series adds support Renesas R-Car S4-8 UFS controller.

Thanks for your series!

> This controller has some restrictions so adds some quirks for it.
> Before using this driver, we have to initialize a clock generator
> on the environment board (named "Spider") by using the commands of
> U-Boot like below:
>  => i2c dev 0
>  => i2c mw 0x6c 0x26 0x05
>  => i2c olen 0x6c 2
>  => i2c mw 0x6c 0x26c 0x2e

You mean we need a driver for the RC21212 clock generator? ;-)

Or the boot loader should program the clock generator, like is done
on other R-Car boards for e.g. the PCIe clock (BTW, RC21212 also
generates the PCIe clock on Spider)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
