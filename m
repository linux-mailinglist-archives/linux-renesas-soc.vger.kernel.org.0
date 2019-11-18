Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3AD100DD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 22:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfKRViQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 16:38:16 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:32972 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfKRViP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:38:15 -0500
Received: by mail-ot1-f68.google.com with SMTP id u13so15926201ote.0;
        Mon, 18 Nov 2019 13:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mAc7Q/gtUlmiHluKgpEFvKm0HPMSruDCFKUdodfYdR0=;
        b=C3HgR7IWy4PqbYZMJcpI6m58pmQeYJDRKq4TGo/IMMfQpUQCqiwnPl6z1JEoSW8OA+
         cvKoOPyJt/kKOtDITC/mk/o7JHny/asBcuJfj9spO5gk9iWVS7U/wwJdG6xNeKSB84mJ
         aCifY5gnancf961+Xs6i7EPS0FWB6hRbjCASzi5gPy8mp6TNgIVGcczfGEGRMSWZMchF
         2v9z6/q5qqyuXUtdfIwCOyfXtNZLk/OodvQdaURfkpF8hlYfc7adSSTTqRkNs8TY74o2
         CSLkWQ8u5NqD21W90zNrPSPKcU6m4rccciTQmDcKCv1PR5DR3UHf36MCQGkLYtw9jYrg
         f6xA==
X-Gm-Message-State: APjAAAUjiw/GGeQqI83jfrSiMN8Y9Te3jp3Jsu7/R6xtz+6LHAWCjUB5
        gEFhGkiKHUuJBG1+1lVmOw==
X-Google-Smtp-Source: APXvYqyBcM9ucYjeN+0WdBVulO1FOqLPu7utjXGGWwI64en8P7kn8VoXj4mYdXUFMhdkBH8ZvYGVwQ==
X-Received: by 2002:a9d:2c25:: with SMTP id f34mr1021910otb.27.1574113094793;
        Mon, 18 Nov 2019 13:38:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v11sm6502747ota.13.2019.11.18.13.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 13:38:14 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:38:13 -0600
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
Subject: Re: [PATCH v4 03/13] dt-bindings: display: bridge: lvds-transmitter:
 Absorb ti,ds90c185.txt
Message-ID: <20191118213813.GA5240@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573660292-10629-4-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 13 Nov 2019 15:51:22 +0000, Fabrizio Castro wrote:
> ti,ds90c185.txt documents LVDS encoders using the same driver
> as the one documented by lvds-transmitter.yaml.
> Since the properties listed in ti,ds90c185.txt are the same
> as the ones listed in lvds-transmitter.yaml, absorb the dt-binding
> into lvds-transmitter.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * New patch
> ---
>  .../bindings/display/bridge/lvds-transmitter.yaml  | 14 +++---
>  .../bindings/display/bridge/ti,ds90c185.txt        | 55 ----------------------
>  2 files changed, 8 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
