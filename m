Return-Path: <linux-renesas-soc+bounces-1779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 687F983AA45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DDD72918E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 12:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A0C77634;
	Wed, 24 Jan 2024 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7MxbPyL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72076918
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706100533; cv=none; b=Q8voFiDVnl+TAzaeElb/+UoSCjlQO+Z2Ff8HRPuDCzDZKENE+GtZkFlT8MD8norMwD/GknoVKh0dCW4HPeEZJvQ9bzEzk5PeGEiGvi5y+QicyQ40Bca319DcUbRoU8s/C26LQ49xxYWId0MK+NdDtmY5JIxk3z2vawcfTNvmT/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706100533; c=relaxed/simple;
	bh=gmqqcuFNQULKUexI97rlf9RuTK8M031/LlhsaUh7jNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMzbPeWZDsO3njaFqbb1SRs5e1cE6T3AnR9RdKelO3D3Q635fkQQXDzJ8Lh2wuMZORDiyni2thNn1393jnIBJyD3beTl/Qs8FwT2zQT0cKgZx/C/VA1KacQzflDX6kbnBgNrdqED3ArA4KQju9YrQhoQbEG0aS8sqha05noT1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7MxbPyL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC24C433C7;
	Wed, 24 Jan 2024 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706100533;
	bh=gmqqcuFNQULKUexI97rlf9RuTK8M031/LlhsaUh7jNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7MxbPyLR9iLCNipssWbVFERr8toizlPo2tfnjy6HlHxVbxS+PAw70DrfMbPAsrME
	 ol0cfvpGOzn1+jqsUlN994l4uN9P4QMyAoCM7FzIujTkiH2b+XBu8Z+g3xC9DxxRpC
	 1mzXET9bo0d2z51vTxmwnCUAb8iiA9VJPDi8kg3D92by5ZatH8ELWIbN9T1PJCQigw
	 LhoO0RsQFIRwxau9SlFUEtPS6558kmiuCU1ps2KeKVS9e/qqP1XhngQwfVdkkmlT0L
	 rxKln1OGXBCWqPBfUwnr3Y3ZqNU38Nowy88U4CJiOKqRc4bpdb/nMPPweINgy6svUG
	 y1K6fKIPgAYLQ==
Date: Wed, 24 Jan 2024 13:48:49 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 3/7] arm64: dts: renesas: Add Renesas R8A779G2 SoC
 support
Message-ID: <ZbEHMQIplrLFbfld@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1702309604.git.geert+renesas@glider.be>
 <73de98b825eff295c60b76a239e9a885dd65303c.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="avr5vC3gJR3FUHxN"
Content-Disposition: inline
In-Reply-To: <73de98b825eff295c60b76a239e9a885dd65303c.1702309604.git.geert+renesas@glider.be>


--avr5vC3gJR3FUHxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 05:01:18PM +0100, Geert Uytterhoeven wrote:
> Add support for the Renesas R-Car V4H ES2.0 (R8A779G2) SoC, which is an
> updated version of the R-Car V4H (R8A779G0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--avr5vC3gJR3FUHxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWxBzEACgkQFA3kzBSg
KbbM5w/+Pq9U+iJ3XgWOXUoGVAJ+OS7d1joGsZOpCWe7IfdOqsFVlirzoiWpHjvK
5CN9uiDGWCp538aHGW4DThsJ/Ex6Xw0isTmXZby/fMl3s+PvnFxwN8rH5b6F1IDG
fpYeHNTHj9d7OZLzhRoXxYiU1sPi1WLI9XLH78IMriZTvdJopQ2HFiq8o2KS3G30
ycASqHN4PflOzTwTx48utxTm4KAy6PNESXjeujHiBO9s7AfPffDd41F7/ZkmiLJG
WfRPqZWzMZNjB5lnH01ApGF1h0fbkkuYpw4Qri2VN3BA5YyTXJDF6H5h/yjPtDOi
Op+PX4RIjLPB96r4H1m7o1zSLtHqqwp/WLoohR3yllup5DxlxjQGhxBrC6GgrbKv
AyJDeaKFr2kHLFGyEvlI2EtJTGsAdVPJmbGdYO25twN1as1YDa9MriTlGjZ6lVCx
Io+Dm5VgNsZBV0mv37F4LiUlc3xXpm7DwNvMjDpTnFFIwL3BCGt1UP9XyC7PJt/Y
Gz40NR23lO3sZ26YMa12Vh3cSMzT5aWi0+YXQvPOdvPA8o9h4NfZ3cX20/lfjAMA
IflrfPTPMv+eEuGLHLJVtUkp37LoqyQ5vQdWqh6OuFhAdxpGdQngCgLY+lqltJjk
qjWHTzCGsS9bZuzu7wZ7kOgH+hM2Bz+NuRLcVnFi6T8yw/HsMw4=
=RR3t
-----END PGP SIGNATURE-----

--avr5vC3gJR3FUHxN--

