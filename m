Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCCED175C1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2020 14:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgCBNt7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Mar 2020 08:49:59 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45169 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbgCBNt7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Mar 2020 08:49:59 -0500
Received: by mail-ot1-f65.google.com with SMTP id f21so1162364otp.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2020 05:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0mv81znbwLLaJhvIAWe3XFzJIBevWRO4IIziejSmdw8=;
        b=cOwNJeuZPirnkNGsZ/b7qQ3GTDh9H7YRTpvlDA939JX1SkXY7+sPHnMOAdVChlNfIN
         bwPdeK+lykmyFho+hr/M+lumpN08naUk+FC+l+oYG1mQSjR3cdF3TfOA58URw4MTJ2/9
         miROBj6SQFmLn3gjM7+CwDdOrfeVqe/KIupthel4Xnxry61iP8DYnenVOSj7u2DQv/S4
         /iUVMdJ3pnauACFOQyEmz9t65pyPJpJLg5QdXBSH3at8S62SRH2QwRVzJMskWiwKEbys
         wgu+jX3ZGeP9Jx8hP0HsTKE25Crl2sOJs8RlL1j7eG2uZYAst3RslL2yxUx2nPSU0I9m
         /yQg==
X-Gm-Message-State: APjAAAVh8M18ePP+/0wJnILOmCxOYqFWnDkJmEB+02L7JxDs+V55tp3v
        /9PLNiSwsKdjBlcu3Iq61SScuGQnbaWY9yoUgZU=
X-Google-Smtp-Source: APXvYqz3wT4DQlX4MWs7Wvdwm6tq4tTI1BAqXuOm20PEuEg+oDlj+u0DXYyXw2CmlOhkMUtEM9hFmIDyCh/i/2ioA4M=
X-Received: by 2002:a05:6830:100e:: with SMTP id a14mr13446900otp.297.1583156998879;
 Mon, 02 Mar 2020 05:49:58 -0800 (PST)
MIME-Version: 1.0
References: <1580323253-3281-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <1580323253-3281-3-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
In-Reply-To: <1580323253-3281-3-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Mar 2020 14:49:47 +0100
Message-ID: <CAMuHMdV0aOF30FpEzekq65CA6=_UTQA56WOCCv=WymuHapVjaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: iwg22d-sodimm: disable lcd for extension board
To:     Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marian-Cristian,

On Wed, Jan 29, 2020 at 7:58 PM Marian-Cristian Rotariu
<marian-cristian.rotariu.rb@bp.renesas.com> wrote:
> The two variants of the iW-G22D should be mutually exclusive, therefore
> this patch disables the RGB LCD display when the HDMI extension board is
> used.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Shouldn't this be merged with the previous patch, to avoid bisection
failures?

> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> @@ -108,6 +108,19 @@
>         };
>  };
>
> +&lcd_panel {
> +       status = "disabled";
> +
> +       /* null reference to get rid of the dtc warning */
> +       ports {
> +               port@0 {
> +                       endpoint {
> +                               remote-endpoint = <0>;
> +                       };
> +               };
> +       };
> +};
> +
>  &pfc {
>         can1_pins: can1 {
>                 groups = "can1_data_b";
> diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> index 878113a..444adc6 100644
> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> @@ -98,7 +98,7 @@
>                 pinctrl-names = "default";
>         };
>
> -       lcd {
> +       lcd_panel: lcd {
>                 compatible = "edt,etm043080dh6gp", "simple-panel";
>                 power-supply = <&vccq_panel>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
