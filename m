Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CFD1C60D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2020 21:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbgEETLC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 May 2020 15:11:02 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38657 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgEETLB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 May 2020 15:11:01 -0400
Received: by mail-oi1-f196.google.com with SMTP id r66so2990791oie.5;
        Tue, 05 May 2020 12:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sPZdlJTtTRQJiLlibAWVzC2KCD6dgBidSCLi0OcybB8=;
        b=SAEN4BFeT97B2+GOrt+S6+hpZTjCCZbrSs0thzBkd+3vwRoLo0yGlMDnF559HuQp91
         5QOMqt16Tfhz0D1M2eZ2Pt2dAianqd84PQsFAW3jTTggYv2ogVym1FaiaP4WkgNlcUez
         yyY2gyCrDoTOYplAcDtS56kS5veE4by2wbGcF02yna1k4heseit6OHPbOno+NBuumZAz
         wWd59AvD1pOkCVijCp6eLQ+K65zOkElYKRZSN/oMTYdbeaeQqCF3wcEmcbUquQycBDiN
         UM0oktnriTK2fAF9ghlc7Rycm28kcVASNJ8o+SDcWywLqQf2CP0SVc+cP/abDwGNxaks
         kf8w==
X-Gm-Message-State: AGi0PuYCezJxKOUabyxywNGX2/DHe9emS34t5ADnCVxQPDiWPeB2VXVJ
        FUjhdiJ3CiUVn+S8B8qn9QAmhno=
X-Google-Smtp-Source: APiQypIXGxmvcD4gphth8NXIPfPGvEQixA24pgsZd0empG7WGJlIZgA64cPSpqiIpycAgPTrfluZQw==
X-Received: by 2002:aca:53cd:: with SMTP id h196mr84159oib.104.1588705860814;
        Tue, 05 May 2020 12:11:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y2sm799299oot.16.2020.05.05.12.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 12:10:59 -0700 (PDT)
Received: (nullmailer pid 25300 invoked by uid 1000);
        Tue, 05 May 2020 19:10:58 -0000
Date:   Tue, 5 May 2020 14:10:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, robh+dt@kernel.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v5] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to
 json-schema
Message-ID: <20200505191058.GA25129@bogus>
References: <1587446152-23886-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587446152-23886-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 21 Apr 2020 14:15:52 +0900, Yoshihiro Shimoda wrote:
> Convert Renesas VMSA-Compatible IOMMU bindings documentation
> to json-schema.
> 
> Note that original documentation doesn't mention renesas,ipmmu-vmsa
> for R-Mobile APE6. But, R-Mobile APE6 is similar to the R-Car
> Gen2. So, renesas,ipmmu-r8a73a4 belongs the renesas,ipmmu-vmsa
> section.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v4:
>  - Fix description about cell counts on #iommu-cells and renesas,ipmmu-main.
>  - Fix node name on the example. 
>  https://patchwork.kernel.org/patch/11494231/
> 
>  Changes from v3:
>  - Fix renesas,ipmmu-r8a7795's section
>  https://patchwork.kernel.org/patch/11494079/
> 
>  Changes from v2:
>  - Add a description for R-Mobile APE6 on the commit log.
>  - Change renesas,ipmmu-r8a73a4 section on the compatible.
>  - Add items on the interrupts.
>  - Add power-domains to required.
>  - Add oneOf for interrupts and renesas,ipmmu-main
>  https://patchwork.kernel.org/patch/11490581/
> 
>  Changes from v1:
>  - Fix typo in the subject.
>  - Add a description on #iommu-cells.
>  https://patchwork.kernel.org/patch/11485415/
> 
>  .../bindings/iommu/renesas,ipmmu-vmsa.txt          | 73 ----------------
>  .../bindings/iommu/renesas,ipmmu-vmsa.yaml         | 98 ++++++++++++++++++++++
>  2 files changed, 98 insertions(+), 73 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
>  create mode 100644 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> 

Applied, thanks.

Rob
