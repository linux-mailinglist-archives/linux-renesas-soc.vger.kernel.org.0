Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C39BCF2374
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 01:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732784AbfKGAou (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 19:44:50 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34682 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732730AbfKGAot (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 19:44:49 -0500
Received: by mail-oi1-f194.google.com with SMTP id l202so460407oig.1;
        Wed, 06 Nov 2019 16:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0A6Sl7zSjHp0Gn3fGjWaLM1DGcUnZEOa8sMsOQfIiPU=;
        b=t22UPpwhYxTq13KRKfcuj4aSjuZLiE63ZcNaddIoPf0xTGx+ELcJs3bJI3L3HM7Z84
         EeCJn5ALhZ0+ZRqI/pF3/NdNUpE2wxlmsg61aGWj6NQ+Sqo5EqIeaeAhiqrY8Nr88FTU
         BBiLCdr3XWocCnHlogYVKREL8CyrttKya6nCVq21B8E9E5yuYHbq2e93BqwDozyTKfik
         nSGqf8qlX/nQQA7FLd6Yi2SG85qf9w3NfuhA/LBh4ouzsvSPpd6TQHx3ISdXc5pAenF+
         CKNo2k0k2R/kCvMVsYuaf9WFLIVFIZA5LPqozVZUOzd/8CtIQD8E3lpz3P+I2hYFTJk0
         ZMbw==
X-Gm-Message-State: APjAAAX6eaJLZxysqAzV37NwSMN/Ns8wbR/1AhbivtT6LfrF43LdKtqJ
        sG+2gzcIcoJuVhw3AOxYVP3qaDI=
X-Google-Smtp-Source: APXvYqyfsqvPVgFUWcwXVoPnoSlHymygFq5/jTwO77h/Hv9a1kU1pcDbot6gwp0R/54F7mjEIf2REA==
X-Received: by 2002:aca:1101:: with SMTP id 1mr772110oir.103.1573087488847;
        Wed, 06 Nov 2019 16:44:48 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a9sm202045otc.75.2019.11.06.16.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:44:48 -0800 (PST)
Date:   Wed, 6 Nov 2019 18:44:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/3] dt-bindings: display: renesas: du: Add vendor prefix
 to vsps property
Message-ID: <20191107004447.GA14493@bogus>
References: <20191105183504.21447-1-geert+renesas@glider.be>
 <20191105183504.21447-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105183504.21447-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue,  5 Nov 2019 19:35:02 +0100, Geert Uytterhoeven wrote:
> The Renesas-specific "vsps" property lacks a vendor prefix.
> Add a "renesas," prefix to comply with DT best practises.
> 
> Move "renesas,vsps" below "renesas,cmms" to preserve alphabetical sort
> order.
> 
> Fixes: 06711e6385a4ab4c ("drm: rcar-du: Document the vsps property in the DT bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/display/renesas,du.txt       | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
