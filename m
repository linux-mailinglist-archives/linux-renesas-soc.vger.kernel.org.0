Return-Path: <linux-renesas-soc+bounces-1685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46931838AF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 10:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77F641C23310
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 09:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080CC5D732;
	Tue, 23 Jan 2024 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSBM0kev"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24B15D723
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003426; cv=none; b=PabnqULn2klkekFBHpx1w0tHD3s9yGwtM/XUeG+du2JvTR6vmPppoqk/XbrAmeaeTB4oRF55rAkhjLs7N0eG57vEBVWqpjgup0BGgWiI920PQyDRnE7R0oqCFKUxkRZ6/91IUV4JUKVjXfj2QcJfuooCXEtfQEf0ecTYv7XPgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003426; c=relaxed/simple;
	bh=EUImVz7BKJwXrJKlbE4O0iT8CMp7XDSUbjZwRrdgx14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/8ZNgi6xnWCP2SAzSqrpmmke/36/2jrUufbwgYO+hzAmKXGZxaCIa/6pWoza0JxSc3YTF/B1YywSTs2sfu7R0LUe+TMjYUe5uwoDS98Vt0A6ZTSQV3PvLt72nZyDUD5iknA2wRNrMvGnd4HFM1r98yqGATnJHDxfng9HYjGeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSBM0kev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1CCC433C7;
	Tue, 23 Jan 2024 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706003426;
	bh=EUImVz7BKJwXrJKlbE4O0iT8CMp7XDSUbjZwRrdgx14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSBM0kevLsFbSaI48TsOSpvoac5UhfV7tj+uRLczl68H9wNDx5oNtj79unQP4TXH+
	 UVuH+Q9VQ8u8Mxd1b7YxJy9cu13fs3EarhEwrxb3J8JYullEq5VbYAjla/thguRa38
	 wjXY2/uE2nlpBlbjJ85gy0n6LJS3gZb0VXn/NXlAZVZxVIVJU+EWjp7APvfC0eAiMc
	 HSxK9vCY8F4qtKJHIg25kbXVgr72irVw8YcBD0/xt/xBbrdWDyuSM6KgaoPimQh49e
	 QxledyFGZVY08uFGDnavmNFCFj6wFbQHjcHXZMnQw++IxDl8ZPJjejYwFhj7Iq25R/
	 efdm6DKIbn63Q==
Date: Tue, 23 Jan 2024 10:50:22 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Disable board staging
Message-ID: <Za-L3pNe4LOWy1fL@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <64c1d4613d5dfc1f70816f2136d66b75c8e39c1f.1705933656.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oZQbQNZsGu7KXIp7"
Content-Disposition: inline
In-Reply-To: <64c1d4613d5dfc1f70816f2136d66b75c8e39c1f.1705933656.git.geert+renesas@glider.be>


--oZQbQNZsGu7KXIp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 03:28:59PM +0100, Geert Uytterhoeven wrote:
> After the DT conversion the SH-Mobile and Armadillo-800-EVA display
> support, and the removal of the EMMA Mobile USB Gadget staging driver,
> there is no longer a need to enable support for board staging drivers.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hooray! \o/

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--oZQbQNZsGu7KXIp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWvi94ACgkQFA3kzBSg
KbaGWw//VOiIgvnReg4YBXqkYsh4idOKydBPY4DIGBJi4/mCv6Q5+SPrHfaroU9g
HSTo+OP5Co9VSXfXxmGKyhpEeTR5zp1hbyL5qj7feO2f3GYRv5YUWhurWsSjw2o9
tzFqduiT9jxjvCJca5KBGl1d7mudjq+5i2v7KiO06Fj5/ZYSzUaPRQ27OhveHvbT
c4CJtLsmBKcqRhygM+OL8qzvkFboPJdg1KGz8FteV3HdkWbJqfFZI597N0hbAlqS
ppwyfehN5AtsXpIHjuUsY5pz9L4GCzYw7Q+h/bB/9/v1zv1+Xc7+zXd3EeqUHy/N
B3dXHXerOmtlTzwZ4Abklw0aAdE0lpRU6HFRclAO7XzGPc3AGX79M2otQyQ3XFsv
OnvcQD2kwDsdAceTtdu6IuDQcCRkkITuOIKNMhzMyxwDeNHHKZZ2uq6FKQVG/dFh
k8I35cn9wkOaLXHnHnDx71g2wEt9x3S1nmj+JgLwtCSGg8DQAkCdje+gsTrZUxl0
Q1WdgiJQc92gDPu4lpOzZ/UWH5gdJeP7g5kLRKb2EtMLKr/Y/e1aAsEmmktjtJiQ
rnL8ZRd+Qf5abjno8joeBKATHxVXf/rGNmG0NSH8mtZbG6z/fO/WjcpOb/yKitIz
RchGwPFP0K1+IGY5+SBusIAyI06epgNtbCEXu7z7oyfvA2Joffc=
=tPqN
-----END PGP SIGNATURE-----

--oZQbQNZsGu7KXIp7--

