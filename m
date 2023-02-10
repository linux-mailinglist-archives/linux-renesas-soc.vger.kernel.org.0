Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05822691F43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 13:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbjBJMrP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 07:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbjBJMrO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 07:47:14 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330503CE3C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:47:14 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id ch10so4380711qtb.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2Vp4HjiS3H8O7F9PA9E5TvI5pi+xfaNzgD0qjmIqBw=;
        b=nEnbNnhOI7cO5ProP3moE5rgXyGAUFWV5rMvowhfK8wu/4iv1Qwj6tm9nMRkPfqoEl
         dmr1DHY0f0kaCqekUjF5lc7foDjDtayjIjaAkZajxOGs5RBIMhRd58+pi1QCGqNc2Vfz
         B1Ibt4NIcpdq7nDFfB0rhCtUBhnLu+UhBEYtByEy8gwEKNEz30y/z4t48F+rWOEOMFJV
         hAQV5X31ncr242yS2jBbj8hHAOwLi/0c+7lg91GRWutZO435JwE3qxby3DEfMs/O+9g4
         VbEpwxXWMNMTE4m7hxKe1MB0yxecuPoGEXr+4nyDzFJgTj0hKBWgD9WUfz8CiFY+X8rA
         i2BA==
X-Gm-Message-State: AO0yUKXCXFiO7Iozc5qqkej7zg1b7INttj3TZ9RMc38OL6ieU5aBzjX0
        Xmvfkn3nmtwqP38EmSLltriFmRWzWKCg1AuE
X-Google-Smtp-Source: AK7set+d1ao6tNkvKmOT3PlB3XnunYuAgP2MBr9fY4y9mNVjhtFToptCNKciX9hcUibbb0cNzHkoww==
X-Received: by 2002:ac8:7f4c:0:b0:3a5:ff6e:d43e with SMTP id g12-20020ac87f4c000000b003a5ff6ed43emr29493078qtk.2.1676033233147;
        Fri, 10 Feb 2023 04:47:13 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id i23-20020ac87657000000b003b86b962030sm3278304qtr.72.2023.02.10.04.47.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:47:12 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5258f66721bso66434257b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:47:12 -0800 (PST)
X-Received: by 2002:a0d:e9c1:0:b0:514:a90f:10ea with SMTP id
 s184-20020a0de9c1000000b00514a90f10eamr1444217ywe.316.1676033232508; Fri, 10
 Feb 2023 04:47:12 -0800 (PST)
MIME-Version: 1.0
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com> <87bkmcang2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bkmcang2.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Feb 2023 13:46:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUpVTnC7K-8A4MRE_2Xtr9mbZAkGa5ax7X6kQrvzkTKAw@mail.gmail.com>
Message-ID: <CAMuHMdUpVTnC7K-8A4MRE_2Xtr9mbZAkGa5ax7X6kQrvzkTKAw@mail.gmail.com>
Subject: Re: [PATCH 2/9] pinctrl: renesas: r8a779g0: Add Audio SSI support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Thu, Feb 2, 2023 at 2:03 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Linh Phung <linh.phung.jy@renesas.com>
>
> This patch adds Audio SSI pins, groups, and functions
> to r8a779g0 SoC.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v1 is still valid, i.e. will queue in renesas-pinctrl-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
