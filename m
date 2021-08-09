Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731133E45F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Aug 2021 14:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhHIM6G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Aug 2021 08:58:06 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:34401 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbhHIM6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 08:58:05 -0400
Received: by mail-vk1-f179.google.com with SMTP id x11so3908034vke.1;
        Mon, 09 Aug 2021 05:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8YyANyuZR7fYPTEivb2A77rPthj74HCMJFLYlpLjhb4=;
        b=JHl0Wpqlw4+rEhyCZiZudmmLXovJ/7qPMEnQkSaj8VsXg9iw+C2fE/OkqbZ5Gn7NSj
         3pybdxret/bV1eP8imGReJ6cU1IAWwPdrw9wTuJHD+wGwd5aKb6VGkw+uwY2IWHxNuEb
         NPzGjrQubxTwtoS57ffsILhp6zo7tdTZQwoabU3+IKrWAY9+F0SM8lBPiCpPK6TcigJA
         pjW43kReh1p+cEUM7UZ0Qsk1kMl9SE8axGdZNsY3YREdQD40Z+/5X4/RSZokNwv83bhf
         IxUyjRoM+lq3fFyfAIvqrsIpo+1yWxQpKz2DfVqR4mVc+R+vh2jIdawCNgQpsIIERDv0
         5qrA==
X-Gm-Message-State: AOAM5302/2M5VnsZ2Ab2F/nmk0JQLqMfuCdW9WkPee/9dmHeKZw7wbrO
        RrSVeaiGUesKcaRg2c5L64dwBgp9qscSq74DbsY=
X-Google-Smtp-Source: ABdhPJy3oD8kwL2fKgjd1+x6oD9DrDy3lnCulPeZeuWofPVdmbjqf9lmI9L+WnkYPGr3ewE9j3BxXIRigNiej0QJHFk=
X-Received: by 2002:a1f:fc03:: with SMTP id a3mr13722921vki.1.1628513864509;
 Mon, 09 Aug 2021 05:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com> <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Aug 2021 14:57:33 +0200
Message-ID: <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Aug 6, 2021 at 12:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The DMAC driver on RZ/G2L expects the slave channel configuration
> to be passed in dmas property.
> This patch updates the example node to include the encoded slave
> channel configuration.
>
> Fixes: 5df6dfbb6de815ba3a("ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> v3->v4:
>  * Updated bindings as the DMAC driver on RZ/G2L expects the
>    slave channel configuration to be passed in dmas property.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> @@ -93,8 +93,8 @@ examples:
>              clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
>              power-domains = <&cpg>;
>              resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
> -            dmas = <&dmac 0x255>,
> -                   <&dmac 0x256>;
> +            dmas = <&dmac 0x2655>,
> +                   <&dmac 0x2656>;
>              dma-names = "tx", "rx";
>              #sound-dai-cells = <0>;
>      };

I think it would be good to describe the expected format in the description
for the dmas property, so the DTS writer knows what the numerical
values in the example really mean.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
