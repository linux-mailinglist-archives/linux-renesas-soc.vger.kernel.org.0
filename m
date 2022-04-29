Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D319051435B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 09:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238511AbiD2Hm5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 03:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354963AbiD2Hm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 03:42:56 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2E5A66DB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 00:39:38 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id p4so4600179qtq.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 00:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bQLHDC/gWnPXjG1esqXZgkFSaVmA2LstmfBCN2+RfWI=;
        b=oaGj5MxnHHCogDgneJ7AoQuqcyjTcPbmnyy17xq8UxYSN2yGTlCiJW4yB7xuSjT8r2
         OiH5PllAQZhhG8ZYpoVqfgg4mNKpNZ6KjJO3DDliWLXA83Qe4Se7KdHM/NL4oqR8JxtJ
         Fs/SF64NSRtVrUE3/gY5SRGcGNgws4bJMB7eptGq0IHdfUAm8pNYjPz16qJyd5G+EEEp
         mvOkC9gSYRxO7IGhyL8WmaI5vHlAcGt2QKGFv9p1/pho8dCJjHdMEred8GISvnQayUs0
         qe7zMn84usMoDj8MYl3SuBLlaf+Lt0GNEpHeN+XDDydlZ3H+poRQLO7yibBbHk6aob8Y
         3X4g==
X-Gm-Message-State: AOAM530hpJQd06XPMy+smbJNsVqCrGo/MCzRMMB8T9yOfDQqeT4kajND
        9Jy67FTQBzXHMhqPP8OzGoCFlwFgXIsv6j/C
X-Google-Smtp-Source: ABdhPJxaDhtHTzkaZekkxUDVBEgch5u1jWbsdwXENLlBEeKHkwd9o/tScE4IDdWzVTbQexcqtBWB7g==
X-Received: by 2002:ac8:4e4f:0:b0:2f3:8c74:b227 with SMTP id e15-20020ac84e4f000000b002f38c74b227mr4401700qtw.423.1651217977725;
        Fri, 29 Apr 2022 00:39:37 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id k66-20020a37ba45000000b0069c5adb2f2fsm1146333qkf.6.2022.04.29.00.39.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 00:39:37 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2f7c424c66cso77117257b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 00:39:37 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr34596003ywa.479.1651217976904; Fri, 29
 Apr 2022 00:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220428135058.597586-1-yoshihiro.shimoda.uh@renesas.com> <20220428135058.597586-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220428135058.597586-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Apr 2022 09:39:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBWP_jhYCuFfVyTKUBxTGgB_hHtmLheNFLiHuK-zyP1Q@mail.gmail.com>
Message-ID: <CAMuHMdWBWP_jhYCuFfVyTKUBxTGgB_hHtmLheNFLiHuK-zyP1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: renesas: cpg-mssr: Add support for R-Car V4H
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Thu, Apr 28, 2022 at 3:51 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial CPG support for R-Car V4H (r8a779g0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
