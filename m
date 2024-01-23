Return-Path: <linux-renesas-soc+bounces-1684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97E4838AEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 10:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8F951C211C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 09:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900A95C8E2;
	Tue, 23 Jan 2024 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHDkbLdZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8D55C8EE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003402; cv=none; b=Fm9i+TQH/RDTd7Ah5kwmf/m8dOQF+JmxZhp9PQyPcrMNCNRXRKUnrs8PdD+J0DaOwzR0Jd/R+dM9nY85mcu9+ffFjSloOlNm5ZsVX+eXCgeCPMOszfH5AaEXgI+Yu+GtNTtqVcuXnJXkhFzNDhK8Qi8NQfexs1Pz8YR9l6o9T1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003402; c=relaxed/simple;
	bh=WCel+0uHR4no2z8SgT2em/Xf9G93N+rMmKWoGqmNXgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqhGW6RVW0rhVmbBA3GduOBV+wLVz8fabU4gNTv1WdslPkc/b0y1nikW8uHppz+9Afpb8jsiHmb7gZ9oIsJ/PnTyXxnAKCwr1BF437ZWqoy2b+WeWZcllnxoJGURbreTB1g0DfogrlszkNcshXbH482qj8i6zIG7bIoQmhM9ty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHDkbLdZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72471C433C7;
	Tue, 23 Jan 2024 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706003401;
	bh=WCel+0uHR4no2z8SgT2em/Xf9G93N+rMmKWoGqmNXgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHDkbLdZxdGYG72DDRE16edmQqX4617s9/H/JBiPlUiwBgYQB+3P1r4GEuF0aM38G
	 o/xDh5e+cEoHxnQ5tsZ6Qf4G7mIN4l6mPYxXYI9oIjoL/uUyuSw5257CstPAuyWIGW
	 ieR2SSI0kNwbNZ5lzia/PxlMWaTY9zGNPjUTYLps6+1GWMqzpFJWEXFv9hvTzY/yB5
	 55y+YWssy1wxXMXnZr3xp8TuvLz9T38ebz4GAPuSHMMzbpkDyTIj/ek5hEdp8upGxv
	 Ye9VmevDrSoQnsrk1aE65Ys6lNXSu0E4RJY+i7Pug9qHwRI2iEJ7Xz3Btjdk01Sp0J
	 q//k47tjpqdCw==
Date: Tue, 23 Jan 2024 10:49:58 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Disable staging
Message-ID: <Za-Lxuj-5JRrJ2H8@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <7f1fa862cb508a5d29947380b72324be027ac76f.1705933596.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o+UTIo8hghph/GCB"
Content-Disposition: inline
In-Reply-To: <7f1fa862cb508a5d29947380b72324be027ac76f.1705933596.git.geert+renesas@glider.be>


--o+UTIo8hghph/GCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 03:27:30PM +0100, Geert Uytterhoeven wrote:
> After the DT conversion of SH-Mobile and Armadillo-800-EVA display
> support, and the removal of the EMMA Mobile USB Gadget staging driver,
> there is no longer a need to enable support for board staging or any
> other staging drivers.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hooray! \o/

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--o+UTIo8hghph/GCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWvi8YACgkQFA3kzBSg
Kbaf6w/9GB7dVlNrf6IN8RTPCw+k/Lu6ylpTIER6S8edx6tlZgqW4m07+pP1suEU
63vmddmROPKCFBcfbTnD3RvpUWva12T1PSl9yUw1sM4j3xKge+yV7mnb6goDGUbk
G0gbWpeQHlbqmBu31uGKAv6fQxM648ipTQzcccZh92D/zCUXw9kgZTE025g+uhd/
ditDpnyfH6IAmujkJ8utJhZOjMbqM0HzZP6T5FehU5CnMLkhFkE9mOc1fM1cVVOg
UAySSoMCbXyIT1UePz2roKppxpfsuT426FeqMLdoEnw7I8b8rqaoCFo0xhTTBd3K
xpwCbO2qzKXK4GQLxenpapnZ5yA8G88jaS03zVJtOdiSggIm3NW5VtyGDex9gxQ3
hnr9f3J/j3U5ssAJID12W9jrK5m4dbmzu8KcatEkXURhJrOCgk3ggPigStcZzVQT
oCCiMFTXkN5YYhRCyQvLOKvXl87QU4hQSySz/oARCk2nSAO6qzebCPex0t8BHJqF
WVe4ap12t3z2PGS5XOUH/IHdrMKVs8vyAQQr6dT9LLam78EfsxA7eWF6g0EvUWVf
hjBHByBsfNa/tWU1G+fALDDlODmSphoHJDeqPTJa/4wLzMummItLFOfEDJRVALEV
CTheq+lmiUz5bkTfRekY/D7bwVKBvdJ+Fta4ImzkB5QNue6DFrg=
=In/C
-----END PGP SIGNATURE-----

--o+UTIo8hghph/GCB--

