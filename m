Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAAB5FD543
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Oct 2022 08:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiJMGx6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Oct 2022 02:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiJMGx5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Oct 2022 02:53:57 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AF9326D5;
        Wed, 12 Oct 2022 23:53:56 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id s3so469035qtn.12;
        Wed, 12 Oct 2022 23:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJTU43O6Wi9BS2BszmSyodhB+jZB65JGEtu+jXPJK2s=;
        b=2Gcby0njqNRW/P+djJheQVkbIxuD9FY4RNp/bKzMssvaEzS48jle933yJ76/jI6Fk4
         ayduEGYZ2774ouDrCQ4sfYB4+odWGcV3Es8OjTouLTs6zOdvWFdxjdF7K/Z+OurpzPcJ
         n4ZM8WuMizWPVIgALlY7gIS+t6yX1uAqNi6hMUIrqgUnT8br6wocopKLOoE3U0pzCRW8
         hlbfiQvM5lAO6WOeG20bCEkGPicGbSKOOL755yOv8oMpV7K2PaPk/oGlzJAHenyXjLEW
         b0B9l9oyGnGCmp/334WUbDztM9VBSnTWf06btfhLBifGwpQ47gVqlbTfg128vXEqx2Qg
         giGA==
X-Gm-Message-State: ACrzQf1xDsHibesvn5q7L4hwMw8Wpjq6IgDae9STui6eiOZEBU2hHiWP
        eAEyhstL07d1K79bARkxMuBxoF3NLZBPIA==
X-Google-Smtp-Source: AMsMyM4oOCxpiUMZ1PGT3Rz5AUI93Iy62BCz1byPJWE1l9g/9ICcS4bw8KEAAy3SNCGyjlmLn/20lg==
X-Received: by 2002:ac8:4e8e:0:b0:39c:c256:1465 with SMTP id 14-20020ac84e8e000000b0039cc2561465mr4803337qtp.259.1665644035444;
        Wed, 12 Oct 2022 23:53:55 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id gb14-20020a05622a598e00b0035cf0f50d7csm14057562qtb.52.2022.10.12.23.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 23:53:55 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id b145so1050991yba.0;
        Wed, 12 Oct 2022 23:53:54 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr29107744ybb.604.1665644034794; Wed, 12
 Oct 2022 23:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221012184830.3199-1-wsa+renesas@sang-engineering.com> <CAMuHMdWkp_jMLZxCW6atKMy8XPsrhnjX5L6Nm3uZqM+77pvaVw@mail.gmail.com>
In-Reply-To: <CAMuHMdWkp_jMLZxCW6atKMy8XPsrhnjX5L6Nm3uZqM+77pvaVw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Oct 2022 08:53:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXooLEsTz3jV3mT1rSzY0iZcdZacJjhLBEXnroq7avQQA@mail.gmail.com>
Message-ID: <CAMuHMdXooLEsTz3jV3mT1rSzY0iZcdZacJjhLBEXnroq7avQQA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779a0: Fix SD0H clock name
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 13, 2022 at 8:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Oct 12, 2022 at 8:48 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Correct the misspelled textual name of the SD0H clock.
> >
> > Fixes: 470e3f0d0b15 ("clk: renesas: rcar-gen4: Introduce R-Car Gen4 CPG driver")
>
> Thanks for your patch!
>
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I hadn't even noticed the R-Car S4-8 misspelling was copied from V3U ;-)
>
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
