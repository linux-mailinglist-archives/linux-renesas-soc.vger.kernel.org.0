Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4220145A1C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 12:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236400AbhKWLqC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 06:46:02 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:43784 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236408AbhKWLqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 06:46:01 -0500
Received: by mail-ua1-f45.google.com with SMTP id j14so33275734uan.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Nov 2021 03:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wyUBUjgX6SDhoDxnLUCkRvH4vHNxrE1nH2b9bjeDRxk=;
        b=scAJFLcN9aj42iuVA8WCwmvjP2h4kPxetgI0FkOYmdQEAq7CDh8DUMhE9fv7mlxq+p
         rXaRlCpSssYRJxva6ypIyALdnzOcMkWCftJSDGsvegiftPiGp+zaxLuRKAFOZCaQHylo
         pnF5J4sX4nYSrR1O0MoTX8+i0Q2iLarS9Z4B07eHT128BSVjsMYxQMWfaolPXFy5AP7U
         1irH1juZTlaM/YHqQJKK79U5ssyoCC1z53R1f2ebnzPnbiGfz9FFyV+1ZAGf+MSVSNaq
         J5OZTnpiDz2FS/h7Xk11w35wzo5kSCxb//9+TACdnflHL8bjMbLe+kgn9xBZd+vP3lbj
         f/MQ==
X-Gm-Message-State: AOAM533R0Nqs5bbJFKpY5zjEJZc+2bggtH0/YnHj0cE74zcWiYHqK+Cw
        46vPyRBTgarJoXPlK/UyJ1GowW1cwv6DMg==
X-Google-Smtp-Source: ABdhPJx+zYuzL3ws5PnQFiz4RfCcsnYrBD95GPRs4dmSeJPbcsRNHlq4gBNOrWfrzY6u+ZZ4AD7lBA==
X-Received: by 2002:a9f:2329:: with SMTP id 38mr7657363uae.124.1637667772335;
        Tue, 23 Nov 2021 03:42:52 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id t20sm6677636vsj.27.2021.11.23.03.42.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 03:42:52 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 84so12202821vkc.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Nov 2021 03:42:51 -0800 (PST)
X-Received: by 2002:a05:6122:7d4:: with SMTP id l20mr9293555vkr.26.1637667771620;
 Tue, 23 Nov 2021 03:42:51 -0800 (PST)
MIME-Version: 1.0
References: <87y25owlp0.wl-kuninori.morimoto.gx@renesas.com> <87wnl8wloh.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wnl8wloh.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 12:42:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtHUsKw5DQjSs-ANNiyptumydshdQaiyL7bSHa5B=eKg@mail.gmail.com>
Message-ID: <CAMuHMdXtHUsKw5DQjSs-ANNiyptumydshdQaiyL7bSHa5B=eKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: ulcb/ulcb-kf: switch to use
 audio-graph-card2 for sound
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Nov 16, 2021 at 9:26 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current ULCB{-KF} are using audio-graph-card.
> Now ALSA is supporting new audio-graph-card2 which can easily handle
> more advanced feature. Let's switch to use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

Unfortunately this introduces several errors from "make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/renesas,rsnd.yaml".
Probably the renesas,rand need to be amended first?

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -302,12 +302,9 @@ rsnd_port2: port@2 {
>                         reg = <2>;
>                         rsnd_for_pcm3168a_play: endpoint {
>                                 remote-endpoint = <&pcm3168a_endpoint_p>;
> -
> -                               dai-format = "i2s";
> -                               bitclock-master = <&rsnd_for_pcm3168a_play>;
> -                               frame-master = <&rsnd_for_pcm3168a_play>;
> +                               bitclock-master;
> +                               frame-master;

arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dt.yaml: sound@ec500000:
ports:port@2: Unevaluated properties are not allowed ('reg',
'phandle', 'endpoint' were unexpected)
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dt.yaml: sound@ec500000:
ports:port@2:endpoint:frame-master: True is not of type 'array'
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dt.yaml: sound@ec500000:
ports:port@2:endpoint:bitclock-master: True is not of type 'array'
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

>                                 dai-tdm-slot-num = <8>;
> -
>                                 playback = <&ssi3>;
>                         };
>                 };
> @@ -315,12 +312,9 @@ rsnd_port3: port@3 {
>                         reg = <3>;
>                         rsnd_for_pcm3168a_capture: endpoint {
>                                 remote-endpoint = <&pcm3168a_endpoint_c>;
> -
> -                               dai-format = "i2s";
> -                               bitclock-master = <&rsnd_for_pcm3168a_capture>;
> -                               frame-master = <&rsnd_for_pcm3168a_capture>;
> +                               bitclock-master;
> +                               frame-master;

arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dt.yaml: sound@ec500000:
ports:port@3: Unevaluated properties are not allowed ('reg',
'phandle', 'endpoint' were unexpected)
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dt.yaml: sound@ec500000:
ports:port@3:endpoint:frame-master: True is not of type 'array'
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dt.yaml: sound@ec500000:
ports:port@3:endpoint:bitclock-master: True is not of type 'array'
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

>                                 dai-tdm-slot-num = <6>;
> -
>                                 capture  = <&ssi4>;
>                         };
>                 };
> @@ -360,10 +354,10 @@ wlcore: wlcore@2 {
>  };
>
>  &sound_card {
> -       dais = <&rsnd_port0     /* ak4613 */
> -               &rsnd_port1     /* HDMI0  */
> -               &rsnd_port2     /* pcm3168a playback */
> -               &rsnd_port3     /* pcm3168a capture  */
> +       links = <&rsnd_port0    /* ak4613 */
> +                &rsnd_port1    /* HDMI0  */
> +                &rsnd_port2    /* pcm3168a playback */
> +                &rsnd_port3    /* pcm3168a capture  */
>                 >;
>  };
>
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> index 7edffe7f8cfa..b4e69d212970 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -94,11 +94,11 @@ reg_3p3v: regulator1 {
>         };
>
>         sound_card: sound {
> -               compatible = "audio-graph-card";
> +               compatible = "audio-graph-card2";
>                 label = "rcar-sound";
>
> -               dais = <&rsnd_port0     /* ak4613 */
> -                       &rsnd_port1     /* HDMI0  */
> +               links = <&rsnd_port0    /* ak4613 */
> +                        &rsnd_port1    /* HDMI0  */
>                         >;
>         };
>
> @@ -411,11 +411,8 @@ rsnd_port0: port@0 {
>                         reg = <0>;
>                         rsnd_for_ak4613: endpoint {
>                                 remote-endpoint = <&ak4613_endpoint>;
> -
> -                               dai-format = "left_j";
> -                               bitclock-master = <&rsnd_for_ak4613>;
> -                               frame-master = <&rsnd_for_ak4613>;
> -
> +                               bitclock-master;
> +                               frame-master;

arch/arm64/boot/dts/renesas/r8a77951-ulcb.dt.yaml: sound@ec500000:
ports:port@0: Unevaluated properties are not allowed ('reg',
'phandle', 'endpoint' were unexpected)
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
arch/arm64/boot/dts/renesas/r8a77951-ulcb.dt.yaml: sound@ec500000:
ports:port@0:endpoint:frame-master: True is not of type 'array'
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
arch/arm64/boot/dts/renesas/r8a77951-ulcb.dt.yaml: sound@ec500000:
ports:port@0:endpoint:bitclock-master: True is not of type 'array'
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

>                                 playback = <&ssi0>, <&src0>, <&dvc0>;
>                                 capture  = <&ssi1>, <&src1>, <&dvc1>;
>                         };
> @@ -424,11 +421,8 @@ rsnd_port1: port@1 {
>                         reg = <1>;
>                         rsnd_for_hdmi: endpoint {
>                                 remote-endpoint = <&dw_hdmi0_snd_in>;
> -
> -                               dai-format = "i2s";
> -                               bitclock-master = <&rsnd_for_hdmi>;
> -                               frame-master = <&rsnd_for_hdmi>;
> -
> +                               bitclock-master;
> +                               frame-master;

arch/arm64/boot/dts/renesas/r8a77951-ulcb.dt.yaml: sound@ec500000:
ports:port@1: Unevaluated properties are not allowed ('reg',
'phandle', 'endpoint' were unexpected)
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
arch/arm64/boot/dts/renesas/r8a77951-ulcb.dt.yaml: sound@ec500000:
ports:port@1:endpoint:frame-master: True is not of type 'array'
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
arch/arm64/boot/dts/renesas/r8a77951-ulcb.dt.yaml: sound@ec500000:
ports:port@1:endpoint:bitclock-master: True is not of type 'array'
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

>                                 playback = <&ssi2>;
>                         };
>                 };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
