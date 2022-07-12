Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45EAF5713F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jul 2022 10:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbiGLIHp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jul 2022 04:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiGLIHo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jul 2022 04:07:44 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D4C52DC7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 01:07:44 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id q13so507341qkc.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 01:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KOnoEIxrdGSfa+HUs7YxCx9Vv+v4k9MGt/ulfGFDWdM=;
        b=opsSoUcsXBvIAEaiO15Kpc2ZjzOBFQo7Wfm0kA2i/OK/WXEcP0GH/wvqXi3UtH790W
         hV+YDY1lH0MZ9RLIUUV4+pGTYx1y/Vd/ZO4sDUqWPCJZNjH3/UiAVM3O+6YD1rQw+8qq
         rxkJjCa+RjDqrmSj99KGmsKipS1iJBwVwWtvCjUPlvop0D0AEmiox/Q+KyKLbqp9ak/6
         e0p3LAt1gmZIHVTpEnDFoybcTQBxR8YnXicbdHZg++brLYgWxhB6pnfxb6TOG8GmsFzW
         u8NRHjp4SFehlWhs2ViMA1Tl0OQMVZBPqeYIOZYdc1Agd9UVBTYJa8JOnDmMXSOvXpit
         QYOA==
X-Gm-Message-State: AJIora/48mdL5EL+UoUH5HYVmikRrRgwtcsB2bAuwRQdnJlC8ST0ELaa
        4dWxLgL8SSbvKKCrHRNQj9w/cwwR1M/rhA==
X-Google-Smtp-Source: AGRyM1t4zkG0yznSxmoBOpe0FOt1kJKdWKXo6ZKB26dBL3NmHOcaD3hcUTyuBSWnG+h1eiZR4qeBBA==
X-Received: by 2002:a05:620a:190c:b0:6b5:9f6b:77d9 with SMTP id bj12-20020a05620a190c00b006b59f6b77d9mr1744768qkb.142.1657613263325;
        Tue, 12 Jul 2022 01:07:43 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id de3-20020a05620a370300b006b58aa4e0e0sm4584305qkb.24.2022.07.12.01.07.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:07:43 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-31c8bb90d09so72976267b3.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 01:07:42 -0700 (PDT)
X-Received: by 2002:a81:1090:0:b0:31c:9be5:6c95 with SMTP id
 138-20020a811090000000b0031c9be56c95mr24469025ywq.384.1657613262544; Tue, 12
 Jul 2022 01:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220711134656.277730-1-wsa+renesas@sang-engineering.com> <20220711134656.277730-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220711134656.277730-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jul 2022 10:07:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKFa8JPB+pu+VAJnyRDNOq1ewgaBDghDdwo=dBC2+m4Q@mail.gmail.com>
Message-ID: <CAMuHMdXKFa8JPB+pu+VAJnyRDNOq1ewgaBDghDdwo=dBC2+m4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779f0: Add SDHI0 support
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

On Mon, Jul 11, 2022 at 3:52 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Extracted from a larger BSP patch made by Linh Phung.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.21.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
