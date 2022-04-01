Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1A74EED9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 15:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345574AbiDANEB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 09:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbiDANEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 09:04:00 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF9B21FC5C;
        Fri,  1 Apr 2022 06:02:11 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id t7so2050463qta.10;
        Fri, 01 Apr 2022 06:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fjIdOVCvUTUVsPuRsDSitcZiiBXDu9oUOQOu172T1h8=;
        b=yiSs74mgXzTiHqKV16M5Th4LluBHFL8WhyLrV1eFGRQCP/buOxpYHdOG6CbLV2u/Lo
         88N2MPKChRzjOdhmXmeaCAM0WQyz3328hZRiOegZn18JraQLstiRhHKv8U1MNg4+wdDm
         6pkZdIyKxRcvpMdUAtI/BousBsa/vP+MfAxbuT35IhwNlVbKjrfe0bn9dDwfpamg7Ik4
         bzzyrAxDr94ZBWu/OReX+lkxg7inTnIAjFkLhRE9n/dKBhOK0I5TqqFDg0M20iPOSq49
         PzOIjPvrMTAiRd6VRp9OJ5sJVbVYdHboUjiIgAojzZ1wWz/Tbp1FXMR/zbzq32BpgLu9
         /5tg==
X-Gm-Message-State: AOAM5307bzZGlIQ+plXQKR9DF1JUu3/axMO2HYQfH+DaePmkTJJUFC1D
        Y20tyrQew6Igx5BELvNPOamJIe0iHt+3Gw==
X-Google-Smtp-Source: ABdhPJy28Ad9cpXfDG1g1RqGqGCAew+A6JjbpRyuw73czF4qQUpbf5PdbeRqYSqtBenTj5qF1I03zQ==
X-Received: by 2002:a05:622a:552:b0:2e2:72c:a05b with SMTP id m18-20020a05622a055200b002e2072ca05bmr8239898qtx.409.1648818129891;
        Fri, 01 Apr 2022 06:02:09 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id x6-20020ac86b46000000b002e02be9c0easm1487460qts.69.2022.04.01.06.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 06:02:09 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id z33so394255ybh.5;
        Fri, 01 Apr 2022 06:02:09 -0700 (PDT)
X-Received: by 2002:a25:5b88:0:b0:63d:8530:d762 with SMTP id
 p130-20020a255b88000000b0063d8530d762mr517158ybb.546.1648818129335; Fri, 01
 Apr 2022 06:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com> <20220320123016.57991-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320123016.57991-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 15:01:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUso+a2UqMTZByGQryj+GvT4go4GB9EOM60D1Ue9oMi_A@mail.gmail.com>
Message-ID: <CAMuHMdUso+a2UqMTZByGQryj+GvT4go4GB9EOM60D1Ue9oMi_A@mail.gmail.com>
Subject: Re: [PATCH 2/6] mmc: renesas_sdhi: R-Car D3 also has no HS400
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Mar 21, 2022 at 11:50 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> It is not explicitly expressed in the docs, but the needed data strobe
> pin is indeed missing for D3. The BSP disables HS400 as well. This means
> a little refactoring to reuse an already existing setup.

You mean the DS signal?  That also doesn't exist on R-Car V3M, so
shouldn't of_r8a77970_compatible.quirks be set to &sdhi_quirks_nohs400,
too?

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
