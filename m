Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC7B66BCB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 12:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjAPLTr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 06:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjAPLTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 06:19:46 -0500
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803F01E9C6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:19:45 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id u20so3065761qvq.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRfQPtoq4/s84+Gp7UAtN8BjaEqzOR4seaSxuKKVZJg=;
        b=TMHEfKKpOFVeGukQfSf2trCxwSIYWNfOOr8X5pWI3q8QbAnvfq2eoDvSR1cRejInKM
         SLdv32tERIKxOjfJLcHDuCB2b9vXw8x8oU8y42Jlzrkb1cwtFzH+6/XXoK+j/ZqeAL2t
         A5a2YtFmv/Rm0Vbg5LPnXi+7wsCrnrFl9ZprYtoW3ktrWmZ0P8P0S0GcTRPu7niPYsue
         1AoHXdo8jpFuaY/lpzpKLmStjEu/xLYohTj3hBwVCWC0NPZ0q8jeeMdGlKE7U7QepLR4
         gCn3edYF5Rf42BV4m/egYi+L2Ti+4kLX72AW2dGIyj+pWx4Uf3w0Nh1if51rmemWSWUp
         M46g==
X-Gm-Message-State: AFqh2koZqnjRkO08mf7HBl7OQA0ymogjo2/ahTW2lxYKOFd1Ctyiwzs3
        cYYAWk7nsVIInT5ZPcKUcdVIc5q6xzf/cA==
X-Google-Smtp-Source: AMrXdXsBgzDO2a54ILzGKec3w2g43nZL2wF2d/xLkCMX2dkji4J1uyKwSib1n+1aPHYoSYg/rV8Cgg==
X-Received: by 2002:a05:6214:70b:b0:534:89ff:ae4f with SMTP id c11-20020a056214070b00b0053489ffae4fmr15515873qvz.12.1673867984489;
        Mon, 16 Jan 2023 03:19:44 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a280900b006fcaa1eab0esm18275393qkp.123.2023.01.16.03.19.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:19:44 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id e130so360871yba.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:19:44 -0800 (PST)
X-Received: by 2002:a25:5189:0:b0:7bf:d201:60cb with SMTP id
 f131-20020a255189000000b007bfd20160cbmr1921561ybb.365.1673867983928; Mon, 16
 Jan 2023 03:19:43 -0800 (PST)
MIME-Version: 1.0
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com> <87a62ni40z.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a62ni40z.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 12:19:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXH1jVcwxxLyYya6JoYFuPFjdSr-TEExfVZk00CPqnbnA@mail.gmail.com>
Message-ID: <CAMuHMdXH1jVcwxxLyYya6JoYFuPFjdSr-TEExfVZk00CPqnbnA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph
 Card2 dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Fri, Jan 13, 2023 at 3:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> ALSA SoC has many type of Generic Audio Card driver (Simple Audio Card,
> Audio Graph Card, Audio Graph Card2), and Renesas/Kuninori Morimoto want
> to test these.
>
> Generic Audio Card driver had been requested on ALSA SoC.
> It has many type of device connection method, and historically,
> requested connection support range of generic driver have been
> upgraded.
>
> Upgrading connection support range itself was possible on generic
> driver, but could not implemented, because we need to keep compatibility
> on Device-Tree. This is one of the reason why we have many type of
> Generic Audio Card driver.
>
> ULCB/KF is good board to test these.
> Kuninori has been testing these Generic Audio Card driver by using his
> local patch to switching drivers. But it is good idea to upstream these
> from information sharing point of view, because DT setting is complex.
> It can be good sample for user. This patch is one of them.
>
> From normal user point of view who don't need to test the driver,
> it should keep as-is, nothing changed.
>
> This patch adds "Audio Graph Card2" DT setting file for ULCB/KF,
> and switch to use it. We can switch to other Generic Audio Graph driver
> if ulcb.dtsi / ulcb-kf.dtsi were updated.
>
> Because it needs "switching driver", not "add extra feature",
> it doesn't use Device-Tree overlay.
>
> Link: https://lore.kernel.org/r/878rjapxg8.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
