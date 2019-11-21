Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FC810589B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 18:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfKURdk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 12:33:40 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:58475 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfKURdk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 12:33:40 -0500
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id D9A19240008;
        Thu, 21 Nov 2019 17:33:37 +0000 (UTC)
Date:   Thu, 21 Nov 2019 18:35:41 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] max9286: simplify i2c-mux parsing
Message-ID: <20191121173541.sb4ycbinjkhvzmso@uno.localdomain>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
 <20191121165631.5744-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vfvvexuoguzdgswj"
Content-Disposition: inline
In-Reply-To: <20191121165631.5744-1-kieran.bingham@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vfvvexuoguzdgswj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kieran,

On Thu, Nov 21, 2019 at 04:56:31PM +0000, Kieran Bingham wrote:
>  - Identify each enabled i2c-mux channel in a single pass
>
> The parse_dt function iterates each node in the i2c-mux for each endpoint looking for a match.
> The only purpose of these iterations is to determine if the corresponding i2c-channel
> is enabled. (status = 'okay').
>
> Iterate the i2c-mux nodes in a single pass storing the enable state
> in a local i2c_mux_mask for use when parsing the endpoints.
>

I very much agree with this :)

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 84 +++++++++++++++----------------------
>  1 file changed, 34 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 34cb6f3b40c2..a36132becdc7 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1097,55 +1097,6 @@ static int max9286_is_bound(struct device *dev, void *data)
>  	return 0;
>  }
>
> -static struct device_node *max9286_get_i2c_by_id(struct device_node *parent,
> -						 u32 id)
> -{
> -	struct device_node *i2c_mux;
> -	struct device_node *child;
> -
> -	/* Balance the of_node_put() performed by of_find_node_by_name() */
> -	of_node_get(parent);
> -
> -	i2c_mux = of_find_node_by_name(parent, "i2c-mux");
> -	if (!i2c_mux) {
> -		printk("max9286: Failed to find i2c-mux node\n");
> -		return NULL;
> -	}
> -
> -	for_each_child_of_node(i2c_mux, child) {
> -		u32 i2c_id = 0;
> -
> -		if (of_node_cmp(child->name, "i2c") != 0)
> -			continue;
> -		of_property_read_u32(child, "reg", &i2c_id);
> -		if (id == i2c_id)
> -			return child;
> -	}
> -
> -	return NULL;
> -}
> -
> -static int max9286_check_i2c_bus_by_id(struct device *dev, int id)
> -{
> -	struct device_node *i2c_np;
> -
> -	i2c_np = max9286_get_i2c_by_id(dev->of_node, id);
> -	if (!i2c_np) {
> -		dev_err(dev, "Failed to find corresponding i2c@%u\n", id);
> -		return -ENODEV;
> -	}
> -
> -	if (!of_device_is_available(i2c_np)) {
> -		dev_dbg(dev, "Skipping port %u with disabled I2C bus\n", id);
> -		of_node_put(i2c_np);
> -		return -ENODEV;
> -	}
> -
> -	of_node_put(i2c_np);
> -
> -	return 0;
> -}
> -
>  static void max9286_cleanup_dt(struct max9286_priv *priv)
>  {
>  	struct max9286_source *source;
> @@ -1167,11 +1118,44 @@ static void max9286_cleanup_dt(struct max9286_priv *priv)
>  static int max9286_parse_dt(struct max9286_priv *priv)
>  {
>  	struct device *dev = &priv->client->dev;
> +	struct device_node *i2c_mux;
> +	struct device_node *child = NULL;
>  	struct device_node *ep_np = NULL;

Nit: could you re-use child or ep_np ?

> +	unsigned int i2c_mux_mask = 0;
>  	int ret;
>
> +	/* Balance the of_node_put() performed by of_find_node_by_name() */

Do you need this comment ?

> +	of_node_get(dev->of_node);
> +	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> +	if (!i2c_mux) {
> +		dev_err(dev, "Failed to find i2c-mux node\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Identify which i2c-mux channels are enabled */
> +	for_each_child_of_node(i2c_mux, child) {
> +		u32 id = 0;
> +
> +		if (of_node_cmp(child->name, "i2c") != 0)
> +			continue;

With the new bindings in yaml format and the associated verification,
this should not happen.

> +
> +		of_property_read_u32(child, "reg", &id);
> +		if (id >= MAX9286_NUM_GMSL)
> +			continue;
> +
> +		if (!of_device_is_available(child)) {
> +			dev_dbg(dev, "Skipping port %u with disabled I2C bus\n", id);
> +			continue;
> +		}
> +
> +		i2c_mux_mask |= BIT(id);
> +	}
> +	of_node_put(child);
> +	of_node_put(i2c_mux);
> +
>  	v4l2_async_notifier_init(&priv->notifier);
>
> +	/* Parse the endpoints */
>  	for_each_endpoint_of_node(dev->of_node, ep_np) {

dev->of_node is reused here, do you need to get it again ?

All minors though, squash this on the next max9286 submission if you
feel to.

Thanks
   j

>  		struct max9286_source *source;
>  		struct of_endpoint ep;
> @@ -1214,7 +1198,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  		}
>
>  		/* Skip if the corresponding GMSL link is unavailable. */
> -		if (max9286_check_i2c_bus_by_id(dev, ep.port))
> +		if (!(i2c_mux_mask & BIT(ep.port)))
>  			continue;
>
>  		if (priv->sources[ep.port].fwnode) {
> --
> 2.20.1
>

--vfvvexuoguzdgswj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3Wyu0ACgkQcjQGjxah
Vjy3Pg//ZaEkg+NgZafsxJpXphumiT6bnmMmWcQClYjtqwUM/YlpTL9Pnhl8aijb
TqU7mVv3ZXb4P4ybDkwg1U9JAmEDbhINFURSL/eXASQtWfU00iq5Q7gant9ifbp8
K2JH+FpUrwsn8qeX1oFKs69aTvYJkaXRN0KW77izgxyj7Tpo//33ZuBGhFT6CTDv
4i837BnlnQbUbN7LMfazBS9jx3nRl2LFFuhMrVMr4xnJ+A7xxzWwoBLMUCLPMfoN
NY9U6dM4MNz2Et7gsbwH1b+CdoQnJAt033MrjxmyOv1xQtfAEeAfU3jo00HXN/gt
pnqN1jdcEVkZm8uDqPU4K2rOSP8CEvl6fpFR2PEwq8AxguYaipGFJtwhN73Ro6QK
c8YApGGZiPSrlSxENnxqKSR/zS1kj5uajDnZ/zOIn2rDtPn2ifInshpydRNYcYhe
Gw/l7dtiBeGkJJT9j67BzIRGyMiOP1dGihakscoc3LrL4Xw27Jdh4cVQJIQ3Ze2D
HwiyN2iuBtYM8Y7NjJIiItR21/naWTxUFSrxtYf5PiOzMXELEuhYzTdUe4lHDRRx
bfnmlTRC3HeF8SuiCX4tCCBF4rfq8T2ROtDzkWAkwm048TushSPs8wxGl//YrNmQ
vUHjwSzsokV7eBRYBcGw1XIKXucVs4jNh5z0ucnkhQurLuoDoUA=
=TYiB
-----END PGP SIGNATURE-----

--vfvvexuoguzdgswj--
