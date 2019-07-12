Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 929E066E50
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 14:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbfGLM3c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 08:29:32 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35829 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfGLM3a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 08:29:30 -0400
Received: by mail-ot1-f68.google.com with SMTP id j19so9289632otq.2;
        Fri, 12 Jul 2019 05:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oEdcVtCqnAmcikhOKq8zHJ48dzBynV9gjlaZHvc/aWA=;
        b=f4crqYI8oUH7sZA3Zkze8ETa5sFKl6o48gI3P4GH1UaISPKPKFrkztxP9vDHLWb/WT
         cRDnH6VCdMsHQmY/eAFzHTxyME0W4JL3m7MJXJVKMAuQmyRMWudpArQr4Hg0lQScr/6j
         Ru0n3RY/P+nzzD8/ZfBDHPSb8QRlmL9Ou+xCjOssI7SLnSZnY5356wUUG4GhY5KwAc4X
         eXyWkHyAd2Kf8SOVmWD2ZskTLXNicpWMKfRyeIdCX9dtie22qllbPNyRFm920BK9t4RO
         rLB+gszkbXnyjHCNned8f7pjuiKtDudCD5ATSsNMebRKXN77fDlHgro8H1DPqt/9Nr/K
         WkPw==
X-Gm-Message-State: APjAAAUx3KE57D6YOPbcR/68YM6MyoGXr/3EIoUUnMLokzeVBfCEt/pb
        sFqD2HzU064Dsy7o3lV72ZPTuo+XhZC3HFfvbKg=
X-Google-Smtp-Source: APXvYqw9RWe0Lk5Iw2vrCQIx/W+CQhgWkC9teDx9sc3MNmIW16eMpmIpD1KwHThNlDLBfxc6yXSTao6gi9bFb0xYxfI=
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr8468916oto.39.1562934569988;
 Fri, 12 Jul 2019 05:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com> <1562321720-18735-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1562321720-18735-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Jul 2019 14:29:18 +0200
Message-ID: <CAMuHMdU79JQfEH5hY=wjyknE+sLpS6i3GeXYZ5Z=uzWkWDC-DA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: hihope-common: Add PCA9654 I/O expander
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jul 5, 2019 at 12:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Enable PCA9654 GPIO expander, so that we can configure its GPIOs later.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -162,6 +162,13 @@
>         clock-frequency = <400000>;
>         status = "okay";
>
> +       gpio_expander: gpio@20 {
> +               compatible = "onnn,pca9654";
> +               reg = <0x20>;
> +               gpio-controller;
> +               #gpio-cells = <2>;

You may want to describe that the interrupt output is tied to GP5_25?

> +       };
> +

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
