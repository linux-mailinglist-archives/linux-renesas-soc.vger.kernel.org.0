Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFDD105202
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 13:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfKUMCQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 07:02:16 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:35719 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfKUMCQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 07:02:16 -0500
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B7CE010000F;
        Thu, 21 Nov 2019 12:02:12 +0000 (UTC)
Date:   Thu, 21 Nov 2019 13:04:16 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT 0/4] GMSL Refresh (would be v6)
Message-ID: <20191121120416.c2uuxltyvym4pdr7@uno.localdomain>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
 <7d5f2a2e-3592-ab7b-2a0c-23373b2dbd2f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sg4yht5eqybjxfqd"
Content-Disposition: inline
In-Reply-To: <7d5f2a2e-3592-ab7b-2a0c-23373b2dbd2f@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--sg4yht5eqybjxfqd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kieran,

On Wed, Nov 20, 2019 at 04:33:15PM +0000, Kieran Bingham wrote:
> Hi Jacopo,
>
> Thanks for this refresh. The key part here is the refresh of the
> V4L2-Mux series, which is what had previously blocked the GMSL series.
>
> Will you post/publish the vl42-mux series on the linux-media mailinglist?

I considered that, but we already know that series is not meant to go
far, so I could just as reference...

>
> I know there are other interested parties who are looking at such topics
> - so highlighting the latest version might be beneficial to promoting
> discussions.
>

Might be, yes...

>
> On 16/11/2019 16:50, Jacopo Mondi wrote:
> > Hello this is refersh of our GMSL work.
> >
> > Current situation is the following:
> > - Kieran sent a full v4 with multiplexed stream support and has a v5 br=
anch in
> >   his repository with v4 review comment fixes on top
> >
> > 	I rebased the multiplexed stream's series on latest media-master
> > 	https://jmondi.org/cgit/linux/log/?h=3Dv4l2-mux/media-master/v6
> >
> > 	On top of that I took Kieran's v5 and re-applied on top:
> > 	https://jmondi.org/cgit/linux/log/?h=3Djmondi/gmsl/kieran/v6
> >
> > - Niklas sent a v1 (which sould have been a v5) which removes multiplex=
ed
> >   streams and only support one camera and was meant for inclusion but i=
s still
> >   floating around in linux-media, mostly because some of the comments on
> >   Kieran's v4 still applied there, if I'm not mistaken.
> >
> > 	I took Niklas' single stream max9286 and replaced the original
> > 	bindings with a json-schema version
> > 	https://jmondi.org/cgit/linux/log/?h=3Djmondi/gmsl/niklas/v6
> >
> > I bumped all versions to v6 to avoid further confusion.
> >
> > Not having a working GMSL setup I would ask to Kieran or Niklas to test=
 this
> > version so that we can try re-send the single stream max9286 version wi=
th new
> > yaml bindings for inclusion.
>
> Thanks, I can confirm that the rebase to current master was successful
> (based on your branch with the version of patches based on my gmsl/v5)
>

Great! Thanks for testing!

>
> As we now have two forks of the GMSL I'm going to rebase these such that
> the separation between current topics is clear:
>
>  - MAX9286 with support for a single camera (and only a single MAX9286)
> 	- This we could/should hope to get upstream
>  - MAX9286 VC support
> 	- (requires the V4L2-Mux support of course)
>  - MAX9286 dual device workaround (not suitable for upstream currently)
> 	- Required to function on the Salvator-XS GMSL board.
>
> Once I've done (and tested this) I'll make a new posting (should we call
> this v6? or v6.1?)

I think you can keep v6, as this one is RFT..

>
>
> In the meantime, I will not be making changes to the RDACM20, so if you
> wish to get started investigating the separation topic here - then I
> don't think you are blocked on me.
>

I think this will need a bit more thoughts... Separating max9271 and
ov10653 might be trivial, as the only action the current rdacm20
driver does on the sensor is an initial configuration with a set of
register-value entries. It's a bit more work to properly define the
data connection in DT and setting up a sub-notifier in the serializer
driver, but that's totally feasible...

Although, as Laurent pointed out we have a uController in the camera
module, regulators (iirc) etc, and so it makes sense to keep a single
rdacm20 driver, breaking out the serializer driver code into a
re-usable library instead of making a proper driver out of it.

What's your opinion on this ?

Thanks
  j

> --
> Regards
>
> Kieran
>
>
>
>
> > (I kept linux-media e devicetree out as I would like to test the patche=
s before
> > expanding the receivers list)
> >
> > Thanks
> >    j
> >
> > Jacopo Mondi (2):
> >   arm64: dts: renesas: Add Maxim GMSL expansion board
> >   arm64: dts: renesas: r8a7796=3Dsalvator-x: Include GMSL
> >
> > Laurent Pinchart (1):
> >   dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
> >
> > Niklas S=C3=B6derlund (1):
> >   max9286: Add MAX9286 driver
> >
> >  .../bindings/media/i2c/maxim,max9286.yaml     |  286 +++++
> >  MAINTAINERS                                   |   10 +
> >  .../boot/dts/renesas/r8a7795-salvator-x.dts   |    1 +
> >  .../boot/dts/renesas/salvator-x-max9286.dtsi  |  394 ++++++
> >  drivers/media/i2c/Kconfig                     |   11 +
> >  drivers/media/i2c/Makefile                    |    1 +
> >  drivers/media/i2c/max9286.c                   | 1081 +++++++++++++++++
> >  7 files changed, 1784 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,m=
ax9286.yaml
> >  create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
> >  create mode 100644 drivers/media/i2c/max9286.c
> >
> > --
> > 2.23.0
> >
>

--sg4yht5eqybjxfqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3WfUAACgkQcjQGjxah
Vjw8YRAAk2DaBCm612LvK3UzwapozQBdtGRg9t2UmZ2TeAD2sUBh4RnbCQtOLBuK
qmVUySToIS7mGWcuMozeKN6QsetzOqkwVzr24Xmj4iSFS5AP3Z4h8a9eteqBeXsX
BK/sdRSymMjUvH9jMA9iuXjvhL896e8fmynNmDQsD6/S+wDGXri4IYz3dV+sWzX7
3AosrcOsciRdtmKBI8FMST2CwT9jhbhsXNZdv4TUq0Yfq3IJ30w3X0ySw38SOga9
89c3k0e4eJl6Hnknrin6SKMnxbKfljtmdxMNynHRJdJdYuN7ZDtzM7rREu2laX71
DqrQ5t3pJ17wfoGQzh3uQ2bF8xuCasboCfq9tCPo7EmGVVwLBxxFDWCFV2h7eIYf
c1REjcJUgYsL1Sddm0JpAwzGZtHL+OkGZR9dwy4k6axLV7DC3e4YuLQcM8POE6X/
cg5gCndwnncSVPUgZWqOUDPXT/aio8qHVfo5gWe9c7F73tceeKYWza92NxJS3Ca3
JbiMEcdxtyN1tBU/eEt/ZC7xoFvsvXaPBTMH6dPHV5Mi7BL8Vx3irb05XzG/i+oW
I/rPEslEngfZ8HR0LhpjOtA1y3Q0HTrnFWSykK922PlOH3CYH1zvkXQ+abTM68CF
gCiLreSd5/cGFA+yeLRwMvrAVyQqFbepF7Y5EASvI6SbjCxXLig=
=Bhyz
-----END PGP SIGNATURE-----

--sg4yht5eqybjxfqd--
