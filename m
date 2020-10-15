Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3607C28F386
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Oct 2020 15:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729735AbgJONmI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Oct 2020 09:42:08 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41076 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729543AbgJONmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 09:42:08 -0400
Received: by mail-oi1-f196.google.com with SMTP id q136so3132295oic.8;
        Thu, 15 Oct 2020 06:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=orF3cUU9oOlrO0FJRLdebs2VBGQcFMsbBrA1OLiycKc=;
        b=E/Pycu/0l1XZnpUdw5stPYHepQP6695avZbWdQQM8OOaKtWzpwfKWnA8qWYOwrWWlP
         Uyo9GrzhkM8gIM0wUEmfv00ojlMBa9FnODWiggpBiedP+pDsU5SvcOdIyTWyoUELDuA4
         5YcY3ypl+8rHci2Po9LUsNX2wduaWarlG/mejOmOinVrfSVxqxLLW3U2OJ9egLLEJIx7
         EzPV4quwaotN8pKh7OAL7pdUlmbt/o+bkHSojx/hYSzOaI6OYmq9LHl0MHP+4cdEEvQP
         evRBMf0VgHWceVXlHB0cziYH8LN2L+heK8jfwzQ/uxN0qcM3g3+MpxqV/5fKCEzOuqNY
         ESRQ==
X-Gm-Message-State: AOAM533TeRMSSjUyj51A+aiQ/sUwCf7FGxVHJxbBhaYiQ3KO0rb/0c54
        C02YCTlvXw04r+o80u2UaH80Nb6+jCTZSvvYO4w=
X-Google-Smtp-Source: ABdhPJwIHm97HoA7V3FJf/i1TcP1cp8zPRHXwEDlwF/Nb56j3OiUhYXo+FNYC1Wl0GFutzFDpqRcyF818BuYmu4Dmng=
X-Received: by 2002:aca:c490:: with SMTP id u138mr2200333oif.54.1602769327067;
 Thu, 15 Oct 2020 06:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201015132350.8360-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201015132350.8360-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Oct 2020 15:41:56 +0200
Message-ID: <CAMuHMdUogbfHYv+g3+2=7JwhgH3MngmDEe5nvjZwkjTOJyn9dQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-skew-ps
 from ethernet-phy node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Oct 15, 2020 at 3:24 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> HiHope RZG2[HMN] boards uses Realtek phy and the driver does not support
> rxc-skew-ps property. So remove rxc-skew-ps from ethernet-phy node.
>
> Fixes: 7433f1fb8ec8fe ("arm64: dts: renesas: Add HiHope RZ/G2M sub board support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> @@ -23,7 +23,6 @@
>         status = "okay";
>
>         phy0: ethernet-phy@0 {
> -               rxc-skew-ps = <1500>;
>                 reg = <0>;
>                 interrupt-parent = <&gpio2>;
>                 interrupts = <11 IRQ_TYPE_LEVEL_LOW>;

Should "rx-internal-delay-ps = <1800>" be added to the avb node instead
(after [1] has entered v5.10-rc1, and the DTS part of [2] has been
 applied to renesas-devel)?

[1] [PATCH net-next v4 resend 5/5] ravb: Add support for explicit
internal clock delay configuration
    https://lore.kernel.org/linux-renesas-soc/20201001101008.14365-6-geert+renesas@glider.be/
[2] [PATCH v3 0/7] net/ravb: Add support for explicit internal clock
delay configuration
    https://lore.kernel.org/linux-renesas-soc/20200819134344.27813-1-geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
