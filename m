Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC2A4EBE72
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 12:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244131AbiC3KOl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 06:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235908AbiC3KOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 06:14:41 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39314160681
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Mar 2022 03:12:57 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id a11so17590399qtb.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Mar 2022 03:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3XIW50U/dDwGQ9PCNoaDIA9CTJkKZho0mhBjCoVlB60=;
        b=ZL1dlQ9Ggc0fUddG3Sm2/lkJ3DGow36SRY9sGMBfPwYkYR2mIVIE9w1gAQBYqSs5xX
         YqupsUR5UJkAsuhbD3ZDb39FNro7GjPbA7+DVPfv8lMv8mmp7AMF1ONV160jvsfTc7BC
         Wlf4JHTXYHC/YOoyL2pTLCAdt2uHsANX8XYs+76w2WAdEwN6jU2AUKJEbeLxHyXDbycO
         eRxhI/DopHqkyy3uD6+NIAIw8zCTcHNdhTa3Nn9gUaVkJIrDT1XNbg5aLjvGc+vpeoKk
         a6Bei9UFKn5tu4bwAQFutdm2faIxm1bhRIqPttGZ3q9wr81YOgPDVADAka4ol563/qpx
         WUiQ==
X-Gm-Message-State: AOAM530m/E34lwrI1rLt/4L+8QWu9E3WdtWGwdgqu56U9g08dVK2srUw
        ROw/KTI9TxWfGf8cIRLWB/JXc8LdMvQnwQ==
X-Google-Smtp-Source: ABdhPJzOFFprZVP1bg+TEqs6z0NAUTjnQrlZ9wL5xS/ZankddTvJ76FVVa8cxcOGay6KBozep/1HUg==
X-Received: by 2002:a05:622a:1a28:b0:2e1:102f:915a with SMTP id f40-20020a05622a1a2800b002e1102f915amr31969794qtb.306.1648635176203;
        Wed, 30 Mar 2022 03:12:56 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 78-20020a370551000000b0067e3a58c090sm10625013qkf.82.2022.03.30.03.12.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 03:12:56 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2e5e9025c20so212899117b3.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Mar 2022 03:12:55 -0700 (PDT)
X-Received: by 2002:a05:6902:101:b0:633:ccde:cfca with SMTP id
 o1-20020a056902010100b00633ccdecfcamr30636456ybh.207.1648635175610; Wed, 30
 Mar 2022 03:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220319223306.60782-1-wsa+renesas@sang-engineering.com> <20220319223306.60782-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220319223306.60782-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Mar 2022 12:12:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTDZ+_4in0x6vJViw2d-gjWfXSVyA0cV=3AZZ3kXpAEw@mail.gmail.com>
Message-ID: <CAMuHMdVTDZ+_4in0x6vJViw2d-gjWfXSVyA0cV=3AZZ3kXpAEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77961: Add i2c aliases
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
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

On Mon, Mar 21, 2022 at 11:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>
> Keep aligned with other Gen3 SoCs and sort the I2C busses.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Do we really need them?
Aliases are meant to refer to labels on physical ports on boards,
so even if these labels would be present, they do not belong to
.dtsi files.
Unless you have a good reason to keep them, I'd rather remove them
everywhere.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
