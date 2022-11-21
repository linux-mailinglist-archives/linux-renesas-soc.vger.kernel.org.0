Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E9A631B89
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 09:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiKUIgB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 03:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKUIgA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 03:36:00 -0500
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39762DF15;
        Mon, 21 Nov 2022 00:36:00 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id i12so7607605qvs.2;
        Mon, 21 Nov 2022 00:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgxEZuQ8kvtpeXEq+L6kg5CD+mZ6LsuqDvYogXmTWZo=;
        b=sf3XorJMf6qTFcFOMKEXst1r7YNgVAULNKUkajNixfWzeq8UwIZB0+WzIw7UM9G7Qs
         1H4QTxGp/qFyVu/c2aqhuwggwZYqXjRfjjQeN3hzwNzLtH0QUzOaEOEweX00ZQ4cNbX/
         JWrxh+1I7GDkuQZ/D28sDQFEetzsm8JXDh0mrLcAY3ipnsKWP+czr6e+k6lBh2BGqQHq
         yF/7x34tr760e1KsCTMg/Mt2O/kDXPAA/XF/5TBPLtapqhNvmPYL83jS64mqR730GBFD
         Fl602JVLlvRkCWggESpfj/xPsw1auVLjDybB0wdDU35zxo2zZH8qMPrnBAlOsWE0oARy
         PoQg==
X-Gm-Message-State: ANoB5pn4OgV8O9ZQhzfXl5v5bdELs2kE6xKQKEtUR/EgVtAtlI/gofvC
        H87RhNThFZrUcA1JU1IKs2Ih8ZRbtEhpnw==
X-Google-Smtp-Source: AA0mqf7vEku1tOkzq06Qyw1sP48sLmKui2RrAfQG9+GE0SoLU45hJziML8mVJV5TB55HU3P5IKemOw==
X-Received: by 2002:a05:6214:81:b0:4bc:244e:86b5 with SMTP id n1-20020a056214008100b004bc244e86b5mr2442824qvr.94.1669019759211;
        Mon, 21 Nov 2022 00:35:59 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id l21-20020a37f915000000b006fa7b5ea2d1sm7865437qkj.125.2022.11.21.00.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:35:58 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-39e61d2087dso31244437b3.5;
        Mon, 21 Nov 2022 00:35:58 -0800 (PST)
X-Received: by 2002:a05:690c:b81:b0:37e:6806:a5f9 with SMTP id
 ck1-20020a05690c0b8100b0037e6806a5f9mr616957ywb.47.1669019758207; Mon, 21 Nov
 2022 00:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20221120113457.42010-1-wsa+renesas@sang-engineering.com> <20221120113457.42010-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221120113457.42010-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Nov 2022 09:35:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmLDU6XFxL74S_f7vfT7bFU1Z-eiFZmFPUiuUUTCQvGA@mail.gmail.com>
Message-ID: <CAMuHMdWmLDU6XFxL74S_f7vfT7bFU1Z-eiFZmFPUiuUUTCQvGA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mmc: renesas_sdhi: use new convenience macro from
 MMC core
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Nov 20, 2022 at 12:51 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Makes the code more readable.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
