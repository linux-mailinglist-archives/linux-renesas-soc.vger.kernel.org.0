Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71C3F77C8C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235360AbjHOHng convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbjHOHnV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:43:21 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9290DAB;
        Tue, 15 Aug 2023 00:43:20 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a1ebb85f99so4836276b6e.2;
        Tue, 15 Aug 2023 00:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085400; x=1692690200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcSqMj1oxk+XcRkqUpUSGJ3z0luUcZQWsRNfhNSx+Ec=;
        b=OEgewyrzGeq1BZ8R8EtLRvjlfx23+Q8fl1QnJcSyBA8d1vSaFRjxQqrHAH2ULJApTk
         6hmAZ66ioCM3KYqyXh9xzziCIr2ZLJryoW0CmekXaAemrDk9En3eO8VD4AhhnnHh1WOj
         720uw7CP8oDw1zEpmQRB43LXldPfv7cpJJpuYHYMb+4G8WLMkTTwp1kghJJHm/XWSHAr
         owvSbb/2q3u5R3J5DjTP2+sySTEg74G74Bq0/LqRCHmLEiuP5ZWcBN5zauXHN+Q0G9t3
         SGLJtXEAwXRrY63skoy1Omxt8oNJM9p0Ay/q5i9qPLNn+sqF06Iu+3cn+v/gBEg1grJZ
         3p1Q==
X-Gm-Message-State: AOJu0Yz1ymmkr73d8fScM1tegFatCflp9i4dWWmo8Jrh1l7+QB7cz3Vn
        VVVqvMkR1xWKLYjZcaltClsfmLR12e3KNA==
X-Google-Smtp-Source: AGHT+IF+VmbAuNI4buGd0z6IeDU2SBt+r9KWvvU4QBne0rUy5GQoybfsy2wv+SjiQTnH7mfq8MlIFw==
X-Received: by 2002:a05:6358:7215:b0:139:833c:53f8 with SMTP id h21-20020a056358721500b00139833c53f8mr11212880rwa.24.1692085399722;
        Tue, 15 Aug 2023 00:43:19 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id e191-20020a2537c8000000b00d071631665fsm2831960yba.59.2023.08.15.00.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:43:19 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so3739815276.2;
        Tue, 15 Aug 2023 00:43:19 -0700 (PDT)
X-Received: by 2002:a25:8312:0:b0:d47:89c0:52aa with SMTP id
 s18-20020a258312000000b00d4789c052aamr9836466ybk.13.1692085399035; Tue, 15
 Aug 2023 00:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com> <87h6pjpro4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h6pjpro4.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 09:43:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-DphtkyzGd1Zyi0ySS7ipAwUrRGa7PNX6RL2zYNadWw@mail.gmail.com>
Message-ID: <CAMuHMdX-DphtkyzGd1Zyi0ySS7ipAwUrRGa7PNX6RL2zYNadWw@mail.gmail.com>
Subject: Re: [PATCH 7/9] clk: renesas: r8a77965: add 922 ADG
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
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

On Tue, Aug 1, 2023 at 1:50 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> R-Car Sound needs to enable "ADG" on RMSTPCR9/SMSTPCR9 22bit to use
> clk_i which came from internal S0D4. This patch adds it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.6 with the tags given.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
