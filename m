Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43FE044C68
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 21:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729677AbfFMTkl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 15:40:41 -0400
Received: from sauhun.de ([88.99.104.3]:44334 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727429AbfFMTkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 15:40:41 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id A63294A127B;
        Thu, 13 Jun 2019 21:40:39 +0200 (CEST)
Date:   Thu, 13 Jun 2019 21:40:38 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, hch@lst.de,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v6 2/5] block: sort headers on blk-setting.c
Message-ID: <20190613194038.GC6863@kunai>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline
In-Reply-To: <1560421215-10750-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 07:20:12PM +0900, Yoshihiro Shimoda wrote:
> This patch sorts the headers in alphabetic order to ease
> the maintenance for this part.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Yup, I got the same result :)

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0CprYACgkQFA3kzBSg
KbZVJA/8CYiC4KAb4ZKE4Mg2e92mY0FzKCoXyJ0PJgcli/gmfXTFbkO5qZ+oxE1P
zMMjpm99xunduO/0xXIL/+AkyKyFRBv62+LAknH47DHRslBPIINw8gIAEFTwiV3H
nOmXvs/QtXDzkMNbC0rctqCamxcksSuKTlLxVHM/RWQxWtOqn8VJzz0uedhUIvQU
8wlnZOYC6Rih/2i+OISP3Szg6852ZckLeL8nMfHpsivAydHlFoDTrkFlnPC7HvQy
QEHn1R5wyz4rQTShL3SpdGvzv5nsAOk5VoGptYYWPOS9uDuKTLQ71Ip9nmB3iPKJ
m7a6OrozGncNS1U9MIov5thNHmiuKM8lzWqL/wGthPSK7c0YgDMvFKBpd+smwSj/
gQiwB7py1iLWzI0a3L37tZCxnNuZafR0MONyXouCZcv9ruby9J8SUutherJIEt7t
w65zdUyLw/spqvVkbqG44EKKyhZyODmBBIziSDJgWQbJ1odnuImR2lqm92cizJn2
L/M5/5h3GqL1/C+cZuMKmky/ytn+UzAj5S5Ix+y2I2Wq4Cu4mrQS5hQ0L+7p7kw5
YBZUTgbth+oEeBulL+Rp+z/NAuKkRp3p+safGAxG+JRNkvw4M71Abq8Gq1otC1SW
SEuShkO4eoYn+CEUfm0r32hizvsY9Aw+TIlvVrsGjFFQIyPkNvw=
=yGu2
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
