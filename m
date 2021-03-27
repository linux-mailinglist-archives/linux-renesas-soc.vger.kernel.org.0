Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F1B34B84A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Mar 2021 17:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhC0Qmo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 27 Mar 2021 12:42:44 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:39647 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhC0Qmn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 27 Mar 2021 12:42:43 -0400
Received: by mail-ot1-f45.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so8212017ote.6;
        Sat, 27 Mar 2021 09:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Adu3Op/lND4oC5P4MkNjHnwnlBxB8vPxviuUDes9aI=;
        b=Ids3vT87+HYnXNT/6dImzAk37ltZg9kmQDndSBHqfFgxX+5g9/iw6u3w+X6yrDBzpx
         nLctFy+TvuZNSg0EpIxOxkHIsMDvQWTk65NpsRw8YtO7mQR3ZLUWAQ4m5shDcGwVvYNl
         AQLzkTI4dwkSJXiNXxKKHNSFvQsS3D+/KDUNB+S+WJKIw5zlbxtQilIA9gjiIp5a+AK2
         tVSxcXuaGq+nC06H775uH8ucy1u8K3NbKwesQatOX//c7a3SOrrKHCHmo2JpEafmBCpp
         stDcTnSi1AGWZzCqmaLWv4sGTve32cgjWHASoJFGzmIMdQVPS02Jueqgatb7VVjGK71f
         QC1w==
X-Gm-Message-State: AOAM531NftyZhbUwCvi3KX+JGDlgyi2TvHLdf6VueWJ4RXETEQlDOUlJ
        nP330ked4UP6gfyLyGODtQ==
X-Google-Smtp-Source: ABdhPJxeQIDE4oB/aMKotfQ5MCqdfzWm41e7k0pkVPSry+xOdIxVkeNOaaIsWRPXbRcaRGLKgHA6Iw==
X-Received: by 2002:a9d:3a4a:: with SMTP id j68mr16230064otc.4.1616863362965;
        Sat, 27 Mar 2021 09:42:42 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
        by smtp.gmail.com with ESMTPSA id w7sm2868319ote.52.2021.03.27.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 09:42:42 -0700 (PDT)
Received: (nullmailer pid 220138 invoked by uid 1000);
        Sat, 27 Mar 2021 16:42:39 -0000
Date:   Sat, 27 Mar 2021 10:42:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make
 enable GPIO optional
Message-ID: <20210327164239.GA220109@robh.at.kernel.org>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 22 Mar 2021 05:01:18 +0200, Laurent Pinchart wrote:
> The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
> global reset signal, not controllable by the kernel. Make it optional in
> those cases.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml         | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
