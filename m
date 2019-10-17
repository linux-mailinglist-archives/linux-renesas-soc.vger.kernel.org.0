Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C20ADAF41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2019 16:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394768AbfJQOKh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Oct 2019 10:10:37 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39551 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbfJQOKg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Oct 2019 10:10:36 -0400
Received: by mail-oi1-f195.google.com with SMTP id w144so2258408oia.6;
        Thu, 17 Oct 2019 07:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JUCnmISg9Lo1ZQ+QCRXqmsIfbsyyJ8LBPqArNDz2z6I=;
        b=aOoMA3T0DNAecyZR/lI7IYBpeWNMLs5Q84QGk8/m3bwFi1icvIUevkef3W2anr/XTm
         PelWdnpgbhtEF0J1YHoLvHC1+wOBsk+x0WWJl1zdh3Tf6y7TtEElzYhOtmbD1bCHBwp8
         mfGD9rXskLZpHJb0xvra62VOnGuEdfqK5t1uZgi8HdrtNNsXk7eN7ETD3Q9S5zaYFM1F
         qJX33GC655axHNzt9tL/53XYKUin+dvVs2thCy7rrIO6KZQClcB/kjkBMKq/cENdZA8s
         vvtYU620KRqzTGMgdd+dFgr8e2xWtdGpHvVT908qrj8E67KiDggE8wtCDBXgiwRksqxE
         KG4A==
X-Gm-Message-State: APjAAAXSIT8INFLfmgpvtzBbg9QfsHKlVxmJdTvj9OZ3ChbgnPizafb/
        kBcI2lCpUxNABscNZMZ3XQ==
X-Google-Smtp-Source: APXvYqzDwlaHjxT+MIqCZeMtMjgTyWz8EjeESsVfinAxFG8Pf1W0gxmhQtgmXwqjUlGyzfAxEhO9jg==
X-Received: by 2002:aca:5c82:: with SMTP id q124mr816444oib.19.1571321434424;
        Thu, 17 Oct 2019 07:10:34 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t17sm617415otk.14.2019.10.17.07.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 07:10:33 -0700 (PDT)
Date:   Thu, 17 Oct 2019 09:10:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, airlied@linux.ie,
        daniel@ffwll.ch, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Subject: Re: [PATCH v6 1/8] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20191017141032.GA23925@bogus>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
 <20191016085548.105703-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016085548.105703-2-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 16 Oct 2019 10:55:41 +0200, Jacopo Mondi wrote:
> Add device tree bindings documentation for the Renesas R-Car Display
> Unit Color Management Module.
> 
> CMM is the image enhancement module available on each R-Car DU video
> channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/display/renesas,cmm.yaml         | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
