Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B119B11D191
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2019 16:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbfLLP47 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Dec 2019 10:56:59 -0500
Received: from foss.arm.com ([217.140.110.172]:51592 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729383AbfLLP47 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 10:56:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9554D30E;
        Thu, 12 Dec 2019 07:56:58 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 146313F6CF;
        Thu, 12 Dec 2019 07:56:57 -0800 (PST)
Date:   Thu, 12 Dec 2019 15:56:56 +0000
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
Message-ID: <20191212155656.GE4310@sirena.org.uk>
References: <23236201-a387-7257-35a4-ee4ed2f6bfd0@ideasonboard.com>
 <20191209163755.GF5483@sirena.org.uk>
 <fb87c957-40e8-587e-5789-33b740f8326d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline
In-Reply-To: <fb87c957-40e8-587e-5789-33b740f8326d@ideasonboard.com>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2019 at 10:42:43PM +0000, Kieran Bingham wrote:
> On 09/12/2019 16:37, Mark Brown wrote:

> >>  - is there anything I can do here within regulator_dev_lookup() to
> >>    attempt creating the regulator_dev 'on-demand' when
> >>    of_find_regulator_by_node(node) returns empty? (or is that crazy, and
> >>    just a rabbit-hole?)

> > This seems like a terrible idea, you'll have a half baked regulator in

> Ohh eep, I just re-read my description, and I don't think I described my
> intention very well at all. (or at all!)

> I wouldn't want to have just a half baked struct regulator_dev on it's
> own ... I was more wondering if we can kick the core driver framework to
> fully probe this regulator (which would thus create the required
> regulator_dev structures). It was more a question of can we guide the
> core driver framework that it really needs to probe this device
> immediately ...

Oh, I see.  Last time I looked at this in any detail the driver core did
probe things pretty much immediately when it got a new driver to match a
device (or vice versa), some existing MFDs rely on that.

> I was sort of wondering if something like this could optimise away some
> of the -EPROBE_DEFER iterations at a more global level, but I don't know
> how or if that would work anyway.

In theory someone could try to do some sort of sorting with the DT
graph, people keep talking about it but nobody's done anything that I'm
aware of.

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3yY0cACgkQJNaLcl1U
h9Ccnwf/Zt+s1/jHa0s+zui6lpM6t0BkffH9abuTMNz+8nOSjEcI+IqxOJOyVglO
gc1BBImmb6yEghdfzsfO13RGQwiRRApOz9SN2yLQW2jkvAeSIcfNm6hpqYYr12Vn
jSSayzKo4E/qciIxRdulZ9bzhtK7yf7ADU7M0eKrVVayJh8wvTxOPWsUpUIGYCG3
9Ts8ZXb6W18i9lthckJjTPc01Tm7c1UWs6cEs6D4QbkvLCWEUCPB0h/unH1JlrPH
vowIKCEZgzEpacCLnb89u9yqbAUqludWSSt59ImcQw3JKDop5NH7JHbvjUzQXDI6
E6UF7w/0C74tUzExKKiBlucg2VDOBw==
=afJG
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
