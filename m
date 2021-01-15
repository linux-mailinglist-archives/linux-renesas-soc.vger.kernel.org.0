Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF4B2F813C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 17:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbhAOQvW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jan 2021 11:51:22 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:42864 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbhAOQvW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 11:51:22 -0500
Received: by mail-oi1-f171.google.com with SMTP id l200so10162148oig.9;
        Fri, 15 Jan 2021 08:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5fLN7OulXncVQApei3ublkkTNVRLPQFG9EYgq/5LsEY=;
        b=WQ6m5hWYjyEqtlUWvjF149iwNiPxq8RWiLfhawfv0Qh/VnEoXftZ9ldGkkGiQTviji
         kk+DDTiV21sZAjCNJ+jJqrHJP4FI/aN4KM4YWYH0svalRb4u3x38peRtjOi/v0pE+G1l
         ChfZgz39p0E19/6E7OUs7gBz51gqLCOVWJIW76fgRHgcuvckXE0o/aQZbp5uWG4iDxNH
         1ox+ZzDfkThwzD16DOQE8tJD7KYdSNF/oUJ5giqJm4HoSIHgaWrZU81EWoh5tSooOeDX
         OI+JHTMVWQCHo9eFaPmY/vOyMGOqyY8pZc/FwIpOZzNfhxxdylN4vMeH8fdXMVIRS5iX
         O0/A==
X-Gm-Message-State: AOAM530o08YzgAaDcYQNvBk3IZ6RT7EcnhNBTaHtr7eXM0sxtEY9mCBw
        c3Lha0j34jn66I9mkdmqYeMONH+bDA==
X-Google-Smtp-Source: ABdhPJyWVaI+1oubphuIPiK+3CWSN1uLPvtMMc/tQUOhs4fBs8IFxhHO1oH4JJo3TZe4FonyuohtsQ==
X-Received: by 2002:a05:6808:253:: with SMTP id m19mr6041849oie.34.1610729441177;
        Fri, 15 Jan 2021 08:50:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a15sm1735753oii.50.2021.01.15.08.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:50:40 -0800 (PST)
Received: (nullmailer pid 1434041 invoked by uid 1000);
        Fri, 15 Jan 2021 16:50:39 -0000
Date:   Fri, 15 Jan 2021 10:50:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Mark Yao <markyao0591@gmail.com>, devicetree@vger.kernel.org,
        Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: display: rockchip: dw-hdmi: Convert
 binding to YAML
Message-ID: <20210115165039.GA1433984@robh.at.kernel.org>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210114064437.5793-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114064437.5793-6-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 14 Jan 2021 08:44:35 +0200, Laurent Pinchart wrote:
> Convert the Rockchip HDMI TX text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v3:
> 
> - Replace endpoint-base with endpoint
> 
> Changes since v2:
> 
> - Use Mark's @gmail.com e-mail address as the @rock-chips.com address
>   bounces
> 
> Changes since v1:
> 
> - Drop pinctrl-0 and pinctrl-1
> - Use unevaluatedProperties instead of additionalProperties
> - Drop reg and interrupts as they're checked in the base schema
> - Rebase on top of OF graph schema, dropped redundant properties
> - Fix identation for enum entries
> - Tidy up clock names
> ---
>  .../display/rockchip/dw_hdmi-rockchip.txt     |  74 ---------
>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 156 ++++++++++++++++++
>  2 files changed, 156 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
