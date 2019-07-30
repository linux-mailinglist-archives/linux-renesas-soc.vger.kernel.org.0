Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10B5C7A536
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730936AbfG3Jvm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:51:42 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57681 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730901AbfG3Jvm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:51:42 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 9096E802A7; Tue, 30 Jul 2019 11:51:28 +0200 (CEST)
Date:   Tue, 30 Jul 2019 11:51:40 +0200
From:   Pavel Machek <pavel@denx.de>
To:     yoshihiro.shimoda.uh@renesas.com, kishon@ti.com,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     cip-dev@lists.cip-project.org
Subject: phy-rcar-gen3-usb2: wrong parsing of role in role_store?
Message-ID: <20190730095140.GA29609@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Code does strcmps, but does not actually check count. So AFAICT
writing "host-I-don't-want-I-need-peripheral" into the file will
succeed and turn it into host mode.

Also data beyond count in buf are going to be accessed.

Best regards,
								Pavel

static ssize_t role_store(struct device *dev, struct device_attribute *attr,
                          const char *buf, size_t count)
{
        struct rcar_gen3_chan *ch =3D dev_get_drvdata(dev);
        bool is_b_device;
        enum phy_mode cur_mode, new_mode;

        if (!ch->is_otg_channel || !rcar_gen3_is_any_rphy_initialized(ch))
                return -EIO;

        /* FIXME, this is wrong */
        if (!strncmp(buf, "host", strlen("host")))
                new_mode =3D PHY_MODE_USB_HOST;
        else if (!strncmp(buf, "peripheral", strlen("peripheral")))
                new_mode =3D PHY_MODE_USB_DEVICE;
        else
                return -EINVAL;


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1AEywACgkQMOfwapXb+vKz0wCeMEr6Xfbdu2izrD/k5LjebFz+
faEAoJnaRR88lf1ifgYIfsCDsbMWYSxQ
=a5ET
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
