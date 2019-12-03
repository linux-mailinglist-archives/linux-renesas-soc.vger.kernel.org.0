Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80E1E10F994
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 09:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfLCIQ6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 03:16:58 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:48773 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCIQz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 03:16:55 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A72C560011;
        Tue,  3 Dec 2019 08:16:52 +0000 (UTC)
Date:   Tue, 3 Dec 2019 09:19:02 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] max9286: Improve mux-state readbility [v2]
Message-ID: <20191203081902.jqwqmfsrdztpcudg@uno.localdomain>
References: <20191128162706.704-1-kieran.bingham@ideasonboard.com>
 <20191129132643.6429-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="moc4n343pptgugnf"
Content-Disposition: inline
In-Reply-To: <20191129132643.6429-1-kieran.bingham@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--moc4n343pptgugnf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kieran,
    only a really minor nit, you could fix when squashing this patch

On Fri, Nov 29, 2019 at 01:26:43PM +0000, Kieran Bingham wrote:
> The MAX9286 implements an I2C mux which we maintain in an open state
> while we are streaming from the cameras.
>
> The development code for the MAX9286 uses an integer value with
> arbitrary state values to control these state transitions. This is
> highlighted with a FIXME and is difficult to interpret the meaning of the
> values 0, 1, 2.
>
> Introduce a new function call max9286_i2c_mux_open() to make it clear
> when a component opens all the mux channels, and update the usage
> in s_stream() to max9286_i2c_mux_close() the mux on stop stream.
>
> We previously had missed an occasion to sleep after an update to the I2C
> Fwd/Rev channels, so all writes to this configuration register are moved
> to a helper: max9286_i2c_mux_configure() which guarantees the delay.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 74 ++++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 5b8dfa652d50..b34fb31c6db5 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -144,7 +144,7 @@ struct max9286_priv {
>  	struct media_pad pads[MAX9286_N_PADS];
>  	struct regulator *regulator;
>  	bool poc_enabled;
> -	int streaming;
> +	int mux_state;
>
>  	struct i2c_mux_core *mux;
>  	unsigned int mux_channel;
> @@ -221,57 +221,59 @@ static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
>   * I2C Multiplexer
>   */
>
> -static int max9286_i2c_mux_close(struct max9286_priv *priv)
> +enum max9286_i2c_mux_state {
> +	MAX9286_MUX_CLOSED = 0,
> +	MAX9286_MUX_OPEN,
> +};
> +
> +static void max9286_i2c_mux_configure(struct max9286_priv *priv, u8 conf)
> +{
> +	max9286_write(priv, 0x0a, conf);
> +
> +	/*
> +	 * We must sleep after any change to the forward or reverse channel
> +	 * configuration.
> +	 */
> +	usleep_range(3000, 5000);
> +}
> +
> +static void max9286_i2c_mux_open(struct max9286_priv *priv)
> +{
> +	/* Open all channels on the MAX9286 */
> +	max9286_i2c_mux_configure(priv, 0xff);
> +
> +	priv->mux_state = MAX9286_MUX_OPEN;
> +}
> +
> +static void max9286_i2c_mux_close(struct max9286_priv *priv)
>  {
> -	/* FIXME: See note in max9286_i2c_mux_select() */
> -	if (priv->streaming)
> -		return 0;
>  	/*
>  	 * Ensure that both the forward and reverse channel are disabled on the
>  	 * mux, and that the channel ID is invalidated to ensure we reconfigure
> -	 * on the next select call.
> +	 * on the next max9286_i2c_mux_select() call.
>  	 */
> -	priv->mux_channel = -1;
> -	max9286_write(priv, 0x0a, 0x00);
> -	usleep_range(3000, 5000);
> +	max9286_i2c_mux_configure(priv, 0x00);
>
> -	return 0;
> +	priv->mux_state = MAX9286_MUX_CLOSED;
> +	priv->mux_channel = -1;
>  }
>
>  static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
>  {
>  	struct max9286_priv *priv = i2c_mux_priv(muxc);
>
> -	/*
> -	 * FIXME: This state keeping is a hack and do the job. It should
> -	 * be should be reworked. One option to consider is that once all
> -	 * cameras are programmed the mux selection logic should be disabled
> -	 * and all all reverse and forward channels enable all the time.
> -	 *
> -	 * In any case this logic with a int that have two states should be
> -	 * reworked!
> -	 */
> -	if (priv->streaming == 1) {
> -		max9286_write(priv, 0x0a, 0xff);
> -		priv->streaming = 2;
> -		return 0;
> -	} else if (priv->streaming == 2) {
> +	/* channel select is disabled when configured in the opened state. */

All other comments in this driver start with a capital letter.

Otherwise, I really like this patch! thanks!

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> +	if (priv->mux_state == MAX9286_MUX_OPEN)
>  		return 0;
> -	}
>
>  	if (priv->mux_channel == chan)
>  		return 0;
>
>  	priv->mux_channel = chan;
>
> -	max9286_write(priv, 0x0a,
> -		      MAX9286_FWDCCEN(chan) | MAX9286_REVCCEN(chan));
> -
> -	/*
> -	 * We must sleep after any change to the forward or reverse channel
> -	 * configuration.
> -	 */
> -	usleep_range(3000, 5000);
> +	max9286_i2c_mux_configure(priv,
> +				  MAX9286_FWDCCEN(chan) |
> +				  MAX9286_REVCCEN(chan));
>
>  	return 0;
>  }
> @@ -441,8 +443,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>
>  	if (enable) {
> -		/* FIXME: See note in max9286_i2c_mux_select() */
> -		priv->streaming = 1;
> +		max9286_i2c_mux_open(priv);
>
>  		/* Start all cameras. */
>  		for_each_source(priv, source) {
> @@ -490,8 +491,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		for_each_source(priv, source)
>  			v4l2_subdev_call(source->sd, video, s_stream, 0);
>
> -		/* FIXME: See note in max9286_i2c_mux_select() */
> -		priv->streaming = 0;
> +		max9286_i2c_mux_close(priv);
>  	}
>
>  	return 0;
> --
> 2.20.1
>

--moc4n343pptgugnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3mGnYACgkQcjQGjxah
Vjz7JQ/8C05/xrKpVvYfuw7TnM8Lcu9iHbM0bNzDanzgR4QVG6mKdpNbYVv4//Tu
RdJ3WoyGDy6sFOA2Mb/qD6z74jpyzSYsDRa7vVZcjuTcbrhy1mB3o+u3JIP39nlB
XK5ZLjbKok0WRUwWKyHU9l80EwXxMkMNNHASf5DA4PnOqWjuX9yW9gJOVLwYE0q5
0mh7dt0ge78NJfPbQNv3DpQXkCOtrAkoGj7mEraUxoV/vdlg5nwBBX3QJ7UUsjN6
ydsRsRIgdnX86HFJiH6B7xppbGiHWiuvE4V/0hgnddTJMbyBun2G1nF61enMyEpX
2UfyLxIuPO9kPq7LZCb4I9QAgeu2sE16DurxBcwggeilTyOe/NyGYk6jvQxAIyj8
3o9VDwdyGCjVDDg7g+nb5FXtOLBzvJhW/c7cG6fMbkKkWMaUKzVls6lGXOh0idHn
SWWsQIHQnO9e8f6LwV/rnOGdp6zeDLbiu46pQ7/qgLAIcwRoiNAbWtQqZZGQPvCz
po0QmB5OD0iv9A6iRGj/tznHCzzoZmZSn5TCV06iRhT/V+EG+KaivkCsCpM3pvSq
ZEkk/HLNj/Y0CHSXGif6wJkP1g5DKSaw0d2qInt2SWgSKZD4VAJUbwcL7HL2UEnk
0F2eGEpZdC3JtxXxaoazq1SlWVgU3Ke2xoVXtgpVRcSImabsXQA=
=zCjV
-----END PGP SIGNATURE-----

--moc4n343pptgugnf--
