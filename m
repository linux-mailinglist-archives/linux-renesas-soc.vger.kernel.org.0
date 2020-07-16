Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A522E222632
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 16:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbgGPOu6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 10:50:58 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43758 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPOu5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 10:50:57 -0400
Received: by mail-ot1-f68.google.com with SMTP id 95so4391533otw.10;
        Thu, 16 Jul 2020 07:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DRJaFCSXRYkutxNn91NF44g9U1kYxsQDLLWfAu1WbbQ=;
        b=uRGg/mLe7ma/iNNFdbPtorWOp6YZ3KHKPWUUPtCKpFx8t9cyC9TStlP3AZifa8QXLV
         pku+gO7QQJ4upgFPyenmR/m0dy2nhiChUMtJPwf9Tsk0SGhlXN2KnCdJOaOuIHDAPI5m
         XOhZbOGvPXE6a+ZEbiNK9/oADi9FmlE6+Spt6+uctZ3iZ9lo21t90Y5snaVt5GU2z5Ki
         5BgqSVJFCSNs791SArowXAVXw2Dqq1fkRoi1a7MumjDOUVY4lfzsQLaDBxs4J2Lu83wS
         d1flftQf5/XnaNlrrI9mnc0kPIAwJY/ERXgf7u3fA4PNhAY8tbqTWkVxnHNQh3rbknUZ
         yh2Q==
X-Gm-Message-State: AOAM531pAqhmqz/IY9N3my4iJO0CdWvi7iVjp59RSeDFMt8BYHaWSFf8
        vXB1I4BhWkJIseW9rDKW099UYz4ACrleZn12d7c=
X-Google-Smtp-Source: ABdhPJxyxYPYlnu26Hv5+mDli+MtJUrQt5wGWDh7lDg99HePscNEbHIbPNRFs3d2epSAxS9HsVjtad/k5x67y/U4vnc=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr4514600otb.107.1594911057188;
 Thu, 16 Jul 2020 07:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Jul 2020 16:50:46 +0200
Message-ID: <CAMuHMdVy4O9vbyO-j1eJbjQGon-3MEng42EOYJ2PoRmRY5ttKQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: Initial r8a774e1 SoC device tree
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Jul 8, 2020 at 7:49 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Basic support for the RZ/G2H SoC.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 652 ++++++++++++++++++++++
>  1 file changed, 652 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1.dtsi
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> new file mode 100644
> index 000000000000..6637e157ffcd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi

> +               intc_ex: interrupt-controller@e61c0000 {
> +                       compatible = "renesas,intc-ex-r8a774b1", "renesas,irqc";

Woops, '4e1, of course.

As I haven't sent a PR for arm-soc yet, I'll fix it up in renesas-devel.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
