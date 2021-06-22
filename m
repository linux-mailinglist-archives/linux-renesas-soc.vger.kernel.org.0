Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5773B0AB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 18:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbhFVQ5S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 12:57:18 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:36713 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbhFVQ5R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 12:57:17 -0400
Received: by mail-io1-f54.google.com with SMTP id s19so14336618ioc.3;
        Tue, 22 Jun 2021 09:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nst9vbRv3atdsjiAwZVyleOKg/gFLJsFk5FhmXQlxQw=;
        b=DxZ5e5mKsAkEECIccCAPv9tAUPCs8zTmDxoKWsPy0y+mMtWznX/7sz/5Hv7Y8bq/5s
         0GNjJN25xZv4ZAEp+TrLHBbd5roOfiW0lsiSmHqkCmJKUFCu5lUpROuRw0+PxWYLHQvI
         S4dGuyaCcFR9QsSLo2gm5bfQOJtitqPUvA6ZUlMcOZPZCiCEXbMpPbYX3nwDKCvgJrpZ
         1ECYaPWWbADBPn/7/cYBGBlEEu692oRcBgjSF7aKNlZimD/DtrKNbkNJcW5eFk+ugtwf
         7LLsOkCYDaqn/AuNrvotKDGP0EhEHTSZD+HOyFh2GGMUv8Swrn8nJue27rbWnxvktx/A
         xlGg==
X-Gm-Message-State: AOAM532z1O1g8nZuSLoUFFGfWJZHiC9u2GEHrkxfcaATbsvYMyYKkNMt
        y6/+gMNc3Ac/wYwuL6Vma9pZV6FoBw==
X-Google-Smtp-Source: ABdhPJwxes1QyEmFowKSsudJkkyqhfPKqc6A8x0/51AML0FVdLusi2ElghJUf8zau5B5LBuX3hvUjQ==
X-Received: by 2002:a05:6638:12cd:: with SMTP id v13mr4854440jas.104.1624380900931;
        Tue, 22 Jun 2021 09:55:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g4sm2282474ilk.37.2021.06.22.09.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:55:00 -0700 (PDT)
Received: (nullmailer pid 3837213 invoked by uid 1000);
        Tue, 22 Jun 2021 16:54:56 -0000
Date:   Tue, 22 Jun 2021 10:54:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tomohito Esaki <etom@igel.co.jp>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATH 3/4] dt-bindings: display: Add virtual DRM
Message-ID: <20210622165456.GA3756306@robh.at.kernel.org>
References: <20210621064403.26663-1-etom@igel.co.jp>
 <20210621064403.26663-4-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621064403.26663-4-etom@igel.co.jp>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 21, 2021 at 03:44:02PM +0900, Tomohito Esaki wrote:
> Add device tree bindings documentation for virtual DRM.

DRM is a Linuxism. What's virtual DRM? Why does it need to be in DT? 
What's the usecase? You're going to need a lot more reasoning to justify 
this for DT.

> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  .../devicetree/bindings/display/vdrm.yaml     | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/vdrm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/vdrm.yaml b/Documentation/devicetree/bindings/display/vdrm.yaml
> new file mode 100644
> index 000000000000..6493bb0fc09f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/vdrm.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/vdrm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Virtual DRM Device Tree Bindings
> +
> +description:
> +  This document defines device tree properties virtual DRM. The initial
> +  position, size and z-position of the plane used in the virtual DRM is
> +  specified.
> +  The current limitation is that these settings are applied to all crtc.
> +
> +properties:
> +  compatible:
> +    const: virt-drm
> +
> +patternProperties:
> +  "^plane(@.*)?$":
> +    description: Information of the planes used in virtual DRM
> +    type: object
> +
> +    properties:
> +      x:
> +        type: int
> +        description: x-coordinate of the left-top of the plane in pixels
> +
> +      y:
> +        type: int
> +        description: y-coordinate of the left-top of the plane in pixels
> +
> +      width:
> +        type: int
> +        description: width of the plane in pixels
> +
> +      height:
> +        type: int
> +	description: height of the plane in pixels
> +
> +      zpos:
> +        type: int
> +        description: z-position of the plane
> +
> +    required:
> +      - x
> +      - y
> +      - width
> +      - height
> +      - zpos
> +
> +required:
> +  - compatible
> +  - "^plane(@.*)?$"
> +
> +examples:
> + - |
> +   vdrm@0 {
> +       compatible = "virt-drm";
> +       plane@0 {
> +           x = <200>;
> +	   y = <100>;
> +	   width = <800>;
> +	   height = <600>;
> +	   zpos = <1>;
> +       };
> +   };
> -- 
> 2.25.1
> 
> 
