Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA0D22C26B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 11:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfE1JEs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 05:04:48 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:33289 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbfE1JEr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 05:04:47 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6C0F9100008;
        Tue, 28 May 2019 09:04:42 +0000 (UTC)
Date:   Tue, 28 May 2019 11:05:51 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 03/10] drm: bridge: thc63: Report input bus mode
 through bridge timings
Message-ID: <20190528090551.swt6ovalcadateht@uno.localdomain>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hpp6knvdq33m7ccs"
Content-Disposition: inline
In-Reply-To: <20190511210702.18394-4-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--hpp6knvdq33m7ccs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Sun, May 12, 2019 at 12:06:55AM +0300, Laurent Pinchart wrote:
> Set a drm_bridge_timings in the drm_bridge, and use it to report the
> input bus mode (single-link or dual-link). The other fields of the
> timings structure are kept to 0 as they do not apply to LVDS buses.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
>
> - Ignore disabled remote device
> ---
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 54 +++++++++++++++++++++------
>  1 file changed, 43 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index b083a740565c..709dd28b43d6 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -31,6 +31,8 @@ struct thc63_dev {
>
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next;
> +
> +	struct drm_bridge_timings timings;
>  };
>
>  static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
> @@ -48,15 +50,28 @@ static int thc63_attach(struct drm_bridge *bridge)
>  static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
>  					const struct drm_display_mode *mode)
>  {
> +	struct thc63_dev *thc63 = to_thc63(bridge);
> +	unsigned int min_freq;
> +	unsigned int max_freq;
> +
>  	/*
> -	 * The THC63LVD1024 clock frequency range is 8 to 135 MHz in single-in
> -	 * mode. Note that the limits are different in dual-in, single-out mode,
> -	 * and will need to be adjusted accordingly.
> +	 * The THC63LVD1024 pixel rate range is 8 to 135 MHz in all modes but
> +	 * dual-in, single-out where it is 40 to 150 MHz. As dual-in, dual-out
> +	 * isn't supported by the driver yet, simply derive the limits from the
> +	 * input mode.
>  	 */
> -	if (mode->clock < 8000)
> +	if (thc63->timings.dual_link) {
> +		min_freq = 40000;
> +		max_freq = 150000;
> +	} else {
> +		min_freq = 8000;
> +		max_freq = 135000;
> +	}
> +
> +	if (mode->clock < min_freq)
>  		return MODE_CLOCK_LOW;
>
> -	if (mode->clock > 135000)
> +	if (mode->clock > max_freq)
>  		return MODE_CLOCK_HIGH;

I would have made a separate patch for this bit, anyway, verified
against the THC631024 manual, and this matches my understanding.

>
>  	return MODE_OK;
> @@ -101,19 +116,19 @@ static const struct drm_bridge_funcs thc63_bridge_func = {
>
>  static int thc63_parse_dt(struct thc63_dev *thc63)
>  {
> -	struct device_node *thc63_out;
> +	struct device_node *endpoint;
>  	struct device_node *remote;
>
> -	thc63_out = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> -						  THC63_RGB_OUT0, -1);
> -	if (!thc63_out) {
> +	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> +						 THC63_RGB_OUT0, -1);
> +	if (!endpoint) {
>  		dev_err(thc63->dev, "Missing endpoint in port@%u\n",
>  			THC63_RGB_OUT0);
>  		return -ENODEV;
>  	}
>
> -	remote = of_graph_get_remote_port_parent(thc63_out);
> -	of_node_put(thc63_out);
> +	remote = of_graph_get_remote_port_parent(endpoint);
> +	of_node_put(endpoint);
>  	if (!remote) {
>  		dev_err(thc63->dev, "Endpoint in port@%u unconnected\n",
>  			THC63_RGB_OUT0);
> @@ -132,6 +147,22 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
>  	if (!thc63->next)
>  		return -EPROBE_DEFER;
>
> +	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> +						 THC63_LVDS_IN1, -1);
> +	if (endpoint) {
> +		remote = of_graph_get_remote_port_parent(endpoint);
> +		of_node_put(endpoint);
> +
> +		if (remote) {
> +			if (of_device_is_available(remote))
> +				thc63->timings.dual_link = true;
> +			of_node_put(remote);
> +		}
> +	}
> +
> +	dev_dbg(thc63->dev, "operating in %s-link mode\n",
> +		thc63->timings.dual_link ? "dual" : "single");
> +

Fine, thanks for having addressed comments on the RFC.

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>  	return 0;
>  }
>
> @@ -188,6 +219,7 @@ static int thc63_probe(struct platform_device *pdev)
>  	thc63->bridge.driver_private = thc63;
>  	thc63->bridge.of_node = pdev->dev.of_node;
>  	thc63->bridge.funcs = &thc63_bridge_func;
> +	thc63->bridge.timings = &thc63->timings;
>
>  	drm_bridge_add(&thc63->bridge);
>
> --
> Regards,
>
> Laurent Pinchart
>

--hpp6knvdq33m7ccs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzs+e8ACgkQcjQGjxah
VjxGBQ//QaejbAKf4w1iPov+CyMt01/OwqyLdI2pfSvTF6118ZDWONgYY62kqpMb
BFrDILszA2My2FPdBMxD777GWpaDGCGCUxES4aB3+qFGL6EsOvRurxk1ERiZ1r6F
hbbINoOpit4BG0Qy3Ac3Yi1XwNRRmhaN6Ne5IMyYKil6zDy8kEA7Pl658cgc+kaR
VxZfma9bsCe6lHZ/Tq2BcDhHFiI46FyHiuZ0enaJrPxbUxkxRv7eYJQemhzFXvG0
iOYFUC+1CXh0XqiQYDaNifWIb4fryMt1NwVs0UF9WJJYUKqcIMIDP69v8fLhRcPc
Xrs9zZYKgHH9a3w68Q97F8sKBHmhIPoAtTjwpg+LL52htKZEIWbAfyLZmL3zikQH
YiTZX7grMD1caSfXNEoRRYsezQ4MW0ph+oVgp3+xnCVmt11BU5N9wnZVj3mE4/L3
7CTUcWUbwHYOg/8h3kH2ubstMGKfrwYcRSubJGjbgjI1YBLXleWoRwfEIe/X26K5
XXOC8Dfhz9MpUCtfLEk/juTEYSUniIJRUtKTSaE0JTy+Cy3L7datbETgSR/c+eQg
V8t3YefLGljB/oeY+3dj+Evy9OgvmDbGjatCfhlTVsCNaf5M2M1jotMz82v76TVj
zIXLw8d2QuggC45YG7HaFH05zp8zvfy2RwQ4/z80y7NRmywDfjc=
=k+Tn
-----END PGP SIGNATURE-----

--hpp6knvdq33m7ccs--
