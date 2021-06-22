Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6283B0930
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 17:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbhFVPgR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 11:36:17 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:41912 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbhFVPgQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 11:36:16 -0400
Received: by mail-vs1-f43.google.com with SMTP id c26so2525196vso.8;
        Tue, 22 Jun 2021 08:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e0kj1yCj9hUXoWtuJlxr+wOuOoyWlBQbRl2CeEKY3qM=;
        b=byFq2236yV4YlkvcHDajsFaGUS9vz3acxwyhnY2AngP4j0mbsGc3q60xDeRAiCl5sz
         9+ou9yNJ/AjZiJoeemzEqy0CaHpYx8L2YsgHovvQD7vtCKxW+bI6JIpL/GL0ATVXmHP7
         LN1k/1N1QtYW/M/BHtncE7ys2VMxgXO42s8pbWEP12ki6CBwHZaz7kzPADDpRBNycVsN
         BVSgLiAGffItWNp1oBNrg4WOciSGmuB1TT8aN6L5vO6EVtKvPSB9voGeEBU1of5LFSvS
         +sHgl1fpKFhhbxDZbGhZ87WhBY9y64h78457P7V7oGbcxfEnEWSbT7l0Q5UXkreBRQCm
         Tt7Q==
X-Gm-Message-State: AOAM530rZCe6tKJulGpHBFD+tPUtrb6UX4Zp0Fv/UnHV+18Xi2CS1vQ3
        o2rsLYmyM8b51N3qm7taiL9KRFSUCR4CXZYikL4=
X-Google-Smtp-Source: ABdhPJyYtCKexQMmD6WfpRtiEBJ6BJpZqbgg5bB8kbrqIm1MhxMd5tkMzX6oKMTtU7/a7Byr/xpm2BFyMMIcUNeJlDo=
X-Received: by 2002:a67:7787:: with SMTP id s129mr18673501vsc.40.1624376039492;
 Tue, 22 Jun 2021 08:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com> <20210621093943.12143-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210621093943.12143-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jun 2021 17:33:48 +0200
Message-ID: <CAMuHMdWJhrCtJ8stfNotr5Cfc9HK=Sytn_Tn_U1v3o+kEnwecw@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Jun 21, 2021 at 11:40 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document USB phy bindings for RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/phy/renesas,usb2-phy.yaml        | 23 ++++++++++---------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> index 0f358d5b84ef..eebba6c83aec 100644
> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -17,17 +17,18 @@ properties:
>
>        - items:
>            - enum:
> -              - renesas,usb2-phy-r7s9210  # RZ/A2
> -              - renesas,usb2-phy-r8a774a1 # RZ/G2M
> -              - renesas,usb2-phy-r8a774b1 # RZ/G2N
> -              - renesas,usb2-phy-r8a774c0 # RZ/G2E
> -              - renesas,usb2-phy-r8a774e1 # RZ/G2H
> -              - renesas,usb2-phy-r8a7795  # R-Car H3
> -              - renesas,usb2-phy-r8a7796  # R-Car M3-W
> -              - renesas,usb2-phy-r8a77961 # R-Car M3-W+
> -              - renesas,usb2-phy-r8a77965 # R-Car M3-N
> -              - renesas,usb2-phy-r8a77990 # R-Car E3
> -              - renesas,usb2-phy-r8a77995 # R-Car D3
> +              - renesas,usb2-phy-r7s9210   # RZ/A2
> +              - renesas,usb2-phy-r8a774a1  # RZ/G2M
> +              - renesas,usb2-phy-r8a774b1  # RZ/G2N
> +              - renesas,usb2-phy-r8a774c0  # RZ/G2E
> +              - renesas,usb2-phy-r8a774e1  # RZ/G2H
> +              - renesas,usb2-phy-r8a7795   # R-Car H3
> +              - renesas,usb2-phy-r8a7796   # R-Car M3-W
> +              - renesas,usb2-phy-r8a77961  # R-Car M3-W+
> +              - renesas,usb2-phy-r8a77965  # R-Car M3-N
> +              - renesas,usb2-phy-r8a77990  # R-Car E3
> +              - renesas,usb2-phy-r8a77995  # R-Car D3
> +              - renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
>            - const: renesas,rcar-gen3-usb2-phy
>
>    reg:

As some of the register bits are different, cfr. my comments to
[PATCH v2 10/11], I think you want to add a new oneOf instead:

      - items:
          - enum:
              - renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
          - const: renesas,rzg2l-usb2-phy


Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
