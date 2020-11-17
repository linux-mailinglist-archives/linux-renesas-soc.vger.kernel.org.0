Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E102B5D06
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 11:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbgKQKhf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 05:37:35 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:47049 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgKQKhf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 05:37:35 -0500
Received: by mail-ot1-f65.google.com with SMTP id g19so18885614otp.13;
        Tue, 17 Nov 2020 02:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xlpCdbdwdgiAHLJ6o3j80s/A4tWrQRJFEA4CoHh+SMQ=;
        b=lWyeL40SYRWaaQ0rOX80mEl3n9CH4mVMQvaiDT7zG5c0wplXgelM9COEIWiR9qJrKo
         4M5cIRRya2nuOj+rkr7dfitxQPhdWpw2c1MwrYlQDzSz61Ky/WHsK9IqNUNhOAXSIrgx
         yqFLckwLPSoXMsDpxViraJgvMlp0aKdmwMsvTQU30xLeQL8A9XSQpgAqLlwmJXOIJY8g
         t+ODtM71CDdfJc6gOvwdzuwKvrQ/VzyDo8OYLn8zzxLxh2SYpQw2QZ62ASw9PbWgHIvc
         1PZJyGkEv2LspiMc/aevZygaax2gbb6j0t4I+nqQvcbLCiUPR8yaBumgapxTr6j3QeK0
         FcJw==
X-Gm-Message-State: AOAM5305487CT7c845SG/CcdHTjzb225hmEiEjoxmFvF/DnCXSZ+xxpm
        8yPM9WwnDBW6toRIf1Q5gFhTzCSWcFzd6p75wxI=
X-Google-Smtp-Source: ABdhPJwdmx7r6I5zj8jodkYho7XnaytzF+QMp1QBc/itOa9ld+ji3I3oUftzlTM4p0M68kkeI24eiE8vpMn7CYfNO3c=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr2362156oti.107.1605609454288;
 Tue, 17 Nov 2020 02:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20201117103123.3938-1-chunfeng.yun@mediatek.com>
In-Reply-To: <20201117103123.3938-1-chunfeng.yun@mediatek.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Nov 2020 11:37:23 +0100
Message-ID: <CAMuHMdXVXqj9k4FMFH5aiqKwNrWocJpjahYKA8k2e3Z2ji2hvQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: add additionalProperties
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-unisoc@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chunfeng,

On Tue, Nov 17, 2020 at 11:32 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> Add an explicit "additionalProperties: true" to avoid
> dt_binding_check error caused by:
> 'additionalProperties' is a required property
>
> This will not change function, due to additionalProperties
> is true by default.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/actions.yaml
> +++ b/Documentation/devicetree/bindings/arm/actions.yaml
> @@ -49,3 +49,5 @@ properties:
>            - enum:
>                - ucrobotics,bubblegum-96 # uCRobotics Bubblegum-96
>            - const: actions,s900
> +
> +additionalProperties: true

Looks very similar to commit 62298364bd489b06 ("dt-bindings: Explicitly
allow additional properties in board/SoC schemas") in v5.10-rc2?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
