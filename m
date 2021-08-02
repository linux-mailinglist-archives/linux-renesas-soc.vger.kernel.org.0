Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579213DE291
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Aug 2021 00:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbhHBWhw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Aug 2021 18:37:52 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:37687 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbhHBWhv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 18:37:51 -0400
Received: by mail-il1-f171.google.com with SMTP id f8so14651644ilr.4;
        Mon, 02 Aug 2021 15:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iusIdSGsnA+AqpZNVzpAfNq8YSbNcjn9LXrv0H+wAUU=;
        b=oX5U8IHE9YbobUwz9mSz+3YDlNhMZtJp5GVVR1X25bqKhNOiWyrePwVtocm3Ep1SWo
         kh7OSkpFvBmo+3v/3JcKlos2Ro6MJz1t0B0Qt+6OtOEHlnMl9vFOgiurtyYBNH+5ks9g
         upuaP2kmLxAtamuFJPJSI0tGm2cQt/lhyCNM0IMXzoeW3xHukqGsRwpMgAMK7ak+6rSf
         xxIdHwS/0c6a8VrMn2CXVLkYRed3BZxs8BbjkvO/7n20EwHrxmm4PkUDHj2Jh+2ui/bF
         z6lhE/OoRO/Qu+SL2YfEob4rOh+PGPbiNJWHWZL0V0YLOm2HZm89yHlUF9WNzjbOjiui
         SROQ==
X-Gm-Message-State: AOAM5323ay15fu75BUGQib4snR8doau9pHUEmD53+0tdbOTb1zVXP+PX
        31X5chMn+eNcOSUkhgOuu7eJD4QfGg==
X-Google-Smtp-Source: ABdhPJyjyx97xDi/IQCrhvK6Hz2bT29AuvbNyRbkqJgBgbWqakmyYMijP5rtJPtfMULEWh9whclvkg==
X-Received: by 2002:a05:6e02:5cf:: with SMTP id l15mr4004268ils.90.1627943860470;
        Mon, 02 Aug 2021 15:37:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z10sm6305530iln.8.2021.08.02.15.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 15:37:39 -0700 (PDT)
Received: (nullmailer pid 1750591 invoked by uid 1000);
        Mon, 02 Aug 2021 22:37:38 -0000
Date:   Mon, 2 Aug 2021 16:37:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RESEND] [PATCH v2 1/2] dt-bindings: display: bridge: Add
 binding for R-Car MIPI DSI/CSI-2 TX
Message-ID: <YQhzsjCheZByFHyS@robh.at.kernel.org>
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
 <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 28, 2021 at 07:26:39PM +0300, Laurent Pinchart wrote:
> The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> can operate in either DSI or CSI-2 mode, with up to four data lanes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> Looks like I forgot to CC the devicetree mailing list and Rob Herring on
> the first try. Resending, sorry about that.
> ---
>  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

BTW, b4 doesn't like your message-id.
