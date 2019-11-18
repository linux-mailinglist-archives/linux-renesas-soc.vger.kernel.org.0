Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E713D100DE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 22:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfKRVki (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 16:40:38 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33169 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfKRVki (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:40:38 -0500
Received: by mail-ot1-f68.google.com with SMTP id u13so15932477ote.0;
        Mon, 18 Nov 2019 13:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WZUio/taqOaS8HOsKs6Tx/K86C3+G5uKrrovVbDJGwI=;
        b=WPDmC7Pzo+/nzmHwi4BGRLPPhgs1AuaoH0Yt841elVFhmr8vP4K7Hl/Zvhq/sCk4Dp
         SnWnPehOdZOBfArKOQ61KRWx+n3WJnIazxP1Ivs/GuSd3KwtJGnVGzGIeGnBKElI6XYw
         zZT2rvojEDIQFXWmazf5ab1Bq7anfQZjP+Ds5d9rMLDmVDEuWXF4YjEbB9dzR/sUiG6N
         ySWQjDvx1mNANZ5AamqmBNPejkcNXDOHeJ9usW9KXJm63EvffHoRWXMFF+fhw8wgVJHH
         tr/enCdC49TY5xZzvswJJQ8FmVIoTIpMD1w8RFkxb17QOamAMwcbbE2Z6MD8fW07dmKt
         prKw==
X-Gm-Message-State: APjAAAXpjFDWAKOB1vCbgdNkVOgmW44nWww4qOMbFrZE8TK+FJ9y6/q2
        KBbfqWetxCGU+GsF/rsBPQ==
X-Google-Smtp-Source: APXvYqyrzHYyOBHJh5dN3sj2axQ7Dp2CrqN5El1pXKfbXVsKh1Bq1DDAp309KKjjFQBFuT2fTGWs5g==
X-Received: by 2002:a05:6830:1d8a:: with SMTP id y10mr996840oti.329.1574113236832;
        Mon, 18 Nov 2019 13:40:36 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k9sm6441118oik.18.2019.11.18.13.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 13:40:36 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:40:35 -0600
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
Subject: Re: [PATCH v4 08/13] dt-bindings: display: bridge: Repurpose
 lvds-encoder
Message-ID: <20191118214035.GA9128@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-9-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573660292-10629-9-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 13 Nov 2019 15:51:27 +0000, Fabrizio Castro wrote:
> In an effort to repurpose lvds-encoder.c to also serve the
> function of LVDS decoders, we ended up defining a new "generic"
> compatible string ("lvds-decoder"), therefore adapt the dt schema
> to allow for the new compatible string.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * Improved title and description according to Laurent's comments
> * Reworked definition of the compatible property
> v2->v3:
> * Extracted conversion to lvds-codec as per Rob's comment
> v1->v2:
> * Converted to dt-schema as per Neil's comment
> ---
>  .../{lvds-transmitter.yaml => lvds-codec.yaml}     | 54 +++++++++++++++++-----
>  1 file changed, 42 insertions(+), 12 deletions(-)
>  rename Documentation/devicetree/bindings/display/bridge/{lvds-transmitter.yaml => lvds-codec.yaml} (61%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
