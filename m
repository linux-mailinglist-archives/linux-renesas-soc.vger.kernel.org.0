Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5476D008E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 12:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbjC3KDm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 06:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbjC3KDi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 06:03:38 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06A67689;
        Thu, 30 Mar 2023 03:03:22 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-545cb3c9898so269576937b3.7;
        Thu, 30 Mar 2023 03:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680170602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYboRTcs8TAcQoasaBSMzn8Hx9VZHVE9Lec1pajFBBU=;
        b=FGTupM3ahKSwB+Ti+6/4H/uIPvqw3hAyYNad80ZOAJxxHgCzPrNmv6fftQqF96lF9I
         7sKDtVozkmWwy+taaEGXxqX/SXXkOSYbRIgcbY9zqIQuseVJJoZEG4aX3bq3UetJNYaU
         k3NoWnRppik9wvOCnqieuztN7JU2YdVCnBvsa1iuX33zYxqKIuCRAQvdMpiSN41sLEFN
         hy4ny7WiAI90uUT0Zr8RJahDdaOyzLXikucfxCshJN5S9IT0aID0fOS/sngRLb9WTyKG
         zxCCmuRPDyT4OPKBgJgmUTDusFuhVZtqh3LjTNFpHCLwMabsKC856pJLW6mnKpnrba1b
         FHWA==
X-Gm-Message-State: AAQBX9fMqQmdDwjQgc12e1xuCo/MlYmM3Tya2PGAhIE/CxcuB/viNwja
        CSU7P76rE5BAnnIJqxU4en+S55sq6kyOEQ==
X-Google-Smtp-Source: AKy350ZkzCTr0/vGWUO4ivfi0ISRRy/YAvHk0mlR2SIc6tXVUumn29fxnEj95uST49naUnTVek/4yQ==
X-Received: by 2002:a81:7c04:0:b0:546:2a48:804e with SMTP id x4-20020a817c04000000b005462a48804emr4433198ywc.50.1680170601941;
        Thu, 30 Mar 2023 03:03:21 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id q5-20020a0dec05000000b00545a08184f9sm3455682ywn.137.2023.03.30.03.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 03:03:21 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-536af432ee5so345456517b3.0;
        Thu, 30 Mar 2023 03:03:21 -0700 (PDT)
X-Received: by 2002:a81:a7c4:0:b0:546:264:a375 with SMTP id
 e187-20020a81a7c4000000b005460264a375mr6032931ywh.4.1680170601247; Thu, 30
 Mar 2023 03:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230321114753.75038-1-biju.das.jz@bp.renesas.com> <20230321114753.75038-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230321114753.75038-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Mar 2023 12:03:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvZKVFznf5tK_khH-pscf4J6iX2-05WbrsOZAgoaY45Q@mail.gmail.com>
Message-ID: <CAMuHMdXvZKVFznf5tK_khH-pscf4J6iX2-05WbrsOZAgoaY45Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 node
 using dt overlay
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Mar 21, 2023 at 12:48 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable sci0 node using dt overlay and disable can{0,1}-stb-hog
> nodes in dt overlay as its pins are shared with sci0 pins.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Updated commit header sci0 nodes->sci0 node
>  * Removed PMOD USBUART reference and connection details as user can connect
>    anything on that PMOD1 pins.
>  * Renamed r9a07g043-smarc.dtso->r9a07g043-smarc-pmod.dtso
>  * Dropped unused header file dt-bindings/gpio/gpio.h

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043-smarc-pmod.dtso
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/{G2UL, Five} SMARC EVK PMOD parts
> + *
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + *
> + *
> + * [Connection]
> + *
> + * SMARC EVK
> + * +----------------------------+
> + * |CN7 (PMOD1 PIN HEADER)      |
> + * |   SCI0_TXD          pin7  |
> + * |   SCI0_RXD          pin8  |

I'll re-add Gnd/Vcc from v3 while applying, as this is useful info for the user.

> + * +----------------------------+


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
