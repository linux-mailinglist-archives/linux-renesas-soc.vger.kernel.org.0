Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64AB31A8EF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 01:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441029AbgDNXLZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 19:11:25 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39619 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441018AbgDNXLW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 19:11:22 -0400
Received: by mail-ot1-f66.google.com with SMTP id x11so1530969otp.6;
        Tue, 14 Apr 2020 16:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uQbA1hm4F1ECx3Q8+dWpAWgcwSDF1dFS3d3ZIaptT0s=;
        b=DB+mBfYobMoaRdKaeemG2Q+iQOYlDdFnCv1P+j7Y0Fn5/z+SW50st5Q0ia8dBJltsE
         MqYWKxDyofYFgDEVh09THB/xPjOHpa1duij6TFlgV5Y6zTIwriclfRxRdXIdV1v+Frsa
         qQwcPz+4Gb3IwbnyXU/pvKsLWQW6OwWc2lrqv1K6RVVP2VMaLXbMMa1c5qrcwFxTT3uM
         I9wc+Qa8ne925YtCiy/U4uxOG4xpSY+yAO1R6wR5vLAp8lRPnf3BFGuGf+bh5caLwzKC
         tDNDsDH3JqdDw2k/5za9POGcXt6tbiufvb/+nu9od2B/f9gFmU/azQJrkO2rzt/fJzpi
         j9CA==
X-Gm-Message-State: AGi0PuZ1gwE1+DPLrm68YlUZjHGeB9XVkvrqXLkl54zSY7OQxsJJs0yh
        x7V6ztt401/iPGi1OJbk4A==
X-Google-Smtp-Source: APiQypK8ZzZ8C2d2xHIP7/hVcEIpx48D8sjnAVUS4VjaxOXBvRO5TMBQWpnOXEbSUqJLeeI5tihRSg==
X-Received: by 2002:a4a:e151:: with SMTP id p17mr16389352oot.28.1586905879376;
        Tue, 14 Apr 2020 16:11:19 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p130sm5952795oig.51.2020.04.14.16.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 16:11:18 -0700 (PDT)
Received: (nullmailer pid 6378 invoked by uid 1000);
        Tue, 14 Apr 2020 23:11:18 -0000
Date:   Tue, 14 Apr 2020 18:11:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <mark.yao@rock-chips.com>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH/RFC 6/6] dt-bindings: display: bridge: Remove deprecated
 dw_hdmi.txt
Message-ID: <20200414231118.GA6328@bogus>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200405233935.27599-7-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon,  6 Apr 2020 02:39:35 +0300, Laurent Pinchart wrote:
> dw_hdmi.txt has been replaced with synopsys,dw-hdmi.yaml, and all
> references to the old file have been converted. Remove it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/dw_hdmi.txt       | 33 -------------------
>  1 file changed, 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
