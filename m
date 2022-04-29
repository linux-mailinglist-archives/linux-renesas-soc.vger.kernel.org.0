Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3743514389
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 09:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355323AbiD2H7j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 03:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355298AbiD2H7i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 03:59:38 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688B0C0E5C;
        Fri, 29 Apr 2022 00:56:20 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id x77so4545840qkb.3;
        Fri, 29 Apr 2022 00:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZCPd5tGHywaf/P7fbXCZZA0ZZWI7I9IZK3JccWegatE=;
        b=LTO6/7KzU5AszOZGCkyDNHZ9vYJQKV/S+HnLiPlFHJ8qiRMrwJHlcsrwaf+sOxQeDj
         cCD070RYbaemLQwu0xVFHgntI4jP28MjQVHX3y3aCXMaIHjWejnYfYuNGpnhhKIm2DDc
         WtrNhpfi+aj/3E9tM4NCEelGa+wFrNGiPVFanKxK2BtvVbIMobl1wjEu6Z9ZnZy5OmkL
         qI+Hq5qo5m8orQXTaJjqjTrKkWtbV+hatHKK289sNqjI82hhu6RGnYHnVtCDQ+MVt2yi
         mAT6FotUn2eLcRZ3NCGHpKCPyI4Zm4I1s1jlXdiGOc5/XpPZw+xSFozzV7G7ZamInXOI
         ay3w==
X-Gm-Message-State: AOAM532VVi2buJqATDRmcjnFaFxIm1ANxP56qDtpHmL/ITTjOJs10KRB
        BE8ycnxWCc+7B4J8NsYXtUMtfU7htSeiUZMV
X-Google-Smtp-Source: ABdhPJz/gm3mzNXetQAZkGv+3LKHROCYfgexkSVvt1GPlQ094+QPMuVOoWFlzS03+wMmWTs1lnps/w==
X-Received: by 2002:a05:620a:170f:b0:69e:b917:b8c4 with SMTP id az15-20020a05620a170f00b0069eb917b8c4mr21724814qkb.593.1651218979364;
        Fri, 29 Apr 2022 00:56:19 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id x24-20020ac87318000000b002f1fc5fcaedsm1254702qto.68.2022.04.29.00.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 00:56:18 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2f7bb893309so76881577b3.12;
        Fri, 29 Apr 2022 00:56:18 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr36207138ywi.449.1651218977916; Fri, 29
 Apr 2022 00:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220429072400.23729-1-biju.das.jz@bp.renesas.com> <20220429072400.23729-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220429072400.23729-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Apr 2022 09:56:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6bTw6vg0h3s0iXwDBA-7KFMNaiz4jB_A_K=CA7p50RA@mail.gmail.com>
Message-ID: <CAMuHMdX6bTw6vg0h3s0iXwDBA-7KFMNaiz4jB_A_K=CA7p50RA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0 support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Fri, Apr 29, 2022 at 9:24 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable USB2.0 Host/Device support on RZ/G2UL SMARC EVK by
> adding usb{0,1} pincontrol entries to the soc-pinctrl dtsi
> and deleting the nodes which disabled it.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> V2->v3:
>  * Fixed typo in commit description RZ/G2L->RZ/G2UL.
> v1->v2:
>  * Fixed the code comment related to USB1 OVC and VBUS.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
