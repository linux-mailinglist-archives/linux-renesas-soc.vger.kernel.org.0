Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85C1203E76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 19:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbgFVRwq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 13:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730046AbgFVRwp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 13:52:45 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE3BC061573;
        Mon, 22 Jun 2020 10:52:45 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id v13so13779617otp.4;
        Mon, 22 Jun 2020 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c3U81bx6gTZu2W3e+xYnSw5Jlusy05+ISUo5eh+2kNw=;
        b=Unr5f4zxpWyYCGUAyXtqaimObdGmGC3elLdwRoYnR31VNUlv0Qbb6Zb2CdjAttYj+I
         VnX4HFMBLGhGkweyGlkSM/jtXLHA61tBm5PrEoFqIQmms4s5IT913IOLeDkhPbnMLfL7
         a8ugnSoJaTnsoRYHnSoyucUqs/L4S5yB+zU6ltiJSx1aPsBGmwC/46yI9SPeFlvG4EGs
         t/wKxVJ48BfroR7HIDRdBifEVRaDLinqsbXBWxedoPY0COD7LSnxsoPwuNHZZFqnvntU
         BR6cTnEAZZ+jheABPKvut/+MqKzgjzDPI/nZb9vkrvj+OZM9z+j4qctTlHpmrrtN8jbR
         vfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3U81bx6gTZu2W3e+xYnSw5Jlusy05+ISUo5eh+2kNw=;
        b=qiJih6z+8ztxRfv96Xj+zGKP1R6VdVJRDASxagbk7iahWXijV831zJFhEI9HLEImrQ
         KcCi2TBH4rPq+QCY1IxKfeUUugt6yihV1YU2AlniAiZ5WbIReC19z6b5wQHQLIMCSDUp
         Y4aqnMTVdcXxciG5vIaysQNKpwQtYM5wfb8MSIkZsLF3lbaRpc6U8y6wFOtOU3IZKBeV
         PdTJuHntOT600bTxq/zVbkMJKpeApE5wCoPiika0en1F0Pj6MjpjDbFUDULLmX7m9MI5
         TtrIjaUTHc+T+3hAKdeDdiaKI/XZkGLgSYSDcXtOG6eDmfQ+OBP42yrFt0GPrHg7WjKQ
         pylw==
X-Gm-Message-State: AOAM5334oGVDEkyLnJu9KcWc+nLeNCRC+W/QsDIdOuCuCmeXL6PtvGa0
        vYCqKO0R6MXCqnNn/ypCPZQ5vjLgwLHLwOjbi0s=
X-Google-Smtp-Source: ABdhPJx5eB39CGljKy11xsnx0bd/2ros2b0o0ME+sXda1JV9InGs/LiwGuCe2IW0OuAoRtAUkyMzKJv4hF8AiOQzA/Y=
X-Received: by 2002:a9d:6188:: with SMTP id g8mr14046396otk.43.1592848365088;
 Mon, 22 Jun 2020 10:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <1591554886-21725-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1591554886-21725-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 22 Jun 2020 18:52:18 +0100
Message-ID: <CA+V-a8sMAkhLh9n7d=4QaNLDDJuExcu4ctWX2P1xH6Jqj-D3DA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Add support for HiHope RZ/G2M[N] Rev.3.0/4.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Sun, Jun 7, 2020 at 7:35 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series adds supports for HiHope RZ/G2M[N] Rev.3.0/4.0
> boards.
>
> Patches are based on top of renesas-arm-dt-for-v5.9 branch [1].
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (11):
>   arm64: dts: renesas: r8a774a1-hihope-rzg2m[-ex/-ex-idk-1110wr]: Rename
>     HiHope RZ/G2M boards
>   arm64: dts: renesas: r8a774b1-hihope-rzg2n[-ex]: Rename HiHope RZ/G2N
>     boards
>   arm64: dts: renesas: hihope-common: Separate out Rev.2.0 specific into
>     hihope-common-rev2.dtsi file
>   arm64: dts: renesas: Add HiHope RZ/G2M[N] Rev.3.0/4.0 specific into
>     common file
>   arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 main board support
>   arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 sub board support
>   arm64: dts: renesas: hihope-rzg2-ex: Separate out lvds specific nodes
>     into common file
>   arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 board with
>     idk-1110wr display
>   arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 main board support
>   arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 sub board support
>   arm64: dts: renesas: Add HiHope RZ/G2N Rev2.0/3.0/4.0 board with
>     idk-1110wr display
>
Thank you for the Ack's for the above patches.

I shall re-spin the new version fixing the comments. I am waiting for
your feedback on patch 03/11.

Cheers,
--Prabhakar


>  arch/arm64/boot/dts/renesas/Makefile          |  17 ++-
>  .../boot/dts/renesas/hihope-common-rev2.dtsi  | 101 +++++++++++++
>  .../boot/dts/renesas/hihope-common-rev4.dtsi  | 143 ++++++++++++++++++
>  .../arm64/boot/dts/renesas/hihope-common.dtsi |  87 +----------
>  .../boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi |  52 +++++++
>  .../boot/dts/renesas/hihope-rzg2-ex.dtsi      |  37 -----
>  .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts   |  43 +-----
>  .../dts/renesas/r8a774a1-hihope-rzg2m-ex.dts  |   6 +-
>  ...a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts |  15 ++
>  .../renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts |  19 +++
>  .../renesas/r8a774a1-hihope-rzg2m-rev2.dts    |  38 +++++
>  .../dts/renesas/r8a774a1-hihope-rzg2m.dts     |   5 +-
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |   2 +
>  .../r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts   |  15 ++
>  .../dts/renesas/r8a774b1-hihope-rzg2n-ex.dts  |   6 +-
>  ...a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts |  15 ++
>  .../renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts |  15 ++
>  .../renesas/r8a774b1-hihope-rzg2n-rev2.dts    |  42 +++++
>  .../dts/renesas/r8a774b1-hihope-rzg2n.dts     |   5 +-
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |   2 +
>  20 files changed, 490 insertions(+), 175 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/hihope-common-rev4.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
>
> --
> 2.17.1
>
