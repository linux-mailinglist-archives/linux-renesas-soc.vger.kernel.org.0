Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF326968AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 17:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjBNQAH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 11:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233472AbjBNP76 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 10:59:58 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256B159D4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 07:59:49 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id m12so17971318qth.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 07:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKfos2m2Ks0OaaoYUXhCgHyHpj/wWafGLo6dnoQV95c=;
        b=d3ZPiss1l3mxVEizpKpt0znJCL4J7ec78waP2D9RVn9lGB4CmRV3DuL1atblSBfDsA
         1UQuHhZ+vaKzLt4ZJcpZPjdgNOlZUxl/CDvoNKtmu3tbad853mmakl0rl9cWGs7jwvEa
         1s5TJYU362thUF3A7mG3UtbxTg6hWJMkCanm6Q3k2AZbB8UwCOUP2F2Ao1ce3QHi9Iv0
         0A4bhiX2rCFsRe+XTQC7z5uHbllpwPFt9AF3y0/l2tsYG60etmVrr7+N6D1bzMoCHQ4/
         z2CmnjtiDXogf8muuE4dq05xsLJqI/Se0uUlPJAwNypx6o5TeVLUObINWvZoDWCRpU35
         vXFA==
X-Gm-Message-State: AO0yUKXgdSvQY0seZWk/zZSz+mewzBTxXdZSDWf3bcmAfDB/E+ERoBUU
        6YPaT6LbAYtXgmDE3XODpKPn8BSQ3SH0FbXc
X-Google-Smtp-Source: AK7set/3wLC5KtAKI8mYo65E2Y1VfFK2SMi3bzgyXgvGkHENjQ6uUDrH8QeQ7utKT49Udfp8Sf7NGA==
X-Received: by 2002:a05:622a:170b:b0:3b6:334b:2cbc with SMTP id h11-20020a05622a170b00b003b6334b2cbcmr4694865qtk.65.1676390388181;
        Tue, 14 Feb 2023 07:59:48 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 136-20020a370c8e000000b00706aeebe71csm12091157qkm.108.2023.02.14.07.59.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 07:59:47 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id s203so13593208ybc.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 07:59:47 -0800 (PST)
X-Received: by 2002:a5b:ac4:0:b0:8ec:43b3:83fc with SMTP id
 a4-20020a5b0ac4000000b008ec43b383fcmr290240ybr.128.1676390387608; Tue, 14 Feb
 2023 07:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20230211150012.3824154-1-niklas.soderlund+renesas@ragnatech.se> <20230211150012.3824154-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211150012.3824154-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 16:59:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-O_EJfd1__W9Gk85XUG7d7-kYAuZnTSKJ2U76+U3tcw@mail.gmail.com>
Message-ID: <CAMuHMdX-O_EJfd1__W9Gk85XUG7d7-kYAuZnTSKJ2U76+U3tcw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: white-hawk: Add and connect MAX96712
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Feb 11, 2023 at 4:00 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The sub-board contains two MAX96712 connected to the main-board using
> I2C and CSI-2, record the connections. Also enable all nodes (VIN, CSI-2
> and ISP) that are part of the downstream video capture pipeline.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
