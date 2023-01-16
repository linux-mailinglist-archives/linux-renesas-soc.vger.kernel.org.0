Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04EF066BCBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 12:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjAPLUr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 06:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjAPLUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 06:20:43 -0500
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FA41E9FB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:20:42 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id d13so19330931qvj.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:20:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHSv5ZLWBf6WM+wa3mBJopSTv3Ja1VCVWywfq9yQBbk=;
        b=dAkfIK1Vc3KVEFEMvWwy5uiABQae0cwkcB1BNoGZGbRvjU6BDJo4YClQ76RwDHw48R
         6GbQNc9exEaToH2WugdLQOTVeacQDNqVA+V/yPZlQHVRvNOnykDhOa34VBQmfzsOfabd
         X5ROgt+uDGln3UAQuqZsfnkxP8qODS1IRYEYqaNq3VmnSyX2ehBAF7Fn7iueMvMlvpSq
         TDZFSg35At8UJ9R1z0s23SnsBl1AHDieBYjlVp8Ss3arlPRYq3BWME1VG1vAGLE3vpvn
         VzQveNJAIb+sEbUoCxC62PG89XKXETmXjdSyOiYggi1f5qPP7gm0Ls06KeJ6MRMP1RSn
         wqXA==
X-Gm-Message-State: AFqh2kpjG7FMECMkuQuAIoBmoyTZpvafRHSGCN5m/iLIsN4YJHyyWZJw
        GDxTthlFZbLd+IqtcbXf/HLOkqDykKupfg==
X-Google-Smtp-Source: AMrXdXvP04yMxjdXy3i6f7lUoK/izILM8YH9UV6cJ6aQS0y/FGJNWK3W8bWvnstVfP4Nkyf9KsJYDA==
X-Received: by 2002:a05:6214:3285:b0:534:2fa3:14a6 with SMTP id mu5-20020a056214328500b005342fa314a6mr23941551qvb.10.1673868041405;
        Mon, 16 Jan 2023 03:20:41 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id d6-20020a05620a240600b006fc2f74ad12sm18207968qkn.92.2023.01.16.03.20.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:20:41 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id l139so29851118ybl.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:20:40 -0800 (PST)
X-Received: by 2002:a5b:541:0:b0:7d5:620e:b60f with SMTP id
 r1-20020a5b0541000000b007d5620eb60fmr818306ybp.89.1673868040715; Mon, 16 Jan
 2023 03:20:40 -0800 (PST)
MIME-Version: 1.0
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com> <877cxri40q.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877cxri40q.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 12:20:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXJSpAQV7R1x_em1SUwP7G8tdR9Y7Ki4TrC284aqkh2w@mail.gmail.com>
Message-ID: <CAMuHMdWXJSpAQV7R1x_em1SUwP7G8tdR9Y7Ki4TrC284aqkh2w@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph
 Card2 dtsi MIX + TDM Split dtsi
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
> This patch adds "Audio Graph Card2 + MIXer + TDM Split" DT setting file
> for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
> We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.
>
> Because it needs "switching driver", not "add extra feature",
> it doesn't use Device-Tree overlay.
>
> Link: https://lore.kernel.org/r/875yeepxfw.wl-kuninori.morimoto.gx@renesas.com
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
