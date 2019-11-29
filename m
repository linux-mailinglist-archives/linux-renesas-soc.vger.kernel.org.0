Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E4110D4EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2019 12:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfK2LdJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Nov 2019 06:33:09 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:39437 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2LdJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Nov 2019 06:33:09 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BDFFC1BF215;
        Fri, 29 Nov 2019 11:33:04 +0000 (UTC)
Date:   Fri, 29 Nov 2019 12:35:12 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] max9286: Improve mux-state readbility
Message-ID: <20191129113512.s6rioibgxuxpbanb@uno.localdomain>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
 <20191128162706.704-1-kieran.bingham@ideasonboard.com>
 <20191129091420.tgqzm4jqj7lknbfz@uno.localdomain>
 <dab13648-9559-5a41-b08e-499cf6b58aea@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y2mjijuwohhonmay"
Content-Disposition: inline
In-Reply-To: <dab13648-9559-5a41-b08e-499cf6b58aea@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--y2mjijuwohhonmay
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kieran,

On Fri, Nov 29, 2019 at 11:13:00AM +0000, Kieran Bingham wrote:
> Hi Jacopo,
>
> Thanks for reviewing this :D
>
> On 29/11/2019 09:14, Jacopo Mondi wrote:
> > Hi Kieran,
> >
> > On Thu, Nov 28, 2019 at 04:27:06PM +0000, Kieran Bingham wrote:
> >> The MAX9286 implements an I2C mux which we maintain in an open state
> >> while we are streaming from the cameras.
> >>
> >> The development code for the MAX9286 uses an integer value with
> >> arbitrary state values to control these state transitions. This is
> >> highlighted ith a FIXME and is difficult to interpret the meaning of the
> >
> > s/ith/with
>
> ack.
>
> >
> >> values 0, 1, 2.
> >>
> >> Introduce an enum to declare the intent of each state, and comment the
> >> states accordingly.
> >>
> >> This state transition is only needed for the multi-channel support, and
> >> will not be included in the single-channel max9286 posting.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> ---
> >>  drivers/media/i2c/max9286.c | 63 +++++++++++++++++++++++--------------
> >>  1 file changed, 40 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >> index eed00ff1dee4..a9c3e7411bda 100644
> >> --- a/drivers/media/i2c/max9286.c
> >> +++ b/drivers/media/i2c/max9286.c
> >> @@ -144,7 +144,7 @@ struct max9286_priv {
> >>  	struct media_pad pads[MAX9286_N_PADS];
> >>  	struct regulator *regulator;
> >>  	bool poc_enabled;
> >> -	int streaming;
> >> +	int mux_state;
> >>
> >>  	struct i2c_mux_core *mux;
> >>  	unsigned int mux_channel;
> >> @@ -221,16 +221,39 @@ static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
> >>   * I2C Multiplexer
> >>   */
> >>
> >> +enum max9286_i2c_mux_state {
> >
> > Let the bikeshedding begin here
> >
> >> +	/*
> >> +	 * The I2C Mux will enable only a single channel (both forward, and
> >
> > s/Mux/mux
>
> Ack.
>
> >
> >> +	 * reverse) at a time, and to reduce I2C bus bandwidth, it will only
> >> +	 * reconfigure the channel when a write is requested to a different
> >> +	 * channel.
> >
> > I won't here explain what a mux channel select does
>
> I was trying to explain what /this state/ does ...
> I can streamline this.
>
> >
> >> +	 */
> >> +	MAX9286_I2C_MUX_STATE_CHANNEL = 0,
> >
> > To me, this should be the initial state of the mux, where all channels
> > are closed.
> >
>
> I actually started with a _CLOSED here, but I determined that _CLOSED
> was redundant, as _CLOSED is simply _CHANNEL with a channel id of -1.
>
> And when in _CLOSED, the next 'write' should be of type _CHANNEL, as in
> it should configure only a single channel, and open only that channel.
>
>
> > The state machine to me should look like:
> >
> >         init() -> i2c_mux_close() -> mux_state = CLOSED;
> >         all transaction selects/deselect a single channel>
> >         s_stream(1) -> mux_state = REQUEST_OPEN
>
> I also had a REQUEST_OPEN, but I deemed it also to be a bit redundant,
> as the external (not mux components) which adapt the mux_state should
> only care about two states - Either it's open or on channel.
>
> I almost wonder if I should put in a helper function to make mux_state
> private to the i2c_mux functions ... but I think that's overkill.
>
>
> >         first transaction opens all channels -> mux_state = OPEN
> >         all successive transactions with (mux_state = OPEN) are nop
> >
> >         s_stream(0) -> i2c_mux_close() -> mux_state = CLOSED
> >         all transaction selects/deselect a single channel until next s_stream(1)
> >
> > For this state I propose MAX9286_I2C_MUX_STATE_CLOSED
> >
> >> +
> >> +	/*
> >> +	 * The I2C mux will be configured with all ports open. All I2C writes
> >> +	 * will be transmitted to all remote I2C devices, and where multiple
> >> +	 * devices have the same address, the write will be received by all of
> >> +	 * them.
> >> +	 */
> >> +	MAX9286_I2C_MUX_STATE_OPEN,
> >
> > I propose MAX9286_I2C_MUX_STATE_REQUEST_OPEN
> >
> >> +
> >> +	/*
> >> +	 * The I2C mux is configured with all ports open.
> >> +	 *
> >> +	 * No reconfiguration of the I2C mux channel select is required.
> >> +	 */
> >> +	MAX9286_I2C_MUX_STATE_DISABLE_SELECT,
> >
> > I propose MAX9286_I2C_MUX_STATE_OPEN
>
> I had this as 'MUX_STATE_OPENED', but it felt like what it was really
> doing was just 'disabling select' operations, hence I renamed it.
>
> It's also 'internal' and I wouldn't expect the no nmax9286_i2c_mux_
> functions to reference this enum value.
>
> My further reasoning to keep this as DISABLE_SELECT is that ifsomeone
> set this state (not that anyone ever should), when the mux was closed -
> it would remain closed.
>

Ok, let's see what other thinks... anyway, that's your code so if you
feel strong about this, I'm fine with what you have

>
> > Could all these be shorten to MAX9286_MUX_.... ?
>
> I think so, I was just following the function naming.
>
>
> >> +};
> >> +
> >>  static int max9286_i2c_mux_close(struct max9286_priv *priv)
> >>  {
> >> -	/* FIXME: See note in max9286_i2c_mux_select() */
> >> -	if (priv->streaming)
> >> -		return 0;
> >
> > I don't get why we had this one here. Do you agree it was not
> > necessary ? I guess so, since you dropped it...
>
>
> Exactly, I couldn't see any reason for this to be here, and I also
> couldn't see it being used, as _close It doesn't get called after an
> s_stream operation as far as I can tell. It's only currently closed
> during _probe and _init.
>
> However, if at some other point, someone wanted to call _close, I would
> expect it to close all of the channels.
>
> >
> >>  	/*
> >>  	 * Ensure that both the forward and reverse channel are disabled on the
> >> -	 * mux, and that the channel ID is invalidated to ensure we reconfigure
> >> -	 * on the next select call.
> >> +	 * mux, and that the channel state and ID is invalidated to ensure we
> >> +	 * reconfigure on the next max9286_i2c_mux_select() call.
> >>  	 */
> >> +	priv->mux_state = MAX9286_I2C_MUX_STATE_CHANNEL;
>
> Note here that we set the mux_channel to -1, and thus the state is set
> to _CHANNEL as discussed above, because on the next operation - we
> expect either the write to go to the specific channel, /or/ if someone
> has set MAX9286_I2C_MUX_STATE_OPEN explicitly the select call will send
> it to all channels.
>
> Those are the only two options as far as I can tell, so adding extra
> states of '_CLOSED' seems redundant, and adds unecessary complexity to me.

_CLOSED was meant to replace _CHANNEL in my proposal.
No worries though

>
> >>  	priv->mux_channel = -1;
> >>  	max9286_write(priv, 0x0a, 0x00);
> >>  	usleep_range(3000, 5000);
> >> @@ -242,23 +265,19 @@ static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
> >>  {
> >>  	struct max9286_priv *priv = i2c_mux_priv(muxc);
> >>
> >> -	/*
> >> -	 * FIXME: This state keeping is a hack and do the job. It should
> >> -	 * be should be reworked. One option to consider is that once all
> >> -	 * cameras are programmed the mux selection logic should be disabled
> >> -	 * and all all reverse and forward channels enable all the time.
> >> -	 *
> >> -	 * In any case this logic with a int that have two states should be
> >> -	 * reworked!
> >> -	 */
> >> -	if (priv->streaming == 1) {
> >> -		max9286_write(priv, 0x0a, 0xff);
> >> -		priv->streaming = 2;
> >> +	/* channel select is disabled when configured in the opened state. */
> >
> > Channel
>
> Ack.
>
>
> >
> >> +	if (priv->mux_state == MAX9286_I2C_MUX_STATE_DISABLE_SELECT)
> >>  		return 0;
> >> -	} else if (priv->streaming == 2) {
> >> +
> >> +	if (priv->mux_state == MAX9286_I2C_MUX_STATE_OPEN) {
> >> +		/* Open all channels on the MAX9286 */
> >> +		max9286_write(priv, 0x0a, 0xff);
> >> +		priv->mux_state = MAX9286_I2C_MUX_STATE_DISABLE_SELECT;
> >
> > Shouldn't we sleep 3-5ms when changing the forward/reverse channel
> > configuration ?
>
> Based on the comments below, we probably do - and this has been missing.
>

Yes, was not there in first place

> >
> >>  		return 0;
> >>  	}
> >>
> >> +	/* Handling for MAX9286_I2C_MUX_STATE_CHANNEL */
> >> +
> >
> > Empty line
> > Do you need this comment ?
>
> I wanted to clarify that of the 3 states, the lines above explicitly
> handle the MAX9286_I2C_MUX_STATE_DISABLE_SELECT,  and the
> MAX9286_I2C_MUX_STATE_OPEN states, so it's left 'implicit' that the code
> below is MAX9286_I2C_MUX_STATE_CHANNEL.
>
> I added the comment to make it more explicit.
>
> I didn't want to move all the code into a switch statement which would
> be my only alternative otherwise I think.
>
>
>
>
> >>  	if (priv->mux_channel == chan)
> >>  		return 0;
> >>
> >> @@ -441,8 +460,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
> >>  	int ret;
> >>
> >>  	if (enable) {
> >> -		/* FIXME: See note in max9286_i2c_mux_select() */
> >> -		priv->streaming = 1;
> >> +		priv->mux_state = MAX9286_I2C_MUX_STATE_OPEN;
> >>
> >>  		/* Start all cameras. */
> >>  		for_each_source(priv, source) {
> >> @@ -490,8 +508,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
> >>  		for_each_source(priv, source)
> >>  			v4l2_subdev_call(source->sd, video, s_stream, 0);
> >>
> >> -		/* FIXME: See note in max9286_i2c_mux_select() */
> >> -		priv->streaming = 0;
> >> +		priv->mux_state = MAX9286_I2C_MUX_STATE_CHANNEL;
> >
> > Shouldn't we call i2c_mux_close() here, and let it close all channels
> > and reset the mux state ? If the mux is not closed by writing
> > 0x0a = 0x00 but the state is here reset to STATE_CHANNEL all
> > successive i2c_mux_select() call will re-open channel-by-channel a mux
> > that is already open, won't they ?
>
> I have not modified the actual state transitions from your original
> implementation, so I think you're the expert here. This is your code,
> just renamed.

I know, this was a question not strictly related to your changes

>
> (Ok perhaps that's not true, I removed the state check at
> max9286_i2c_mux_close above)
>
> So - thinking it through ... Yes, you are right - this will leave all
> the channels open. This is the behaviour we had before this patch though
> so I wonder if this could explain any of the issues we've had.
>
> I don't /think/ so - because
>   A) we probably reset the board a lot,
>   B) I don't think we've had issues starting and stopping streams, but
>      we haven't done enough testing there.

Also, it won't hurt to have the mux open all the time after we have
configured addresses properly. It just does not feel 'right'

>
>
>
> > Overall, I very much agree we need this patch, so thanks for having
> > addressed it!
>
> No problem, I needed to go through to understand what the three states
> (0, 1, 2) were, so this is what I came up with.
>
> Thanks for your comments, I'll await any further comments to the above
> then do a respin before collapsing it into the multi-stream support patch.
>
> Or do you think we should keep things as separate patches on top of the
> 'single' camera support? I don't want to end up in a GMSL==100 patches
> to track case again if we can avoid it .., So I'd like to keep it down
> to three managable topics :
>
>  Patch 1) A single camera support, (should apply and run on linux-media)
>  Patch 2) Support for multiple streams (requires v4l2-mux)
>  Patch 3) Support for 2 MAX9286 on one bus (not upstreamable currently)

I very much agree with this plan!

Thanks
   j

>
> --
> Kieran
>
>
> > Thanks
> >    j
> >
> >>  	}
> >>
> >>  	return 0;
> >> --
> >> 2.20.1
> >>

--y2mjijuwohhonmay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3hAnAACgkQcjQGjxah
VjxKNA/+ND1wOJ320YA1uVBx5+MXFt3PBmH5HYN6LooWxmgp9zH+I+hhaGDlFHuO
DkQ/WFV2oSV2tdTEY8RaVUKo/ZSCw4vn4v3cyhMnxNUexHiKf1gehp6hoSz0qToa
68gItGhdvQxBZazU5jHZDkZr4dBapz2tNxqLFFFM9o3x/O6oUiLUy+mzqGY705uB
Kk3DSYQ7FixFP/m8/fNkjg82YlauCBHggYH5ElTarTVczP7pMY4iFE0DYXqKWLpm
rffEpfegLZPQaM2gQOfJV1zUShi4Rt6vB39K6KSQOf6jGqV8UlLUQykPolaUPyN7
xNa50FecE86JhtBa9D2MqxFqZKIb97wLYmqW7i6YAvo2AjOnczdTGWaunB3cR4FZ
AfEx4evod0iGRfFBaV3PnxiUyQ1FN6TMvfnkSY0gKqQXj6a+0kd7EMkI05MA02ih
RYrlf9mU4LmkFkdUtFGuhtNn0lvvFC6+tzQI6tttop5AX4zgtick+lglgwDXO6MD
1XYQBQ3ziQ8kM0/l0Oa07g2TGxM2oGoVa8rgHW/C0xZlZMatdSwapQlGgNArCRwS
J8/P+Jead0X1iTWrMy8eE2MAbaZnlGzN1oLifypz6DFnEJiXqsSZeJBDjcXsBKe4
R2zL6Vk+KnCBrp3I7HVrwb38O96IXpxRcHlhc9OHIiqtIkGZAco=
=0JF9
-----END PGP SIGNATURE-----

--y2mjijuwohhonmay--
