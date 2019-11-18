Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72EC6100DD3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 22:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfKRVgM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 16:36:12 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34810 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfKRVgL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:36:11 -0500
Received: by mail-ot1-f68.google.com with SMTP id 19so6002796otz.1;
        Mon, 18 Nov 2019 13:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/0BIKn+o96RBSpk8ZHTuKqS7BjRkQHseFrb4HN/n6hM=;
        b=MtJhOo9S0T9DsAlXODgiUB/T+Myj/hDg3VMMAUbFHohti0Tow+6PiAxTikiuOfhuiv
         xLK41J0wNKUofsXpIFvMksusPW+2b4NH3qqdVpDWcVAp4T9yj2FaCOFE+94h2JNsklSV
         8f77YWh201KLfj8B0VeWrf5uxcjuXcZFtW4BUqwocQhMmfZUsKRp9QJdh7k8n7N/8RNO
         sRz4qy95OdWQLAUEm430B6tDc2EY2ziq3ME3LX26BFITKwBiWpoCK0XxiH5AtwVarN2K
         koVk121I3AVkUEEzWKFtGFgMvwJDjFYnYMVF5KOObIKfhHw6s3gUc6PmSVg2xwK0tiCW
         N56w==
X-Gm-Message-State: APjAAAVWptX0hDjvledoPJrAEesn35np33ToNTvUx2VsVGV5OCSd+2sf
        HEIKSJ3qAIz30jQ4HWhf4A==
X-Google-Smtp-Source: APXvYqwmIGg/mph+M+CHBdotYlMsPFBa2R7uinZCHzD9Ud0o5hIMrJlVslhdtsHPYuitryawEvTPaw==
X-Received: by 2002:a05:6830:224c:: with SMTP id t12mr1012564otd.299.1574112971130;
        Mon, 18 Nov 2019 13:36:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n204sm6495968oig.15.2019.11.18.13.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 13:36:10 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:36:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 02/13] dt-bindings: display: bridge: lvds-transmitter:
 Document powerdown-gpios
Message-ID: <20191118213609.GA1484@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 13 Nov 2019 15:51:21 +0000, Fabrizio Castro wrote:
> Add documentation for property powerdown-gpios. The property is
> optional.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * New patch
> ---
>  .../devicetree/bindings/display/bridge/lvds-transmitter.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
