Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD4D6100DCC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 22:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfKRVfw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 16:35:52 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46531 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfKRVfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:35:52 -0500
Received: by mail-oi1-f196.google.com with SMTP id n14so16762813oie.13;
        Mon, 18 Nov 2019 13:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Sl6UvL1270xzdCJiWSFRDVSctMprL75mgthNeZrpY4g=;
        b=qdoV2nmn9q/2H/2azl9TN8rnaq1BzpCbtfgOrRH23XPseFkmiu+koGrk5ohgwmedby
         E1JG9JO7LwWco8iJOwLJx82moe58agm2pD47wsyuNl3yPoUhCBki2xTq0aXJVwXiBp+k
         3MG5ouyPWWpJqkCXw93BjxKavHdxDRVd8WHwst37BW1JhQN2S08ah5kHe2ej/UvyCXcY
         4AYIW6LffrQPARmysOI6ZN8Ro7MHExGnHDte721OT+c7iGcDbGVHIJWYTIS3TMY2jZoG
         uNq+RhWLQqUaRpN2ST5Id7EpQUmIjTOOwX3uKVyk7qDI1MiecqTgvtVveB90u9ea/dfZ
         cguQ==
X-Gm-Message-State: APjAAAXzk0OxGScwpl+v79GSXU9E4QBJ7vUq0UT/uvB9PSyiildpB3Ar
        4mvrZofQ3d650GZfF3FiYw==
X-Google-Smtp-Source: APXvYqyodfRhsKMy4FOhXu6Ho1s9RLWOndgId1YcIUHbjswsnDNmMErI8ydPdEeAc6VoUI1SAu1QSQ==
X-Received: by 2002:aca:b303:: with SMTP id c3mr1000895oif.100.1574112949655;
        Mon, 18 Nov 2019 13:35:49 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x11sm6400573oie.25.2019.11.18.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 13:35:48 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:35:48 -0600
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
Subject: Re: [PATCH v4 01/13] dt-bindings: display: bridge: Convert
 lvds-transmitter binding to json-schema
Message-ID: <20191118213548.GA765@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573660292-10629-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 13 Nov 2019 15:51:20 +0000, Fabrizio Castro wrote:
> Convert the lvds-transmitter binding to DT schema format using
> json-schema.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * Fixed the description of property "compatible" according to Laurent's
>   comments
> v2->v3:
> * Extracted conversion to dt-schema as per Rob's comment
> v1->v2:
> * Converted to dt-schema as per Neil's comment
> ---
>  .../bindings/display/bridge/lvds-transmitter.txt   | 66 ----------------
>  .../bindings/display/bridge/lvds-transmitter.yaml  | 91 ++++++++++++++++++++++
>  2 files changed, 91 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
