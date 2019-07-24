Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFFD74093
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2019 23:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387738AbfGXVEo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jul 2019 17:04:44 -0400
Received: from sauhun.de ([88.99.104.3]:42050 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387546AbfGXVEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 17:04:44 -0400
Received: from localhost (p54B334B5.dip0.t-ipconnect.de [84.179.52.181])
        by pokefinder.org (Postfix) with ESMTPSA id 13DF14A1209;
        Wed, 24 Jul 2019 23:04:42 +0200 (CEST)
Date:   Wed, 24 Jul 2019 23:04:41 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC repost] arm64: dts: renesas: ebisu, draak: Limit
 EtherAVB to 100Mbps
Message-ID: <20190724210441.GA1559@kunai>
References: <20190717125739.21450-1-horms+renesas@verge.net.au>
 <20190717132607.GA1458@kunai>
 <20190724105203.thykr2staw22gdj3@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <20190724105203.thykr2staw22gdj3@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > What about adding a short comment explaining the situation?
>=20
> Do you mean in the DT itself?

Yes, so we don't forget why it is there. Or do you think this is not
needed? I'd think it is useful but won't insist.


--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl04x+UACgkQFA3kzBSg
KbZXxhAAnTXukP1XYbvqYoGHXWNhsw+WJyaM0aOfz5mmCSfBRan7+YIQ2i7Qq8DH
xbwk2l3Qt2o+TEI4+LMvZ5sI81l2HNaZQi5Zsicf7c/xhHecwuiIvVhqoF2W5k2N
FcmIVCLvrgNlMaRSgFNcYG5vicRPJeLnWNBstw95ltKs3/8M636qYl8qDDIHh6Vp
S87NniVc2wX7Yu77ybU+lsBwDzoLtpq0H2ajxKqnxDg5suix5+I7IqYZkRuHTlO8
jaO1353cXCBzd/m8xrDNmO92NWyxuOEC71Yv+qkcUgJn5xEN7DaSxMY4wTYoTZ5W
XxfuzyBZCNkNGeMlLnWcb7CRzY6gc99YyywWKnzRHA7dAI0tdtuEZlA1EZtWOlhd
TZ6x0sUAqkACQarS0yBE3Tlu3cDRltegOg1pGfXmJWGiaI/UnPIXobMtc6/IW1Sn
44zR6O2/J8x3Covg/827XH/n++7pZb98hXyDO808d5UQ0iDn+1/E93hj+kh1kze2
CdLxay9NeeDhULpdUw+ClkSDVITS6uggDhX2WNOnhotsyg2G88qdTwaTE2KD9t7u
cAqwuwF7IhjTnzVTp47U0DvL3YCIvEJ+4cr9kn64k8NUk36z9CLwJCd1Zmr1hjYp
qYDslGwTMSmnknS+sGBoUnFAPCRRbZ/7vANxv4328sXVYOP3NcA=
=o6hC
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
