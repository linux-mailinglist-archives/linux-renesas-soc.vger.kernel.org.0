Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471E3EEAFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2019 22:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbfKDVWz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Nov 2019 16:22:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:57742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728377AbfKDVWz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 16:22:55 -0500
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A663820869;
        Mon,  4 Nov 2019 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572902573;
        bh=7dJ/ia471WvDDaGPQasHlMYmYRTeVpG5ZWFxZcTDhuw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gaKeA5uH4v0NTUmXh+E4hrCfplOv5KZkizuGa3/Le13zxfd4iJo/ui3dO9phf73UJ
         LCYZVAsIyb3QUOW2Wd0AR8ceSHSJIFKaGMoTGHbWBx9JNBjGHKalMjWiVp0JSpUWWl
         PRuG4oU7EPgfcOrHhr5WfVFf6B49vSqK8hj+YFk4=
Received: by mail-qk1-f176.google.com with SMTP id e2so19130432qkn.5;
        Mon, 04 Nov 2019 13:22:53 -0800 (PST)
X-Gm-Message-State: APjAAAUxFVsKqUSeopLuGxlUxGlD4OoMqp3Sx9d6eF4bzQgrJa+J2qZG
        8XgV0clNvPSoDRIx90C2jKMjwGf26n/WyQni0A==
X-Google-Smtp-Source: APXvYqzsut7cy1jUm00XrKnirDZrqUqKmAVvL42F+Fbd8gvhRe+yRJinCpAGbWA4yeLCmepGvwNesz0t/I1xKS4MtIQ=
X-Received: by 2002:a05:620a:205d:: with SMTP id d29mr1462515qka.152.1572902572759;
 Mon, 04 Nov 2019 13:22:52 -0800 (PST)
MIME-Version: 1.0
References: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com> <1572886683-4919-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1572886683-4919-3-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 4 Nov 2019 15:22:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ+xus0GDWb0Px6HKDBzOt1yjwCCkQrfMspubwG+LZOdQ@mail.gmail.com>
Message-ID: <CAL_JsqJ+xus0GDWb0Px6HKDBzOt1yjwCCkQrfMspubwG+LZOdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 4, 2019 at 10:58 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> In an effort to repurpose lvds-encoder.c to also serve the
> function of LVDS decoders, we ended up defining a new "generic"
> compatible string, therefore adapt the dt-bindings to fit the
> new purpose. Also, convert the dt-bindings from .txt to .yaml
> while at it.

"Also, ... while at it." is a sign for split into 2 patches.

> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> ---
> v1->v2:
> * Converted to dt-schema as per Neil's comment
> ---
>  .../bindings/display/bridge/lvds-codec.yaml        | 117 +++++++++++++++++++++
>  .../bindings/display/bridge/lvds-transmitter.txt   |  66 ------------
>  2 files changed, 117 insertions(+), 66 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> new file mode 100644
> index 0000000..ff79bc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Trasnparent LVDS encoders and LVDS decoders

Typo

> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  This binding supports transparent LVDS encoders and LVDS decoders that don't
> +  require any configuration.
> +
> +  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
> +  incompatible data link layers have been used over time to transmit image data
> +  to LVDS panels. This binding targets devices compatible with the following
> +  specifications only.
> +
> +  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
> +  1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
> +  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> +  Semiconductor
> +  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> +  Electronics Standards Association (VESA)
> +
> +  Those devices have been marketed under the FPD-Link and FlatLink brand names
> +  among others.
> +
> +properties:
> +  compatible:
> +    description: |
> +      Any encoder or decoder compatible with this generic binding, but with
> +      additional properties not listed here, must define its own binding and
> +      list a device specific compatible first followed by the generic compatible
> +    items:
> +      - enum:

You can drop 'items' when there's only 1.

> +        - lvds-encoder # for LVDS encoders
> +        - lvds-decoder # for LVDS decoders
> +
> +  ports:
> +    type: object
> +    description: |
> +      This device has two video ports. Their connections are modeled using the
> +      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          With LVDS encoders port 0 is for parallel input
> +          With LVDS decoders port 0 is for LVDS input
> +
> +      port@1:
> +        type: object
> +        description: |
> +          With LVDS encoders port 1 is for LVDS output
> +          With LVDS decoders port 1 is for parallel output

port@* are required, right?

> +
> +required:
> +  - compatible
> +  - ports
> +
> +examples:
> +  - |
> +    lvds-encoder {
> +      compatible = "lvds-encoder";
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +
> +          lvds_enc_in: endpoint {
> +            remote-endpoint = <&display_out_rgb>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +
> +          lvds_enc_out: endpoint {
> +            remote-endpoint = <&lvds_panel_in>;
> +          };
> +        };
> +      };
> +    };
> +
> +  - |
> +    lvds-decoder {
> +      compatible = "lvds-decoder";
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +
> +          lvds_dec_in: endpoint {
> +            remote-endpoint = <&display_out_lvds>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +
> +          lvds_dec_out: endpoint {
> +            remote-endpoint = <&rgb_panel_in>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
