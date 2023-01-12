Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A22E6670C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 12:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjALLWX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 06:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbjALLVq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 06:21:46 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D953555657
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:12:46 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id e22so3693061qts.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMPOkKZstQblIw3mpVZAOfd3exSdyooa5y33KQ+5qFY=;
        b=V+GPHsy5YLn49EeBDfzamfLOJ5aaR3kPFYGklB4eg15yw96/JC7O0FFCqLvfUd8E0u
         Pp+JDtoujihn3usPxIykxCxVGc5LUMHaNpfvNV57m+HOXwDiHkoMebUdOLRnwJdRpbnx
         fyn38HN2QZAokoHy+ltojRPWPOZrV9qZ9qaptTcH9PlfObBA1HelS9GR1IbUpK1Hdvq7
         TiEvMCyCL2QomnN6Kl7bvEGBqzbVr0FNoPj3VA0sgjeKedd3DJqS3R5sCVuPYBuRTBSm
         mG/MpG8bnTVsznFdEAS2Nz1p+YliUjCclpdyRZfMtJUtMcvLw9YZEpzb12a2MHYvzwiV
         fYMA==
X-Gm-Message-State: AFqh2kpnxlYKf3vVzZEzS4PKBKRLYpeDekDk2h3ujhvuDys83OCJS7Ax
        yqtYvzJebDobAL7ZvUEjcJaqxRUT2/HGFA==
X-Google-Smtp-Source: AMrXdXslYqoutadTyA7+ML7YlSZ1avSfevGANp+dIqfD5yObjJb4bf0TaY1MyyEkt8wgluGbenW7Xg==
X-Received: by 2002:a05:622a:1884:b0:3ab:ec48:d54f with SMTP id v4-20020a05622a188400b003abec48d54fmr34412528qtc.25.1673521965120;
        Thu, 12 Jan 2023 03:12:45 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id e7-20020ac80647000000b003a69225c2cdsm8933947qth.56.2023.01.12.03.12.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 03:12:44 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-4d0f843c417so120523797b3.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:12:44 -0800 (PST)
X-Received: by 2002:a81:1a16:0:b0:46f:bd6:957d with SMTP id
 a22-20020a811a16000000b0046f0bd6957dmr1758634ywa.383.1673521964490; Thu, 12
 Jan 2023 03:12:44 -0800 (PST)
MIME-Version: 1.0
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com> <87a63qpxge.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a63qpxge.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Jan 2023 12:12:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJ7B-7qK_ft3627pwSgUkFONnDaLw-59vVP_Tmuj0jNQ@mail.gmail.com>
Message-ID: <CAMuHMdXJ7B-7qK_ft3627pwSgUkFONnDaLw-59vVP_Tmuj0jNQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
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
> This patch adds "Audio Graph Card" DT setting file for ULCB/KF.
> We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.
>
> Because it needs "switching driver", not "add extra feature",
> it doesn't use Device-Tree overlay.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi

> +&ak4613 {
> +       #sound-dai-cells = <0>;
> +
> +       port {
> +               /*
> +                * (A) CPU0 <-> ak4613
> +                */
> +               ak4613_endpoint: endpoint {
> +                       remote-endpoint = <&rsnd_for_ak4613>;
> +               };
> +       };
> +};
> +
> +&hdmi0 {
> +       ports {
> +               port@2 {
> +                       /*
> +                        * (B) CPU1 <-> HDMI

As this is used for playback only, "CPU1 -> HDMI"?

> +                        */
> +                       dw_hdmi0_snd_in: endpoint {
> +                               remote-endpoint = <&rsnd_for_hdmi>;
> +                       };
> +               };
> +       };
> +};
> +
> +&rcar_sound {
> +       ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               rsnd_port0: port@0 {
> +                       /*
> +                        * (A) CPU0 <-> ak4613
> +                        */
> +                       reg = <0>;
> +                       rsnd_for_ak4613: endpoint {
> +                               remote-endpoint = <&ak4613_endpoint>;
> +                               bitclock-master;
> +                               frame-master;
> +                               playback = <&ssi0>, <&src0>, <&dvc0>;
> +                               capture  = <&ssi1>, <&src1>, <&dvc1>;
> +                       };
> +               };
> +               rsnd_port1: port@1 {
> +                       /*
> +                        * (B) CPU1 <-> HDMI

CPU1 -> HDMI

> +                        */
> +                       reg = <1>;
> +                       rsnd_for_hdmi: endpoint {
> +                               remote-endpoint = <&dw_hdmi0_snd_in>;
> +                               bitclock-master;
> +                               frame-master;
> +                               playback = <&ssi2>;
> +                       };
> +               };
> +       };
> +};

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi

> +&pcm3168a {
> +       ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               mclk-fs = <512>;
> +               /*
> +                * (C) CPU2 <-> PCM3168A-p

CPU2 -> PCM3168A-p

> +                */
> +               port@0 {
> +                       reg = <0>;
> +                       pcm3168a_endpoint_p: endpoint {
> +                               remote-endpoint = <&rsnd_for_pcm3168a_play>;
> +                               clocks = <&clksndsel>;
> +                       };
> +               };
> +               /*
> +                * (D) CPU3 <-> PCM3168A-c

As this is used for capture only, "CPU3 <- PCM3168A-c"?

> +                */
> +               port@1 {
> +                       reg = <1>;
> +                       pcm3168a_endpoint_c: endpoint {
> +                               remote-endpoint = <&rsnd_for_pcm3168a_capture>;
> +                               clocks = <&clksndsel>;
> +                       };
> +               };
> +       };
> +};
> +
> +&rcar_sound {
> +       ports {
> +               /* rsnd_port0/1 are defined in ulcb.dtsi */
> +               /*
> +                * (C) CPU2 <-> PCM3168A-p

CPU2 -> PCM3168A-p

> +                */
> +               rsnd_port2: port@2 {
> +                       reg = <2>;
> +                       rsnd_for_pcm3168a_play: endpoint {
> +                               remote-endpoint = <&pcm3168a_endpoint_p>;
> +                               bitclock-master;
> +                               frame-master;
> +                               dai-tdm-slot-num = <8>;
> +                               playback = <&ssi3>;
> +                       };
> +               };
> +               /*
> +                * (D) CPU3 <-> PCM3168A-c

CPU3 <- PCM3168A-c

> +                */
> +               rsnd_port3: port@3 {
> +                       reg = <3>;
> +                       rsnd_for_pcm3168a_capture: endpoint {
> +                               remote-endpoint = <&pcm3168a_endpoint_c>;
> +                               bitclock-master;
> +                               frame-master;
> +                               dai-tdm-slot-num = <6>;
> +                               capture = <&ssi4>;
> +                       };
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
