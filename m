Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC976670D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 12:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbjALLZV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 06:25:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjALLYK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 06:24:10 -0500
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D0E264
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:14:48 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id t7so12525662qvv.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkJBOJ6yJ8fHD5fEsGpARR9n0uXuIFMn7sPmEjEINsE=;
        b=ljhEKCId2y3s8dz3YhYLIY/fWvhnCvJjh0NHBzjzwoJsFeFQNx5V8nJirNeP9eRA4E
         xYJoKo6AeTjapLOY1m7NmH5e8jOSC2ahUO73U+QHhq9r7IF4vJMVNoTC4Qf8GNjw38Ln
         hMIbdGICshcFO77zjEYVSNrd9Bd8bW7H+kCcsAr1MCjVTSuW9IKSb2K6DqWG2riWPrWs
         0MrTsXKBfM+6mwfgSj4wcC14Nf9gXakuTWB+H9gS8y3hD317DG37niQGfmC4zxmZG5n5
         FJUegpQDD6bY5mfVVuwymq+A7K0ZS2n8Fp5V5lX7AKmowx+2o4ycA4Opbx9L0wSq3jjL
         JqRA==
X-Gm-Message-State: AFqh2koXYwigVexAOAghR2EyauVJBj0q5/5FEz1yaxSDlWqqvHOBHMg4
        wfPTQkqjXKpjectFyYKIVRX0z0D28e1Oxw==
X-Google-Smtp-Source: AMrXdXtRVHGcgW6CeeEoE4z05XdQ/+6x4U6UVMZ9Trf+FT1bTqjXOKyTBTCDxVzsoP+vo0h+vSu2VQ==
X-Received: by 2002:a05:6214:1fc9:b0:534:24d1:62e9 with SMTP id jh9-20020a0562141fc900b0053424d162e9mr7801292qvb.25.1673522087658;
        Thu, 12 Jan 2023 03:14:47 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id l23-20020a37f917000000b006fc2b672950sm10599349qkj.37.2023.01.12.03.14.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 03:14:47 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-4c15c4fc8ccso234519687b3.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:14:47 -0800 (PST)
X-Received: by 2002:a81:ac18:0:b0:475:f3f5:c6c with SMTP id
 k24-20020a81ac18000000b00475f3f50c6cmr1936575ywh.358.1673522087076; Thu, 12
 Jan 2023 03:14:47 -0800 (PST)
MIME-Version: 1.0
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com> <878rjapxg8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878rjapxg8.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Jan 2023 12:14:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUO5NwiUd31ff8WHgW54RVJOma5qeSDkygGTT4fACQu1A@mail.gmail.com>
Message-ID: <CAMuHMdUO5NwiUd31ff8WHgW54RVJOma5qeSDkygGTT4fACQu1A@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Wed, Dec 14, 2022 at 2:48 AM Kuninori Morimoto
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
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree for ULCB + Audio Graph Card2
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/*
> + *     (A) CPU0 ------ ak4613
> + *     (B) CPU1 ------ HDMI
> + *
> + *     (A) aplay   -D plughw:0,0 xxx.wav
> + *     (B) aplay   -D plughw:0,1 xxx.wav
> + *
> + *     (A) arecord -D plughw:0,0 xxx.wav

I think you should remove the existing aplay/arecord commands from
ulcb.dtsi (and ulcb-kf.dtsi).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
