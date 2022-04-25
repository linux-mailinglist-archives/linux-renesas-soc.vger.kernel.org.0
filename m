Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380D450DB21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 10:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbiDYIak (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 04:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236632AbiDYIa0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 04:30:26 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975CF1FA56;
        Mon, 25 Apr 2022 01:26:16 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id hf18so9835646qtb.0;
        Mon, 25 Apr 2022 01:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mw4/qeOxZMM6jmVeg1j9kXzpp/Z9Zm8EXt27iZCZExQ=;
        b=apegmHRls/HBEYd8Lnx4qRSvXHf9jlxdyMUfjqVhiscl0ZUagmkLktLiTo1E2ne1QW
         ngSfYTAMOSUaGHR4n/PpN6N4gBmFrcLW6yCPaDuBbV98xaF+owrVqIQ2ZdBnRIiPdqoR
         O3y0nBT1QGAT6bZIdGMqXRH5lgb525NdzM1FncFu89D3NNSVEtnIzDs8dmEP1xBqzfV8
         7XNCAreMLAmG9cs7YMaQDuMbOPiS6Q+QhoBU4R4iaOYJhPAAZyq5v08cXauEUocSIaEH
         eQ+PiXXr2EaRW/Vov3we+7LysFT9Rkk5BZvtp4EXb2wpsRs8vU418XEH2+dOxF3NJa62
         Z5Jw==
X-Gm-Message-State: AOAM531kzI0jD7DKQt1M7wq3RuiBOKPNUXRArvV23+bH8XSV7dHAe5l/
        kJWRr06KU6KzdJzn80KNwAUQnx4zGI0jBQ==
X-Google-Smtp-Source: ABdhPJzodM3AwnhFiN9SE+W4ejCCunBwrPYXLtl8iFx6fhpZuHJ0QtRlVIG91h1UDNHi9bvaiUSdyg==
X-Received: by 2002:a05:622a:64f:b0:2e0:6a11:7b0d with SMTP id a15-20020a05622a064f00b002e06a117b0dmr11283659qtb.9.1650875175469;
        Mon, 25 Apr 2022 01:26:15 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id a28-20020a05620a02fc00b0069e8e766a0csm4749850qko.94.2022.04.25.01.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 01:26:15 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2f7b90e8b37so62489247b3.6;
        Mon, 25 Apr 2022 01:26:15 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr15569251ywb.438.1650875174882; Mon, 25
 Apr 2022 01:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com> <20220425064201.459633-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220425064201.459633-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 10:26:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXN2i6qsavUW8FSB29OpL=k3yrDMp9u_2OKaQmeA5Q5mA@mail.gmail.com>
Message-ID: <CAMuHMdXN2i6qsavUW8FSB29OpL=k3yrDMp9u_2OKaQmeA5Q5mA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add all Clock Pulse Generator Core Clock Outputs for the Renesas
> R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v5.19 a branch shared by driver and DT.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
