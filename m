Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4778B4018C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 11:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241225AbhIFJ1I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 05:27:08 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:43846 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241223AbhIFJ1H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 05:27:07 -0400
Received: by mail-vs1-f53.google.com with SMTP id u1so5024493vsq.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Sep 2021 02:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKgAbQefaW1KqucLM8UJFekLXt2mYSldt0WzPjKsO+8=;
        b=Fhzt0quipCE+IW9iOoDEujQ3zo3ScDitZS6rxDv5MxMnECB/qNAaTjPuXGEnaNomrU
         XDgv+uxnn2ZXRS/ynvWYCDJGKnQ/E0QnCbYVBzJAQjkTbtaKGCsnsUCcjEXJX0hJbeDh
         4SGcaFM+eAQAdg1AwV2HAn4NFb96wAZtuApbfEsoYPvPO1tnO0B+GLFY6XXGXI+9QMmW
         Bn9aic56hFta7HYA3di8C9rcmzXqRxVmmyYOQWbieraNzYnXu/xi4L6QxW0BZtS8Duva
         mALgwBNC2AZxACtoWaFEuFV1H1HkivXbSN3Oz+SGHALz5OWMC4hVYJT7tYAjoEhm0se9
         4YjA==
X-Gm-Message-State: AOAM530gS3wcNrhT0WPlrtELbEyeX0KwHp4cj28OFcP9QzN7VSSHi6V/
        vojX+1cHOyn9F0rDYrvvYFnWvcdbmOjamdkGD+LmYgDI
X-Google-Smtp-Source: ABdhPJxTI/UI1YXwKHdiECjSr1n562pr9mNZf/I2cNVuCOwO0rTOHE7O19+7BneofsPbO3gBqFwhPxeUXUejPFa0Gxc=
X-Received: by 2002:a05:6102:2417:: with SMTP id j23mr5239636vsi.35.1630920362978;
 Mon, 06 Sep 2021 02:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210827073819.29992-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210827073819.29992-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 11:25:51 +0200
Message-ID: <CAMuHMdU2f3xZ1zgjCk-6JkkzdLVYjScBSooNNZvsNzc2tFZPXg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77961: Add TPU device node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Aug 27, 2021 at 9:38 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add the missing TPU node for the R-Car M3-W+ SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -1367,6 +1367,17 @@ scif5: serial@e6f30000 {
>                         status = "disabled";
>                 };
>
> +               tpu: pwm@e6e80000 {
> +                       compatible = "renesas,tpu-r8a77961", "renesas,tpu";

scripts/checkpatch.pl:

    WARNING: DT compatible string "renesas,tpu-r8a77961" appears
un-documented -- check ./Documentation/devicetree/bindings/
    #34: FILE: arch/arm64/boot/dts/renesas/r8a77961.dtsi:1371:

make dtbs_check:

    arch/arm64/boot/dts/renesas/r8a77961-ulcb.dt.yaml: pwm@e6e80000:
compatible:0: 'renesas,tpu-r8a77961' is not one of
['renesas,tpu-r8a73a4', 'renesas,tpu-r8a7740', 'renesas,tpu-r8a7742',
'renesas,tpu-r8a7743', 'renesas,tpu-r8a7744', 'renesas,tpu-r8a7745',
'renesas,tpu-r8a7790', 'renesas,tpu-r8a7791', 'renesas,tpu-r8a7792',
'renesas,tpu-r8a7793', 'renesas,tpu-r8a7794', 'renesas,tpu-r8a7795',
'renesas,tpu-r8a7796', 'renesas,tpu-r8a77965', 'renesas,tpu-r8a77970',
'renesas,tpu-r8a77980']

Any chance you can send a DT binding update? TIA!

> +                       reg = <0 0xe6e80000 0 0x148>;
> +                       interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 304>;
> +                       power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +                       resets = <&cpg 304>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
> +
>                 msiof0: spi@e6e90000 {
>                         compatible = "renesas,msiof-r8a77961",
>                                      "renesas,rcar-gen3-msiof";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
