Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603B74FDB77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 12:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354596AbiDLKEC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245026AbiDLJmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 05:42:32 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB6D61A37;
        Tue, 12 Apr 2022 01:47:56 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id x20so6344982qvl.10;
        Tue, 12 Apr 2022 01:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lP1JUdfR4YYIObn1/MVTE8t9OD99YvO9AS5tnmwJug4=;
        b=oM3LebVKpkJxHnKu/9PHmlnCHh+6r30atHZCs2ZIKYdl0rfbqz1t9QFGCF/u2KZbeh
         szW/8ht+9D16/Q70SDcqMWHlkQiylV7h+g+V7t3U93ZGseKXiDhUeVgiKnaDGRoHrBBl
         yel9OaqMIXQJ8TFc91Y5+QBSZOp9QWq722N4Hf+7qE0S7YZHbFiOmADekoaDGIcJgx8E
         iu46LpMRzvLhOcsEtjCuh7KOP/0c/EHjVl+4G5HamyPRK4+d2wWa0a8vRdIx0iFiHS3f
         PacZSzy57krJpTwEz+ibWzSavAmrCzfHQZPCO0lhS5wtfInpH9IZO1FFVqySHR987gEH
         UeSg==
X-Gm-Message-State: AOAM5310ezbXhPfu5ZsV/J/WdiG4Ymh7FKY8/DlSzOfXBwyBoIBaUlN4
        7fVJ6Lhhb3kGqXr5dvMxpaI5EvLlmszUWjCz
X-Google-Smtp-Source: ABdhPJyCC74/s1En8U8GDNYt26ykFj+dPr7h0LkEYXdruqwqLl/dV9kRpokp9PZm5dzaHdoCrv5MOg==
X-Received: by 2002:a05:6214:21e1:b0:440:fa7a:493e with SMTP id p1-20020a05621421e100b00440fa7a493emr30443937qvj.55.1649753275824;
        Tue, 12 Apr 2022 01:47:55 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id w17-20020a05622a135100b002ef480d2559sm2897848qtk.34.2022.04.12.01.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 01:47:55 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id e71so17365148ybf.8;
        Tue, 12 Apr 2022 01:47:55 -0700 (PDT)
X-Received: by 2002:a25:2c89:0:b0:641:2884:b52e with SMTP id
 s131-20020a252c89000000b006412884b52emr9521498ybs.506.1649753275160; Tue, 12
 Apr 2022 01:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220322095512.4707-1-wsa+renesas@sang-engineering.com> <20220322095512.4707-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220322095512.4707-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 10:47:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbuuYLRO-s+5PhsQPKHaeJXHxjoGzN+Tx1hk0YiLqRwg@mail.gmail.com>
Message-ID: <CAMuHMdVbuuYLRO-s+5PhsQPKHaeJXHxjoGzN+Tx1hk0YiLqRwg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: rcar-gen3: add interrupt
 property to the watchdog node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

On Tue, Mar 22, 2022 at 11:12 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Driver doesn't use it yet, but let's describe the HW properly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
