Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDB5A76501A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 11:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjG0JqY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 05:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjG0JqX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 05:46:23 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B1B94;
        Thu, 27 Jul 2023 02:46:22 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1bba7717d3bso587376fac.1;
        Thu, 27 Jul 2023 02:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690451182; x=1691055982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6o1KOkvT/dgp0Rk9orSLNKyG7j6Z7f0guuvfctyJGc=;
        b=jlxHVceUxkTCBejRI7edJMURQ7uHH3mO8nrZRfDxYeNs8/gS8gzJ3puD/fFBP2JXeb
         2pUK8BlNin1mLnnROXMbrbLTkmxC/nhj4Ff4zy8fS7EuimFp3CkCfTpQwweKCG7Rv+Jh
         KkyCZxowG4k6yvR2qsTttPLzk0mwIPDRGQbOxVAynouaZd+9Co98H/RQrxnNFuCW9HYk
         jMZZ+YdigwPP2c5W8aJVszpT+lEd4acz4TjsoUVZFhsW3suTZPkv7FTXlsx7yGQuU+6n
         wAkbjKhQsU1KB4SDKPWfpqonBp79cSDQkQcUiHYLWD9kIpBpG5yu/W3eYdv+DrBaEMDy
         SVlA==
X-Gm-Message-State: ABy/qLYL3G8oqWrs2jP2Ij8BVEjIkAwDXPQmnXO8ABYGheSLGz1abfIj
        xZ/uWbmxjSkaKSV0pAJjpvkyvLMtQkTSug==
X-Google-Smtp-Source: APBJJlESYbBO25iYPGY/T/b1+KgqwCmoYvMdQ5qdoyk4DzNYtRVBVRtnKgcbw33tVLJ5a+GvOSySig==
X-Received: by 2002:a05:6870:f14b:b0:1bb:8680:265f with SMTP id l11-20020a056870f14b00b001bb8680265fmr2307245oac.39.1690451181933;
        Thu, 27 Jul 2023 02:46:21 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id 127-20020a4a0385000000b0056360466d3esm441184ooi.48.2023.07.27.02.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 02:46:21 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-565f2567422so550587eaf.2;
        Thu, 27 Jul 2023 02:46:20 -0700 (PDT)
X-Received: by 2002:a05:6808:13d2:b0:3a3:d7de:5cfa with SMTP id
 d18-20020a05680813d200b003a3d7de5cfamr2511145oiw.11.1690451180641; Thu, 27
 Jul 2023 02:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230726080832.120669-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230726080832.120669-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jul 2023 11:46:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4-FDUaCCaajY6oVQ5HcOXJcRggNOKXNzQRZZEfQ6OMw@mail.gmail.com>
Message-ID: <CAMuHMdW4-FDUaCCaajY6oVQ5HcOXJcRggNOKXNzQRZZEfQ6OMw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rz-smarc-common: Use versa3 clk for
 audio mclk
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biji,

On Wed, Jul 26, 2023 at 10:08 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Currently audio mclk uses a fixed clk of 11.2896MHz (multiple of 44.1kHz).
> Replace this fixed clk with the programmable versa3 clk that can provide
> the clocking to support both 44.1kHz (with a clock of 11.2896MHz) and
> 48kHz (with a clock of 12.2880MHz), based on audio sampling rate for
> playback and record.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> @@ -32,12 +32,6 @@ chosen {
>                 stdout-path = "serial0:115200n8";
>         };
>
> -       audio_mclock: audio_mclock {
> -               compatible = "fixed-clock";
> -               #clock-cells = <0>;
> -               clock-frequency = <11289600>;
> -       };
> -
>         snd_rzg2l: sound {
>                 compatible = "simple-audio-card";
>                 simple-audio-card,format = "i2s";
> @@ -55,7 +49,7 @@ cpu_dai: simple-audio-card,cpu {
>                 };
>
>                 codec_dai: simple-audio-card,codec {
> -                       clocks = <&audio_mclock>;
> +                       clocks = <&versa3 3>;

The bindings do not mention the mapping from clock indices to actual
outputs.
According to Table 3. ("Output Source") in the 5P35023 datasheet,
I would expect the mapping to be 0=REF, 1=SE1, 2=SE2, 3=SE3, 4=DIFF1,
5=DIFF2.
But as AUDIO_MCK is sourced from SE2, that can't be correct?
Oops, the mapping in the driver uses the order in the Block Diagram,
which is the inverse...

>                         sound-dai = <&wm8978>;
>                 };
>         };
> @@ -76,6 +70,12 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
>                 gpios-states = <1>;
>                 states = <3300000 1>, <1800000 0>;
>         };
> +
> +       x1_x2: xtal {

X2 is a different 32768 kHz crystal.
"xtal" is a too-generic node name, and may cause conflicts that are
hard to debug .

"x1: x1-clock {", cfr. "x2" in
arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi?

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <24000000>;
> +       };
>  };
>

> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> @@ -20,6 +20,27 @@ &cpu_dai {
>         sound-dai = <&ssi1>;
>  };
>
> +&i2c0 {

Any specific reason you're not adding

    clock-frequency = <400000>;

like is already present on the other SoMs?

> +       versa3: versa3@68 {
> +               compatible = "renesas,5p35023";

The rest LGTM, I didn't verify renesas,settings though.
Note that to avoid introducing regressions, this patch has to be
postponed until Versa3 clock support has reached upstream (v6.6-rc1?).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
