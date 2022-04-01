Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A094EED14
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 14:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345868AbiDAM2X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 08:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345863AbiDAM2V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 08:28:21 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5A7185957
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Apr 2022 05:26:32 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id v13so1945078qkv.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Apr 2022 05:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghH0jRKeMzAFBuVxrsRfXD9uE52ZmwWgo9z7QphjAZA=;
        b=7LE/bAB2AOIZGTWetLEP8zxc+dZr8ZYUnf3Xc6kr/tsHNy0ooAF8v29Cx91E4iB5Tf
         T190HhEdjy5pIyFi7eHQ1vwx0ugKXfjh22rImSsyk9iVz1MDP/UQmiko2FEdYYvS3gLI
         10LcyRGf5TKmrCZXc9oQQLhaE3F5LRRvQY74vDN4OQOl3cD+DR5TcpDN6tZVoZrhl8vk
         hRRwIulO/Su07jPHOD27tBljqyqtDgW1W+K1JdPEJANu3ieiF7qCKVWTpa4itvrXDXP7
         d7WJpkf3deqICXxIeY8E2f8Nf37JonpzVea7VmspeEn/j6L/LPO6cICukqnrpS1RXTbp
         8s1g==
X-Gm-Message-State: AOAM533v6jlkTSMuGzuV7xIXuWD0Sp7EP3eFt7vnhTmiAIQ2AtwpWRwz
        pjv2d4AuCBp64mglAFJgols8Hk15bWcRIA==
X-Google-Smtp-Source: ABdhPJzbBszy9vjJ5ArKcVBgzua3JXEngRRGUxi8WW6dZD8dSqn2beuWDCqIdP482RNXUL8Sidj0ug==
X-Received: by 2002:a05:620a:4048:b0:67d:7410:d6c7 with SMTP id i8-20020a05620a404800b0067d7410d6c7mr6118818qko.524.1648815991065;
        Fri, 01 Apr 2022 05:26:31 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id t72-20020a37464b000000b0067ec1c9dcaesm1222483qka.44.2022.04.01.05.26.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 05:26:30 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2e5e9025c20so30839837b3.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Apr 2022 05:26:30 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr9503184ywi.449.1648815990345; Fri, 01
 Apr 2022 05:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220319223306.60782-1-wsa+renesas@sang-engineering.com> <20220319223306.60782-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220319223306.60782-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 14:26:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUc_MUXFPmkEzHaTGG5oyJNS2QROpe-RdgTpfRcOstU6Q@mail.gmail.com>
Message-ID: <CAMuHMdUc_MUXFPmkEzHaTGG5oyJNS2QROpe-RdgTpfRcOstU6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77961: Add CAN-FD node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,


Thanks for your patch!

On Sun, Mar 20, 2022 at 11:48 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> It was forgotten when adding the other CAN nodes, add it now.
>
> Fixes: 92c406ed0a7f ("arm64: dts: renesas: r8a77961: Add CAN nodes")

I don't think it was forgotten, and think this is not really a fix:
CAN and CAN-FD are two different devices, with different drivers.

> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index ac9b587f6fc5..87bb903954ed 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -1222,6 +1222,31 @@ can1: can@e6c38000 {
>                         status = "disabled";
>                 };
>
> +               canfd: can@e66c0000 {
> +                       compatible = "renesas,r8a77961-canfd",

Can you please send a patch to augment the DT bindings?

> +                                    "renesas,rcar-gen3-canfd";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19, with the Fixes tag removed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
