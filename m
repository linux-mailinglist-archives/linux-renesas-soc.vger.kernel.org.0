Return-Path: <linux-renesas-soc+bounces-6508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB32190F575
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 19:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B191282A7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 17:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DAD155C94;
	Wed, 19 Jun 2024 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1yo5egO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1092558B7;
	Wed, 19 Jun 2024 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718819313; cv=none; b=i+Fn1kKMtIkkUNSexXoTB8UFh0Ts9c/kZTe0lwVBP+v1KfciuXh4criIX4sOF6W0232WmQ+FCoD9YM8gaKKmGcceXhRk9ZqT/VCVOPWjozGJJWdTkRi5Cu1IArVaHeAjM6W6tG2ejIrmLmqOim2Kik2vHWO/95soRT2QmruutuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718819313; c=relaxed/simple;
	bh=+H1y+nRL9sbiYxKUX3amRQOLD3k10dsKb7bEBzTZpwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phMPRBD/36X+uB8oa2/mbkjlZYqdabFkbS5IPzQf3qqWIQfWPMUAqHwsbIEH7MbTchf1KeGiuGGYI6y45WxqejLkIbsAGaXQdLFTmzcUgZXlrmkFRh+CGIo5AOWbXKSbNfpa2HAmXJXHkt6ZDuTbjymCjQRRB8ZNz9q4W0kPak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1yo5egO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA647C2BBFC;
	Wed, 19 Jun 2024 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718819313;
	bh=+H1y+nRL9sbiYxKUX3amRQOLD3k10dsKb7bEBzTZpwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1yo5egOUjPWySNaTqqx3kdECHlskTJiKvQomO2XPNhib4rCX2Ylr2sL+qowAgnMn
	 TxlQ4sy0Ywyk54FmL/bw5vMvvobuy26b8CGlMZJcRa6DHYPik0hGl3LBbbNmWSnVwW
	 djWFaVufj6TAwHRxAG/qfp6lewCaqpCUaDoUQX1+Cn+sMmf9ORUONtkCOkBMJSp4LE
	 XaH4KpqyQklyNftv6ttlE2M2H+COTGR4UCumi4/iFosGa1ZdQXGp1eq8bo15OZk+Zn
	 OwPG+wxioUxej4LcNOADzNhwwjLYDCeS7aLtDUnk7jP17W7A5TW57FNwQqvckDeWZr
	 ctsdVEeRl2fzQ==
Date: Wed, 19 Jun 2024 18:48:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	marek.vasut+renesas@mailbox.org
Subject: Re: [PATCH] dt-bindings: clock: rcar-gen2: Remove obsolete header
 files
Message-ID: <20240619-explain-sip-97568f8ac726@spud>
References: <d4abb688d666be35e99577a25b16958cbb4c3c98.1718796005.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DHmCkqrhx6sMv4JG"
Content-Disposition: inline
In-Reply-To: <d4abb688d666be35e99577a25b16958cbb4c3c98.1718796005.git.geert+renesas@glider.be>


--DHmCkqrhx6sMv4JG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 01:22:46PM +0200, Geert Uytterhoeven wrote:
> The clock definitions in <dt-bindings/clock/r8a779?-clock.h> were
> superseded by those in <dt-bindings/clock/r8a779?-cpg-mssr.h> a long
> time ago.
>=20
> The last DTS user of these files was removed in commit 362b334b17943d84
> ("ARM: dts: r8a7791: Convert to new CPG/MSSR bindings") in v4.15.
> Driver support for the old bindings was removed in commit
> 58256143cff7c2e0 ("clk: renesas: Remove R-Car Gen2 legacy DT clock
> support") in v5.5, so there is no point to keep on carrying these.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

If U-Boot is not using them,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
(and if it is, another task for Marek I guess!)

Thanks,
Conor.

--DHmCkqrhx6sMv4JG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMZ7QAKCRB4tDGHoIJi
0sVNAP9XUqM3g9KnW52zPaLKAWsof5aGQZou1n3opr4EX3WvBwEA4gTj6X9xFd1X
9IHy60JhSDC8V5IjTADrfy/yET7NxAs=
=t8to
-----END PGP SIGNATURE-----

--DHmCkqrhx6sMv4JG--

