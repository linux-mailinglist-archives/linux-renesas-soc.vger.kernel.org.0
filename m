Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2ABD177B8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2020 17:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbgCCQF7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Mar 2020 11:05:59 -0500
Received: from sauhun.de ([88.99.104.3]:51212 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728714AbgCCQF7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Mar 2020 11:05:59 -0500
Received: from localhost (p54B3308A.dip0.t-ipconnect.de [84.179.48.138])
        by pokefinder.org (Postfix) with ESMTPSA id DA3FC2C0872;
        Tue,  3 Mar 2020 17:05:57 +0100 (CET)
Date:   Tue, 3 Mar 2020 17:05:54 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com
Subject: Re: [PATCH 00/11] clk: renesas: cpg-mssr: add ignore-unused option
Message-ID: <20200303160554.GA3683@ninjato>
References: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 09:28:06PM +0100, Ulrich Hecht wrote:
> Hi!
>=20
> This series adds the option for declaring clocks as "ignore-unused", i.e.=
=20
> clocks that will not be turned on if not used, but also not turned off if
> unused. It also enables this option for the RWDT clocks in (almost) all
> SoCs.
>=20
> The point of this is to allow a WDT that has been enabled by the bootload=
er
> to survive these events:
>=20
> - deferred probing of the WDT device, which can lead the clock driver
>   to disable the WDT clock until the WDT is re-probed, giving it a
>   blind spot
> - probe failure in the WDT driver

I like the approach in general. Seems to solve both issues nicely. Minor
comments for patch 1 follow. I also agree with Geert about the squashing
of patches, yet in general, I look forward if this could be added.


--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5egF4ACgkQFA3kzBSg
Kba/qA/+NWcSKVXYuGscmNdjC4Dhc+OCM3iPBBF7139f7LXniZPwBZYDts+iWrwl
+YdzD6wnjlS49FdWhlvUJl2cXtABgcNgAevltqGv+RBet+zy2ypCB35EEGQxq7c5
ZItPLdsENsUmBX1IhUUARee+KTk5H7zpIiMOn8JL2SkloiVlFB1A7mCyO2iEvyfl
T8GbujXvwu2WpfkmPPuqj1PMrxr6RAE4dLnvqQxkeO24Ui2roFxXvXU1w/irYlMQ
i/a44eVpsb5Aa2d1NByTbNE7GmRiLjEUOAgiyOe7gEnMqp03Kd6KQHOVPuj3qFZL
s60mythsk5xWur8lOIuf1EPuEgRhuDzubIi1TgZ6xoYz46Cnw0nTM5h/udrcNZRn
+0Vm50+76gQUbb2z4UFcJcOKMdRS8nJHtQ2vMNxEmwHzFu/63MhEUWAMt4OfXpOV
fVE/krgmAawYf2vB4dHauMDXHWvQLGO5Sg/AuLjI9NsE4TefOTwSQ7cQhzX0pVIx
nbxk39QAEukGWJbXPVrhOez4SJmbQjPKsazhfb3R+rdjEk7yyJHYGioiAofjOs4S
TN9vUA6GxwIJnt4ClQHTrmhrbfRhJgJG6puxZWf/JU/och3MLSOHZiM5NeeWDdrb
QSUU5KA9fnKoRs9MGH7II7c0ad99tfL937HHDnD6OoZ8I++sLq0=
=diNf
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
