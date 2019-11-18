Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C583100E60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 22:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfKRVvQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 16:51:16 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43875 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfKRVvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:51:15 -0500
Received: by mail-oi1-f193.google.com with SMTP id l20so16812287oie.10;
        Mon, 18 Nov 2019 13:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hEC0vXainlrwNnEp9G18IEiJOKLOfTAQobDWOxSae4w=;
        b=A+yn/wIzaWdsbWXGFq3IilafMSnjfeBKcweX3oCU2+cC49ebVqn/1Oxcu3FVzzqJWs
         wmxzSwvRhUzGr9UywJSiMBRvs+q+0MQYAzB7ROX4jrEBo46bGvNj3m9rl0lsnsmtvpC/
         CjfzH+n4V0CvCbMaK1SEgFAQsubo4TWK3B3LfStK6Keph32SIMLDCj6vxeDHnHGkuhmR
         MVBKRjITO+rRuhtxO79pbh4vF7J3XMj0LM1hFLua+AUjTF2t98djcJBHkDVjqUqcq5tE
         Phg6GtHWbIBxKAYOoibtom2W7E5TW3ykBJxSG8VUvFCzDbUr38qfpQJApAFyn84nMNQr
         onbA==
X-Gm-Message-State: APjAAAVsYzcv6PvZ6jOoQuzZJ9/a/v9ICdLybwEnBbMrLnDn4sbfBs7a
        xJfkLKYWAYDtpcNUWugsyA==
X-Google-Smtp-Source: APXvYqzRkJzwRQuhVaue+B3wBvYpyxpcTCUMZXwn87IM1tgwW7C2JjpdCBgkt6sqnEAIZDoTSgSAUA==
X-Received: by 2002:aca:d508:: with SMTP id m8mr995352oig.31.1574113874526;
        Mon, 18 Nov 2019 13:51:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 63sm6650617oty.58.2019.11.18.13.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 13:51:13 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:51:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 13/13] [HACK] dt-bindings: display: bridge:
 lvds-codec: Absorb thine,thc63lvdm83d.txt
Message-ID: <20191118215113.GA10406@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-14-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573660292-10629-14-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 13, 2019 at 03:51:32PM +0000, Fabrizio Castro wrote:
> At this point in time, compatible string "thine,thc63lvdm83d" is
> backed by the lvds-codec driver, and the documentation contained
> in thine,thc63lvdm83d.txt is basically the same as the one
> contained in lvds-codec.yaml (generic fallback compatible string
> aside), therefore absorb thine,thc63lvdm83d.txt.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> Hi Laurent,
> 
> what do you think about this patch?
> 
> Thanks,
> Fab
> 
> v3->v4:
> * New patch
> ---
>  .../bindings/display/bridge/lvds-codec.yaml        |  5 +--
>  .../bindings/display/bridge/thine,thc63lvdm83d.txt | 50 ----------------------
>  2 files changed, 2 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 21f8c6e..420bfce 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -30,9 +30,6 @@ description: |
>  
>  properties:
>    compatible:
> -    description: |
> -      Must list the device specific compatible string first, followed by the
> -      generic compatible string.

Probably better to just omit this from the start. 

In any case:

Reviewed-by: Rob Herring <robh@kernel.org>
