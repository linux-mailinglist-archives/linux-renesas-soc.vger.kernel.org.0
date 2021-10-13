Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C45942C4C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 17:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhJMPaH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 11:30:07 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:45742 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhJMPaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 11:30:06 -0400
Received: by mail-ua1-f42.google.com with SMTP id 64so5205127uab.12;
        Wed, 13 Oct 2021 08:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kVVmY5OcYf0DohQJT+evgWUz/UIxo3Hbg6s+ngWAqMs=;
        b=6nAOuJwX/aWPqIcBBHX+hLThCxU+L5oxcRtsBirtey/W9PQUFxccQ36Aw5AIDDO9IH
         ifGMk8avtUOIOqtYCYJ6esk3y1++ve+vZEFtedN2byhC2EN+OyTFLdmPiTKpUVRK8vlP
         omiX4pC6pGJYO5EM8XYrEwiZh7BJZUnGAgP0hUYVUPly2DPa0OfgPeuyQVsyA71rTxSc
         6bR5ADwZwFVLfU1ujnjUeiUib3P+ydcFjkmmb7Y8ipQmBmOPXwIb85SPIG2SmOcpISVo
         UZPJTyGUy00ouDZ0hyWYRPTm1ITw2zlBcuLmctybvJn+I5SK+PIm5Ai7btl0k4eMFina
         +/gg==
X-Gm-Message-State: AOAM532PmLFexhMMQ4bDO28fnHEgbwC0v3vh6csFZ7+cQ5050uEDYNXj
        RHfNdR2yj1gFLhW3IFc7fNIOqvyzjlOuKjbu12irddvdG5M=
X-Google-Smtp-Source: ABdhPJw6dsHz60dW3ysQzGjilPhENSH9U1h/MWFKtwWpyT7CKRgOy52zBJozD7co2ikQqoub/p29o1rYmFciEG0K6LU=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr29804961uaf.114.1634138882801;
 Wed, 13 Oct 2021 08:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211013075647.32231-1-biju.das.jz@bp.renesas.com> <20211013075647.32231-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211013075647.32231-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 17:27:51 +0200
Message-ID: <CAMuHMdWxzk84GWC6H5DGesMmL_k1zDbGJ6CT0xqH5mfRHZRJCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a07g044: Add GbEthernet nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 13, 2021 at 9:57 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add Gigabit Ethernet{0,1} nodes to SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---v1->v2:
>  * Removed extra space before arp_ns.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
