Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD0633D8D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 17:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238492AbhCPQMU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 12:12:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:34388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235501AbhCPQLf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 12:11:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F194765103;
        Tue, 16 Mar 2021 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615911094;
        bh=35SIT3iPQSjph5vWPQOGdeWgRxkk11sjoB9x+0CNOVA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IbGjDn4wUtPbgNCiuXouRA0H4yd3h7EGYERiYXXuH+m9IwlDUNFMr75xQAYfD6hh2
         sUKLCuWB0xVOqo4E8fHxeCAGLnoTTHS1t6U8+fQXOQJvceix+ktF+s9c9ovxpzSjKz
         +jFH4B/ebge9GFBWnSfKOcAdGDXh5xCc0+gEpY3mdUGMIzCGiwmeXsK3+CXQroA/lM
         l119q1DHeZGEDuzGXlqm9u8F9iu7PvfBo3L5e0lvJ3cMXFXyi5uencoor750wOn+PM
         /1pNUgHgS0ISMxKH2Q4pE5dSHt6Ek3ZPSfpFru2c0jz6yIkt3RsEGcyt7AV6LkXZ39
         3IPnZorPcgN1w==
Received: by mail-ed1-f54.google.com with SMTP id z1so22212121edb.8;
        Tue, 16 Mar 2021 09:11:33 -0700 (PDT)
X-Gm-Message-State: AOAM530CwGIIpvCVTXOlCAHKWlL7kixtqYh6BY2irBM8bReHNkoGLICS
        RyZJv/WGy0NIc8kNpbY3rHTWBIpP5oFfwa9wag==
X-Google-Smtp-Source: ABdhPJyaz1jHP2gkVWlnV8xoLBHvVO2dfEQT1wx+qW2U9vhAWt7lnuWSVDSR1Cl7ERH1YphiAr/zB4WZbrFsPxMFl4M=
X-Received: by 2002:aa7:c403:: with SMTP id j3mr36976488edq.137.1615911092488;
 Tue, 16 Mar 2021 09:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140538.2403985-1-geert+renesas@glider.be>
In-Reply-To: <20210316140538.2403985-1-geert+renesas@glider.be>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 16 Mar 2021 10:11:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK+B+FqoR8CVcWHyEjmnpKivsacppX=nw-4ZMWHemx=tA@mail.gmail.com>
Message-ID: <CAL_JsqK+B+FqoR8CVcWHyEjmnpKivsacppX=nw-4ZMWHemx=tA@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 16, 2021 at 8:05 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>   - Remove unneeded reference for "idt,slew-percent", as vendor specific
>     properties having a standard unit suffix don't need a type,

Care to also fix 'idt,xtal-load-femtofarads' which was recently added?

>   - Add missing "additionalProperties: false" for subnodes, to catch
>     typos in properties,
>   - Fix property names in example.
>
> Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
> This depends on "[PATCH dt-schema 0/2] dt-schema: Add percentage", which
> is part of dt-schema v2021.2.1.
>
> v4:
>   - Add Reviewed-by, Acked-by,
>
> v3:
>   - Drop references for "idt,voltage-microvolt" and "idt,slew-percent",
>
> v2:
>   - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
>     ('clk: vc5: Use "idt,voltage-microvolt" instead of
>     "idt,voltage-microvolts"'),
>   - Drop reference to clock.yaml, which is already applied
>     unconditionally,
>   - Drop removal of allOf around if condition, as it is unnecessary
>     churn.
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.yaml       | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> index c268debe5b8d58cd..a7d00c552e3de161 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> @@ -84,9 +84,10 @@ patternProperties:
>          enum: [ 1800000, 2500000, 3300000 ]
>        idt,slew-percent:
>          description: The Slew rate control for CMOS single-ended.
> -        $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [ 80, 85, 90, 100 ]
>
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -141,13 +142,13 @@ examples:
>              clock-names = "xin";
>
>              OUT1 {
> -                idt,drive-mode = <VC5_CMOSD>;
> -                idt,voltage-microvolts = <1800000>;
> +                idt,mode = <VC5_CMOSD>;
> +                idt,voltage-microvolt = <1800000>;
>                  idt,slew-percent = <80>;
>              };
>
>              OUT4 {
> -                idt,drive-mode = <VC5_LVDS>;
> +                idt,mode = <VC5_LVDS>;
>              };
>          };
>      };
> --
> 2.25.1
>
