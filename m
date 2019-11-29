Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE79910D2FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2019 10:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfK2JMT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Nov 2019 04:12:19 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43415 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfK2JMS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Nov 2019 04:12:18 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7A59EFF809;
        Fri, 29 Nov 2019 09:12:16 +0000 (UTC)
Date:   Fri, 29 Nov 2019 10:14:20 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] max9286: Improve mux-state readbility
Message-ID: <20191129091420.tgqzm4jqj7lknbfz@uno.localdomain>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
 <20191128162706.704-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wvz5vgjjbeokicez"
Content-Disposition: inline
In-Reply-To: <20191128162706.704-1-kieran.bingham@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--wvz5vgjjbeokicez
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kieran,

On Thu, Nov 28, 2019 at 04:27:06PM +0000, Kieran Bingham wrote:
> The MAX9286 implements an I2C mux which we maintain in an open state
> while we are streaming from the cameras.
>
> The development code for the MAX9286 uses an integer value with
> arbitrary state values to control these state transitions. This is
> highlighted ith a FIXME and is difficult to interpret the meaning of the

s/ith/with

> values 0, 1, 2.
>
> Introduce an enum to declare the intent of each state, and comment the
> states accordingly.
>
> This state transition is only needed for the multi-channel support, and
> will not be included in the single-channel max9286 posting.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 63 +++++++++++++++++++++++--------------
>  1 file changed, 40 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index eed00ff1dee4..a9c3e7411bda 100644
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
> @@ -221,16 +221,39 @@ static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
>   * I2C Multiplexer
>   */
>
> +enum max9286_i2c_mux_state {

Let the bikeshedding begin here

> +	/*
> +	 * The I2C Mux will enable only a single channel (both forward, and

s/Mux/mux

> +	 * reverse) at a time, and to reduce I2C bus bandwidth, it will only
> +	 * reconfigure the channel when a write is requested to a different
> +	 * channel.

I won't here explain what a mux channel select does

> +	 */
> +	MAX9286_I2C_MUX_STATE_CHANNEL = 0,

To me, this should be the initial state of the mux, where all channels
are closed.

The state machine to me should look like:

        init() -> i2c_mux_close() -> mux_state = CLOSED;
        all transaction selects/deselect a single channel

        s_stream(1) -> mux_state = REQUEST_OPEN
        first transaction opens all channels -> mux_state = OPEN
        all successive transactions with (mux_state = OPEN) are nop

        s_stream(0) -> i2c_mux_close() -> mux_state = CLOSED
        all transaction selects/deselect a single channel until next s_stream(1)

For this state I propose MAX9286_I2C_MUX_STATE_CLOSED

> +
> +	/*
> +	 * The I2C mux will be configured with all ports open. All I2C writes
> +	 * will be transmitted to all remote I2C devices, and where multiple
> +	 * devices have the same address, the write will be received by all of
> +	 * them.
> +	 */
> +	MAX9286_I2C_MUX_STATE_OPEN,

I propose MAX9286_I2C_MUX_STATE_REQUEST_OPEN

> +
> +	/*
> +	 * The I2C mux is configured with all ports open.
> +	 *
> +	 * No reconfiguration of the I2C mux channel select is required.
> +	 */
> +	MAX9286_I2C_MUX_STATE_DISABLE_SELECT,

I propose MAX9286_I2C_MUX_STATE_OPEN

Could all these be shorten to MAX9286_MUX_.... ?

> +};
> +
>  static int max9286_i2c_mux_close(struct max9286_priv *priv)
>  {
> -	/* FIXME: See note in max9286_i2c_mux_select() */
> -	if (priv->streaming)
> -		return 0;

I don't get why we had this one here. Do you agree it was not
necessary ? I guess so, since you dropped it...

>  	/*
>  	 * Ensure that both the forward and reverse channel are disabled on the
> -	 * mux, and that the channel ID is invalidated to ensure we reconfigure
> -	 * on the next select call.
> +	 * mux, and that the channel state and ID is invalidated to ensure we
> +	 * reconfigure on the next max9286_i2c_mux_select() call.
>  	 */
> +	priv->mux_state = MAX9286_I2C_MUX_STATE_CHANNEL;
>  	priv->mux_channel = -1;
>  	max9286_write(priv, 0x0a, 0x00);
>  	usleep_range(3000, 5000);
> @@ -242,23 +265,19 @@ static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
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
> +	/* channel select is disabled when configured in the opened state. */

Channel

> +	if (priv->mux_state == MAX9286_I2C_MUX_STATE_DISABLE_SELECT)
>  		return 0;
> -	} else if (priv->streaming == 2) {
> +
> +	if (priv->mux_state == MAX9286_I2C_MUX_STATE_OPEN) {
> +		/* Open all channels on the MAX9286 */
> +		max9286_write(priv, 0x0a, 0xff);
> +		priv->mux_state = MAX9286_I2C_MUX_STATE_DISABLE_SELECT;

Shouldn't we sleep 3-5ms when changing the forward/reverse channel
configuration ?

>  		return 0;
>  	}
>
> +	/* Handling for MAX9286_I2C_MUX_STATE_CHANNEL */
> +

Empty line
Do you need this comment ?

>  	if (priv->mux_channel == chan)
>  		return 0;
>
> @@ -441,8 +460,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>
>  	if (enable) {
> -		/* FIXME: See note in max9286_i2c_mux_select() */
> -		priv->streaming = 1;
> +		priv->mux_state = MAX9286_I2C_MUX_STATE_OPEN;
>
>  		/* Start all cameras. */
>  		for_each_source(priv, source) {
> @@ -490,8 +508,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		for_each_source(priv, source)
>  			v4l2_subdev_call(source->sd, video, s_stream, 0);
>
> -		/* FIXME: See note in max9286_i2c_mux_select() */
> -		priv->streaming = 0;
> +		priv->mux_state = MAX9286_I2C_MUX_STATE_CHANNEL;

Shouldn't we call i2c_mux_close() here, and let it close all channels
and reset the mux state ? If the mux is not closed by writing
0x0a = 0x00 but the state is here reset to STATE_CHANNEL all
successive i2c_mux_select() call will re-open channel-by-channel a mux
that is already open, won't they ?

Overall, I very much agree we need this patch, so thanks for having
addressed it!

Thanks
   j

>  	}
>
>  	return 0;
> --
> 2.20.1
>

--wvz5vgjjbeokicez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3g4WcACgkQcjQGjxah
VjyBihAAxPFvKNvJWHkkjvp8teRy6z+JNg+qFAx9vzRRkE5u7eViVW4KNGGlpxx6
0z3LD8eqi/dUz8lYX8DkUaYM+tvf3xZ+Y/+7angJGqv1WgyQsr72zFhNN/TJ70F+
RpBLQwoTcjxiripzsmP0sPvJkuoHnTshx6cQaka1yqt3Eq3Avs/AA0i4wHAYDxjS
CeiJkvalIndbaPCGIQEj9ub/zlgD4ra+dFVdJChke1KYaXlRb5s9NFG2v4c07Sr+
CWQOz/pk5Xmee5CVSf6sgWdBTjPEO011/yBVIbBuTS/6lUBltMYD2/uR3hdRBYwp
9ECh3pu6LauCJbVecyVOF84aQJoii5hN+ccWaqEjV1lPBlXXy6Vsjlac0OH5B4X4
nTYpeGBr4Z4StutI7WjuBzVzZ3WKw5USvKyBLnO4E5E2IXugj1SQBBKG0juRQ4j8
s9Nemmby9h35+jorHPs5zfaIC5DAPtCmNfhOfLLkavAjU09chBDOs0IK7us+mQPH
2wah6eqmrOy8USEhR/4l6gCd5n4/QDqQxLXKVookdln3yMrFl69qqgnzJehl5CSX
K4GXYKDKDvAMC267/m6b4+xlIXxAumO+ntnks8b9bUQYFjaVUBox1uS9MyhoC43r
4/Ib14N/hFWyjXGeo/VNrGStvrxA0Hm4A6RqiWn0JW7z5jCh/1I=
=p5xY
-----END PGP SIGNATURE-----

--wvz5vgjjbeokicez--
