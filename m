Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E059F11728C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 18:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfLIRN0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 12:13:26 -0500
Received: from foss.arm.com ([217.140.110.172]:38952 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfLIRN0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 12:13:26 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D0421FB;
        Mon,  9 Dec 2019 09:13:25 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0D183F6CF;
        Mon,  9 Dec 2019 09:13:24 -0800 (PST)
Date:   Mon, 9 Dec 2019 17:13:23 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: Regulator probe on demand (or circular dependencies)
Message-ID: <20191209171323.GI5483@sirena.org.uk>
References: <23236201-a387-7257-35a4-ee4ed2f6bfd0@ideasonboard.com>
 <20191209163755.GF5483@sirena.org.uk>
 <d7003d64-e838-9dcb-8c61-d6567ff6eb69@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BghK6+krpKHjj+jk"
Content-Disposition: inline
In-Reply-To: <d7003d64-e838-9dcb-8c61-d6567ff6eb69@ideasonboard.com>
X-Cookie: We read to say that we have read.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--BghK6+krpKHjj+jk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2019 at 05:03:38PM +0000, Kieran Bingham wrote:
> On 09/12/2019 16:37, Mark Brown wrote:
> > On Fri, Dec 06, 2019 at 04:38:04PM +0000, Kieran Bingham wrote:

> >> The MAX9286 also exposes 2 GPIO pins, as such I have configured the
> >> MAX9286 driver [1] to expose a gpio-chip [2].

> > So this seems like a MFD then?  The nice thing about using the MFD
> > subsystem is that it means that the drivers for the various subsystems
> > on the device can instantiate in any order and defer separately without
> > interfering with each other which seems like it's the issue here.

> Well that's part of the problem... the V4L2 async framework can not
> currently support the device performing a probe-defer at all, so it
> *will* fail later (and crash currently).

> I hope we can fix this sometime - but it's a recurring pain point it
> seems. Unless it's just our video-capture driver, I'll have to dig
> deeper here, and check with Niklas.

Yes, that seems like something that should be fixed anyway - if nothing
else for the most part probe defer error handling is just error
handling.

--BghK6+krpKHjj+jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3ugLIACgkQJNaLcl1U
h9BSsgf+P5nEAiz6NE9toFu9jyKior0Li4t0qIFCVkk/mB5VP8vwpWbdmWHbInXn
yQaGDBq4LPXzselsQ64sa45vBUr8b/wZB/LVOZgYa7u/+7fpt79OdWdMGzWnEoYy
KrX0DfDCFH3VkgzRuZOu6DTNn3TQddAVOtXiEMjwKyPNH30eD5WopFEbbpvghAZw
D/xUEoxosM3qL7SjNdFxue1r9nrGkgm5KYfkkDhuyJIsRxtb5EYKqbOW4EyquHQo
toS7WRGSZTCy4kt7tD6W0ZazXCB+XYmCVPXUvwE+5DZTUcceRMPcVH7NXcfZ2wul
Hc2gP2Bf8BT2lA86tlaFcK6j8Gsong==
=bIW4
-----END PGP SIGNATURE-----

--BghK6+krpKHjj+jk--
