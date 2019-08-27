Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC8B49F420
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 22:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731296AbfH0U3s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 16:29:48 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39025 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731253AbfH0U3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 16:29:47 -0400
Received: by mail-oi1-f196.google.com with SMTP id 16so302929oiq.6;
        Tue, 27 Aug 2019 13:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8niDKrVIoqrSXH9oif2WET13kHnIVA/UIc91Gu8SkZM=;
        b=cqk4g/y8T7nunwqiAeB7q6XdwOT3OrXzc6FizEBOWsgasHJFy3sT04xubmu+RzfyHN
         bbZOlZM5zfBfezahDyqKMagu+9HQCJERu2skyX2OZCiGQQ/haANOPOjVZqAIvHUU881q
         HMUzl+Vu3wKKL9me5G8i2MACN5EHhYgNjgf+qMwoSZEiTqL2dQAHe9YsrHiBG54MDWe4
         TDj6Qu3sHNqDkC/nbyWk/vF76/k65pLYaLxFyywK09/5YIvUTuBAT9QDdqCYzuobApIu
         fZRgNZVnmON8z07BWCvbxQ/QBlCfpk4sRzUViVgU0utoR1O0qsUULLaw2u8QSUMOQekq
         8DMw==
X-Gm-Message-State: APjAAAUa0tFNysVidld4jFpC3QFJ2l2zl9jRTDoriOWPlMPUtbgvl9dY
        KrWjK7VRJA6hzKxGXi/39Q==
X-Google-Smtp-Source: APXvYqyvi93uz4dBcCcm4cI88A8pdbEVLlyRLkZI+skrt3KOD0/N23uLiDTKZNEwXqB/ZdPpBbIoDg==
X-Received: by 2002:a05:6808:982:: with SMTP id a2mr396001oic.59.1566937786583;
        Tue, 27 Aug 2019 13:29:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j19sm144026otk.46.2019.08.27.13.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 13:29:46 -0700 (PDT)
Date:   Tue, 27 Aug 2019 15:29:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com
Subject: Re: [PATCH v3 02/14] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20190827202945.GA3488@bogus>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 25, 2019 at 03:51:42PM +0200, Jacopo Mondi wrote:
> Document the newly added 'cmms' property which accepts a list of phandle
> and channel index pairs that point to the CMM units available for each
> Display Unit output video channel.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index c97dfacad281..c2265e2a1af2 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -45,6 +45,10 @@ Required Properties:
>      instance that serves the DU channel, and the channel index identifies the
>      LIF instance in that VSP.
> 
> +  - cmms: A list of phandles to the CMM instances present in the SoC, one
> +    for each available DU channel. The property shall not be specified for
> +    SoCs that do not provide any CMM (such as V3M and V3H).

renesas,cmms

Perhaps define what CMM is.

> +
>  Required nodes:
> 
>  The connections to the DU output video ports are modeled using the OF graph
> @@ -91,6 +95,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>  			 <&cpg CPG_MOD 721>;
>  		clock-names = "du.0", "du.1", "du.2", "du.3";
>  		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> +		cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
> 
>  		ports {
>  			#address-cells = <1>;
> --
> 2.22.0
> 
