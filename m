Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1267241A0DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 22:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236938AbhI0U7O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 16:59:14 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:44904 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbhI0U7O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:59:14 -0400
Received: by mail-oi1-f174.google.com with SMTP id e24so17400419oig.11;
        Mon, 27 Sep 2021 13:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l5Mqh3vIaAE/8zYRBqY+q9GOKFmDCTSjBlpUeQfhV/8=;
        b=sTiKn7ZsngORPazipC07n/0hAySz0XxXabxMp5f+nul7VY0Zjchmgpz7y392IqSdjd
         2JfF9G53SL8yPeLUy3KOe+AV5rPj0SmZUuzHaYWA/HOe5OrIywxfnW9h1uGJq2Pq1K0d
         oeZhMrYYWJJz9Tz7sAsp73qTYef8TBjnnTTbXvTgzzdTehi1TTM6WdYyooZkoOWmCGL6
         pqiOqm8d3p+K1+JrxmmpR2kyBZeDjl2XnQAoxojAZA+xBJwnV6DtwcIXNtK2YlHGjrAo
         UnjT5Gp/hIRWkPsL4wwQ6KGzxtytpJpxgBfpD1lcdxPZTHIGaive+U9wInPLWPSQ4sxD
         Y1yg==
X-Gm-Message-State: AOAM531JNVAYCLYeGgYZ6E5GSv5dGEHVtcjJv5H3nDRkDToY7dBId1u4
        eHlBD6k5hzZ3YMt8D/kuaQ==
X-Google-Smtp-Source: ABdhPJzkBg9e4PP70PY+l6j+F0sfK9E2DP+ra4/sSyP2t4qiM3CxZpWCqQMgfRVKKO0v+4tLIEFDlA==
X-Received: by 2002:aca:32c5:: with SMTP id y188mr814898oiy.163.1632776255590;
        Mon, 27 Sep 2021 13:57:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u6sm2488378ooh.15.2021.09.27.13.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:57:35 -0700 (PDT)
Received: (nullmailer pid 3861061 invoked by uid 1000);
        Mon, 27 Sep 2021 20:57:34 -0000
Date:   Mon, 27 Sep 2021 15:57:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@glider.be>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3.1] dt-bindings: display: renesas,du: Provide bindings
 for r8a779a0
Message-ID: <YVIwPnRxxO0Txm2G@robh.at.kernel.org>
References: <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
 <20210923130138.67552-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923130138.67552-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 23 Sep 2021 14:01:38 +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> v2:
>  - Collected Laurent's tag
>  - Remove clock-names requirement
>  - Specify only a single clock
> 
> v3:
>  - Use clocknames: 'du.0' instead of 'du' to remain consistent
> 
> v3.1:
>  - Require clock-names
>  - Collect Geert's tag
> 
>  .../bindings/display/renesas,du.yaml          | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
