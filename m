Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C17A915BDC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2020 12:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbgBMLid (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Feb 2020 06:38:33 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:60177 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729428AbgBMLid (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 06:38:33 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 32C716000F;
        Thu, 13 Feb 2020 11:38:31 +0000 (UTC)
Date:   Thu, 13 Feb 2020 12:41:12 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] max9286: Split out async registration
Message-ID: <20200213114112.b6cbskal5ek24uj6@uno.localdomain>
References: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
 <20200212173727.19476-2-kieran.bingham+renesas@ideasonboard.com>
 <20200213094614.fqie2a7smfjiyzv7@uno.localdomain>
 <ff9361c1-aae4-4bd3-3851-3e205c53f342@ideasonboard.com>
 <20200213102047.ezba3dqvbx7qg5lq@uno.localdomain>
 <fef3b258-97b6-8a6a-71ce-f6d44450300b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="svxppa62hooynr5q"
Content-Disposition: inline
In-Reply-To: <fef3b258-97b6-8a6a-71ce-f6d44450300b@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--svxppa62hooynr5q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kieran,

On Thu, Feb 13, 2020 at 10:27:11AM +0000, Kieran Bingham wrote:
> On 13/02/2020 10:20, Jacopo Mondi wrote:
> > Hi Kieran,
> >
> > On Thu, Feb 13, 2020 at 10:07:18AM +0000, Kieran Bingham wrote:
> >> Hi Jacopo,
> >>
> >> On 13/02/2020 09:46, Jacopo Mondi wrote:
> >>> Hi Kieran,
> >>>   very nice thanks for handling this
> >>
> >> :-)
> >>
> >>> Just a few minors
> >>
> >> :-s hehe
> >>
> >
> > Turned out to be lengthier than expected :)
> >
> >>>
> >>> On Wed, Feb 12, 2020 at 05:37:26PM +0000, Kieran Bingham wrote:
> >>>> Move all the V4L2 Subdev Async registration so that it can only happen once
> >>>> we know we will not need to -EPROBE_DEFER...
> >>>>
> >>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>> ---
> >>>>  drivers/media/i2c/max9286.c | 88 +++++++++++++++++++++++--------------
> >>>>  1 file changed, 55 insertions(+), 33 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >>>> index 1b4ff3533795..03c5fa232b6d 100644
> >>>> --- a/drivers/media/i2c/max9286.c
> >>>> +++ b/drivers/media/i2c/max9286.c
> >>>> @@ -503,6 +503,49 @@ static const struct v4l2_async_notifier_operations max9286_notify_ops = {
> >>>>  	.unbind = max9286_notify_unbind,
> >>>>  };
> >>>>
> >>>> +static int max9286_v4l2_async_register(struct max9286_priv *priv)
> >>>
> >>> Could you capture in the function name this actually deals with
> >>> notifiers ? Like max9286_notifier_register() or similar...
> >>
> >> I'd like to keep the 'v4l2' in there somewhere...
> >>
> >> 	max9286_v4l2_notifier_register() ?
> >>
> >> But then maybe even that could be confused with the notifiers/async
> >> handling for the max9286 itself.
> >>
> >> My aim was that max9286_v4l2_async_{un,}register() dealt with subdevices
> >> connected to the max9286 only ...
> >
> > To me async_register() calls for dealing with registering our own
> > subdev to the async framework, not collecting remote asds and adding
> > it our subnotifier. As you wish, it's really just a suggestion.
>
>
> So would you like to see the async registration between the max9286 and
> the connected CSI2 receiver handled in this pair of functions too?
>

No no, I was just bikeshedding on function names, no worries :)


--svxppa62hooynr5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl5FNdgACgkQcjQGjxah
VjxHvw/8C2sywgTGMg3FIRdGl/ZO/y0G3kFlTCK3fT8t4MV0q5ec1Y2YaQmONZTb
7vya+aKML8GD6yWSxIf3BlSwUdj6rI9HA03Su5bK7ltxDet/5fCdHP3DrY4bm0+k
eLPPoqtvHwjrcJhO3N3YH1l1z21aaHFKuzXFEOjMGRKo342/AIx024thR7xMee6e
Dko/dTPV2XSHl2hyoBvdpnosvBO0msazrssJmZXAYLAmDGWOM+BnQzSMF9ennVI7
daqEBpg9WzCOALX80z9QS1sgIxPXroM4M8oyjQ20EtAQb1Qi5UI+5q3+bqqOpBFt
Znikv/bc1PFU8PdcthBkjQLE5kDrt82yMPdl/pfB3Ofb8yfeJLPYWFOoZlB3XFCQ
8PS9nIFMWoAqmgrllZMHPwcL3NLhCJ5UZKb3FEwPASiNxcCloWV/5Nfa19XutNuB
6F4zZs95TSdWu/iU9T6AE2EAQ5VlBus/FtHyQnxWk4JPLtZ/eU0Hr9DhwaEFVAYm
k8zDxWQ+9Zv1E0nqr1gr2oZUGzzkSg3Vl2M7kBY5FwatY/MfEwrK9ELjGKdlWQWi
AF0u+4vTSLnPgxf3pAEMy3/yjUZ4+r+IlwKxJAjRbCGolzTEMLTcVBe0wpXSiNjx
HPf7ytyzAlUDH4JtR+vO4D0b2N6Wib2AhW9QibH+1k8JBZ9+8Ok=
=NkoW
-----END PGP SIGNATURE-----

--svxppa62hooynr5q--
