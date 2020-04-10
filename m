Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524CD1A48D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 19:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgDJRNX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 13:13:23 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40797 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJRNX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 13:13:23 -0400
Received: by mail-qk1-f194.google.com with SMTP id z15so2796790qki.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2020 10:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IM1Dms+6Kk6uSoOVXDf++gqgf8pSHSOrUNNPGKpHdFY=;
        b=HV2la9hQONCVfSMQQuksMMkJuwjAeD273zC8VodiNbmtqcBgp2ySsLByOsTc1wzOMr
         Q9UfQ3z57uAE/AWLeIkDYBqxMsgSFKVaorYpEBWRMLbBFkKVnmwYANj6bP3Btwm2uths
         L9byXcBZfaHUEkD0RCnPWYbb3RLvr6yjpdT+E3khm/EiDCkUDGNNZMO4Fom5Xpr1b0rM
         lbfhPKbdmkL+FSBFPFKRkQPoLz4AWsJLrV3BqyY8BMDpnEVBFFhkxyXkMSxZ//Z/bz2W
         VRZdiIuzKZZicmBrIzbxO4CEGwy9CxOfE/paIO4nviIEqyU173faTtrmigfjHx+WYbQX
         5o7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IM1Dms+6Kk6uSoOVXDf++gqgf8pSHSOrUNNPGKpHdFY=;
        b=OgMk0yld8m2AeLVy8T4BPI7F0sYlswURy/rZwMvYgECLhI/hGvzQ6iWRl/EKGA8WLe
         e/E5n07swEOlb8kTiD9njVwK+4xQZn+2jucgukfR8a2n+fG6e5BR5+zQrDwFA0c2b9gE
         j/lA0spPFcQrPCQTFqSktLve5LY8OruwucBu2BWS6Cz+8GDSLJYBBAADR/ORIYKETV1x
         qRAiQhSY95BxXv33uZCvTDSLVHvddxwURa5pOmE/bL/1ar73EoDg6t/AIWcK/rgiGt3B
         8nneHeBo+7rJ82urVdZE4t0Kjb50hPBqHALl9c8MvI/bojkSVQ/GVNwxigzoup1inMDt
         Vivg==
X-Gm-Message-State: AGi0PuYXpZxJ0YH8LxHoV/xlPhUtZAi5QxBLBYaAxo+PUl1KD2QTMd06
        Qb4R6vaf4pDMtU+YgGBRtJKETw==
X-Google-Smtp-Source: APiQypLmE/MEQtipGhULJ9OlLMq9pEcPOhlrkTjtMbVWOYt8l+l3qlb93NNl4fBSv7xFKi5pNqJpBA==
X-Received: by 2002:a05:620a:a41:: with SMTP id j1mr5046527qka.86.1586538802345;
        Fri, 10 Apr 2020 10:13:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id m10sm1997447qte.71.2020.04.10.10.13.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Apr 2020 10:13:21 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jMxDU-0006Dq-Uh; Fri, 10 Apr 2020 14:13:20 -0300
Date:   Fri, 10 Apr 2020 14:13:20 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Saeed Mahameed <saeedm@mellanox.com>
Cc:     "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "leon@kernel.org" <leon@kernel.org>,
        "Laurent.pinchart@ideasonboard.com" 
        <Laurent.pinchart@ideasonboard.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "nico@fluxnic.net" <nico@fluxnic.net>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "a.hajda@samsung.com" <a.hajda@samsung.com>,
        "jonas@kwiboo.se" <jonas@kwiboo.se>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Message-ID: <20200410171320.GN11886@ziepe.ca>
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca>
 <87k12pgifv.fsf@intel.com>
 <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 10, 2020 at 02:40:42AM +0000, Saeed Mahameed wrote:

> This assumes that the module using FOO has its own flag representing
> FOO which is not always the case.
> 
> for example in mlx5 we use VXLAN config flag directly to compile VXLAN
> related files:
> 
> mlx5/core/Makefile:
> 
> obj-$(CONFIG_MLX5_CORE) += mlx5_core.o
> 
> mlx5_core-y := mlx5_core.o
> mlx5_core-$(VXLAN) += mlx5_vxlan.o
> 
> and in mlx5_main.o we do:

Does this work if VXLAN = m ?

> if (IS_ENABLED(VXLAN))
>        mlx5_vxlan_init()
> 
> after the change in imply semantics:
> our options are:
> 
> 1) use IS_REACHABLE(VXLAN) instead of IS_ENABLED(VXLAN)
> 
> 2) have MLX5_VXLAN in mlx5 Kconfig and use IS_ENABLED(MLX5_VXLAN) 
> config MLX5_VXLAN
> 	depends on VXLAN || !VXLAN
> 	bool

Does this trick work when vxlan is a bool not a tristate?

Why not just put the VXLAN || !VXLAN directly on MLX5_CORE?

Jason
