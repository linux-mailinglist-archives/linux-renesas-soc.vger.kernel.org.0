Return-Path: <linux-renesas-soc+bounces-2578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA03850646
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Feb 2024 21:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DC011C20A75
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Feb 2024 20:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B545F849;
	Sat, 10 Feb 2024 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkDndEBI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5E73612E;
	Sat, 10 Feb 2024 20:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707597910; cv=none; b=RQatGzvyI8ALWWK5W2YO4Gphe2M+FN7/aAROp/w8rKqnBa9MpP/N+p+MKik2fyCcCci7c3c6p2LsncntAYMoWKVLLtib6lrQerFLxA3slw42jJIIER4dSoDZ0tgjaaxDJxQaWIfG1bOljnHpXVOsbquVP7p/uD8uaLu4+UhVhMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707597910; c=relaxed/simple;
	bh=s4/GAVNGtJKHPvbP5T5lksRrhX3AwahMM1n17Lq7znE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXIgg/ONv7p22dPQASG2ZbiT2OWPNst7eca3hOpUvwu5wJ5odScg7RoukocKU9oUKS35bXXM3/pew0H27p46i6O9QUfh+5prXm9o0wMv0SmL4YfrHf4UzVwMsf2DmMTAVicN6EU+16T1XVZdlQPezHztv58srIlXjcUqb7G9rzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkDndEBI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860B6C433F1;
	Sat, 10 Feb 2024 20:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707597910;
	bh=s4/GAVNGtJKHPvbP5T5lksRrhX3AwahMM1n17Lq7znE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkDndEBIepg68mtmfu7hDTGwCd1fFZsS339EH3wAkQ4yDgtB9h29+ENI1njeEf2gx
	 xTdWzMlEGj63DnqC4mP1S9US2SRcVdXaBim7+UbWyJzCWdfM48piM4X1TLgVNzREiA
	 cgG1sG5eazQ7r8g3mCN2YoGxp7Tifa+lU+TeBsiBEJB8LaJ7nUlxUAMa/0M1UdnEx1
	 Libzy5Gyl1Vjh2SsgmtIWCgIdvGAcBZQgu7VzTpGgXkv9C+/PrqnqzfWa01wqAUwZ7
	 9DCwnkD23lu52SdsKufhqq7SqFJkBluCR+oRjnmMFMTPHeOHYsDKOEmuWOP4FW0OBK
	 b+z7eyYemyIHg==
Date: Sat, 10 Feb 2024 20:45:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: renesas: Document preferred compatible
 naming
Message-ID: <20240210-zips-chatty-b50df32ee8ff@spud>
References: <20240127121937.2372098-1-niklas.soderlund+renesas@ragnatech.se>
 <20240210130619.GE1177919@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jUNmI1v8HWLO6t4J"
Content-Disposition: inline
In-Reply-To: <20240210130619.GE1177919@ragnatech.se>


--jUNmI1v8HWLO6t4J
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 02:06:19PM +0100, Niklas S=F6derlund wrote:
> I'm unsure who to ping for this patch. It have been acked by Rob so is=20
> the intention this can go thru Geert's Renesas tree?

That would be the expectation, yes.

--jUNmI1v8HWLO6t4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcfgUgAKCRB4tDGHoIJi
0ghlAQDrjrZ8AB9uwiV9Yjpoh+/9CywNNNuCEYfmY/HlceMqCAD9GaMrsmHS3ida
b4Pn0qqFADR8TEtqRMgI9L+UkTwnAwA=
=A7+E
-----END PGP SIGNATURE-----

--jUNmI1v8HWLO6t4J--

