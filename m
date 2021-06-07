Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E37F39DA85
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 13:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhFGLD3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 07:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhFGLD2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 07:03:28 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C51C061766;
        Mon,  7 Jun 2021 04:01:24 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id y2so24224355ybq.13;
        Mon, 07 Jun 2021 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eOk28QuplFXUqfx4Omxl+hHoy7+LeKbRcCFQxR2HiDg=;
        b=kcacTHFqZjpKgAGn83h6ZcGEfrTYMF4xHxvDO5D+aKf7yGAl7SNutkJU/dns5/0Toi
         L1W8p4oMYhasUQYqMU3QnzwgkEIv+DbUoxv9IC7jrGZbbZV+fePV+frtSgJ9Qw+iPqrS
         XycjgZ8aFN+QD8jSPmFNukQqU8gDo5BI04Qwfprk7lkMu67Lb3z8v4maNZfxpaffu/I6
         UfEzizAUmMdxjMkqnALnuKmQfjeh0nhAAEuYXSeDuTLT+m6fv8R8Bn/EwtbDTAUwVhAQ
         d1Y9eV8XiMghf2xI3ujnzpwSIbNOUJWpiQPSg3qaAU6nW+GvWgs5KQyazogzhF4M1H3l
         xFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eOk28QuplFXUqfx4Omxl+hHoy7+LeKbRcCFQxR2HiDg=;
        b=QFSApm/SQRZHC6hN2PD5ykOOHY24BrPXulTPHnW6Nf7Pd5yIGDwvw/ThpMMlNHbf+U
         2JSTk1AghR9DnDvNwdAdDKOAOaRfdbQPSlOCq+oEBCVO7sr+Qhtb6vqhKdEXw0VruEyC
         Fn/QGIxYxJJu78hIktFXXiRr1dUl6vSMpTKcd4xq3N8pI0XUrQXjSABF9ZDxupaD2PH+
         lSCbAjEMq/6QtR5jvZknKztiUuQdG2e2q2ryfHbK6qJPg5hPNTCXGZGJZg51v08DtaW+
         chcEJlIntsi4iBe7XFin74L0Ot9sVlxmPKR8E5Hmt+ctxDq2BImOB+Xi3GyV4f4kLxXe
         8juA==
X-Gm-Message-State: AOAM533jKo1lGgj5odiLR9+iFcyYsVnLiYeYaqE1nUbmVPcjainfra5G
        L2j4ndSOcRSg/AW20+lPgGNCXAOrBjUbUp66iV0=
X-Google-Smtp-Source: ABdhPJxsAO4O7+1PJKJdXSJWiRnllFxvdUp/lmPmeLed0v6u2MYw19nOBSus4DzafHPuZRqHHk1Z52A1NP3Si7Ogius=
X-Received: by 2002:a25:a26a:: with SMTP id b97mr23644097ybi.62.1623063683489;
 Mon, 07 Jun 2021 04:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 7 Jun 2021 12:00:57 +0100
Message-ID: <CA+V-a8syJ=ea9Bhu1gBr=LgEc9ie0j9WmtvmbW285XxjJqE5XA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Add new Renesas RZ/G2L SoC and Renesas RZ/G2L
 SMARC EVK support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Jun 3, 2021 at 11:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series adds initial support for Renesas RZ/G2L SoC and
> Renesas RZ/G2L SMARC EVK.
>
> Initial patches enables minimal peripherals on Renesas RZ/G2L
> SMARC EVK and booted via initramfs.
> * Documentation for RZ/G2{L,LC,UL} SoC variants
> * SoC identification support
> * CPG core support
> * Minimal SoC DTSi
> * Minimal DTS for SMARC EVK
>
> Changes for v2:
> * Included type-2 RZ/G2Ul SoC in binding doc
> * Added single entry for SMARC EVK "renesas,smarc-evk"
> * Renamed ARCH_R9A07G044L to ARCH_R9A07G044 and
>   dropped ARCH_R9A07G044LC config
> * Dropped SoC identification changes will post them as
>   separate patch.
> * Updated comment in sh-sci.c
> * Binding documentation patch for serial driver has been
>   accepted so dropped the patch from this series
> * Incorporated changes requested by Geert for CPG core
> * Fixed dtbs_check errors
> * Dropped 'clock-names'/'clocks'/'power-domains'/'resets'
>   properties from GIC node and will include them in a separate
>   patch along with arm,gic-v3.yaml binding updates
> * Included ACK's from Rob
>
> Patches are based on top of [1] master branch.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/
>
> Cheers,
> Prabhakar
>
> Biju Das (1):
>   serial: sh-sci: Add support for RZ/G2L SoC
>
> Lad Prabhakar (11):
>   dt-bindings: arm: renesas: Document Renesas RZ/G2UL SoC
>   dt-bindings: arm: renesas: Document Renesas RZ/G2{L,LC} SoC variants
>   dt-bindings: arm: renesas: Document SMARC EVK
>   soc: renesas: Add ARCH_R9A07G044 for the new RZ/G2L SoC's
>   arm64: defconfig: Enable ARCH_R9A07G044
>   clk: renesas: Define RZ/G2L CPG Clock Definitions
>   dt-bindings: clock: renesas: Document RZ/G2L SoC CPG driver
>   clk: renesas: Add CPG core wrapper for RZ/G2L SoC
>   clk: renesas: Add support for R9A07G044 SoC
>   arm64: dts: renesas: Add initial DTSI for RZ/G2{L,LC} SoC's
>   arm64: dts: renesas: Add initial device tree for RZ/G2L SMARC EVK
>
Biju pointed out USB/ADC isn't working with the current implementation
on upstream kernel, I'll have to re-structure to accommodate this
use-case. I'll send a v3 fixing the issue.

Sorry for the inconvenience.

Cheers,
Prabhakar

>  .../devicetree/bindings/arm/renesas.yaml      |  18 +
>  .../bindings/clock/renesas,rzg2l-cpg.yaml     |  80 ++
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 119 +++
>  arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  25 +
>  .../boot/dts/renesas/r9a07g044l2-smarc.dts    |  21 +
>  arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  27 +
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/clk/renesas/Kconfig                   |   9 +
>  drivers/clk/renesas/Makefile                  |   2 +
>  drivers/clk/renesas/r9a07g044-cpg.c           | 372 +++++++
>  drivers/clk/renesas/renesas-rzg2l-cpg.c       | 979 ++++++++++++++++++
>  drivers/clk/renesas/renesas-rzg2l-cpg.h       | 217 ++++
>  drivers/soc/renesas/Kconfig                   |   5 +
>  drivers/tty/serial/sh-sci.c                   |  12 +-
>  drivers/tty/serial/sh-sci.h                   |   1 +
>  include/dt-bindings/clock/r9a07g044-cpg.h     |  89 ++
>  17 files changed, 1978 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
>  create mode 100644 drivers/clk/renesas/r9a07g044-cpg.c
>  create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.c
>  create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.h
>  create mode 100644 include/dt-bindings/clock/r9a07g044-cpg.h
>
> --
> 2.17.1
>
