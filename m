Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F374A60BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 16:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240701AbiBAPxF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 10:53:05 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:34346 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237890AbiBAPxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 10:53:04 -0500
Received: by mail-ua1-f45.google.com with SMTP id y4so14142374uad.1;
        Tue, 01 Feb 2022 07:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xqc6Lsto+fasANOShkCIXHcP32yvvcnKBYurW281k/o=;
        b=ay3Et5SLzd28Fzc0V+1J3Um1c0FasWdK+oCAakiMQ17rWaeZNZcrp1uMIpQhqaQ45z
         8kLPLcY9/M7dDYapeSWJDGCKyFVXtvSGApCbTDICifQBzbo46jAISQnmhecqCjFnSALZ
         siYgG9jEfYmcxlyX7Vhn8q6us5SoY91FIpnToCVzDdR7Vrv7xvYmsvjcs62oT7WCXV4z
         soNc5rjeuTAH5m+xiJbxWWdrT85EEnyMm97q7EQ5XbvYorcYg5Mix+a3dDlkYmQd6l/L
         jQIByk9zdjNjvmD0jkuJAbe4DFSZvUuNHefr7apIz7Jye8OrNCS9d47B+Z/TyLMX8unI
         sBFg==
X-Gm-Message-State: AOAM53331tng1/BlKhTEILRfcxrAqvEAaH5miGIkTfkEV1+fbOdbqJSQ
        Oh2ZW8OMSUSkxfP9R9FI0Da50lBdfqP+1Q==
X-Google-Smtp-Source: ABdhPJxU3dbIL2WhzyPmpaJd/Hc8zj9bP/mEJ9/N50DaAa+DgoJvGNmonyCISH2B11WwioRrCg88pg==
X-Received: by 2002:a05:6130:40b:: with SMTP id ba11mr11542602uab.118.1643730784081;
        Tue, 01 Feb 2022 07:53:04 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id r4sm4115651vsk.2.2022.02.01.07.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 07:53:03 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id y4so14142352uad.1;
        Tue, 01 Feb 2022 07:53:03 -0800 (PST)
X-Received: by 2002:ab0:44c:: with SMTP id 70mr10794047uav.78.1643730783404;
 Tue, 01 Feb 2022 07:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-29-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-29-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 16:52:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdDc4GsW17hWa=ouN3BGBh15MFuzPQ-siFqEBniO0FHA@mail.gmail.com>
Message-ID: <CAMuHMdXdDc4GsW17hWa=ouN3BGBh15MFuzPQ-siFqEBniO0FHA@mail.gmail.com>
Subject: Re: [RFC 28/28] arm64: dts: renesas: rzg2l-smarc: Enable Display on
 carrier board
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Jan 12, 2022 at 6:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable display interface on RZ/G2L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -107,6 +118,23 @@
>         };
>  };
>
> +&dsi0 {
> +       status = "okay";
> +
> +       ports {
> +               port@1 {
> +                       dsi0_out: endpoint {
> +                               data-lanes = <1 2 3 4>;
> +                               remote-endpoint = <&adv7535_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&du {
> +       status = "okay";
> +};
> +
>  &ehci0 {
>         dr_mode = "otg";
>         status = "okay";

JFYI, as rzg2l-smarc.dtsi is now shared by the RZ/G2L(C) and RZ/V2L
DTS files, placeholders for "dsi0" and "du" need to be added to
r9a07g054.dtsi.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
