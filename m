Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1331C2FC12E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 21:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731473AbhASUgX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 15:36:23 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:33431 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392147AbhASUgI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 15:36:08 -0500
Received: by mail-oi1-f173.google.com with SMTP id d203so22656774oia.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 12:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C7HRLyg3GcPkYPbKS3000NSBDXfZa3vJtgQzgKUQz+M=;
        b=ENxoU5gMVFK/UD7TbQGRks8zQSNidnUh59tLMOXFnjbLduNVGe+4P9YQIKFiw9Rprk
         A1NvCEdH54PIAsVx9CbYNrREUx8wCkBpr47IBsG3CGtxBCSQ+v1i8+/rSi+js7XmgMFP
         MnPLSc8JFNmNwlUw90qEjIqlT7cOuGn9NPVL4E3Q/tupHjVDC1Ym2PN67RBThh+9DFk9
         9kUIZkClMjm9owxzO/RBXzBxYR1E7ueDPaE/H4beMzXNLUNxLtRKidCyZYwEWL+u61+J
         ZnUuHnYA4KXL3muUcXrnq7rWVpEIEqY0GNFtxmfSlgooz5K29hnYRPHDdqNOzd94YjF+
         afQw==
X-Gm-Message-State: AOAM532XEPzuNmcpOgO7UIG9cp861B2PO9+EIsaMb7dKVSKwbNpWGliw
        6P+uNhlxF1XCtQCECiHa5XEqnpsYys1bmOgSuhI=
X-Google-Smtp-Source: ABdhPJzQSEMjjgW6a7uoYHepHLgIIqYYcRNMht/6K73Zj8bCCCO+AiimwCSoYXrYPg/6Ju3FfyssgLzjmhuvhozz7vk=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr1007333oia.54.1611088527556;
 Tue, 19 Jan 2021 12:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20210119133322.87289-1-wsa+renesas@sang-engineering.com> <CAHCN7xLcqh0efDuMS96Tot2Wek736VTbSbYm-rQgJf=ghZ0sBA@mail.gmail.com>
In-Reply-To: <CAHCN7xLcqh0efDuMS96Tot2Wek736VTbSbYm-rQgJf=ghZ0sBA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Jan 2021 21:35:16 +0100
Message-ID: <CAMuHMdVLwcQ6WpEhybxwCjJ2S-tuOoWqSiQCmB2-=Bunw4fX4A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: disable SD functions for plain eMMC
To:     Adam Ford <aford173@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Tue, Jan 19, 2021 at 7:43 PM Adam Ford <aford173@gmail.com> wrote:
> On Tue, Jan 19, 2021 at 8:48 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Some SDHI instances are solely used for eMMC. Disable SD and SDIO
> > for faster initialization.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > @@ -312,6 +312,8 @@ &sdhi3 {
> >         vqmmc-supply = <&reg_1p8v>;
> >         bus-width = <8>;
> >         mmc-hs200-1_8v;
> > +       no-sd;
> > +       no-sdio;
>
> No objections on the Beacon board.   I cannot speak for the rest.

Does this mean I can add your

    Acked-by: Adam Ford <aford173@gmail.com> [beacon]

?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
