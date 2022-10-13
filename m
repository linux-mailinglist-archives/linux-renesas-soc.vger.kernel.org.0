Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA115FD53E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Oct 2022 08:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiJMGxk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Oct 2022 02:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJMGxj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Oct 2022 02:53:39 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49314326D5;
        Wed, 12 Oct 2022 23:53:38 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id z8so484949qtv.5;
        Wed, 12 Oct 2022 23:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqhIn7a8GZxoIOZ2jLL7IXtV3541/fwKqELCVRadkpg=;
        b=0pdsgcoUPyaXuJ2KVz0nImCXBH4kAsuvRZk+2+lHRNZHS9WND9XtT0H9HtCN234YBX
         KT8yjxtD6cyGGS6g+RzznJFlyE+wP8aAj1ZDNMK6CF/EGtRJgyl3RuCB+mawZar0W4xc
         /pUEfTxkSQyx6nEiUHCfVIm7dfgdQhphmqZBUlSwfGpP1LsKxTjwEnt1tgQQvdCpINH7
         OPToW1Uq8rCsYU1dlXUjPEBozzmRtxgYVkTjLRrrhifNfXYlIXG6UOrVK/FCXr6kIkZ7
         s3cgVU24pclRUWMb2H4EvzjEJ61RKJJ/Is/1EiQ3fPBi4DOvyAaa1wpotrUqKXbumm4s
         XIUg==
X-Gm-Message-State: ACrzQf1oMFsfDgSfyDQsBNwaSBNswbLhgLjnMW1BsIoe/YMjhCHqPWQo
        XnmvhyWGT3OB8nEvGfvlV7gL3O+4DQNtiA==
X-Google-Smtp-Source: AMsMyM5nSJYhc3pFDply2YBgLnlb9r6ioC7l1SY6e/YkUPkUCUbTZ2mg3u6gJltJSvHt1tub4oO4cg==
X-Received: by 2002:ac8:4892:0:b0:398:9975:52a6 with SMTP id i18-20020ac84892000000b00398997552a6mr19661708qtq.580.1665644017247;
        Wed, 12 Oct 2022 23:53:37 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id c7-20020ac85a87000000b00304fe5247bfsm15064970qtc.36.2022.10.12.23.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 23:53:37 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-358bf076f1fso9158787b3.9;
        Wed, 12 Oct 2022 23:53:36 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr29044497ywe.283.1665644016653; Wed, 12
 Oct 2022 23:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221012184830.3199-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221012184830.3199-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Oct 2022 08:53:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkp_jMLZxCW6atKMy8XPsrhnjX5L6Nm3uZqM+77pvaVw@mail.gmail.com>
Message-ID: <CAMuHMdWkp_jMLZxCW6atKMy8XPsrhnjX5L6Nm3uZqM+77pvaVw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779a0: Fix SD0H clock name
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

Hi Wolfram,

On Wed, Oct 12, 2022 at 8:48 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Correct the misspelled textual name of the SD0H clock.
>
> Fixes: 470e3f0d0b15 ("clk: renesas: rcar-gen4: Introduce R-Car Gen4 CPG driver")

Thanks for your patch!

> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>

I hadn't even noticed the R-Car S4-8 misspelling was copied from V3U ;-)

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
