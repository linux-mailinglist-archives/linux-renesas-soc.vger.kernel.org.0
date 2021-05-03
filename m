Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51D137220C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 May 2021 22:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhECUx5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 May 2021 16:53:57 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:36683 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhECUx4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 May 2021 16:53:56 -0400
Received: by mail-ot1-f54.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso6354734otn.3;
        Mon, 03 May 2021 13:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f8RDeY6rU/O7UGBkZst+Pj0wnhGP4S/ZmW7eY0KJBR4=;
        b=SrDRHq4tuqBD6Au94xBb2p+5AOy1klHR1TDM3teFNF6KIqaKykt27K8Q91oFdf2IWm
         7ljC5ioZ2d1x/UR9/41aGKGsSU/wZ/l7jv8zlQdsfQkTkZYD0F+eQ1TnuJSODvJOyFQI
         gIDbdDGRpZW+fv0XmTqZ/idq3m0AHfevhM2yBVU25cNasS9D3wBZV3gEwwfuseCHWs5N
         heG6/cHDibqRj97ux8o1lJbqKwLeCxsST2+3F0XN5tEUB7/9BnfUnKcwAV/wXSYdoe0p
         sznbqTfoVSjtAlVuqoPtSt0+PJPOacrMmvF2hYVz5/YgU3GVzbAaA9izFMBL2ciwOSXW
         2CXQ==
X-Gm-Message-State: AOAM530v3flqumrO7O8hXVjy+z8GFUTHTAjsaOGSae/fltYDC1RXRSqM
        wv7iC1hGyl6AucJpsZr6DU5OPlvMPQ==
X-Google-Smtp-Source: ABdhPJyYx+D8CXse8tsdmIgX0/OVAOGsEQfvIZJ8AUeEtlp4tZwUkm+8LzFXK2YD1AMNdOTB6ObF9A==
X-Received: by 2002:a9d:b87:: with SMTP id 7mr16356866oth.107.1620075181880;
        Mon, 03 May 2021 13:53:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z9sm230382otj.44.2021.05.03.13.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 13:53:01 -0700 (PDT)
Received: (nullmailer pid 2380104 invoked by uid 1000);
        Mon, 03 May 2021 20:53:00 -0000
Date:   Mon, 3 May 2021 15:53:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display: renesas, du: Add missing
 power-domains property
Message-ID: <20210503205300.GA2379757@robh.at.kernel.org>
References: <600d42256515f180bc84b72e8bdb5c5d9126ab62.1619700459.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <600d42256515f180bc84b72e8bdb5c5d9126ab62.1619700459.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 29 Apr 2021 14:47:56 +0200, Geert Uytterhoeven wrote:
> "make dtbs_check" complains:
> 
>     arch/arm/boot/dts/r8a7779-marzen.dt.yaml: display@fff80000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>     arch/arm64/boot/dts/renesas/r8a77970-v3msk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>     arch/arm64/boot/dts/renesas/r8a77970-eagle.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>     arch/arm64/boot/dts/renesas/r8a77980-condor.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>     arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fix this by documenting the power-domains property.
> 
> Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!
