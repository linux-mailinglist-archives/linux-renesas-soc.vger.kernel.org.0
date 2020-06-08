Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060941F20C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 22:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgFHUlR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 16:41:17 -0400
Received: from www.zeus03.de ([194.117.254.33]:37018 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbgFHUlQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 16:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=lfRlR6rk2IoTNg54fbivRcobce3D
        Ce6/iyfI/FoAao8=; b=l4NudZ+Md4P0yig/iC5VtKIDZs0cgxh9TOZadm4uY8Qt
        Gi7BjWgzLam6A6VoE6BXyQ/62il0sCaW564AvYn3d20/I3KZ8mtcBqe4oGPonw/0
        Znqjsq6YSF8N1tutRR8ThaHGhpQ7L6/CbF4T+WBeWZf9sF2IsnXmYTWyHl5e/e4=
Received: (qmail 3137612 invoked from network); 8 Jun 2020 22:41:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jun 2020 22:41:14 +0200
X-UD-Smtp-Session: l3s3148p1@aIrEoZinIoQgAwDPXwXUAIYwoJSUoKNc
Date:   Mon, 8 Jun 2020 22:41:14 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] mmc: core: when downgrading HS400, callback into
 drivers earlier
Message-ID: <20200608204113.GC917@ninjato>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
 <20200604112040.22144-2-wsa+renesas@sang-engineering.com>
 <TY2PR01MB369228A84C46D582D1219EFFD8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB369228A84C46D582D1219EFFD8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

thank you very much for the review!

> > The driver specific downgrade function makes more sense if we run it
> > before we switch anything, not after we already switched. Otherwise some
> > non-HS400 communication has already happened.
> >=20
> > No need to convert users. There is only one currenty which needs this
> > change in a later patchset.
>=20
> Perhaps, should we add Fixes tag like below?
>=20
> Fixes: ba6c7ac3a2f4 ("mmc: core: more fine-grained hooks for HS400 tuning=
")

I am not sure. While it is more correct to move the call to
hs400_downgrade upwards, it does not really fix a bug on its own.
Without patch 2/2 of this series, there is not really a huge difference
when we disable the SCC the old way. For the new way, this patch is a
prerequisite.


> > +	/* Prepare host to downgrade to HS timing */
> > +	if (host->ops->hs400_downgrade)
> > +		host->ops->hs400_downgrade(host);
> > +
>=20
> IICU, we should call hs400_downgrade() between the __mmc_switch("EXT_CSD_=
TIMING_HS")
> and mmc_set_timing(card->host, MMC_TIMING_MMC_HS) because the switch comm=
and should
> be issued in HS400 mode.

Yes, of course, you are right. Will fix!

Kind regards,

   Wolfram


--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7eomkACgkQFA3kzBSg
Kbb0dw/+IU1CyXHkDLpFjZWmvXBJoVZRsi6HF8MvNbabaGPWw36gkISpfZ4aZHgo
VHk0zWGSnTDOYM6cBTYfz8m8cO2+4ULp2vbxdW5jThklxstICFeBXV73DhHE5yoS
1mskaAnSiuvCFu5QNLWGZkAk0FbSmkl1k3iNRifqH7BuafTR0AqqTGOqgJ5fGH/8
FjrBVUtZHYM+VIcdRonMf/BXzx3DX8tAr8pxF7DKurIHZT/LCWmQ7w88ZykWjSV+
5gw5LZC6N9HzyC9P6OvXGurtnzovQEXkPxUANwPavddjghVkNIGkXMf8RoVl4lgl
06te1UgzewW/U0qIsU8OqxLvffGL65WK+oyzYcKzvp75AS0oMk2UmBgT/w9JwfTK
T146VxkD5KxKpbwH6eruITNAvIPCE5rH4dRbkcof5ecD8uEFcg+u/wZp/eB6/URR
19HcddbiBD3mdwTU3TNTZLfJvfZF0vtv7Wcc+0xx/rVRPGjmU1Gby8nNyWtUjWir
HFXLbZtYU7/u6PQlW1FdTQvfKdJLTyO4YGyq7T+d0ocCFNWNIedV84/lHQUar5b8
iclRvm3IhkLqerUgjtnFE9YrU45OTmiygTnaq10XdquFAmmQ9uDb2nPsAqbtTPtx
ps0qE20X9sqytR09J1coq+n0j4aLz3WZRrlpISDgCJqvuGQNqlY=
=hZd4
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
