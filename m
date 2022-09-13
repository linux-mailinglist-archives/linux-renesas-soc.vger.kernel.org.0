Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDF05B7912
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 20:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiIMSB5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 14:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiIMSA4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 14:00:56 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA891AB4EA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Sep 2022 10:02:38 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id c6so9651273qvn.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Sep 2022 10:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4qAJguX/YZ4kqi3CAcNmUhPkCPcv+TscE29QIe6GzJ8=;
        b=Hrf8eyXi0YoUIOaTUJ1Dp73Yr/t4T51KM80lg6kGrFmBcDxjMTVqlKvfsNVIEFLUcN
         m0K2bCBKjtOqwmvd3Yb8UpGCJ59Puh70WlByP1L1X32nQ0JFPFdGVyYKhXE+GmUFkNTH
         T/r9dKEhf2zfFJRL4Z72ygtX+6ouT2j1yhl4ZIl++vdYbob0zgZt56/6S+gA+Merz0DS
         p/Ih87PE04nLzVy1RLNQhjShd51ebOI3YWnsv1YAEb6oTupWL6H0OlhL+FxPmUX4NHZf
         AAWk3O+UEUf0gJvxkCpUCBvRltKLxuU0rBzqvn1NXfLIRCmFhtAqZkqu54qWvMCQi3OR
         g7eA==
X-Gm-Message-State: ACgBeo2OT3Tar2gTXan5n6TlvuxbTVpcTygV5qoyYVmPrL+YH/JNEDwZ
        t4SF9dhrNE2qnq+wN8HeMjmC7CjFrv19uniN
X-Google-Smtp-Source: AA6agR6xKX7Df9S9esxiKnlLROAIZitts4a+tfUgOqQ5IBAXQUds/Cl4Yna4eyWfyOeDSu+mq14jvA==
X-Received: by 2002:a0c:f84b:0:b0:4ac:9d85:2933 with SMTP id g11-20020a0cf84b000000b004ac9d852933mr13567881qvo.115.1663088556566;
        Tue, 13 Sep 2022 10:02:36 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id u29-20020a37ab1d000000b006cdf38dd3f2sm8883876qke.16.2022.09.13.10.02.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 10:02:36 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id f131so18741559ybf.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Sep 2022 10:02:36 -0700 (PDT)
X-Received: by 2002:a25:69c6:0:b0:6af:6f10:9d50 with SMTP id
 e189-20020a2569c6000000b006af6f109d50mr6638398ybc.543.1663088556148; Tue, 13
 Sep 2022 10:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <87k06858oe.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k06858oe.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Sep 2022 18:02:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSnaKGVv3RufYYcERRp148do1pcuTYuNipLcJAp9aeUg@mail.gmail.com>
Message-ID: <CAMuHMdVSnaKGVv3RufYYcERRp148do1pcuTYuNipLcJAp9aeUg@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: dts: renesas: white-hawk: add missing bootargs
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
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

Hi Morimoto-san,

On Tue, Sep 13, 2022 at 3:07 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing bootargs for V4H White Hawk board.
>
> One note is that current White Hawk board doesn't have Ethernet
> support yet, but this patch adds standard settings for it, too.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts

Do you mind if I would apply your patch to r8a779g0-white-hawk-cpu.dtsi
instead?

Cfr. "[PATCH 13/14] arm64: dts: renesas: white-hawk: Move aliases and chosen"
https://lore.kernel.org/linux-renesas-soc/b03b74f4b5ee3c3e828e753beb334ec43162c132.1662715538.git.geert+renesas@glider.be
Probably I should send a similar patch for Spider, too.

> @@ -17,6 +17,7 @@ aliases {
>         };
>
>         chosen {
> +               bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
>                 stdout-path = "serial0:921600n8";
>         };
>  };

Reviewed-by: by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
