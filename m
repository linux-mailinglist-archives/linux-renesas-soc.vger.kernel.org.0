Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3811F5590
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 15:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729120AbgFJNRf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 09:17:35 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38305 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728864AbgFJNRf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 09:17:35 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3DB1E20005;
        Wed, 10 Jun 2020 13:17:32 +0000 (UTC)
Date:   Wed, 10 Jun 2020 15:20:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran@ksquared.org.uk>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v9.2 9/9] fixes! [rdacm20]: Use usleep_range over
 mdelay(10)
Message-ID: <20200610132055.2umlz3ekkejvmgqz@uno.localdomain>
References: <20200610124623.51085-1-kieran@bingham.xyz>
 <20200610124623.51085-10-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610124623.51085-10-kieran@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Jun 10, 2020 at 01:46:23PM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Prefer usleep_range rather than the busy looping mdelay for 10ms waits.
>
> msleep( n < 20 ) may sleep up to 20 milliseconds, but in this instance I
> don't think that's a issue here. All the same, use usleep_range between
> 10, 15 milliseconds.

I think a rather conservative sleep interval like this one is fine, as
I don't have a characterization of the resest delay for this chip. The
10ms came from BSp code, and I'm not sure that was an empirical
measurement of was supported by some document.

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/rdacm20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index cda3e6372ea9..1ed928c4ca70 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -488,9 +488,9 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	 * MAX9271 GPIO1 and verify communication with the OV10635.
>  	 */
>  	max9271_clear_gpios(dev->serializer, MAX9271_GPIO1OUT);
> -	mdelay(10);
> +	usleep_range(10000, 15000);
>  	max9271_set_gpios(dev->serializer, MAX9271_GPIO1OUT);
> -	mdelay(10);
> +	usleep_range(10000, 15000);
>
>  again:
>  	ret = ov10635_read16(dev, OV10635_PID);
> --
> 2.25.1
>
