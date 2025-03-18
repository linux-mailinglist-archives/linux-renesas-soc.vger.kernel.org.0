Return-Path: <linux-renesas-soc+bounces-14605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFFA67E1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 21:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30924188E422
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 20:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22CE20CCDB;
	Tue, 18 Mar 2025 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kgEDTx8s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A821F1F4164
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 20:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742330520; cv=none; b=IxvceVxRPao/filC+UbW3vabR3swumOwlKQQlMxtq6kVDElWVWYChZ5Xb5fz4a6pXbEOOv+NOFYyMn3xF+bx6rKaVOVwIuUHePP5aMkIZ6uoWDsbc1VzfBxtJmxc3cQFlyB2IrKRY84q8jeAYD+c4qus+eLolVZUy3O/ROwXK9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742330520; c=relaxed/simple;
	bh=BROYdDLBFAJtM3u9uxo+6DwOUnRjaAG7FzL//0TnVa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBX6VLLRPeV8xgPJ6wLjVEeJ+ycUfNbDS6gQE1q7TbCQn2x23XXYCLy7L8rcuA9IAasiV8vaXtdEU4WDPrHDZNwOIWTdt9IxAwjf5uaSvyVEuMAyXV+rEJnN8/F4w+ztzSjYNajv93p9RY/3sq6ytF0egmxgJhhIVILbK1akA1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kgEDTx8s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [194.75.195.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDAF2778;
	Tue, 18 Mar 2025 21:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742330414;
	bh=BROYdDLBFAJtM3u9uxo+6DwOUnRjaAG7FzL//0TnVa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgEDTx8sWTNPqTsv4kVlsVLRtrLw4Bt89ibQ5XGuS8XdirLu3qyKfIug2jQKhrw3q
	 20N56ZUNRj9DVh8EeyDJ12lVfp1sypJqHmmYB8HAthjO//PlvtGHZWxDkVxUktJ1gp
	 hoJp3pkSeKOIxBQELyMCEasFS9gO6VliPBMouYsc=
Date: Tue, 18 Mar 2025 22:41:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
Message-ID: <20250318204133.GC22890@pendragon.ideasonboard.com>
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

Thank you for the patch.

On Tue, Mar 18, 2025 at 04:52:56PM +0100, Wolfram Sang wrote:
> Read out and check the ID registers, so we can bail out if I2C
> communication does not work or if the device is unknown.

What's the advantage of that, what are you trying to guard against ?

> Tested on a
> Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
> not enabling RuntimePM for the device.

What do you mean by not enabling runtime PM for the device ?

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v2:
> * switched to a new approach suggested by Doug (Thanks!). We add a
>   dedicated read instead of using the first read. This prevents creating
>   the aux devices. As a side-gain, we check now if the chip at the address
>   is really the one we want to support.
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 87fffaa52bb0..8caa7918933d 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -36,6 +36,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  
> +#define SN_DEVICE_ID_REGS			0x00	/* up to 0x07 */
>  #define SN_DEVICE_REV_REG			0x08
>  #define SN_DPPLL_SRC_REG			0x0A
>  #define  DPPLL_CLK_SRC_DSICLK			BIT(0)
> @@ -1875,6 +1876,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ti_sn65dsi86 *pdata;
> +	u8 id_buf[8];
>  	int ret;
>  
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> @@ -1918,6 +1920,16 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>  
> +	pm_runtime_get_sync(dev);

Missing error checking. You should probably use
pm_runtime_resume_and_get().

> +	ret = regmap_bulk_read(pdata->regmap, SN_DEVICE_ID_REGS, id_buf, ARRAY_SIZE(id_buf));
> +	pm_runtime_put_autosuspend(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read device id\n");
> +
> +	/* The ID string is stored backwards */
> +	if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
> +		return dev_err_probe(dev, -EOPNOTSUPP, "unsupported device id\n");
> +
>  	/*
>  	 * Break ourselves up into a collection of aux devices. The only real
>  	 * motiviation here is to solve the chicken-and-egg problem of probe

-- 
Regards,

Laurent Pinchart

