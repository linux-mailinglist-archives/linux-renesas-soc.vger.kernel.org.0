Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECC666BCA7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 12:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjAPLRt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 06:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjAPLRs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 06:17:48 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D47665A0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:17:47 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id d16so11354638qtw.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOYRs7iR/g0+CzRq7/IKsOFSFEI/Vem0lUXt9+whT2Y=;
        b=5WzzsPKQ7Ra7TnfvwVnvGmXckxmJ69Dhqt4IzLloRRDb+uSSJ8G7A1WlXzul8z58R4
         OSJh0KVekHgbZmkp58D5E6ylUgLXgQwJa8UA83juMW06COJW6S4KQm5NHHB5+tB89NH5
         BMXKs5r8qWeR+MUpddC/Ca6xuZoVHkg3cWsX/mtOKbnzR+J//7OdGpvDOFoMCJ6X371y
         VSiVEDL3imCFarNXINDcMrtJ7sOOnecCOZbcdg8j4k1goV9xokLT+7ODp8ntnKW1KWyx
         5L5jkRKRZIriKK5TkjVe3jh9SI/eJnDeaBofY0Jh7tTtBYEaejQXPO3+w/zIdfRw/nB/
         y+Hg==
X-Gm-Message-State: AFqh2ko6pTaoWbdS42pHT+dmYyvri/1HnH7ZSWPQi8s3cKZj9rnlaCva
        RPeBo0MgLHZGQ628o7JoE4mOzLGaljU0vQ==
X-Google-Smtp-Source: AMrXdXshpw1veH4SxkiY1Vu4NE7VmqUYM8T3Aiml/MUBzafZawRHgvtZYGsJzEGbUuujw5qjrH8y4A==
X-Received: by 2002:a05:622a:418f:b0:3b6:36f8:a63a with SMTP id cd15-20020a05622a418f00b003b636f8a63amr1372421qtb.63.1673867866467;
        Mon, 16 Jan 2023 03:17:46 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id l16-20020a37f910000000b00704df12317esm18018008qkj.24.2023.01.16.03.17.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:17:46 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-4c24993965eso369666257b3.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:17:45 -0800 (PST)
X-Received: by 2002:a81:578e:0:b0:4d9:3858:392 with SMTP id
 l136-20020a81578e000000b004d938580392mr1317250ywb.502.1673867865684; Mon, 16
 Jan 2023 03:17:45 -0800 (PST)
MIME-Version: 1.0
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com> <87edrzi41e.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edrzi41e.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 12:17:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjiN+tEb8p1q+ABvViWXkfzb5x3151OrB_wchz7OaSYg@mail.gmail.com>
Message-ID: <CAMuHMdVjiN+tEb8p1q+ABvViWXkfzb5x3151OrB_wchz7OaSYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] ARM: dts: renesas: #sound-dai-cells is used when simple-card
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 13, 2023 at 3:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current sound comment is indicating that #sound-dai-cells is
> required, but it is needed if board is using simple-card.
> This patch tidyup the comment.
>
> Link: https://lore.kernel.org/r/87cz8mpxgt.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
