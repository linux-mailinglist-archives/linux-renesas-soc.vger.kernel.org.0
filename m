Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8171A6660CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jan 2023 17:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbjAKQlP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Jan 2023 11:41:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235333AbjAKQkX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2023 11:40:23 -0500
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A332C392C1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 08:38:28 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id s127so16296741vsb.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 08:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v22Vzul0qdlPP/XNVArnqxl8t8ecKEmpXNndb6wH7R0=;
        b=pAytwhLdyOlL+Xhdebd/UjZtBDDQfPg5RgxYriTCyG+i0djoqzbaygn86Wfj9gDQsD
         pV53vS8OIIlst1K4pshfVq3gqlrlK6lDfoqt5Eb83FsNUlFUmtHYlDQ0M/nZdTvdLMyM
         UGYRnBqOyN8n78ktKwCN7UISmGlWZKTTps1tBzNq2u+GTJHtUuf0Vq3tlKuto35Ad1go
         FVcwS8yA3OaTEmsBqi6oqGsRji1dIAgs5R032XmEU1YjE5zEdvagwDvFzFj1hyqkOFGZ
         7xXmBdaXYXYCWwTw3XmTpyz4KtuE4ZwknnPESvtNU9OqBQRlufw2bhu4IKWa7MI8Qr80
         4QMw==
X-Gm-Message-State: AFqh2kr0ZQHtt0FZBtQ3vSd6gbQxYfr3QBw/cMvl7rx/BzyT2UE0MYde
        m1X6t9SCGUc7hXEsW18TW/IqLchp9Orlsw==
X-Google-Smtp-Source: AMrXdXsBiKASi8t1yAT9TJywKp80U4WRWrirr18qwXeK3TsjEpN3e8aJRmmxIARteOad9Tds9HKY7Q==
X-Received: by 2002:a67:dc87:0:b0:3b1:2e1e:7014 with SMTP id g7-20020a67dc87000000b003b12e1e7014mr1779147vsk.20.1673455100959;
        Wed, 11 Jan 2023 08:38:20 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id h10-20020a05620a284a00b006feea093006sm9279449qkp.124.2023.01.11.08.38.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 08:38:20 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id e76so15566860ybh.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 08:38:20 -0800 (PST)
X-Received: by 2002:a25:5189:0:b0:7bf:d201:60cb with SMTP id
 f131-20020a255189000000b007bfd20160cbmr730101ybb.365.1673455100366; Wed, 11
 Jan 2023 08:38:20 -0800 (PST)
MIME-Version: 1.0
References: <20230111094944.5996-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230111094944.5996-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Jan 2023 17:38:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwo-R=dksTJH2Kaym3PsM9Xmywbr44SHVtWMwNg=r5iQ@mail.gmail.com>
Message-ID: <CAMuHMdUwo-R=dksTJH2Kaym3PsM9Xmywbr44SHVtWMwNg=r5iQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: condor-i: add HS400 support for eMMC
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

On Wed, Jan 11, 2023 at 10:54 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> HS400 support for R-Car V3H ES2.0 has been fixed, so enable it on this
> board.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Dependency commit f504dee2c63b93fd ("mmc: renesas_sdhi: R-Car V3H
ES2.0 gained HS400 support") is in v5.19, so I will queue in
renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
