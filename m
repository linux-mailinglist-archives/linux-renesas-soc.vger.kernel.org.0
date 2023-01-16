Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E2B66BCB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 12:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjAPLTq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 06:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjAPLTN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 06:19:13 -0500
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB83A1A4AA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:19:11 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id h10so19338915qvq.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWMsbvx6DsyXIfpnaH6iG9gl7DPpCHwCtjmng/1n5Iw=;
        b=AFJEKuiyFjFE4UCL44AfRFl7NbUBqLQs8L8SpUQeed+vHx52Ajl1OBpbOhGOD6gS9G
         6E2pNmbpT5GmvqIQZv7IArzGULAbcbSiAKP9hh0kC9ImMnkm07S3Y6if3m0SwY9JwFDw
         KrXLbCk9rOZHF2sWvnTTgYyDus2FBrSyOqmPz812Ev/4D2j9KX+MpZA6Rxv6XLFAVexm
         PTzsNA6sK/R5sDFyIPbnS4Cxs6l8e7LuYRTHRD9ZuZvVc9qgzPJ+ozuL5LRZ2wDVyNpN
         L/koDn3qoVKEck/Q29UF+56nuWgp2Skv7u08Y1DTni8HYN4kGB8we7/r6uiCTchpGuNh
         uLjQ==
X-Gm-Message-State: AFqh2koVb/fHQP/S6s1kDYxPdEE1UbohyyiJqMuwF4t1hR33ZWkpJwn3
        ieRwm8df5JqS4AMLHzGuKF8uBykYj9yx6g==
X-Google-Smtp-Source: AMrXdXvLgL+69gWjSE8Zvzw4Z8NhxjKz2nWIU1q8LSxn00cHb/nkJZN5DWpQ78rfz5bGIlWLUyU+sA==
X-Received: by 2002:a0c:d692:0:b0:534:8ba9:4fd4 with SMTP id k18-20020a0cd692000000b005348ba94fd4mr14611851qvi.0.1673867950720;
        Mon, 16 Jan 2023 03:19:10 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id d6-20020a37b406000000b007049f19c736sm17698204qkf.7.2023.01.16.03.19.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:19:10 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id d62so13720488ybh.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:19:10 -0800 (PST)
X-Received: by 2002:a25:d84e:0:b0:7b4:6a33:d89f with SMTP id
 p75-20020a25d84e000000b007b46a33d89fmr2933086ybg.543.1673867950365; Mon, 16
 Jan 2023 03:19:10 -0800 (PST)
MIME-Version: 1.0
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com> <87bkn3i414.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bkn3i414.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 12:18:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVff8vU9yUVM3z3Dgjc10rA82cG-kEe=6n0P9FZZ+idKg@mail.gmail.com>
Message-ID: <CAMuHMdVff8vU9yUVM3z3Dgjc10rA82cG-kEe=6n0P9FZZ+idKg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph
 Card dtsi
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
> This patch adds "Audio Graph Card" DT setting file for ULCB/KF.
> We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.
>
> Because it needs "switching driver", not "add extra feature",
> it doesn't use Device-Tree overlay.
>
> Link: https://lore.kernel.org/r/87a63qpxge.wl-kuninori.morimoto.gx@renesas.com
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
