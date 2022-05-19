Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29D6052CFF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 11:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbiESJ4Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 05:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236386AbiESJ4W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 05:56:22 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0887580C6;
        Thu, 19 May 2022 02:56:18 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id l1so4232285qvh.1;
        Thu, 19 May 2022 02:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s/2T1PrXUtD6wltRrWRv0Q24jjGrS4G1g7jGzLZf57U=;
        b=F7jV2Ri/P3OI16CHENIT7AUGdXzTHPeGrKyRQQnqC325iN0rVtvqTNmgfEraspLkRE
         jKDzuCqCKr713qnpLNUEBGxcKxhhYHH8XgtiF7ZOhAdoR9uKZq5t8cJkIJuQGtbqPM0G
         gmz6zjzlPmL3OgK79LXtArvi+gwnDhmjL57KHYkOL/2fBQ72tNXr8aYSet6PvanvybZG
         kt5ziIg6CmEJdS8zMDixtMIgZRW0OWu/xOR/SaZ9N9arDezzR60+YIhlivb0yb+ZfHzm
         Wzqu43DIAdCcyueUgsUQpV2mU4nxsCxrQOySEYoFoR8OxlMV23iO/Wch75/qVBh7Uszx
         Iz5g==
X-Gm-Message-State: AOAM533rM1D6VvEM7YSi4JdlxljzeHD0asiwu5B9pQFRhMlpXRfSQEJl
        0niZgBLxGa49r41WA8An57GXVtj6RtYAXw==
X-Google-Smtp-Source: ABdhPJyg/UfpQzb7DR9cxhlIs7JCyxo0ZtegSnyaS2WaGtgcfD62GPaio4fUIk8VCOxWPNuS0wHDGg==
X-Received: by 2002:a0c:fc48:0:b0:461:d6c2:61a8 with SMTP id w8-20020a0cfc48000000b00461d6c261a8mr3086258qvp.73.1652954177644;
        Thu, 19 May 2022 02:56:17 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id x139-20020a376391000000b006a0ff3ec18bsm978159qkb.122.2022.05.19.02.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:56:16 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id i11so8104732ybq.9;
        Thu, 19 May 2022 02:56:16 -0700 (PDT)
X-Received: by 2002:a05:6902:389:b0:633:31c1:d0f7 with SMTP id
 f9-20020a056902038900b0063331c1d0f7mr3465864ybs.543.1652954176280; Thu, 19
 May 2022 02:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220518150105.48167-1-phil.edworthy@renesas.com>
In-Reply-To: <20220518150105.48167-1-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 11:56:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcKKXJgHS4ZddsUezD-zzYfwyY6=vrRQ_V2O9Mbq8ePg@mail.gmail.com>
Message-ID: <CAMuHMdXcKKXJgHS4ZddsUezD-zzYfwyY6=vrRQ_V2O9Mbq8ePg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g011: Add WDT clock and reset entries
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
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

On Wed, May 18, 2022 at 5:01 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add WDT0 clock and reset entries to CPG driver.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
