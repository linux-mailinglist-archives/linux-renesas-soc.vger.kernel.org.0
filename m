Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C111D4F1607
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 15:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355041AbiDDNjt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 09:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355040AbiDDNjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 09:39:47 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402A13DDD0;
        Mon,  4 Apr 2022 06:37:51 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id o15so6290444qtv.8;
        Mon, 04 Apr 2022 06:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M3S8rKWNusBO1bmzZNw58V6gdJEmEIoLbaxiTEXlC8o=;
        b=q4UPJ47FFqaXEme/9uU4c/C9IAzbqYi3bFIlEyWrjslV5i3itmRCrGXgPEFdoVKcBS
         OWmwx+sAVEyZO4gDVrCcTOwqk0Kg1LjYDdRj+gBkR5ALWsea/jwxhta7SMTCjYp3ZPfc
         dy1wdtDk3ZOwyeJPJxKT9YGSymiRwagGr7lPkKtbPbK5behTHfydBhqtQ4PCj2qQ7Vpm
         ttH3ee6l2JrqMUjbD6xRS5vvd6AP985uubV7FSXP5jC9DIdgT8dsVnMeYGkG959IZLim
         c9L8kROurd63Qin5J3hq8gWTqF8LDsMtU+3VFTxqFhZv6kVEywFLwtgbieuTH5eiB+e5
         UODw==
X-Gm-Message-State: AOAM533WWOgWUe27pcN1Y83HCdpuBps2CJ/uNyInu0c5OK459J4kfD2w
        KWKex4jUuRWncaQCT3IDKtTmYrbYA93O7Q==
X-Google-Smtp-Source: ABdhPJzA2b637Z5hetIBSmVCwQ6zVb1Uh0mknDaJpOeXYNCPNCL1yorOEVGpCU0etjpUmw1fYi4O4g==
X-Received: by 2002:ac8:57c3:0:b0:2e1:e283:ed50 with SMTP id w3-20020ac857c3000000b002e1e283ed50mr70334qta.200.1649079470038;
        Mon, 04 Apr 2022 06:37:50 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id k2-20020a37ba02000000b0067dc1b0104asm6267661qkf.124.2022.04.04.06.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 06:37:49 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2eb680211d9so29075377b3.9;
        Mon, 04 Apr 2022 06:37:49 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr22538045ywb.132.1649079469315; Mon, 04
 Apr 2022 06:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220404130551.20209-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220404130551.20209-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Apr 2022 15:37:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjomnBk38vCjLnNW75_c9pK7W5vn6fHufyOk-dZew6jg@mail.gmail.com>
Message-ID: <CAMuHMdXjomnBk38vCjLnNW75_c9pK7W5vn6fHufyOk-dZew6jg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: remove superfluous specific M3W entry
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Apr 4, 2022 at 3:05 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We don't need to specify the Gen3 compatible entry for M3W because it
> will be provided by the generic Gen3 fallback.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Initially, arch/arm64/boot/dts/renesas/r8a7796.dtsi did not have
the family-specific compatible value.  As commit e871efc9a4f48c9b
("arm64: dts: renesas: r8a7796: Use R-Car SDHI Gen3 fallback compat
string") is included in v4.16 and later, this change should be fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
