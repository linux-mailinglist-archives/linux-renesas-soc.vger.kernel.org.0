Return-Path: <linux-renesas-soc+bounces-31432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKr0ByhS5mkDuwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:19:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9FF42F50A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53A60300B5A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 16:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAE63446B7;
	Mon, 20 Apr 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCyZafo9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3651B2D978C;
	Mon, 20 Apr 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701621; cv=none; b=Bda84MuGxX4gROutEATG5H9gjW4jSK6tpsEHCeU67OFC8JvcE+qrLZAIq/sPRESJC30R6UMlWccyPOAVcucbKzOaXpgC0M1fU/z4y28FshX7HOv1tTBqMTcC5ZNZK0PTO6FxqwpqxllCDp73CXxOyRGFA2DmCIkxqQ7NIFsunN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701621; c=relaxed/simple;
	bh=qpZ7ncDNJr9ziiS+LAieulgSFEo8xxAIbpPMQA4F9mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTYXMVfb5PRfyn9dpCVYGYJKtS9+cy5Dm15TDmMS0bJdPHEAC+xrZRctxGelcvKZGxXgoVERdqanRpBVJbUo68ZtNx0efQPYg3bXUg66ssZdfqBFwZ1IptTsk7nLDSPpLz+UfNhR+ZxMMKiwcfCRgscCQpTC2c5rWPOyVGuq0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCyZafo9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D94BC19425;
	Mon, 20 Apr 2026 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701621;
	bh=qpZ7ncDNJr9ziiS+LAieulgSFEo8xxAIbpPMQA4F9mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GCyZafo9Fh/dEQP8jQ4T8sWyAUyJHulyQiSm09OXDMB/R4IbmiYf6xsJvHLRdqwo1
	 0jfy6MwgMWpQVX01lpDvwflFlluEV1a2RTdTLbUaCefLKt7HNClZyW8M/vx5y8TQdn
	 +UMQu6xbNY4JPECRT/P/iqcSdZNYYlObDQ5wYl9MTcBlQqQ4HRZn9NUYdjQzZuMRXh
	 TbGzQLN6MiE+5kTHeCPWNMnq7cOK4qR4tGUTV6wkuP6VU6smyd5dmJjO1N5Kw3qIww
	 mlJjrsBan6puI5myoUQ05311quXsvxO9AQTXdMSbKqVVmqbjpM1pptOBNtJTVNMh7c
	 kwUjFcKP5wk+w==
Date: Mon, 20 Apr 2026 17:13:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
Message-ID: <20260420-silk-reshuffle-5cebd4e9b3eb@spud>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pUBdod/Tj2QGPXtO"
Content-Disposition: inline
In-Reply-To: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31432-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,glider.be,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,microchip.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE9FF42F50A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--pUBdod/Tj2QGPXtO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 09:35:34PM +0200, Marek Vasut wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--pUBdod/Tj2QGPXtO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZQrgAKCRB4tDGHoIJi
0pjsAQCA49Pk0dsLboQWtCSvqUAqlzI1AA+W9v49L7Jrjx+s9wD+PH5THnhWjMV3
tKapKVmvGgUb9hPLap9b+GLi4MSdzQs=
=SY59
-----END PGP SIGNATURE-----

--pUBdod/Tj2QGPXtO--

