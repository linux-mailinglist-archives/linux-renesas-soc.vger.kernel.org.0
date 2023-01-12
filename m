Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0AF6670DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 12:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjALL2R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 06:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjALL1q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 06:27:46 -0500
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD56165B4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:19:09 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id m12so10458880qvt.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2W2Q87POe51AaF3kmFRtt/kLIYd8lo3Sw3m1ZyoMfc=;
        b=UfN0rNBV1ufQr5HmtekXbVIcG/L61xAAd4/NjIikHEPC97OckCkNNK1zyBIdQkXeTK
         aA7eYcf7qyFqFnouUL7wGbue05iZRNx3G3BvWGxlLPPaFKlEsGzcvmoY9E1TSFSJ9wka
         OHNI2Rc8+qd0PMmdTvdtYinHB7Vd0r8manBPMMw4QsLI5WGiL0FUqTdNOUXgWkjMA7T+
         3CMub0hsnzy56i8FUWAx1wt146i5y6QS3jckn7kJHgBCa/9BQc0rmUKAdeZZTG0P+xbV
         lesUjlYpI8VDxTL+twtsX79Afgkh/tm5BkWPGxt29lvfGCloWQx3CScGFyVGM/DrQTRv
         Ny/Q==
X-Gm-Message-State: AFqh2kp5imHx7OVoevTsN83rS3aSLP3K81IX2YuK9DM3nNo1YTcdLS0z
        o7akrCqUBIZfmdWDltPhd3Whlo5Syt+YHQ==
X-Google-Smtp-Source: AMrXdXtFjV3nWmiP9jwc9F5h9Sr6BAYv6Xf9L/hmvDTtL4w+nYlwa1NMvMxjhxmW5cGRVTaLY70fTg==
X-Received: by 2002:ad4:580d:0:b0:4c6:99f3:cdd3 with SMTP id dd13-20020ad4580d000000b004c699f3cdd3mr117173860qvb.41.1673522348559;
        Thu, 12 Jan 2023 03:19:08 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id v7-20020a05620a440700b006fb112f512csm10733414qkp.74.2023.01.12.03.19.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 03:19:08 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-4d59d518505so65556827b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:19:08 -0800 (PST)
X-Received: by 2002:a05:690c:d8c:b0:4a2:63c5:6c59 with SMTP id
 da12-20020a05690c0d8c00b004a263c56c59mr4179045ywb.384.1673522347921; Thu, 12
 Jan 2023 03:19:07 -0800 (PST)
MIME-Version: 1.0
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com> <877cyupxg2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877cyupxg2.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Jan 2023 12:18:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXoWuxYsy8a-We8hN3Uf6wKzTDwbt7ggOse3=EbMyTvmA@mail.gmail.com>
Message-ID: <CAMuHMdXoWuxYsy8a-We8hN3Uf6wKzTDwbt7ggOse3=EbMyTvmA@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi
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
> This patch adds "Simle Audio Card" DT setting file for ULCB/KF.
> We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.
>
> Because it needs "switching driver", not "add extra feature",
> it doesn't use Device-Tree overlay.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree for ULCB + Kingfisher + Simple Audio Card
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/*
> + *     (A) CPU0 ------ ak4613
> + *     (B) CPU1 ------ HDMI
> + *     (C) CPU2 ------ PCM3168A-p
> + *     (D) CPU3 ------ PCM3168A-c
> + *
> + *     (A) aplay   -D plughw:0,0 xxx.wav
> + *     (B) aplay   -D plughw:0,1 xxx.wav
> + *     (C) aplay   -D plughw:0,2 xxx.wav
> + *
> + *     (A) arecord -D plughw:0,0 xxx.wav
> + *     (D) arecord -D plughw:0,3 xxx.wav
> + */
> +
> +&sound_card {
> +       /* dai-link@0/1 are defined in ulcb.dtsi */
> +
> +       /*
> +        * (C) CPU2 <-> PCM3168A-p

"->", as this is used for playback only (everywhere, in all patches).

> +&rcar_sound {
> +
> +       /* dai0-1 are defined in ulcb.dtsi */

I think this comment belongs under "rcar_sound,dai" below.

> +
> +       rcar_sound,dai {
> +               /*
> +                * (C) CPU2 <-> PCM3168A-p
> +                */
> +               dai2 {
> +                       playback = <&ssi3>;
> +               };
> +               /*
> +                * (D) CPU3 <-> PCM3168A-c
> +                */
> +               dai3 {
> +                       capture = <&ssi4>;
> +               };
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
