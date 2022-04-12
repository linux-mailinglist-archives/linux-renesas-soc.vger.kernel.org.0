Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D8E4FDB80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 12:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiDLKEX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358952AbiDLJrs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 05:47:48 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C066762C8E;
        Tue, 12 Apr 2022 01:53:37 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id c199so11483973qkg.4;
        Tue, 12 Apr 2022 01:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+5QLEkfnkcIMk5JXvTP2/pWavVT6LD4E3jbjn1v9iw=;
        b=Pm1oJI158xAUAlcmvWSJHbD0D8oB9Knm5zV7/ebK+m8O7OE67aWqe0UW+G9ZnL7GIE
         9OvruRHj5fFdSkW417WHoQ4y5a2X55CVbobkHiy2Ql6rI6QYrAbX4T03wgm2hPAq5Hel
         E9DpqczziHeuJD1rqCqG0In2PcrnMkFpWvKkc+VySIaflG9Bl5jxP8nAy2jEDEGkuRw5
         jkis65AnnIM41GN2JeaBkisLdkug3H6CwKDvLQfZkTnHoXWEUxUJzfjyT4jGOtyPlcPz
         CV/EiTsYRCy0oTru3nEzZrqt+VV14u9lybTN2TcnmtYR6oOL19LfmyzfHu+GcYFvQA9T
         ByQQ==
X-Gm-Message-State: AOAM533q6m6cLdv1sxjW+7C/gDmXvXQdzP8ybz0fhy3SCQ4/jfk2Tiam
        fW3kC7dg2iuKQlL4QUZE0vzwBcc357fUBzfP
X-Google-Smtp-Source: ABdhPJyTHYmKM7AYy+Shwi+ArGdcwINe40RVOgahUFGaRVWlRMPHeLR3xi+SVTdV+IjvlP7Qjf37Pg==
X-Received: by 2002:a05:620a:448d:b0:67d:b59e:8720 with SMTP id x13-20020a05620a448d00b0067db59e8720mr2279663qkp.769.1649753616549;
        Tue, 12 Apr 2022 01:53:36 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id d17-20020a05622a101100b002ed11f71ed9sm7117727qte.17.2022.04.12.01.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 01:53:36 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id z33so31938707ybh.5;
        Tue, 12 Apr 2022 01:53:36 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr24367733ybp.613.1649753616014; Tue, 12
 Apr 2022 01:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220322095512.4707-1-wsa+renesas@sang-engineering.com> <20220322095512.4707-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220322095512.4707-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 10:53:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZ=gpqXKkxogV+jhrvZUuRjO_buzYntQ-PFOsy6YnYyA@mail.gmail.com>
Message-ID: <CAMuHMdUZ=gpqXKkxogV+jhrvZUuRjO_buzYntQ-PFOsy6YnYyA@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: rcar-gen4: add interrupt
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

On Tue, Mar 22, 2022 at 10:58 AM Wolfram Sang
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
