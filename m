Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3E24EEDBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 15:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346058AbiDANFe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 09:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346137AbiDANFc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 09:05:32 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCA862F1;
        Fri,  1 Apr 2022 06:03:32 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id b17so1918781qvf.12;
        Fri, 01 Apr 2022 06:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VN+bELT6KTDNmcZCchz2G2HDmhxFMVdXDuF+3yfWjS4=;
        b=7Tphk5FDmiheJKx061o7YxcyrUdDS8bgJ/M/2Q5QQru7qaAeQBz3FI6tq9+fIz4YTP
         2CeZCKkCCryZ8779RT8pYiBxY1NdRQ9tIB4djH9VcAVDrSFMOjzvl7/FTScMA4pai9Kx
         f8NgPTx4QEAnbAi8XH9wgy34E+RGQAIsu86gRE5M8Cenpi3h+r6eOwRLDqLow/Q6cOtB
         RamlHHk2mDCK2WjK0VTt1e0PqMk39nmgyqN6dFluEV9U/UQJHs5HoSjOy2g95eAD+j1B
         a3h2fwBjeQt6OKH2x9zeQl5YfUzVTHpalMXNZVSJbRkHhU7BtaJGU4gVqO3T11SP51T8
         MO5Q==
X-Gm-Message-State: AOAM530tDr7IuvjNyV8Yy2LCsGyvWEjyQFZ9/K70IzDLauMzdPS5yOOI
        4M9UmKzicP+8q9CkEVMLOoZUx9LUTCytMA==
X-Google-Smtp-Source: ABdhPJxFvNYL8tL/ervU4VK4e4Ztsu2IpOSE6mGaTEFxQbeAYtmrBGADHrWkLecTwEdEFBVv+m9RWw==
X-Received: by 2002:a05:6214:c48:b0:440:cded:f2ab with SMTP id r8-20020a0562140c4800b00440cdedf2abmr39153814qvj.18.1648818210669;
        Fri, 01 Apr 2022 06:03:30 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id f8-20020ac859c8000000b002e232e04cafsm1725516qtf.88.2022.04.01.06.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 06:03:30 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id v35so4842052ybi.10;
        Fri, 01 Apr 2022 06:03:30 -0700 (PDT)
X-Received: by 2002:a05:6902:101:b0:633:ccde:cfca with SMTP id
 o1-20020a056902010100b00633ccdecfcamr8065964ybh.207.1648818210074; Fri, 01
 Apr 2022 06:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com> <20220320123016.57991-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320123016.57991-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 15:03:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsnFnY1FiwTj5TPn-ytRHsu3QobSVAZaFULRD5hWuKDw@mail.gmail.com>
Message-ID: <CAMuHMdUsnFnY1FiwTj5TPn-ytRHsu3QobSVAZaFULRD5hWuKDw@mail.gmail.com>
Subject: Re: [PATCH 4/6] mmc: renesas_sdhi: remove a stale comment
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Tue, Mar 22, 2022 at 12:12 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The whitelist has been refactored away with a0fb3fc8af01 ("mmc:
> renesas_sdhi: remove whitelist for internal DMAC") so the comment
> doesn't make any sense anymore.
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
