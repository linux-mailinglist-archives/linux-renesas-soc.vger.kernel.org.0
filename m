Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A613F691F41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 13:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjBJMqU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 07:46:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbjBJMqT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 07:46:19 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5486CC65
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:46:18 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id g8so5455214qtq.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43Gc372fWMl6nuDXEwFRB1KG3iHD/fB+3hPl41PCVpU=;
        b=WTS8Svum4Sw7MfA0tYvs8OnKpkHbmQXGPpvwt41Ebh9NlPw13Nbmf2dF30Dj7UqG5s
         TWBH5nF1qHs5FRRxFzE0ZEK2YWjEDiK7cd7lrE1JcZFyLFhcrWwcem/gnQQrFhZYTxPn
         ptIE4scMe6+PL0L1A/Lp49yeP+sUlPia9nKCfLMvwf74zn0ASc/0a5oRksQinjph/ZsG
         W0QXN1YwGOwbpICdUTNNOYcdTXKoeiwV9ghJ35QDPxu7UhGF8/nSNwgLp/H+KIx9PCeT
         wdXGEIgi7/gcgqS/9fuskizIrr2mXjBVyvv0Qdl+3DoHd1Fjvoholl+Kxq++R0XFpTh+
         qEWw==
X-Gm-Message-State: AO0yUKWIzIBwjJpAeLCdhXyaxEZy1pUZIr+Nztp/PWw/nMN+Zk3+mydl
        szRlKGmLLS/33SRwT7daQ5Gmli+caxSxZ9dt
X-Google-Smtp-Source: AK7set+q4JS6h0oSQoybP8fRLL4/e7qFLS27ts6by6GjFA7nNEGlLv7L+Z1s6v9SBEzBapfQ7eBFAA==
X-Received: by 2002:a05:622a:1393:b0:3b6:30b6:b894 with SMTP id o19-20020a05622a139300b003b630b6b894mr23002316qtk.20.1676033177546;
        Fri, 10 Feb 2023 04:46:17 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id y16-20020ac85f50000000b003ba1ccba523sm3302991qta.93.2023.02.10.04.46.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:46:17 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-52ec329dc01so46561907b3.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:46:17 -0800 (PST)
X-Received: by 2002:a0d:db96:0:b0:52e:c7a1:7439 with SMTP id
 d144-20020a0ddb96000000b0052ec7a17439mr343106ywe.384.1676033176962; Fri, 10
 Feb 2023 04:46:16 -0800 (PST)
MIME-Version: 1.0
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com> <87cz6sanga.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cz6sanga.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Feb 2023 13:46:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVF=S8zmSPAwt8_Hu3+0WS4=UihL7aiwtMg3yvAGPQGow@mail.gmail.com>
Message-ID: <CAMuHMdVF=S8zmSPAwt8_Hu3+0WS4=UihL7aiwtMg3yvAGPQGow@mail.gmail.com>
Subject: Re: [PATCH 1/9] pinctrl: renesas: r8a779g0: Add Audio Clock support
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
> This patch adds Audio Clock pins, groups, and functions
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
