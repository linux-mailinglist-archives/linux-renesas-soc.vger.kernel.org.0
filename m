Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A459A242217
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 23:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgHKVn3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 17:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgHKVn2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 17:43:28 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4F5C061787
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2020 14:43:27 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 185so15188406ljj.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2020 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EAXl6w4ECGXfFb3xMdypO3cd2xJws9gImhiuC1SSVxk=;
        b=mva9uYSpA8TJByXKvf+ZLMTLWYkOkrDybx5y9KDh+483YHhpoOU/Ce098uMFMhoe2m
         /p+kbL+yvxnUyTVGJ8y3JfJ3yjItsyakUOovvcfY/Xijm1Qdfk8eQPSjVrP/+YeDpnAi
         pdbfASKysAduzMv7cNb1NcZmUlRSV8RYlmZK1Xuklellpw9FgEFOOoUPlpKyDUiMs65H
         4ALO8NnUYFnbmdItojcRrfrDrHP3FattkXXRBabWhrZvWSFqv8EWlFU4ViA/E3Xe/HsW
         IeJhSjRa/o9V07/Hh99SYYSMWTFrZt8ISC4nOX5wkq3JirntrEzttWRMMJI9aEdyQXT5
         AvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EAXl6w4ECGXfFb3xMdypO3cd2xJws9gImhiuC1SSVxk=;
        b=e5lLl5ZqotGmB44L66NIELoD5X63WBEzGOsQjMQs01xUdTMhzpGAxWNJ/qze+gEOb7
         OcbEAwshHJOsfg7wqwoicjtVKgt3zhVWloubj95Z/ZqruSz74IX1MbW0DOv4LxTvPjOc
         qOI5whzSgGSDpIlxqza40N/iW1I64dkcBfgc2evtXXzbbFUHcZex4ev7p4cBZVzOL+cm
         G6RBTliN4nnS3H9WS8hT1Bht7Y2wVUM6rXQoDUAwCDIzrqsBGXi1Us1wxYwkYp4bpycl
         TiluWsUH2i4gUNrkFqqdDkZDEsHswgJC0s9sRsGg28dockxLWDGwvHQDm6BRXpqHMDA3
         WuWA==
X-Gm-Message-State: AOAM533LbiTDkkQkdBQMs8vypNBDczn5Tn8Dw2iwOVf75T7lDrpCwRMz
        LSZs3TNL7NGLykm2tqJcVWNobs5YZVo=
X-Google-Smtp-Source: ABdhPJxxslRRkvWlRJhZXLPDq+jynEk5fbFy14Gagb3J2EPwtyAGp/aJJc1LaTB5OfSysK3t7Q/zhg==
X-Received: by 2002:a2e:9557:: with SMTP id t23mr3734338ljh.193.1597182206274;
        Tue, 11 Aug 2020 14:43:26 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id l3sm412lji.115.2020.08.11.14.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 14:43:25 -0700 (PDT)
Date:   Tue, 11 Aug 2020 23:43:24 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH 4/5] media: rcar-csi2: Allocate v4l2_async_subdev
 dynamically
Message-ID: <20200811214324.GB1061689@oden.dyn.berto.se>
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200811205939.19550-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200811205939.19550-5-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for your work.

On 2020-08-11 23:59:38 +0300, Laurent Pinchart wrote:
> v4l2_async_notifier_add_subdev() requires the asd to be allocated
> dynamically, but the rcar-csi2 driver embeds it in the rcar_csi2
> structure. This causes memory corruption when the notifier is destroyed
> at remove time with v4l2_async_notifier_cleanup().
> 
> Fix this issue by registering the asd with
> v4l2_async_notifier_add_fwnode_subdev(), which allocates it dynamically
> internally.

This patch conflicts with [1] which I think is a nicer solution to the 
problem, provided 1/2 of that series is palatable for everyone :-)

1. [PATCH 2/2] rcar-csi2: Use V4L2 async helpers to create the notifier

> 
> Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 24 +++++++++------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index c6cc4f473a07..a16c492b3143 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -362,7 +362,6 @@ struct rcar_csi2 {
>  	struct media_pad pads[NR_OF_RCAR_CSI2_PAD];
>  
>  	struct v4l2_async_notifier notifier;
> -	struct v4l2_async_subdev asd;
>  	struct v4l2_subdev *remote;
>  
>  	struct v4l2_mbus_framefmt mf;
> @@ -811,6 +810,8 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
>  
>  static int rcsi2_parse_dt(struct rcar_csi2 *priv)
>  {
> +	struct v4l2_async_subdev *asd;
> +	struct fwnode_handle *fwnode;
>  	struct device_node *ep;
>  	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
>  	int ret;
> @@ -834,24 +835,19 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
>  		return ret;
>  	}
>  
> -	priv->asd.match.fwnode =
> -		fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
> -	priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -
> +	fwnode = fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
>  	of_node_put(ep);
>  
> +	dev_dbg(priv->dev, "Found '%pOF'\n", to_of_node(fwnode));
> +
>  	v4l2_async_notifier_init(&priv->notifier);
> -
> -	ret = v4l2_async_notifier_add_subdev(&priv->notifier, &priv->asd);
> -	if (ret) {
> -		fwnode_handle_put(priv->asd.match.fwnode);
> -		return ret;
> -	}
> -
>  	priv->notifier.ops = &rcar_csi2_notify_ops;
>  
> -	dev_dbg(priv->dev, "Found '%pOF'\n",
> -		to_of_node(priv->asd.match.fwnode));
> +	asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier, fwnode,
> +						    sizeof(*asd));
> +	fwnode_handle_put(fwnode);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>  
>  	ret = v4l2_async_subdev_notifier_register(&priv->subdev,
>  						  &priv->notifier);
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
