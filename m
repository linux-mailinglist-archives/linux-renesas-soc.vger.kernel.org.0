Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15700100DDA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 22:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfKRVig (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 16:38:36 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38399 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfKRVig (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:38:36 -0500
Received: by mail-oi1-f193.google.com with SMTP id a14so16812417oid.5;
        Mon, 18 Nov 2019 13:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pCxQjBITmvqLnVSUQjs1CPX2mZzwD2s3GOOnzs0YZMI=;
        b=FpF/Ib6DmHj1nC3jNULaWhsGB0UT5bbrOpYXQcHasCNh9ThRc80bTzIXtUHEJnihBg
         38Uwr56zvdBKG1NBLhRa0WYIdqmBCeaZY7kdmfLgxfwlSS1BDKDPHmpNqZbC3Y1plRUW
         KKPvjqzIrFH+SeYheOSPCqIPbX7GV+TcHeSz+K/cLBj/KQ0iCcDSKelG/DdrovJ1V0eL
         mPHydzU65uWCgwcRM8D4FEXyxP0Vil+23jXFi6y3ZZxq4DS3aBh8gxzuJcUD1fsfTswM
         s3mM/5vRrgMEoCPS10NREprFf8/H4ASMsgcrajCTde3E8cSKt40k4tNYnxAKp4rcKXW3
         PcFA==
X-Gm-Message-State: APjAAAXSgiUuPNA9hPmsSX/SOtHSYBV5VSxurOjiSBpYsKABM0JJQbwG
        DQmW/8KqXQtck2IcmB0f8Q==
X-Google-Smtp-Source: APXvYqzSuqFp/B1swfguly5hmQtRXYxJLr4k7XHGsoFJa2jueuZF7o+LMcHgFPChBi+B6fK3kLjB9w==
X-Received: by 2002:aca:320a:: with SMTP id y10mr946034oiy.152.1574113113674;
        Mon, 18 Nov 2019 13:38:33 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i12sm6636202ota.10.2019.11.18.13.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 13:38:33 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:38:32 -0600
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
Subject: Re: [PATCH v4 04/13] dt-bindings: display: bridge: lvds-transmitter:
 Document "ti,sn75lvds83"
Message-ID: <20191118213832.GA5885@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 13 Nov 2019 15:51:23 +0000, Fabrizio Castro wrote:
> Compatible string "ti,sn75lvds83" is being used by device tree
> rk3188-bqedison2qc.dts, but it's not documented anywhere, therefore
> document it within lvds-transmitter.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * New patch
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
