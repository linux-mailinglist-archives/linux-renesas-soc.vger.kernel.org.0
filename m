Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B524641A9AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 09:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239264AbhI1H2R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 03:28:17 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:34471 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239083AbhI1H2P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 03:28:15 -0400
Received: by mail-ua1-f50.google.com with SMTP id 2so13856210uav.1;
        Tue, 28 Sep 2021 00:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/7byrD/3uBF9jfwibepcmS0PKt87kxJxiJqtBq6JUOg=;
        b=0PkL3x2gL912kAYMKhsHH4bL6jwp2RTSpkHxC19Eu3lZ/GwvmxTMki6OVM6f3lZEev
         dwLQvDIH+iFATA8UWMKO9INHBgjxqaD3h0BNkaHR11ZFuM98RvmfxsuTKJkb0HsEH6VS
         btkXQYbc1CPAchRatpd89/KPBPUfZzes7JYPMjjMmny6Ya0+kJKzhstLhIhLnsZOad2V
         mCXzlkRrDI++sERfdzG5oMpSCdBsyHA2aQDO9wNCMwsBQXGJAHg2SbBuikCXI9i+FrJ9
         0ZaVdQKXc2MeW0Y5NotPP9T83PdydreA0lEqqVlUWK/WO3nbinyLMdRsH8dumezdrmXa
         qEkg==
X-Gm-Message-State: AOAM530QZShbFPACWg38WOaEVcCG546/KwRe2HWLeqvInWoJUp8c9rbf
        2V5USuRFA5yfcsh8jr+0Fh6f4oHaaatx9zWVXXs=
X-Google-Smtp-Source: ABdhPJxRnw16Xl7Q2vB5IRHC/DT3o83RXhgDFpziHy/1qoWT/HjL4K6Eqzc6dNBtoaoEc6AWS5ccqDF3S0u9uedu/bI=
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr2371560uac.89.1632813996064;
 Tue, 28 Sep 2021 00:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210927193551.22422-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210927193551.22422-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Sep 2021 09:26:24 +0200
Message-ID: <CAMuHMdXSm993uBbWa2btNRzUcDMz_qOhCKXJ=8e_0TZBqkVALg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable RZG2L_ADC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 27, 2021 at 9:36 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable ADC driver support for Renesas RZ/G2L based platforms.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
