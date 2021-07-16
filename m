Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DC73CBB8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jul 2021 20:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhGPSDy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Jul 2021 14:03:54 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:37656 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbhGPSDx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jul 2021 14:03:53 -0400
Received: by mail-io1-f51.google.com with SMTP id r18so471873iot.4;
        Fri, 16 Jul 2021 11:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BQfg6bk1Rki9URomuLmaOYZJZmzHHE0q6T5kl0dqKzc=;
        b=OZtfiyD0XOHIZ1P/KnKDwRWTPnQzVsF0KnHsCnKUS1pohsqebNNRk+Pf+9lmB3mIm0
         itXSsk4aGw2fJNSqguGroi+mPyLTVITkaqnvJ/oSCAtCaU+ZT6hhEUXzHSWTpLJUSdQ7
         p3yQ8DRNLHJW5BQquhIdCupSeCa4gwrLWQJBSjH6R1ejoALYUrux0ynp/aquSGfddyw8
         AZNXkWoNWkxQcbQINKAmBgSv+Sxp6UPGAMD7dhIUU36ILNhGpNv3IsPyTkvFJubn1vov
         bN6nImV5oVlMP2gDmmecQQSzT/vbksMI+7XJCYlyLvUW7ii+6/5lnVBsMY0FRhUD0Ws/
         7FRQ==
X-Gm-Message-State: AOAM530nf1dvVi40T1bQPfJcn0fE68gST+H1xX8kfvhyx8Ci8Hl6sDHZ
        dU3Zc0gxGf5h6TSIxFHbnQ==
X-Google-Smtp-Source: ABdhPJxa2Fz8IfViDN38tLukY0ZzwaZsIaURYqO0PCSn2LSrQ1SuNn5oEzbxXaNpvO7fXpXb4YHFzQ==
X-Received: by 2002:a5e:a908:: with SMTP id c8mr8269101iod.116.1626458458501;
        Fri, 16 Jul 2021 11:00:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 204sm5475213ioc.50.2021.07.16.11.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 11:00:57 -0700 (PDT)
Received: (nullmailer pid 3684041 invoked by uid 1000);
        Fri, 16 Jul 2021 18:00:54 -0000
Date:   Fri, 16 Jul 2021 12:00:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2] dt-bindings: display: renesas,du: Make resets
 optional on R-Car H1
Message-ID: <20210716180054.GA3683980@robh.at.kernel.org>
References: <98575791b154d80347d5b78132c1d53f5315ee62.1626257936.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98575791b154d80347d5b78132c1d53f5315ee62.1626257936.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 14 Jul 2021 12:19:36 +0200, Geert Uytterhoeven wrote:
> The "resets" property is not present on R-Car Gen1 SoCs.
> Supporting it would require migrating from renesas,cpg-clocks to
> renesas,cpg-mssr.
> 
> Reflect this in the DT bindings by removing the global "required:
> resets".  All SoCs that do have "resets" properties already have
> SoC-specific rules making it required.
> 
> Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
