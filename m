Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38AE567B51C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 15:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235046AbjAYOvG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 09:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234862AbjAYOvF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 09:51:05 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8764955B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:51:04 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id e8so16118677qts.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn/2FoYMFc4CcnghYBibVZYd7QRYy7NyOax7n7Hrsuw=;
        b=kZy0CKDe4Pj6vUUcNhpKMINldTFOKgCRNw32U49fo3sA74MhSiask2cfvxdJbeGQ7b
         +llgMi9xuVManDZ9fFtK+0pPCLjsfJ0XHr6FJoYhIsi0Woj/UKdqQcBb+maRPQC0Va+6
         TynHbMW5TbLuV+ybrcbubBW8hQ9mmlXvcmqNWmKtCfuWrgfst4PlgziPX0Y/70kYbJ+d
         1Hl1lfm1a59wQCypdX7/tSbpnci6tWMeTvDTDUtVEBtV2I3qfx5Q0FH/dzaMcYnVLzO+
         w2Fsn8UFD53cFqPJGHBx1P3FXJKa/DaH640kFcbHFZCNNV/lZtsV1S8g/LS85r8CdJhx
         qYHA==
X-Gm-Message-State: AFqh2kqxCozsZcrF1njyQzR2tUVzXYqucUwVgQQZMeJztY/O86Opwb8h
        fzDjq34ho9Ui0ewUVev51GOnvjsjHNyE9w==
X-Google-Smtp-Source: AMrXdXsiy+X/BHjFywkex/cdmJp516oggPfcNhi6wYO5U9eUJ7HC4EcZIsSMEHy9QJjEekLAxxiVWw==
X-Received: by 2002:ac8:450d:0:b0:3b6:36ab:e9d1 with SMTP id q13-20020ac8450d000000b003b636abe9d1mr44690049qtn.15.1674658263563;
        Wed, 25 Jan 2023 06:51:03 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id a20-20020aed2794000000b003b63b20314esm3474418qtd.57.2023.01.25.06.51.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 06:51:03 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-4a2f8ad29d5so266269727b3.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:51:03 -0800 (PST)
X-Received: by 2002:a81:bd6:0:b0:48d:1334:6e38 with SMTP id
 205-20020a810bd6000000b0048d13346e38mr3772679ywl.316.1674658262968; Wed, 25
 Jan 2023 06:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com> <20230123013448.1250991-5-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230123013448.1250991-5-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Jan 2023 15:50:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXv--8=YHW_-R2FBF=S8XbrnjAxkm6JT5LAaM3y_0FGdg@mail.gmail.com>
Message-ID: <CAMuHMdXv--8=YHW_-R2FBF=S8XbrnjAxkm6JT5LAaM3y_0FGdg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a779g0: Add iommus to DMAC nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 23, 2023 at 2:35 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add iommus properties to the DMAC nodes for r8a779g0.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
