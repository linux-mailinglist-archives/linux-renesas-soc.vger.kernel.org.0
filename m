Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDD1694D0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 17:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjBMQj0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 11:39:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjBMQjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 11:39:25 -0500
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90891449A;
        Mon, 13 Feb 2023 08:39:24 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id 5so14358145qtp.9;
        Mon, 13 Feb 2023 08:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2lTNmbH3filAz27V/QGB2vUb8o3zAATJHl4DQTSpJ0=;
        b=qQ8iAKD9A0/O7fEHdM+TTvRunb+FSUAYs5WOCx0+i4gAE2kCP/K+7JLiaqBv9ery2t
         yoeyc6rkd/ElzKg5923CpPcf77FXq3cvQR1yd26CS7bH/RwaBm2qvYGyv3gsaJwoVjYm
         hWsOvtZL3QANYI10ob2QQymZMEwnE4Y32g4l0a5kfpv35JL5LYVNVA04WS3P9OEkivhQ
         MKASb1vsqEdLQ+e3wVcP0LjcHCGi1y1GRHIxstAPfqExq/FXyGkkDO+iz1SrhKNJbpJM
         WmP7ApPji6whsEvKwA4B8ysAAUuPbSsh4/3a56samG4wCBonfapxEXjbG3MEbeMUjwbM
         uckw==
X-Gm-Message-State: AO0yUKX/3cH7yxnSbAyNX8RpJ4RWqGU+aazN7xOKE17j3EW3iDpUMIh/
        V8o/Swkxi/GF1+wl4NXHsEWPnQLkQSxUjA==
X-Google-Smtp-Source: AK7set+7fjML8Cv7OvNlEUkG6jTlo97wP49QH8NGXACZscG0ex7yhyTyN1d4xIbplw8+gxL67U5OYw==
X-Received: by 2002:a05:622a:4d2:b0:3ba:13dd:f253 with SMTP id q18-20020a05622a04d200b003ba13ddf253mr45580625qtx.7.1676306363665;
        Mon, 13 Feb 2023 08:39:23 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id e65-20020a378244000000b0072ed644bb0dsm9932435qkd.97.2023.02.13.08.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 08:39:23 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-4c24993965eso170349987b3.12;
        Mon, 13 Feb 2023 08:39:23 -0800 (PST)
X-Received: by 2002:a0d:e692:0:b0:52e:c6d9:d760 with SMTP id
 p140-20020a0de692000000b0052ec6d9d760mr1626020ywe.243.1676306363056; Mon, 13
 Feb 2023 08:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20230211143655.3809756-1-niklas.soderlund+renesas@ragnatech.se> <20230211143655.3809756-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211143655.3809756-4-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Feb 2023 17:39:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcPYVomENJj0XvT-TGEWjBiC1=acbZbnH4akFyOOG4Ug@mail.gmail.com>
Message-ID: <CAMuHMdUcPYVomENJj0XvT-TGEWjBiC1=acbZbnH4akFyOOG4Ug@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r8a779g0: Add VIN clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Feb 11, 2023 at 3:37 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the VIN module clocks, which are used by the VIN modules on the
> Renesas R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
