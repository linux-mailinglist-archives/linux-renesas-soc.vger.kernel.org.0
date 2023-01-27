Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9E767E6F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 14:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjA0Nmn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 08:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjA0Nmm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 08:42:42 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85BB1DB85
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 05:42:38 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id e8so3983811qts.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 05:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvXUpZp6IFw2CNL3Gt5PGX/k554y8hPf4+Scdp2Rf9g=;
        b=oTBUdXxFJ81QO/Cz1AsLFcyrMLgPQ1/EgMh2rfTWz6Q1auNej963filKb7mhr0VSNC
         k6K7ZtPcJ0FfEXOIcYQ0OcqPEcSi4+8PcCLvF5n9IBiu46Y9W8qhwHaJJa4LvBezOYAZ
         nYcb6/x0U1CSf/ns8w2xqd550MV4eKZwDx/rIoMbUWp/wxXoCkpUCi3iJDtm2NS+hPd+
         S1Soi2r0qCfV72aHOFzoRfnaJaIG7gsi0vTOW7FUicdAVaIjSCdrKQ6X+iq8tQ40mKEg
         7lxXTCnx132HME2UlwZRpVzN+cl3f8jgjowtIPtPoC/AvxqZY7xBaQEVmAPcS2tbMi8z
         tYKg==
X-Gm-Message-State: AFqh2kpBL0lzdFRmSputlHVW1LjnOaD/O1L5Cq5drevH3wlNgYAhf9Bz
        m/inNR7Tg96RAPo8hvAt3rpGBb3rX48EnQ==
X-Google-Smtp-Source: AMrXdXv+JE7JFF9mPpX2Jm0Odg9nCVE4esLFeewrJV9rTSOIXJO1Anops1sZbfc7zPxg8628gl15Pg==
X-Received: by 2002:a05:622a:5917:b0:3a6:8b3a:6450 with SMTP id ga23-20020a05622a591700b003a68b3a6450mr65472986qtb.54.1674826957767;
        Fri, 27 Jan 2023 05:42:37 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id c10-20020ac81e8a000000b003b63187dbe1sm1187901qtm.27.2023.01.27.05.42.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:42:37 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-4fd37a1551cso66802957b3.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 05:42:37 -0800 (PST)
X-Received: by 2002:a0d:f281:0:b0:508:2f2c:8e5f with SMTP id
 b123-20020a0df281000000b005082f2c8e5fmr829701ywf.384.1674826956972; Fri, 27
 Jan 2023 05:42:36 -0800 (PST)
MIME-Version: 1.0
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com> <87v8kut4uw.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v8kut4uw.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Jan 2023 14:42:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUbVwPeYFDttHfTyP7SAwsfqP+HuZ9sdz-k4x18RNMjg@mail.gmail.com>
Message-ID: <CAMuHMdWUbVwPeYFDttHfTyP7SAwsfqP+HuZ9sdz-k4x18RNMjg@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: renesas: r8a779g0: Add Audio SSI support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 26, 2023 at 3:19 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Linh Phung <linh.phung.jy@renesas.com>
>
> This patch adds Audio SSI pins, groups, and functions
> to r8a779g0 SoC.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
