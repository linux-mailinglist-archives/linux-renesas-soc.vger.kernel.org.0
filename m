Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A49C067B520
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 15:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235283AbjAYOwg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 09:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234862AbjAYOwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 09:52:35 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AB953565
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:52:35 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id v19so3531383qtq.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3UVtRqpDN//wl6uROmxcBvBUPE6R6isK/6AkGP9Hmo=;
        b=jOGYNVq9z+IH9eQhOXODWfYh8WDIKtLISGdtYMvlIv4W/Hfnhi8R2ER7ilFfWb8Gec
         dk52FXtdHzV1ih6YIp6TtqdWQ/KtHd6V79tjbk0QHH61mPX7swyb+oqgDhYOm0i0ZP1P
         /fHz1tlUKR6WiraYLXKYr9PJ7okcU48x5siMwkDY4qK8gKlxH7lFOakJkvyAsra2ISYb
         g/+EtkjrSDl61oL7gNTcqIQJIkTDC3CPUgKQxyxxqXIB6qBuyaNgk2zff+vyz9wLmXdN
         hP/H99tqZnZAFsrMgRSRgSFHnBTZnxJXBs6CN1LCQcj+gHuyW2dfAoHvooyFtoSCY/XD
         A/Xw==
X-Gm-Message-State: AFqh2kpo+ewudmoZq69NGGc+iUXv7QXvIVoumFPJYHZUe5KMdt01trNY
        zxyjTSNCWhpeb3sWex5r1TSj50oB00TeUA==
X-Google-Smtp-Source: AMrXdXsCLVdIurFdGwlyW6BTbnBLCJw2nkKhqUA+k+97QrZEoNJmQnHe45bqN9Cs5EPTt1JXVSGLHA==
X-Received: by 2002:ac8:6a0f:0:b0:3b6:3542:2b4 with SMTP id t15-20020ac86a0f000000b003b6354202b4mr44131347qtr.43.1674658353717;
        Wed, 25 Jan 2023 06:52:33 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id m19-20020ac86893000000b003b7fcbbb020sm1376426qtq.81.2023.01.25.06.52.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 06:52:33 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id e15so1117157ybn.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:52:33 -0800 (PST)
X-Received: by 2002:a25:37d4:0:b0:80b:8602:f3fe with SMTP id
 e203-20020a2537d4000000b0080b8602f3femr627205yba.36.1674658352997; Wed, 25
 Jan 2023 06:52:32 -0800 (PST)
MIME-Version: 1.0
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com> <20230123013448.1250991-6-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230123013448.1250991-6-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Jan 2023 15:52:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5R-XsCsvfoU==HQemV6ie_eo-bB-Y3wmLeRE5m9m7FA@mail.gmail.com>
Message-ID: <CAMuHMdX5R-XsCsvfoU==HQemV6ie_eo-bB-Y3wmLeRE5m9m7FA@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a779g0: Add iommus to MMC node
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
> Add iommus property to the MMC node for r8a779g0.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
