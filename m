Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F2C5A5C60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 09:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbiH3HCr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 03:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiH3HCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 03:02:23 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2B1BD1F4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:02:22 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id s22so5266196qkj.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ktHGzwd71ByJdGIS0l9tY2TuzGGX+oqcFQqqDzVIFec=;
        b=gDZ7gSv/Bwr/jeSibIo3AyeRZIIhd9y/9YmIeN9WmhklWNE/eyXZ5+XqQ+CN1e5687
         rn8Ul79XOQZ5QndvWVL5Lz12kbD+ioLdFD4LonSZyPTMR/6SzcHdsmh4yZxSn/+CaG0o
         4TQNAnIn+d1NwxsGYDrENKMfUN6QkMN5qK2cPjHsie1VA0LPrR/i2NuOGcKAWD5yT26k
         Ts4XAoJE9f+jhoEyggLBM+Y/QdwFDIKyMJXtppoEUSGRIFIcO8xFXQ2offbm6f3JAMae
         NPWFvVm0mxnC9hMQSi8eobeaDGhtBvPuIfM1uuRrzlqQlraj2Kekp9UsYrC4COmQs9ZI
         jNIg==
X-Gm-Message-State: ACgBeo3v9EIN20Q+js2XZIEprVJaaQf1js6vPW6XyrZdSCdRyysG4iNJ
        i+Hh/E9Bz4/63D6ragzkl6erBK6c/0lLdg==
X-Google-Smtp-Source: AA6agR46JwgpkKdAGcfsZlYpjdgYsUkMzqKBEArqva0RadCGISt/l+aCrXNOMM4kNuHYIaLshgFFiw==
X-Received: by 2002:a05:620a:25d0:b0:6bb:f597:1a3 with SMTP id y16-20020a05620a25d000b006bbf59701a3mr10655557qko.43.1661842941641;
        Tue, 30 Aug 2022 00:02:21 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id s16-20020ac85290000000b0034305a91aaesm6523967qtn.83.2022.08.30.00.02.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:02:21 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-324ec5a9e97so250731747b3.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:02:21 -0700 (PDT)
X-Received: by 2002:a25:24b:0:b0:696:4e87:7cec with SMTP id
 72-20020a25024b000000b006964e877cecmr10614765ybc.202.1661842941105; Tue, 30
 Aug 2022 00:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220829124130.2412-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220829124130.2412-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Aug 2022 09:02:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxmjS9Cc8hzRCSs7OVCJP8uHBfiZyKjqjst3jJMTbmMQ@mail.gmail.com>
Message-ID: <CAMuHMdUxmjS9Cc8hzRCSs7OVCJP8uHBfiZyKjqjst3jJMTbmMQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779f0: Add MSIOF nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Thanh Quan <thanh.quan.xn@renesas.com>
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

On Mon, Aug 29, 2022 at 3:12 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Duc Nguyen <duc.nguyen.ub@renesas.com>
>
> Add MSIOF nodes for R-Car S4-8.
>
> Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
> [thanh: added DMA]
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> [wsa: removed mso clock from clocks-property]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * removed 'assigned-clocks'
> * dropped patches enabling MSIOF on Spider board
> * updated commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
