Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2EAE571D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2019 01:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfJYXge (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 19:36:34 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46212 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfJYXge (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 19:36:34 -0400
Received: by mail-oi1-f193.google.com with SMTP id c2so2676736oic.13;
        Fri, 25 Oct 2019 16:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zGcJ7bfctCdlUW4jRyBejRVotK09mQ4mxQ5sxW55+Ok=;
        b=ozIt9+1F78CGsoKuzrP/s6iYw0qv4UkXo6nkoPolQAW/TiUeItvcGM3xnk5GFaDhtX
         EefnyP8GSRye6rf0SDCzJ26Ot1q9YpAQ2mqbrl1HRIQDh6DVsnd7n+fwRYd4CSeRBo+S
         7R9D2VjCqLfqxVjT6vd8jrczHOKIrW21ENvfXJ2BjPvjN8wHr3CzS5J2G4sXoQYwSqIy
         EpdKQrhx9G/J11p+DFls0ThfZlBr3wC/uBZJyPGTbtldvYf+XQT52jBIO0uAj+RX5ly1
         2jPrSfwwC/aX9DqEDt8GkL9ZzTJwX+juTxEn4FeCeM177wlnv8Te14wmTgslMb6OOFwg
         zVgQ==
X-Gm-Message-State: APjAAAWQgCCuA6Fv8aIHKW9kCg4R+oBZH2gYuq/ON/8pGjWdeCSr7RCF
        rAiLm3CKrcgna3eHXen5YQ==
X-Google-Smtp-Source: APXvYqyDvUjg+Vr1NWH5LDuxuu2+wEll9CmzHa5U7i/mJ5HB4WmswhL8J3qYCbo9xDQef1QSAExk2g==
X-Received: by 2002:a05:6808:1d4:: with SMTP id x20mr5196885oic.36.1572046591383;
        Fri, 25 Oct 2019 16:36:31 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b12sm1214085otp.72.2019.10.25.16.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 16:36:30 -0700 (PDT)
Date:   Fri, 25 Oct 2019 18:36:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Mark Rutland <mark.rutland@arm.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-ide@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2] dt-bindings: ata: sata_rcar: Add r8a774b1 support
Message-ID: <20191025233630.GA10027@bogus>
References: <1571822106-16258-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571822106-16258-1-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Oct 2019 10:15:06 +0100, Fabrizio Castro wrote:
> Document SATA support for the RZ/G2N, no driver change required.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> * Prepended "dt-bindings: " to commit title as per Geert's comment
> 
>  Documentation/devicetree/bindings/ata/sata_rcar.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Applied, thanks.

Rob
