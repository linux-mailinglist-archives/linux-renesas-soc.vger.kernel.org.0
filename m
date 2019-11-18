Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAD9100DE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 22:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfKRVlK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 16:41:10 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46082 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfKRVlK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:41:10 -0500
Received: by mail-ot1-f66.google.com with SMTP id n23so15889793otr.13;
        Mon, 18 Nov 2019 13:41:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FRpvq7Wj/iqnBV7qC9kY5Pc+/NV4VUnf2+TihSU+79o=;
        b=OwhnrwHaLaNvWa0kR9wmBaZz+/exz8PBedoH9/Ow1P9w9weFDIgLzxu9KwDdnU08Sq
         Hm4Qd/puvUdvbbJiQImT0j3DirhTRagFYUASxUH58at7KwROBKMjc9YrhzG9WiouVHpQ
         atIDbgEg8TN9yDPnMXmZkxdQxXQZ2vxAQzzX4TfvrtOH2MgRAW+eV6GQ9tb4Uz/CVyhD
         WpzG9MVLCDk1TrNfpeBnehkOrM0XuRTdydto7OsWXZVN2tLlDYKGVHxKDGO4U4gyRRuj
         x9rBId8FWxSRGccvpJ//Z2bJW4pyGcusr1Y0QztxZQmpWeXncYxsedUC2EQpp1Id3ZHT
         YOlQ==
X-Gm-Message-State: APjAAAUn1P6He53uRskt3UJcyLgnytneRPi329QbbdupLSQjdc1BkfRc
        +ebJP1KjzuqH06+lFCoKOg==
X-Google-Smtp-Source: APXvYqxYNT8S6a4Vcem79ZkjeRstdF2mDqA8FfxIE8121Z6pXvIzENQymk0Bvzj9YGieUUYNDP5jRA==
X-Received: by 2002:a9d:7a86:: with SMTP id l6mr1091964otn.340.1574113269453;
        Mon, 18 Nov 2019 13:41:09 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 94sm6653813otg.70.2019.11.18.13.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 13:41:08 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:41:08 -0600
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
Subject: Re: [PATCH v4 09/13] dt-bindings: display: bridge: lvds-codec:
 Document ti,ds90cf384a
Message-ID: <20191118214108.GA10188@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 13 Nov 2019 15:51:28 +0000, Fabrizio Castro wrote:
> The DS90CF384A from TI is a transparent LVDS receiver (decoder),
> and therefore it is compatible with the lvds-codec driver and
> bindings.
> 
> Document the ti,ds90cf384a compatible string with the dt-bindings.
> No driver change required.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * New patch
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
