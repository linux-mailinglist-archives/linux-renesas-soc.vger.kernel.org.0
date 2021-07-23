Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E0A3D3C58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jul 2021 17:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235501AbhGWOmN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jul 2021 10:42:13 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:33454 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235438AbhGWOmL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jul 2021 10:42:11 -0400
Received: by mail-ua1-f52.google.com with SMTP id o10so666850uaj.0;
        Fri, 23 Jul 2021 08:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JNY68lwXBzViTmhmZU6M8m5U/JNICFngnliDXGrMHQw=;
        b=hYLUUbRGj1zaLWmthahSO2ViUXR0apx8CsANgcX2GBjFljOJBqzTW4Ax3173n3sBwH
         iq4oU1Yxzr92VV2dEEKIdWdrhwbmuC31LchrtBhgRdE29XhYVRtlAX216b/ypb1r93e7
         iL3OXxrfgvLxXODo0etYPsVukbCpAnYXBUpRYIkD5Y6Q+ipu6YKDGFx3xWz3JEOH5PtS
         TeNcHIc7iempUhTUIHNFN7q+6duTr3dh6OMPlVpFQcTBqNuRP/qrj0eM/w/plNhIQPj8
         TDWZyuFsHN+2YVY/SiK1q835qFSrK8dzUK+G/zY6/tyqwziZEmFNX7gtuy7PMIM9QsLW
         SH4w==
X-Gm-Message-State: AOAM531d2kO+l7dS00fYJdXcgmvcHnR3wsTjZFzE9mcAeGg6Ued0hbUx
        /ut/kJ2/S3GOSrwDYMo7qXqV/x5wIE+fzsgz2c+xNwZieMg=
X-Google-Smtp-Source: ABdhPJwhJC7Jf6CI/DalbSh1T44jPunX91RAKvn/ANtpsAthpIieasBKsL2jB+guvHwk3PHEgH9q4dCnkUkopoIZQeI=
X-Received: by 2002:ab0:5a2e:: with SMTP id l43mr5079138uad.4.1627053763347;
 Fri, 23 Jul 2021 08:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210721180632.15080-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210721180632.15080-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Jul 2021 17:22:32 +0200
Message-ID: <CAMuHMdWMB8o=GuvOtzBg6w6m3C030wu7-btT+FJ-dAZgNK3xsQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2: Add internal rx delay
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Jul 21, 2021 at 8:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Hihope boards use Realtek PHY. From the very beginning it use only
> tx delays. However the phy driver commit bbc4d71d63549bcd003
> ("net: phy: realtek: fix rtl8211e rx/tx delay config") introduced
> NFS mount failure. Now it needs rx delay inaddition to tx delay
> for NFS mount to work. This patch fixes NFS mount failure issue
> by adding MAC internal rx delay.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.15.

Do you want a Fixes: tag?

> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> @@ -20,6 +20,7 @@
>         pinctrl-names = "default";
>         phy-handle = <&phy0>;
>         tx-internal-delay-ps = <2000>;
> +       rx-internal-delay-ps = <1800>;
>         status = "okay";
>
>         phy0: ethernet-phy@0 {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
