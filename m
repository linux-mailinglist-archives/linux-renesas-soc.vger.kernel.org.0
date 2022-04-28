Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7DD513320
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 13:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbiD1MCL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 08:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237593AbiD1MCK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 08:02:10 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E24A0BD9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 04:58:54 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id r8so3003223qvx.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 04:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mM6sM8g7sA5xGBaTdIwzsNBSuSIXl4/FPPJTK+Bzdn8=;
        b=lc7tinlP2V8nRUAT+bhbcZ090js8Dy58mm6JfOtOhw/kQREdviwv6sRWxMDsA0EKKS
         S1UH+NmN90Bb6RS+lhlk/0TTYlobkMQcbzoi6RTtRjq/odvPdpw7HHAGOuQ8Dj7LzNMd
         CI1iU+2szheGS/masWIdMdKPg69OhcdSlCMz7PvNFUwzxVxqhiNSiiJh1uV/dL9zcyqP
         hZ9rfHTNYv9E6/nspydzOvbYriI9B1YVcaLf0RLQQfeRJiuSLEIszRw4JlggQIxWHZFk
         kVaPGkyelxtMvWHHvYDMsNV5Lt1Hk1KX2J9hjmDBUTuW7nbouOgzGKhJKPLff4au60Dk
         +3oQ==
X-Gm-Message-State: AOAM533o0kXscbmGgvSqohmkq9c1qqgQoXi0qHwm2Um7isscnnHTGEwc
        hPfAoLR1b4kahu35ql7+i2NeWQpC/xAY2w==
X-Google-Smtp-Source: ABdhPJyOdZ1XFsLW1p6izb/wESbI7em7FSrkuLl0+Cvrc7YVKtI9cHCviwz1UWad4+jJjX6CAKH7sw==
X-Received: by 2002:ad4:5f06:0:b0:449:f04b:7654 with SMTP id fo6-20020ad45f06000000b00449f04b7654mr23578248qvb.46.1651147132957;
        Thu, 28 Apr 2022 04:58:52 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 76-20020a370c4f000000b0069f62e55f65sm5572768qkm.107.2022.04.28.04.58.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 04:58:52 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id j2so8661242ybu.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 04:58:52 -0700 (PDT)
X-Received: by 2002:a25:d84c:0:b0:648:7d5e:e2d4 with SMTP id
 p73-20020a25d84c000000b006487d5ee2d4mr17272291ybg.6.1651147131898; Thu, 28
 Apr 2022 04:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220423130206.114032-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423130206.114032-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 13:58:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-waeOt+wAzEa-F25wfzAKziZrcyCJNerE2m9j4Y7Pog@mail.gmail.com>
Message-ID: <CAMuHMdU-waeOt+wAzEa-F25wfzAKziZrcyCJNerE2m9j4Y7Pog@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable ARCH_R9A07G043
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Sat, Apr 23, 2022 at 3:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable support for the Renesas RZ/G2UL SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
