Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04ACC5713E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jul 2022 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbiGLICx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jul 2022 04:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiGLICv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jul 2022 04:02:51 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A199CE05
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 01:02:51 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id f14so5711235qkm.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 01:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pArVfdsDyT42DWDNQe7M9BUz9g2D3QLUDMR2keaHxMw=;
        b=LYY4c2X+xxp2bI3TYSK5euI3GT6mFlpWrH7bEDrSaI6SNYEwLUwGzQ6sEVYZU2zv0b
         +XyLrX4kqVlqzClZdqbEKo3ART1L9v5LaKoqrdFWDk78x2a6xw2rpl8ij9V2U9vAiJPI
         Ajr+OVaTTJEr7WeDpJajbm6hHbuRP2c2Tr35aCjBupZFnAvTe3aK4VnQnr44ZQUJWL/n
         Gsuqvw84DgaPvEXjOMUQSW8Q6otiS5+fGiCoHinHTXBXY4RjL9K/nSj5+Uf7WUvx5/va
         +3mGF4q602D2WTQP5MOqPyLEq+HcNMiH31Sxyn2Ex9TzgobYyy6EvOC9Ecy3J0+28zRD
         vZ5A==
X-Gm-Message-State: AJIora8vB6KnRLKPsgu9EEMojRKvRNWDkiR+t5pVoY60jDh6KcWIDqnG
        SC7uRMdoUpSm3AcrgvWHd6M15e6THt/aCA==
X-Google-Smtp-Source: AGRyM1tAD+RwNG4JzNFz0jQ+bx1IN7ubc46y19y5WmDDlYrMoACz8jHpz/8LDQfG+uWFH7Paff3UOQ==
X-Received: by 2002:a05:620a:4405:b0:6af:2404:de4d with SMTP id v5-20020a05620a440500b006af2404de4dmr14388014qkp.308.1657612970050;
        Tue, 12 Jul 2022 01:02:50 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id a10-20020ac844aa000000b003154e7466casm6795767qto.51.2022.07.12.01.02.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:02:49 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id y195so12718998yby.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 01:02:49 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr21572316ybh.36.1657612969268; Tue, 12
 Jul 2022 01:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220711134656.277730-1-wsa+renesas@sang-engineering.com> <20220711134656.277730-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220711134656.277730-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jul 2022 10:02:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJSjJrHHGRAUjwP-0O6r2dXjPLdC_wRoQOTkP5qxGktQ@mail.gmail.com>
Message-ID: <CAMuHMdUJSjJrHHGRAUjwP-0O6r2dXjPLdC_wRoQOTkP5qxGktQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779f0: Add sdh0 clock
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

On Mon, Jul 11, 2022 at 3:53 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.21.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
