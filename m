Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76ECD253FEA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Aug 2020 09:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgH0H5b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Aug 2020 03:57:31 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46972 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgH0H53 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Aug 2020 03:57:29 -0400
Received: by mail-oi1-f196.google.com with SMTP id v13so3874021oiv.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2020 00:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jQS8HplyBTinr66uaSpO9skKP6GRdTI91mNycdjStoI=;
        b=JDax4BuPzz/j3Gm64i3oQfo6RIIPfGhpWMj+I0q1u7H5Aeznke3ZwYYnMN8nQXp/sz
         F/G4sRHxO4zmjWgyreIbkMMc9kP1BN4nQqnnNq1IeXwRB1Rtc5Q7TQQoMM8fw5A3AvTm
         gDhj0MDTcap5OfJKCRmobF/thAiDWj4dMMB56Y5JCbk1qPF42aDoceGoQKMVufyEvAnW
         zWJcEUXsVkoQc7A5x5fkDKr/2WsB9CFGz/BUtbaBpiZvyoguHRzO++qMPRyA1yFqjuAr
         OH5ASl1mKc/uFe2uZ/cW/5ploO/mRv2Fcj0x+sTM0u6Z1GE5bHJYsaOY5A/iZdz9tnYQ
         Ej5w==
X-Gm-Message-State: AOAM531V2mWfmWDAnXFO3KOFYeSnlLggWLKUayuFexTmExaphMygsa6e
        AUp87QEXQLJwVViRWnb2hNUKrAYPVQmRxpmEN/Y=
X-Google-Smtp-Source: ABdhPJwps6uTHNWji+KvvU2TDTL4z28pEX8igvywopUDsOCnknKkCGX4dVXfAOwfbLRMWTOnqA5D0dWN++p68WhFiqo=
X-Received: by 2002:aca:3402:: with SMTP id b2mr3473796oia.153.1598515048236;
 Thu, 27 Aug 2020 00:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR01MB3692415621B77BF7EF5023B6D8570@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <OSBPR01MB3014AF47303AC074CB23BE55BC570@OSBPR01MB3014.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692235B5EDEAF166079BCADD8570@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <87pn7fwblp.wl-kuninori.morimoto.gx@renesas.com> <87k0xnw77b.wl-kuninori.morimoto.gx@renesas.com>
 <TY2PR01MB3692A2CC69847BFBCF038E47D8570@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <87imd7w6og.wl-kuninori.morimoto.gx@renesas.com> <87h7srw6kn.wl-kuninori.morimoto.gx@renesas.com>
 <OSBPR01MB3014F048A8DAFFDD98FD6342BC570@OSBPR01MB3014.jpnprd01.prod.outlook.com>
 <87ft89vxq5.wl-kuninori.morimoto.gx@renesas.com> <87k0xkvigy.wl-kuninori.morimoto.gx@renesas.com>
 <OSBPR01MB3014BA37617E3D98EEB14211BC550@OSBPR01MB3014.jpnprd01.prod.outlook.com>
 <87imd4vfed.wl-kuninori.morimoto.gx@renesas.com> <87h7sovdvt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h7sovdvt.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Aug 2020 09:57:16 +0200
Message-ID: <CAMuHMdULmm9ZnZX83XtLnMZDOE53ebzPNZ-8VjCeyYu0jHMNVw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77961.dtsi: Enable Sound / Audio-DMAC
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        YUYA HAMAMACHI <yuya.hamamachi.sx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Thanks for your patch!

On Thu, Aug 27, 2020 at 7:50 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch enables Sound and Audio-DMAC for R-Car M3-W+ (R8A77961).
> It is tested on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -1230,27 +1230,494 @@ vin7: video@e6ef7000 {
>                 };
>
>                 rcar_sound: sound@ec500000 {
> +                       /*
> +                        * #sound-dai-cells is required
> +                        *
> +                        * Single DAI : #sound-dai-cells = <0>; <&rcar_sound>;
> +                        * Multi  DAI : #sound-dai-cells = <1>; <&rcar_sound N>;
> +                        */
> +                       /*
> +                        * #clock-cells is required for audio_clkout0/1/2/3
> +                        *
> +                        * clkout       : #clock-cells = <0>;   <&rcar_sound>;
> +                        * clkout0/1/2/3: #clock-cells = <1>;   <&rcar_sound N>;
> +                        */
> +                       compatible =  "renesas,rcar_sound-r8a77961", "renesas,rcar_sound-gen3";

Please make sure "renesas,rcar_sound-r8a77961" is added to the DT bindings
document, too.

Thank you!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
