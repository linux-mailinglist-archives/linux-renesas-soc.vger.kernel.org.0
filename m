Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 294DA20892
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 15:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfEPNvF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 09:51:05 -0400
Received: from sauhun.de ([88.99.104.3]:42158 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbfEPNvF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 09:51:05 -0400
Received: from localhost (p54B334EA.dip0.t-ipconnect.de [84.179.52.234])
        by pokefinder.org (Postfix) with ESMTPSA id 1B3142C04C2;
        Thu, 16 May 2019 15:51:03 +0200 (CEST)
Date:   Thu, 16 May 2019 15:51:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Message-ID: <20190516135102.GA4901@kunai>
References: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 02:22:03PM +0100, Biju Das wrote:
> Fix the below smatch warning by adding variable check rather than the
> hardcoded value.
> warn: array off by one? 'data->select_value[channel_num]'
>=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzdasYACgkQFA3kzBSg
KbZLGw//RP01Uy7QPH+eQ3XfDcZ2Xw/QatqItFdCIW/MyQ1AAZQ7zXFo4qAsBTaL
SHBrQ/VqG0j7oRAJNFNQh7d76OTqTD/Va9xh0RMO8dzzyesuKUIhzhI+b7CC6sFO
9FfEDASAAv7MT3/Dia4xcrZqOKzJ+fND1X7b4sVhYRxuX4B7djJ+ahPkyenhRPvN
nj1T9OtYsP0swd6k00GuRNcYoGqo2hMpuI8MmbPub3xXVqGO6bHmOYHTBtBlZKjf
D5LyczXcYEvb/6fYm+bBPiXkaV5TEqnuhPvnxXvzdu89Xy8qjurfmrC9kVqg0knO
nWGtAK9Cb5/DtSpZQsD8ZnVGU2Jr0v2nNaQ/KzlHGheI/cZ1IKwIpSDGOBKXC4na
oCOkIHVc9sEynqWCF/qRBZp8OgT8kkyG3ytOg0GXY+Ajw2qFTBKRsdZlKrFfSfY1
DmTWC+2HxI6gwxM7/Mz9xXUk2MIc/VuryJIv2rgREwuPXVrJZr0BcSernLeFHOj6
950zdHfFHReYjUcCOjN9KzHFWUUKzXjBcOs5K4HPaSfOX53LR4xbuK07Xd8DvYTo
vQRXbuEWcFs1ttGkymp+U6pVqW95Ux2weWCvFRuMfAoEmFuA+O89wliy7by7aAUL
eXlwcuB+sNdCkt2eWDjcSxuYg3vLcJrA6+Le/uHREK/ttqK2Lco=
=rKGa
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
