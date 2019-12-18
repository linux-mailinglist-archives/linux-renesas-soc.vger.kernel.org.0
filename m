Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31822125319
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 21:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfLRUVD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 15:21:03 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35726 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfLRUVD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 15:21:03 -0500
Received: by mail-ot1-f66.google.com with SMTP id f71so4007817otf.2;
        Wed, 18 Dec 2019 12:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tQKtiXC+t8LkKiCGY5jF8pByY/MVJl26QOwr16m+aeE=;
        b=op4JOLZxaye/zR4CqmKkpoRmKt5xj7ehqM+IODsD7BdUYmTIjDw4e58AyFVRuwwMQO
         rZ5/9edrizM+0ULmx6YfCs12ONukLexaPGYqPFbASm4BmBtAkhyFG5LHudSnDpjUvoe2
         uK3cZ84Lo2JFUVVst1q8qXQEP1PCkg++s3q/484uOP6J42oVCaoBBq8gfqY9ZBvZSMHA
         v6/oPcBNAu3ASxzIZeDvBYDOARKaR6OuBJjmlKTOtks/rnWbdNFjPt/h4JQO2rJhiqsg
         BrMH2OmRyXV3CiGg2AiAD8dE71JbCDN05ZwL/zfEqeAwUCdNbvXpBCy96WSQXxvRCcZB
         +2bA==
X-Gm-Message-State: APjAAAUk7uS8nhkwmtTpkYycxv3ETFFPFjePhRnwBV+bTZVQLcDLfbUz
        SAUHBl+Z4RekSV+FwvmIhw==
X-Google-Smtp-Source: APXvYqxWRPBfS3GhJdMaRpzvv6ODhgDAS/e+vbund8AbAoO3PbSqP7jRSoCfO885vYQ0b8Q5qPG4Tw==
X-Received: by 2002:a05:6830:13d9:: with SMTP id e25mr4465804otq.134.1576700462071;
        Wed, 18 Dec 2019 12:21:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 91sm1198636otb.7.2019.12.18.12.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 12:21:01 -0800 (PST)
Date:   Wed, 18 Dec 2019 14:21:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Subject: Re: [PATCH v6 5/6] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20191218202101.GB7282@bogus>
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1576590361-28244-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576590361-28244-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 17, 2019 at 01:46:00PM +0000, Fabrizio Castro wrote:
> Add binding for the idk-2121wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> v5->v6:
> * No change
> 
> v4->v5:
> * No change
> 
> v3->v4:
> * Absorbed patch "dt-bindings: display: Add bindings for LVDS
>   bus-timings"
> * Big restructuring after Rob's and Laurent's comments
> 
> v2->v3:
> * New patch
> ---
>  .../display/panel/advantech,idk-2121wr.yaml        | 128 +++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> new file mode 100644
> index 0000000..24cd38b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: GPL-2.0

Also, dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)
