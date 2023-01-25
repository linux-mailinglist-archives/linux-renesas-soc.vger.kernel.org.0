Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D42267B328
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 14:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbjAYNVL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 08:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjAYNVK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 08:21:10 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17FD029E12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 05:21:10 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id v19so3277367qtq.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 05:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGDx0Bl4kiIsu3h1iZqgqnRTX3dS/5Foz7OZejavJW0=;
        b=yV/QhAA/nZiGLybfaCBMJLHcUTfds/Zsb7dR4PtNdNvWCaTT6tKyscu/aGNd14f4H5
         e/xWe0fFrStGb2dDRsNk4HbDvwsSzVrjd3tISbVUZpPCjvj+2ubiqZ2cRZdpivMuRsgU
         Ake8tLMJJ5eXOgkLkBklzsBwkoHCTv7oBtFbh8NSV3uGc4afZM0rvpElBgdYt94ZnbRt
         /IS4FNImH++EjpW9rEkEFRg1gQM2PBhtH5qBu3PqCRNw7eYBA3ECyOIdMTvL/m7gglnq
         qW/NPjyz3nFEhLijTdcbhdHn+0YRmJKOfsQwPClpCnHzMl+65W6sE4kYJxwJCQkI4yk1
         b8YQ==
X-Gm-Message-State: AFqh2kqELt4oGIFBSzV7fyfqwPCwkcxKW1KV7kpnzWxvkA8LzukEvEx7
        mMdd9dnHURpoPMJ4PC8Jz7j7OsRSsN2I5Q==
X-Google-Smtp-Source: AMrXdXvGOz2a17EVv8MJz8a99x3H+M79sYNXPZF4tl+EhjeNzhrCm2QhLl1DFUHaaESw2CPgx33VZA==
X-Received: by 2002:ac8:4813:0:b0:3b6:a0ef:bf2c with SMTP id g19-20020ac84813000000b003b6a0efbf2cmr24332122qtq.6.1674652869026;
        Wed, 25 Jan 2023 05:21:09 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id b11-20020ac801cb000000b003b6953fbb8fsm2001263qtg.32.2023.01.25.05.21.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 05:21:08 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-4b718cab0e4so262511007b3.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 05:21:08 -0800 (PST)
X-Received: by 2002:a81:7e4b:0:b0:506:4f19:740c with SMTP id
 p11-20020a817e4b000000b005064f19740cmr548501ywn.383.1674652868373; Wed, 25
 Jan 2023 05:21:08 -0800 (PST)
MIME-Version: 1.0
References: <87v8l3z3y8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v8l3z3y8.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Jan 2023 14:20:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPTEtSn-xrP5XSKRwRssuto8a6O-0-tMGq=v0GNwZMnA@mail.gmail.com>
Message-ID: <CAMuHMdUPTEtSn-xrP5XSKRwRssuto8a6O-0-tMGq=v0GNwZMnA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779g0: tidyup DMAC name on SYS-DMAC
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Thanks for your patch!

On Thu, Jan 19, 2023 at 2:52 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> "sydm" is bit name. Let's rename it as common "sys-dmac".

And the bit name was even removed in Rev. 0.55 of the documentation...

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
