Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E196B66BCC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 12:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjAPLVZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 06:21:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjAPLVW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 06:21:22 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD791DB8B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:21:15 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id h21so24180642qta.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnExC6PfPrF8QvLYqntsqio9r/Zj4g8zJ3fhJMlISmA=;
        b=0V/ZdVEhsRRBUKS24EPuUiW/f4xcqEKvJrDjkk/pkqbE9qqurzb/25L3WFTEA93++H
         0S98ecNtBUc5qiYphwcf6ZNTDsSafABXfbAXvzr105kuikQNXDfn8cj4e39H8zwm4IYz
         Db5kGVp1iD/vYuyik8yNi1Xg7bwuf3cmjyu1oIe7D4ImVQnoXenafKketv5mXMpMWNbL
         AGw3qt7m/xv5YOIKCI0U5qkZBzjS+4Sc5UsK+lq2lLK0YxlMS8yCkjNuP9XZIvFmX503
         0D/vbN/iURiaP74MBBY/H0xHFEGRivu0RVsbeeGjQ2Pui4qRvdpFTeX259aOXVufQ6XL
         1d0w==
X-Gm-Message-State: AFqh2kosb1aesTWhjAdMYBXkQ2BpsXC2NUbUE303gpoRjOzr2g83OYTp
        AAize9Ikdnnc1MThO/vct4JUR0Q53S9HYQ==
X-Google-Smtp-Source: AMrXdXsT+eFDaJQUWXRjPN/d1aQti9PQuoy+3giKcv2qmA71fp35aDfcMnRjmLcy79zSkXWOgFheHA==
X-Received: by 2002:ac8:7358:0:b0:3b6:355b:f8ad with SMTP id q24-20020ac87358000000b003b6355bf8admr1850271qtp.25.1673868074716;
        Mon, 16 Jan 2023 03:21:14 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id d6-20020a37b406000000b007049f19c736sm17700831qkf.7.2023.01.16.03.21.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:21:14 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 203so29856684yby.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:21:14 -0800 (PST)
X-Received: by 2002:a25:d84e:0:b0:7b4:6a33:d89f with SMTP id
 p75-20020a25d84e000000b007b46a33d89fmr2933589ybg.543.1673868074197; Mon, 16
 Jan 2023 03:21:14 -0800 (PST)
MIME-Version: 1.0
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com> <874jsvi40e.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874jsvi40e.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 12:21:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXw29YdVxAkW45VD_jFUqCQeTZ6zTOePNDzus+qq9BW7Q@mail.gmail.com>
Message-ID: <CAMuHMdXw29YdVxAkW45VD_jFUqCQeTZ6zTOePNDzus+qq9BW7Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: add ulcb{-kf} Simple Audio
 Card MIX + TDM Split dtsi
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
> This patch adds "Simle Audio Card + MIXer + TDM Split" DT setting file
> for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
> We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.
>
> Because it needs "switching driver", not "add extra feature",
> it doesn't use Device-Tree overlay.
>
> Link: https://lore.kernel.org/r/87359ipxfj.wl-kuninori.morimoto.gx@renesas.com
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
