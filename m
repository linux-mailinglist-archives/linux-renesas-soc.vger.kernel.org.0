Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D6D382B6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 13:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhEQLrw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 07:47:52 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:46742 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhEQLrv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 07:47:51 -0400
Received: by mail-vs1-f47.google.com with SMTP id t6so2913796vsp.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 04:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eW2rAY7/OvKCg+FQMYyiolPKahjO2Fi5wMv60BOA6HE=;
        b=FaMBqNRDck+TLt68kDEMq6SCKBrKpV6EOZZ0wmjyqxqRXs+BHvGkVxhIn0rJ5pPGJm
         vyCWje4CjM25pYY6vKRzWJa9UXKGImMUHJqvCicqW8tvGj7Ut3a8Mu2fBqcXjxLEWuRg
         MqfEPcwVb6uTGLx9bV9Nk+rscM7zvvqcP7HdCvzNfGQ8kXENFJySZximQE4BjIDUcZGD
         CpPXcx8BMbXjy8QlFUf9ieGO6YY/45U/jlDhXYTmFmtZy4XA2S6fCFI1vP1BTlhkmCUj
         RW3kIobfAuvuYxG7xOmrObvBXCEZfpH6eeLL+gdgCyMYExFoetTGWwQVNZAb7SlR37CB
         OqZw==
X-Gm-Message-State: AOAM531GNKhhinGIDSwG04bWifDKMtDcsdB1guSaXVIHz4d24T2oWGdS
        HVNaSpTdWpRw5LfyB9gGI7JMi4XVx/+bxnEX6ZW+d2Zt
X-Google-Smtp-Source: ABdhPJzqwou83kWyRCMPXRR+2nwLOKEPzYJC8NsQHhVJ06tjg+Dxdgs/jxTeWqYqJnhTpCoT2o9vxwoUevsH1toGyws=
X-Received: by 2002:a67:fb52:: with SMTP id e18mr10292765vsr.18.1621251995072;
 Mon, 17 May 2021 04:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com> <87fsymci1d.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fsymci1d.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 13:46:23 +0200
Message-ID: <CAMuHMdXUEOMn9x3Ga6czmw2NaAzT3LQGqxp-qmkcEuDSxd40uw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77995: draak: Add R-Car Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        hoai.luu.ub@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, May 17, 2021 at 2:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds R-Car Sound support for D3 draak.

Thanks for your patch!

> One note is that it is using different clock definition style
> from ulcb/salvator boards to avoid verbose clocks settings
> on rcar_sound node (see ulcb.dtsi  rcar_sound::clocks).
>
> cs2000 and ADG are closs connected, and needs each other.

cross connected?
need

> ulcb/salvator boards assume drivers are probed cs2000 -> rcar_sound.
> This draak board assumes drivers are probed rcar_sound -> cs2000.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../arm64/boot/dts/renesas/r8a77995-draak.dts | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 6783c3ad0856..591fad289802 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -6,6 +6,11 @@
>   * Copyright (C) 2017 Glider bvba
>   */
>
> +/*
> + * This assumes...
> + *     SW60 : 2-1

Perhaps this comment should be extended (why is this SW60
setting needed?), and moved to the audio block below?

> + */
> +
>  /dts-v1/;
>  #include "r8a77995.dtsi"

> @@ -347,6 +366,39 @@ eeprom@50 {
>                 reg = <0x50>;
>                 pagesize = <8>;
>         };
> +
> +       ak4613: codec@10 {
> +               compatible = "asahi-kasei,ak4613";
> +               #sound-dai-cells = <0>;
> +               reg = <0x10>;
> +               clocks = <&rcar_sound 0>; /* audio_clkout */
> +
> +               asahi-kasei,in1-single-end;
> +               asahi-kasei,in2-single-end;
> +               asahi-kasei,out1-single-end;
> +               asahi-kasei,out2-single-end;
> +               asahi-kasei,out3-single-end;
> +               asahi-kasei,out4-single-end;
> +               asahi-kasei,out5-single-end;
> +               asahi-kasei,out6-single-end;
> +
> +               port {
> +                       ak4613_endpoint: endpoint {
> +                               remote-endpoint = <&rsnd_for_ak4613>;
> +                       };
> +               };

The "port" node seems to be missing from the ak4613 DT bindings:

    arch/arm64/boot/dts/renesas/r8a77995-draak.dt.yaml: codec@10:
'port' does not match any of the regexes:
'^asahi-kasei,in[1-2]-single-end$',
'^asahi-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
    From schema: Documentation/devicetree/bindings/sound/ak4613.yaml

> +&rcar_sound {
> +       pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
> +       pinctrl-names = "default";
> +
> +       /* Single DAI */
> +       #sound-dai-cells = <0>;

arch/arm64/boot/dts/renesas/r8a77995-draak.dt.yaml: sound@ec500000:
'dais' is a required property
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

As this error is reported for all Renesas boards, perhaps the bindings
should be fixed instead?

> +
> +       /* audio_clkout0/1 */
> +       #clock-cells = <1>;
> +       clock-frequency = <12288000 11289600>;
> +
> +       status = "okay";
> +
> +       ports {
> +               rsnd_port0: port {
> +                       rsnd_for_ak4613: endpoint {
> +                               remote-endpoint = <&ak4613_endpoint>;
> +                               dai-format = "left_j";
> +                               bitclock-master = <&rsnd_for_ak4613>;
> +                               frame-master = <&rsnd_for_ak4613>;
> +                               playback = <&ssi3>, <&src5>, <&dvc0>;
> +                               capture  = <&ssi4>, <&src6>, <&dvc1>;
> +                       };
> +               };
> +       };

arch/arm64/boot/dts/renesas/r8a77995-draak.dt.yaml: sound@ec500000:
'ports' does not match any of the regexes: '^rcar_sound,ctu$',
'^rcar_sound,dai$', '^rcar_sound,dvc$', '^rcar_sound,mix$',
'^rcar_sound,src$', '^rcar_sound,ssi$', '^rcar_sound,ssiu$',
'pinctrl-[0-9]+'
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

> +};
> +
> +&ssi4 {
> +       shared-pin;
> +};
> +
>  &pfc {
>         avb0_pins: avb {
>                 groups = "avb0_link", "avb0_mdio", "avb0_mii";
> @@ -449,6 +541,17 @@ sdhi2_pins_uhs: sd2_uhs {
>                 power-source = <1800>;
>         };
>
> +       sound_pins: sound {
> +               groups = "ssi34_ctrl", "ssi3_data", "ssi4_data_a";
> +               function = "ssi";
> +       };
> +
> +       sound_clk_pins: sound-clk {
> +               groups = "audio_clk_a", "audio_clk_b",
> +                        "audio_clkout", "audio_clkout1";
> +               function = "audio_clk";
> +       };
> +

Pin control looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
