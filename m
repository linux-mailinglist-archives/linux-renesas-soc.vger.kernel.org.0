Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBBAE9AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 20:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbfD2SDx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 14:03:53 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36497 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2SDx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 14:03:53 -0400
Received: by mail-oi1-f195.google.com with SMTP id l203so9085019oia.3;
        Mon, 29 Apr 2019 11:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pfq/OGf1540wVTpJOX//KSeSe9WKnU3x9PJywMOOzsk=;
        b=ZopYD9/OML8aBkHT5pHdnIFjYwYy3Pwx4wd8WhFasHksTh8BIqU7Bk1HdQxn2MBXwp
         uMtTU3JWjfcIcQdNsFKKJwf/aWnlyMRl5jA9VMk3gii10HHt7WvQPGC68AENEUj039yi
         5D4hPUeaPvRiop0byBtG3R1RhQ/TLLbgPcbrCVCacgGu4oYLLWDpDVAN91Q68aM7qrdE
         SvSnCaM2oIHxPVgLNWZWO7pBVqilT9+Ff0TxuVPdpuMgrp3/VmF47Xqu7Jv7pPRyN7im
         QZuoutPHE6dzbrrtVUGl+PDiQs+QdcnVYNQjeyjuihO3fy4c9ppICGtmMqSIwyno50Cy
         UENQ==
X-Gm-Message-State: APjAAAUZHAa0Me5LNCzP52DmBqPtOxSwhwrdZy2XMhc9gxX4T9tibJe8
        XtAOo+w4D0WRsmMC69uNybUxers=
X-Google-Smtp-Source: APXvYqxhjBR2hCYtxG77YtU+IkZb/HBh6lZPWJp05ym+yywWHbwvqUHTkAfaRhD27i4MzCqvhK83sw==
X-Received: by 2002:a54:4f18:: with SMTP id e24mr208480oiy.87.1556561032207;
        Mon, 29 Apr 2019 11:03:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm2467366otr.38.2019.04.29.11.03.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 11:03:51 -0700 (PDT)
Date:   Mon, 29 Apr 2019 13:03:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: Re: [PATCH v2 15/20] media: dt-bindings: media: rcar_vin: Document
 r8a77470 bindings
Message-ID: <20190429180350.GA21853@bogus>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-16-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-16-git-send-email-cv-dong@jinso.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Apr 2019 16:54:17 +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
