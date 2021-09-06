Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C814018FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 11:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240959AbhIFJkO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 05:40:14 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:44732 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239548AbhIFJkN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 05:40:13 -0400
Received: by mail-ua1-f53.google.com with SMTP id x6so3486168uai.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Sep 2021 02:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eey+1fvKyL/0sVHrsnNARL/xNkHDsJIksq4sR0ALIKA=;
        b=eHG3hgU5beiRNxjjV22y/aLFcqb0DSlzuqYlNneWMSleU1NVRUDf4+gci7lWBlknjB
         f4X0krls/PqLilheTBQssQUB7QNmzF/yzBfd1iwrYAoVSIjLxx/FUkDt4oIpeGjvKWFQ
         t7GoazqlwwszJBurrUbwdck1yEEMGJsOBpP0SOXqCrTGE/1zc9jgQh2HS6XFqv2sixzL
         aYW24m2UhWOpHyVFnWl9IKIPZz1uw37Ni3wjMYMYQgofJOSNeLHCFjB+64uIGEdoWU/P
         7zNMWcA/vTJIKQLBLb0FZaS6Y7DlNjyuZQKOfGIO8QgIcb+iNuBy+AksBSF+iU7Nfyt5
         Qeyw==
X-Gm-Message-State: AOAM532rGxqJPMH7QuTyOypw8VKUW4hGKqH7/qn/5pHru+IO6t4SDbAl
        auFj9/+Qo/bmEeXdtRHkU1UIFiEpSlHl5Vsl0FE=
X-Google-Smtp-Source: ABdhPJzF5w3LFXAXqIsZhqsokImBg+2i8gYTy66UWFqgD5/FSrzqIOWOY2LRm+QZoDfsa7+Jo9NOLKS70HU8dkmFJ88=
X-Received: by 2002:ab0:4d5b:: with SMTP id k27mr4873159uag.78.1630921149004;
 Mon, 06 Sep 2021 02:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210901091725.35610-1-wsa+renesas@sang-engineering.com> <20210901091725.35610-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210901091725.35610-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 11:38:57 +0200
Message-ID: <CAMuHMdUY4m29MneDZV7ir=8i0nSuh+u6qhH9s7Z3Km3N_DzGDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779a0: Add TPU node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 1, 2021 at 11:17 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Duc Nguyen <duc.nguyen.ub@renesas.com>
>
> This patch adds TPU node for R-Car V3U (r8a779a0) SoC.
>
> Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -1023,6 +1023,17 @@ msiof5: spi@e6c28000 {
>                         status = "disabled";
>                 };
>
> +               tpu: pwm@e6e80000 {

I'll move this just before "msiof0: spi@e6e90000" while applying,
to preserve sort order.

> +                       compatible = "renesas,tpu-r8a779a0", "renesas,tpu";
> +                       reg = <0 0xe6e80000 0 0x148>;
> +                       interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 718>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 718>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
> +
>                 dmac1: dma-controller@e7350000 {
>                         compatible = "renesas,dmac-r8a779a0";
>                         reg = <0 0xe7350000 0 0x1000>,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
