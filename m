Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E2032F587
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 22:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbhCEVvU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 16:51:20 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:42065 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhCEVvL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 16:51:11 -0500
Received: by mail-oi1-f178.google.com with SMTP id l64so4102002oig.9;
        Fri, 05 Mar 2021 13:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=100p8Xn1S8lQaA67XMytTR1G/xqh893KhvDbFefC3fY=;
        b=S1eSdb7o/BOjeHGrEwrSZl1H8xzxLyiXaW19pnSeSnMvVhPcIEg8+6i07Z2Zv1gZe3
         D+ne9N3PJqo41a8KHa2KYHjiY1lBPgGE4uWFEjaveHACh5rDXB87ZJYZVwH4GxVHV/Fn
         fqArgls9nUfDHKNMez0HVcKlrg0F2izLLLrZL3R16jagna/1rb7Ar2vPBFiTTBHylf23
         0o7fAGX2IQd/fqlwoj+Adn+heVvhABYO0UXv1Y2QgQyK6Rnb0wiKz2EmTlOuwyxKhmFN
         jmbmu/vd1CZxvLJKd6Vz72MBaD32zKRPi4EWyZvKSR/1kF6I7LmM/irSdX5OYdmMyPQj
         FgNw==
X-Gm-Message-State: AOAM530tktwoNkV/tRnCGmBVx6ihXgPSjUPX+P59mkzCbqJlXtSCycIt
        9Nmhoyy7y20h9hMciBVo2w==
X-Google-Smtp-Source: ABdhPJxDMb5VFAsGsbj45mslaiDPjYFAeCxvMBiHvuBEQ8OMB/cfUCoEcbiWcTAYSdtp93c0qu0mJA==
X-Received: by 2002:a05:6808:4:: with SMTP id u4mr8755306oic.28.1614981070758;
        Fri, 05 Mar 2021 13:51:10 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p67sm797339oih.21.2021.03.05.13.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:51:10 -0800 (PST)
Received: (nullmailer pid 707923 invoked by uid 1000);
        Fri, 05 Mar 2021 21:51:09 -0000
Date:   Fri, 5 Mar 2021 15:51:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: max9286: Describe gpio-hog
Message-ID: <20210305215109.GA703883@robh.at.kernel.org>
References: <20210215172447.2026514-1-jacopo+renesas@jmondi.org>
 <20210215172447.2026514-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215172447.2026514-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 15, 2021 at 06:24:44PM +0100, Jacopo Mondi wrote:
> The MAX9286 GMSL deserializer features gpio controller capabilities,
> as it provides 2 GPIO lines.
> 
> As establishing a regulator that uses one of the GPIO lines and
> enabling/disabling it at run-time in the max9286 won't work due to
> a circular dependency on the gpio-controller/regulator creation, allow
> the usage of a gpio-hog for that purpose.
> 
> The usage of the gpio-hog is required in designs where the MAX9286
> GPIO lines control the remote cameras power.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml     | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index ee16102fdfe7..9d5ecfd2397c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -50,6 +50,15 @@ properties:
>    '#gpio-cells':
>      const: 2
>  
> +  camvdd_en:

I don't think we want to document all the GPIO hogs, but rather have a 
pattern we can check. IOW, having node name pattern we match on. I think 
the core schemas has this now.

> +    type: object
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      output-low: true
> +      line-name:
> +        const: "CAMVDD_EN"
> +
>    maxim,reverse-channel-microvolt:
>      minimum: 30000
>      maximum: 200000
> -- 
> 2.30.0
> 
