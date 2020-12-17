Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453A52DDBE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 00:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgLQXdf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 18:33:35 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:45020 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgLQXdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 18:33:35 -0500
Received: by mail-oo1-f49.google.com with SMTP id j21so138561oou.11;
        Thu, 17 Dec 2020 15:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o4L0zUoStNxiDtZzdNvMrXS5I8joaFoyrOYrSbDzU7Y=;
        b=dRqczhwHeN7Zhw0/lBaZiLC1Z6tPmTKFXTagyXQ4Y1FGTOCaVBOwsztU0d0pF/wqDx
         KpbiiItHfLjt4yN+zU+tQumA9+SxuaViGXBprzw6v9NDlZiy3TfvmhDB+17+uvhcQESp
         t3dOEG5zfS+aMAEra3uf8JPZchk14wuLWZ0XBeE64+7n0xphF6hlQAWzGBQpYq0RXJcT
         15NzAPJkCUlsUOa2fQwm6KLP8Ayauj0CSIbJin25WoE8wBjP19CASTyjZVYk5ciKTDlA
         gzAq4BDAeG+inzH4yg4LYsMwlJ2J34TGebNPurzc0UIAZSo2sVGDujAv4WTqMQjV2YIW
         E89g==
X-Gm-Message-State: AOAM530fLVzi2zHWKwsmXd1/8vhT6Cwo7cf6MKZQwhuhngIwhcvVvg+p
        Yjf4ZxYd39JUFgZNunh2JxVOXjLYXw==
X-Google-Smtp-Source: ABdhPJzaBWJNWUTtE+/q4T84oos6G4Nn+YvDFEQnYXoZcyVBoreAhzuzCgsUr1Co/9gdgApUzXk1mQ==
X-Received: by 2002:a4a:a289:: with SMTP id h9mr1050535ool.86.1608247974608;
        Thu, 17 Dec 2020 15:32:54 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q18sm1562806ood.35.2020.12.17.15.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 15:32:53 -0800 (PST)
Received: (nullmailer pid 431228 invoked by uid 1000);
        Thu, 17 Dec 2020 23:32:52 -0000
Date:   Thu, 17 Dec 2020 17:32:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas, lvds: RZ/G2E
 needs renesas, companion too
Message-ID: <20201217233252.GA431179@robh.at.kernel.org>
References: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 16 Dec 2020 00:59:27 +0200, Laurent Pinchart wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Document RZ/G2E support for property renesas,companion.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Slight reword of SoC list in description
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.yaml    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
