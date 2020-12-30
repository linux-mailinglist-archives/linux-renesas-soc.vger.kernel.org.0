Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B4B2E7AE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Dec 2020 17:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgL3QGb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Dec 2020 11:06:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:50666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbgL3QGb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Dec 2020 11:06:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34BE220795;
        Wed, 30 Dec 2020 16:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609344350;
        bh=RjTk1eMe6rUUCQ92s6HtWN/G6CXt+9YPO9UEoREadL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VfVfkoyk8F41JQxp70cznPKglmmFzZTtwt8R+ORDDukaNenhLh07xVsvHwyRAHPAw
         GkwcfJBL7d8kDy9BSulsKJNby7VUmvB49F8Nmem/6eYrEOG/xRjgHVruqU51zqaGS0
         JT3SJkZkJXzI7Aq1WdzRmnvFWpF1UuZBFDK6kdJQW9EaMv3hO7sSN7/GUoOieAOpv7
         XuwWfaBUy0+YwDsQipSBhYoAvxJz4GVg8n2Ns2W2OrU2qQTqjnNFyrIx95hRMZy4lJ
         q4uSB3comu/wGdBIvBfMEAdvRnid3sQIcfizyimHtIB9Q9uvdMkamQ6XqftHQgzNu0
         7mjrvmCldhSaw==
Date:   Wed, 30 Dec 2020 17:05:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
Subject: Re: [PATCH/RFC 4/6] dt-bindings: gpio: rcar: Add r8a779a0 support
Message-ID: <20201230160548.GD23641@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Content-Disposition: inline
In-Reply-To: <20201019120614.22149-5-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 02:06:12PM +0200, Geert Uytterhoeven wrote:
> Document the compatible value for the GPIO block in the Renesas R-Car
> V3U (R8A779A0) SoC.
>=20
> While this GPIO block is mostly compatible with GPIO blocks on R-Car
> Gen3 SoCs, there are small differences, and one of the new registers
> needs to be configured differently from its initial reset state.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/spVwACgkQFA3kzBSg
KbZXuQ/+P1zTNlMYhN2qopN4qwjmsteJq9K5u9fr2fcqvixk56rIJFiyAnhN/US+
kZZk4S+rrUg1frowOsOG1wWXeynz1CFfU30g1wqWToVKq4cE9uSYEVSL3xlFikek
PvjvDmsGUCIa0iXIaiev17N0OxUIGuRTobulC3BH3nL2BN9ZD04u6tE5fmzW9L8G
9YyJW7j8vxbT5BEfAWs+DLId4uKYFhdFjVw3gwUe9zgqp2GfC4MkrcyPXOl2UtnA
g6YelafUvAwe8OP27BXpIL0AxaY7w5H0kRBUYeAAxbtO38wDWky0JZbgn9xwz139
3GIBp20Swvo5ULQ4GrEcQxS2x0EcgoYOPZDKgV6bjl4/O3luoVmWKNyqY/3rejQI
LyyTfUShse9Exa4wpu3AQLiAtIKpLamRoApTkRZoJ80Gj0IrsHYhdpFr1YB4g3rM
YaFYQZmqFE5xMRICbMIumwosLnB9eZs+r/wrqHEbCavywfBFLX9kxqh4lPiZYByN
EJ+1efScpNYE8G4+q5Rdxci+NOgPHJM6Rn9XBplBXM8Dr9P7VYenIlkwf98S1ZWE
gFvc62Bllkj3H34791Bi6RVM+gqQBJ80FgX6MP/LaV1ijmdnKr4k5SkAnqo0zJks
Yd/jYNi06lJNZW16rktTspv/3NqsqWOKPKNhEYLolKCMaPbQSpE=
=tcE/
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
