Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4383938FB85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 09:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhEYHT2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 03:19:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:58250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229726AbhEYHT1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 03:19:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7253613D6;
        Tue, 25 May 2021 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621927078;
        bh=Csca58SKBbbmyZOo4ioYPVoHavciv/JHoixjbdFh4lE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mT6COolUtYWstHM2SZhPwdUYUsn0sxf9l8VQoFAoqhV368R1TbBQE8ElxkKKm6j5+
         33dyRBq/haNtQijg2C/1BCj3Vtp7LlaFVkTmY3EbA9nC2NdGqnu80mADRrgjwJTVwi
         FQcOdZ94XkGDJnV3FHp1G4Tn8X8aARXMzPpT9JdZJ/fq6FmK/owZEJf85jX8Paf0Of
         +ItpzrCH1QDETr28/lhuqiKdWsRldlnawiXPd47AWUcX9xsFXHJdCe7ln7x0737v7i
         j9rXqYF0MvODOStrJLr5nt6MOBS0nDvjJVkz+FyqqiRpRJ8lm0r3MrsoDFhhM9YWzr
         pBIxZKqDT0kEg==
Date:   Tue, 25 May 2021 09:17:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] ARM: dts: lager: Configure pull-up for SOFT_SW GPIO
 keys
Message-ID: <YKykoyZC+MG9HT/7@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1619785905.git.geert+renesas@glider.be>
 <9fae3c0c2c0000f6b43c9ce87fe64a594b30a7da.1619785905.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ozaJuRsl1SftqsRa"
Content-Disposition: inline
In-Reply-To: <9fae3c0c2c0000f6b43c9ce87fe64a594b30a7da.1619785905.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ozaJuRsl1SftqsRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 03:10:52PM +0200, Geert Uytterhoeven wrote:
> The GPIO pins connected to the 4 Software Switches (SW2) do not have
> external pull-up resistors, but rely on internal pull-ups being enabled.
> Fortunately this is satisfied by the initial state of these pins.
>=20
> Make this explicit by enabling bias-pull-up, to remove the dependency on
> initial state and/or boot loader configuration.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works fine on my Lager board:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ozaJuRsl1SftqsRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCspJ8ACgkQFA3kzBSg
KbaR2g/+I/RzXJkcETu4VKzgYPIJOB87fOIqSbhGkyPU4TWqNhagOijRxWEdFXHK
yfhOxQlxaORicGGf8QcmuYsuN2anHONRO02MSHkEykQMiGNCeTdpe87k9w1BHBkV
EcxELtkvjPX+J5XU3Npwt+AlpL1kUSBq8XyatDv6KR62AGQYopiMSACNzGR+dFJo
YaG5gwoaZAlbSyZvSlBIToIZUXRE9JCevfsxYaQh+sLdhvchOT+gScJvTlTGQ4nS
Z8PyKthIOzw8S+XKvPFAOztAqTGz7l0S7ZzkC9wN88tpYeQGdM3s7F33t6MCj56n
vVDeTxnG9HTvii7PYTQw7dnbL8M4EYkQc3YStIqEpuQi4dIIC9rQffvQrE6HVq1Y
VN7zGvXgnMTz+PoY35L+mLUzKETFApZW/E+TFT1TDPpX3NVF8y5r34W9ILFu1/Q+
+RgTGQwcWTYNh7PG6imJB4IaJ6EEV+xo1XmEh6PU8cGrmFtVaO+fjzqvdf3qASzD
BU6FmSSG5w2XeiYx66IWvZkeMO8ECEXgodsaZ5/+Ew4+XrDxs5b38AKB/T9JCyr7
oqIHq3Yl+CRZpV4WOO26AoOuvhuAouKS5ZjXJSldrRPzxiNTLIYBlsdSBEfd7wrN
a/Evp4BrfUDVKrv/RvsVi5GsaQ5PI2aGDzQr1FMO+tG4ORGg1Z8=
=OxC6
-----END PGP SIGNATURE-----

--ozaJuRsl1SftqsRa--
