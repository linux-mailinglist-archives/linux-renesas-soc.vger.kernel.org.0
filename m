Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D36C66BBFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 11:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbjAPKj5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 05:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbjAPKjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 05:39:07 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571641F5F8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:38:13 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id x5so645841qti.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3LqnrhrTbcVn513dLbsWfFBzDyqI7TxY9VuwmjnV80=;
        b=VRbu7Azgb8XdyndK1kqdVHh4faETWABNigHRwnk9S7ksEhM5wk2oAgR+OgyrB+y/7b
         czx5UhTWsb0urWreVra0KeYRjuSyIdQa9rl/bAiY/PAZN70aWQmTsA+HDScOwCHgx1JP
         54i6/dtl6goyMqThVmULkVwqEKpNH/R451cNvP0uBkmt3vqt0H72wZdko00zDoT9q7yv
         xapW3wn/0G+uw8BuLEZVtfC/4mlj8zPkVYNZ4XHceRt2RQmMlgSI4484w+LuXYcLu6LW
         oyD/TSiKcB2jVSoGViPqnQht46Q/9Iq7iWUZtcg0zIS5WZtwweCVRFqLrsnvn8jlichn
         OsBw==
X-Gm-Message-State: AFqh2krAmM+JNZ3Yblpr4WGtcOG7zC00c1J4KHgh0Qc3wB4mZF9VH4tJ
        e8WNTm47NyYsupF+cg8nRKGBWWPmuvibuQ==
X-Google-Smtp-Source: AMrXdXtxJTmDwi8WPyewwoND5yAamofp2piXQqspzed5O53UzxWu1rifmugbRsDMydeHw46Bb796sA==
X-Received: by 2002:ac8:51d8:0:b0:3b6:3356:1950 with SMTP id d24-20020ac851d8000000b003b633561950mr2872767qtn.58.1673865492324;
        Mon, 16 Jan 2023 02:38:12 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id h18-20020a05620a401200b007064fa2c616sm3376147qko.66.2023.01.16.02.38.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:38:12 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-4d4303c9de6so224161747b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:38:11 -0800 (PST)
X-Received: by 2002:a81:578e:0:b0:4d9:3858:392 with SMTP id
 l136-20020a81578e000000b004d938580392mr1308411ywb.502.1673865491778; Mon, 16
 Jan 2023 02:38:11 -0800 (PST)
MIME-Version: 1.0
References: <20230114225647.227972-1-aford173@gmail.com> <20230114225647.227972-3-aford173@gmail.com>
In-Reply-To: <20230114225647.227972-3-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 11:38:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpFGktH-f=cG9jN6vNEYNLC0TjvWTt7=A+hoDpWpZyhg@mail.gmail.com>
Message-ID: <CAMuHMdWpFGktH-f=cG9jN6vNEYNLC0TjvWTt7=A+hoDpWpZyhg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: beacon-renesom: Fix some audio messages
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, aford@beaconembedded.com
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

On Sat, Jan 14, 2023 at 11:56 PM Adam Ford <aford173@gmail.com> wrote:
> The WM8962 is configured so the SoC is driving the clock, and it's
> currently set to 24 MHz.  However, when playing audio it shows the
> following message:
>     wm8962 5-001a: Unsupported sysclk ratio 500
>
> While not harmful, a better clock ratio is 512.  It makes the
> message disappear, and it still plays sound.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
