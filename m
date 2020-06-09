Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C0C1F3B1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgFIMuN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:50:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:52742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbgFIMuM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:50:12 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2DD05206A4;
        Tue,  9 Jun 2020 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591707010;
        bh=mb5BHpg+BlUVM5LIoAF9EaqEf3JUMMSjWdvZrwmh12o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dNfcud/2EeiI0vJXbs00wfklZgUQEggKGn7xblQN/w+qUYxzQn5XiaSyx8eXHvzhw
         3LTuY1EMw4fVrZ6VlNlDAH5nT2bHcG4amnTwFNMCbWbgMvM4yHY+Fj4KQqmKNgAKN/
         wlVy9k3mxN67vHj69NPv0LPy2meEp3hoUBoDi+qE=
Date:   Tue, 9 Jun 2020 13:50:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jiri Kosina <trivial@kernel.org>,
        "open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK" 
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/17] drivers: regulator: Fix trivial spelling
Message-ID: <20200609125007.GD4583@sirena.org.uk>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
 <20200609124610.3445662-10-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Content-Disposition: inline
In-Reply-To: <20200609124610.3445662-10-kieran.bingham+renesas@ideasonboard.com>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 01:46:02PM +0100, Kieran Bingham wrote:
> The word 'descriptor' is misspelled throughout the tree.
>=20
> Fix it up accordingly:
>     decriptors -> descriptors
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

For changes like these that are a bunch of trivial fixes independent of
each other it's generally better to send them independently rather than
as a series since only having part of the series (as is the case here)
usually begs questions about dependencies.  I'm hoping there aren't any
here and will queue these...

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7fhX4ACgkQJNaLcl1U
h9B9nQf9FwzB5vMSW8IRVFyyLTJL2DnPj/ZQNSsCDnVu5DnIAhT15EjuZKPfDy1y
/7mBvH1pdxlrneDLatcc732i4hMWSr0VdypgXYgauc7IV6mL5exIXNZqS7yTe/7X
VL7LxPR97oetlOpjRvwOjme3dwx+RqG1fQ4Wej1aPowIMmTN7eEcmiVhnQwy1l3j
xIj7PTBgVT/B5iSjTNPFbhVxFsfNJjkNwgrbG5TwH/p0g+/uqvVIjmMycaNqlg+i
4cFbtIiHr+hPIvmZoNoD4fyxv8TPbe8OxYTXnfOtYdBiM7E+JXU33n9e9uTVNDK6
Lm9LCoA+9DagbXmca9dfbRi+5tk/VQ==
=NQ5y
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--
