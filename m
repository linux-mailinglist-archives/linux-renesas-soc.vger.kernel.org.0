Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F28F665FED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jan 2023 17:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjAKQDD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Jan 2023 11:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbjAKQDC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2023 11:03:02 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC1115FC2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 08:03:01 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id r130so13086102oih.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 08:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQSdMcBUQfWA4IRG5QkpB6/oCBZwQDaw14x0SbslY/8=;
        b=vZ09yWRqJ51PemqEZ4vFkbJEbzDD7NpFhCJ8EqzTJ1BUTWxA1I89Gzm8iC0oPN8ZOw
         Xfdhx4K9/lTnZcTlNZIoaDHY6Fz8vrC+xxP+TkxnZlQk9fuiUSgu7RvHC/moEAUmlqJS
         LwPUFvGYV9x9wN+6/+NZHwGwXL2RViWIiAI4FGrtkm58cUnQEDKoeAIws+zxPCi7XJgd
         s4jlNhjIqEqA8UQE0LBSAmaLTrYGLu1WLNGIPJQXS2T/1JlyY1ZFIgl7nrTT94lR6MRR
         CWigh6m9MzQUwtPsXhMROPy7s+SrcqWz2CXfQRTMklhCK2qYVix/0PirUMxk/szhcxiq
         Lrog==
X-Gm-Message-State: AFqh2koNprJhOP+6niYn8rlto2g/X4fuWgPTt4M6fVRx7p/kqsWDLLiC
        tOjnfdYVVdhcgWMcY3yLhza5GwZw+WVzMQ==
X-Google-Smtp-Source: AMrXdXsdC+8/95AGOyluK9WGo3I1V/T/oq4iPVhEs4mmZ5qRzcMKWusSvbJu2mvTqJc4IDXhP1WabQ==
X-Received: by 2002:a05:6808:1911:b0:360:e643:7e27 with SMTP id bf17-20020a056808191100b00360e6437e27mr50332274oib.36.1673452980250;
        Wed, 11 Jan 2023 08:03:00 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id d15-20020a05620a140f00b006fc92cf4703sm9060619qkj.132.2023.01.11.08.02.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 08:03:00 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 188so15453551ybi.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 08:02:59 -0800 (PST)
X-Received: by 2002:a25:d84e:0:b0:7b4:6a33:d89f with SMTP id
 p75-20020a25d84e000000b007b46a33d89fmr1638078ybg.543.1673452979615; Wed, 11
 Jan 2023 08:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20221220121959.45779-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221220121959.45779-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Jan 2023 17:02:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU9YTgXLdgqPvUWwf6cZAGBPTxSspwnO5KTyVL3v_gwbg@mail.gmail.com>
Message-ID: <CAMuHMdU9YTgXLdgqPvUWwf6cZAGBPTxSspwnO5KTyVL3v_gwbg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: spider-cpu: add i2c0 bus
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Dec 20, 2022 at 1:37 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add the bus and the GPIO expander connected to it. Based on BSP patches
> by LUU HOAI and Phong Hoang.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But perhaps Shimoda-san's patch is more useful?

[PATCH] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS device
https://lore.kernel.org/all/20221222093252.3613915-1-yoshihiro.shimoda.uh@renesas.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
