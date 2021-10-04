Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72CB4214AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Oct 2021 19:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237495AbhJDRDy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 13:03:54 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:39456 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236018AbhJDRDy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 13:03:54 -0400
Received: by mail-ot1-f44.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so22433827ota.6;
        Mon, 04 Oct 2021 10:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z8bpX5ohfnGv7NG36iJlZFsfoAswAuM/dfneaZYCWlc=;
        b=BW0GbdQfEwvME+IQcjs6ntrrzzuWBZJ7ZL0AlgRBf0+k+Gl0C/ndIO+TI/CCVD2KrU
         KiLUPsq1FkH6gdUMGDw7TnycH6i8VdNg6Wk0WKhog2BVPOIyVUd/BzY1Jne0tcPaC1ue
         GZeKR/M2cCjWWhIaH1T0gZmjH0AENyYWZhOXona9bW3CF3XkPnLZEuIdogdjrzuv8/Qe
         mU4e7az8X5K6gg15NwEOtxcA7xK73ptlAbozYtVin9Nz33XrSOUHsrE9WjiqvrU/9XET
         OJCNoSIghDhdmlsdQY/JhJ6dPRL72KCOXsGcuXz4Hmbk+/oquW2Wl3zhygvjKtiJyeue
         7g2g==
X-Gm-Message-State: AOAM533zDONekOKZpcOXDhtx0GXk1o0rv8kEm0HB4kBHQvBQV2jJRMfw
        pjNlcN7+mhWbaiMcUiL/yw==
X-Google-Smtp-Source: ABdhPJxJSYblX7JkA85U0CFTxkDI1xiwSypwDUBERIDrrr6PccL+U6MR2gBqou0mYj1RzK5yhsT2RQ==
X-Received: by 2002:a05:6830:4089:: with SMTP id x9mr10314313ott.223.1633366924827;
        Mon, 04 Oct 2021 10:02:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f61sm2994889otf.73.2021.10.04.10.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 10:02:03 -0700 (PDT)
Received: (nullmailer pid 1477065 invoked by uid 1000);
        Mon, 04 Oct 2021 17:02:03 -0000
Date:   Mon, 4 Oct 2021 12:02:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Panda <spanda@codeaurora.org>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix reg value
Message-ID: <YVszi+keVlkqSfYY@robh.at.kernel.org>
References: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 24 Sep 2021 14:35:12 +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml: bridge@2c: reg:0:0: 45 was expected
> 
> According to the datasheet, the I2C address can be either 0x2c or 0x2d,
> depending on the ADDR control input.
> 
> Fixes: e3896e6dddf0b821 ("dt-bindings: drm/bridge: Document sn65dsi86 bridge bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Also seen with the in-flight Falcon DSI display output patch:
> 
>     arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: sn65dsi86@2c: reg:0:0: 45 was expected
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
