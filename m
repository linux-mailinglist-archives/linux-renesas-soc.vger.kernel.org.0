Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D116401945
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 11:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241674AbhIFJvV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 05:51:21 -0400
Received: from www.zeus03.de ([194.117.254.33]:34908 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241689AbhIFJvV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 05:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=joH6vH9CNfqdbiqFu5uIjx55lbmq
        2/NbgDyaie9/n8I=; b=dwMD0ryzI9QNxmv/MsjpIvlYEKHedXmJ+O8Js26rpW6X
        UV+ZQW28lnb+BoS8ITUBWkIAAwV45NCPXRJWQ/VjO/I30p9TxyWw2BaqvJ32M6mC
        ZpAGmF/4PmpLspequKZu6thSXU8f3OsC+pVDkh5vyzKv7g4JBSSH7G4Hd2OahpI=
Received: (qmail 423046 invoked from network); 6 Sep 2021 11:50:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2021 11:50:15 +0200
X-UD-Smtp-Session: l3s3148p1@1yh0k1DLCqMgARa4Ra5MAc3ZBYWvSFq1
Date:   Mon, 6 Sep 2021 11:50:15 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>
Subject: Re: [RFC PATCH 3/3] arm64: dts: r8a779a0-falcon-cpu: Add TPU support
Message-ID: <YTXkV0IsY353nsoj@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>
References: <20210901091725.35610-1-wsa+renesas@sang-engineering.com>
 <20210901091725.35610-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdV1XgDm1WFQEHST8Fnd0qrbPDBEVKOkr6cfg5a=NS-exg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E8ouUl6Lt2yia6MC"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV1XgDm1WFQEHST8Fnd0qrbPDBEVKOkr6cfg5a=NS-exg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--E8ouUl6Lt2yia6MC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Do we want this activated upstream? I think it is nice to have.
>=20
> I don't think so, as there is no actual user.

OK.

> It could be enabled in a DT overlay describing a board connected to
> CN4. Or just a simple overlay for testing TPU on CN4.  I'd be happy
> to add the latter to
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
/log/?h=3Dtopic/renesas-overlays

With the same argument, let's see if someones actually wants to use it
and adds it as an overly then.

Thanks for fixing the sorting in patch 2/3!


--E8ouUl6Lt2yia6MC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmE15FcACgkQFA3kzBSg
KbYF4Q//Q4Yrm0CRlv/DE0jUZYUSqRKLpfgOblUpirAPwJC/1/WtXRTXF5+b//uA
WgIGN/D1zDv3FFmYmqYbP3u5epktfxvgqyHc+HrcJi+pBkBlcVI5W09NPPcTUMIF
vDNipZE4TGPGwV8HvcuBkl56Mj0kq3UnpKTaFK0pxGYYhhrt0vXlGiKG5+k9I0T7
7qE3OPKoWw2Pi4tntS9iPJeKuceNAGQlnB/Ujdf5DCLYeM5BVEPT64PpjgoqjJRd
q00LiF0FNOuL5sPcz4acnjoO4or1vOvBUwgCnV5j6A1GZgvZeBWxIhTf9+vQ+h+W
HcSfm+cu/y7WNewV9Ox/6Fu3azYkyL/IC6QyL7xWQXMsN4VlxGm34d0moqEb7mc+
K3HxLTGRPXNkSy1Td2GqJ+vLDxKE/bwve/1VWNur1fpLBlB1GXDzW1yrAjozFTCp
gu9lvr1xCvUIUcepXt24F2maFj8gJwu4HKfG2reAqr7EDGJnPBAZaYmU3qS1aS+/
/IjDOwZRJjlOok+6FUZC5J6A9WrYi5Ijhs7QtkY1Ar+HrCGpkElV2RZpUXHjOKYI
wKPWZZKUowk9i70DNq8LyNUKsDUfrRII/Qq8Xf7nQ/iAK3jC4KvrJhRZyv9WNLem
5O9aZFx7YbWiy+GM1Dk5b1INpj/sJ0PCYCU7sLK0cq1JtnPtIls=
=1GUg
-----END PGP SIGNATURE-----

--E8ouUl6Lt2yia6MC--
