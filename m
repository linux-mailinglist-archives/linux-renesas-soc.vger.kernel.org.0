Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EECD1A36C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 17:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgDIPRC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 11:17:02 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:41755 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbgDIPRC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 11:17:02 -0400
Received: from uno.localdomain (unknown [93.69.187.161])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 39C8224000A;
        Thu,  9 Apr 2020 15:16:59 +0000 (UTC)
Date:   Thu, 9 Apr 2020 17:20:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 01/13] squash! max9286: Update the bound_sources mask
 on unbind
Message-ID: <20200409152003.3v5r53mrjxxmv4uo@uno.localdomain>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200409121202.11130-2-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Apr 09, 2020 at 01:11:50PM +0100, Kieran Bingham wrote:
> The bound_sources bit mask tracks sources which have been successfully
> bound through the v4l2 async notifier system.
>
> Ensure that the mask is updated accordingly when unbinding.
>

Indeed!

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Please squash in v8!

Thanks
  j

> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index cb58782e5143..b84d2daa6561 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -493,9 +493,12 @@ static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
>  				  struct v4l2_subdev *subdev,
>  				  struct v4l2_async_subdev *asd)
>  {
> +	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
>  	struct max9286_source *source = asd_to_max9286_source(asd);
> +	unsigned int index = to_index(priv, source);
>
>  	source->sd = NULL;
> +	priv->bound_sources &= ~BIT(index);
>  }
>
>  static const struct v4l2_async_notifier_operations max9286_notify_ops = {
> --
> 2.20.1
>
