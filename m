Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85AF651338B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346175AbiD1MZT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 08:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346140AbiD1MZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 08:25:19 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B872422BF5;
        Thu, 28 Apr 2022 05:22:04 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id y6so1267359qke.10;
        Thu, 28 Apr 2022 05:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VMbnyNY472k010Ga+NOpmDRUxDUBWqI9J8rVOxItQuw=;
        b=eTUPOeH/++VdiTq3UsG93VYw5ICd5VNy9K1Bppyu0FVPIjeZwumSKKPMAIqXMuW3XI
         s/bnb/rYstXiZ2G+hBsUtBw6LUlKCKEJgEHRubxnPMcI3PryBhpQTlAzqXD3Fgi9RAvo
         VmKU6Pr3FVFXo/XYgYHd0T4NcPudUen8XypdyIb9bWaz30/Z57Gb5IhQF10Cq+Co0HgV
         06ljxuFtI+BZIBEG63cDj0hGoAEbS2YYaqYUrKzOfqXmx6CWBkoqRf5dCkaqYB8TU43V
         pMz514iT+/fQxKkyg0F6cSToQNASgWo9Mi5OZ4FkNLUqQeqda1/PzW4NPXQ1aM9GWQqM
         dDcw==
X-Gm-Message-State: AOAM5307lNbZWsaw1fKDvaS4caLVt0xyCocUIx0RFM3xDz7uSVoGigVq
        HR1OxUqSexsR9qPq/CP2pnzk9VgYoRiMsw==
X-Google-Smtp-Source: ABdhPJwC5udylNxjSZirBalQ+edca7rKY8JjsHcudZL1/EPHPIbpJI+rVb5lWQ28/vcobAGHbs67yg==
X-Received: by 2002:a37:6549:0:b0:69f:a625:fe2b with SMTP id z70-20020a376549000000b0069fa625fe2bmr1085609qkb.132.1651148523646;
        Thu, 28 Apr 2022 05:22:03 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id m9-20020a05622a118900b002f1fc51135dsm11774103qtk.57.2022.04.28.05.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:22:03 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2f7d19cac0bso50567177b3.13;
        Thu, 28 Apr 2022 05:22:02 -0700 (PDT)
X-Received: by 2002:a81:e10d:0:b0:2f7:bb2a:6529 with SMTP id
 w13-20020a81e10d000000b002f7bb2a6529mr29148790ywh.62.1651148522767; Thu, 28
 Apr 2022 05:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com> <20220425095244.156720-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425095244.156720-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 14:21:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqKQUh-3BrAQtray77N=cUePMZuegCkxfbsarRcaiJtQ@mail.gmail.com>
Message-ID: <CAMuHMdUqKQUh-3BrAQtray77N=cUePMZuegCkxfbsarRcaiJtQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: renesas: r9a07g043: Add I2C clocks/resets
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, Apr 25, 2022 at 11:52 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add I2C{0,1,2,3} clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
