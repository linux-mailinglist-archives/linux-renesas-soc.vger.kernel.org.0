Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBAAB37EE6C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 May 2021 00:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344225AbhELVnI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 May 2021 17:43:08 -0400
Received: from mail-oo1-f48.google.com ([209.85.161.48]:46748 "EHLO
        mail-oo1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385286AbhELUIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 May 2021 16:08:02 -0400
Received: by mail-oo1-f48.google.com with SMTP id v14-20020a4ae6ce0000b02901fe68cd377fso5208665oot.13;
        Wed, 12 May 2021 13:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V79K7EYHwh4vwW2Epus8hykY/hGr5rIoY6s4Gv58GmQ=;
        b=oO09ZhUyX2XC9f5Hdu4jVfIIjMCv2OOaBFDmPkxTkHh1A5gLx312WT0i+23TjUqJx1
         KHu6gZW/H+ctSBNJNOOTH8eeKE0qJnhxmEPl2aM9eMV7Ce9GsgLNQlCBVGVG7knb2XBQ
         KLloBTUh9igqB22KnuAV07/0xCX785ti6DP4Tm90p+H0mzCRYcaPn84jcdiVQIrJwxiS
         U5g0g89+MW+sxTnEK/LIEYTiwH/gelA0rKuSYsI4A8xMB4SOJnb5YN7w4hfsYtLUiZWU
         T6NhYIQ3x5P5gKn5lCn0LkZ7BMYvMRV9h146M8jzrReG4WaksUquViyb2VbSBi9A7AIy
         7vBA==
X-Gm-Message-State: AOAM533EOjDQzxwO670A4FR1opi3bbLzXI6bnL3Ztgs1Ere4ee1JlvJ7
        CTfUZHiWnmbfvdqxeCFeBQ==
X-Google-Smtp-Source: ABdhPJw5X/WSyRAOB6/qwI3+01jKj0Twy0yV884K/cAxmrCSwH4FZSWYdBAzA3pf+oB93iF8MVLi0g==
X-Received: by 2002:a4a:9b0b:: with SMTP id a11mr5570041ook.73.1620850013581;
        Wed, 12 May 2021 13:06:53 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o80sm215040ooo.41.2021.05.12.13.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:52 -0700 (PDT)
Received: (nullmailer pid 2496314 invoked by uid 1000);
        Tue, 11 May 2021 19:50:32 -0000
Date:   Tue, 11 May 2021 14:50:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: phy: renesas,rcar-gen3-pcie-phy: Convert to
 json-schema
Message-ID: <20210511195032.GA2496284@robh.at.kernel.org>
References: <0301c3a7dae9afde115b6437a11c23ab85cb8b75.1620648490.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0301c3a7dae9afde115b6437a11c23ab85cb8b75.1620648490.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 10 May 2021 14:10:40 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Gen3 PCIe PHY Device Tree binding
> documentation to json-schema.
> 
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I have listed Sergei as the maintainer, as he wrote the original driver
> and bindings.  Sergei: Please scream if this is inappropriate ;-)
> ---
>  .../bindings/phy/rcar-gen3-phy-pcie.txt       | 24 ---------
>  .../phy/renesas,rcar-gen3-pcie-phy.yaml       | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,rcar-gen3-pcie-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
