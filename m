Return-Path: <linux-renesas-soc+bounces-33097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIWfMXCnFGrJPAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 21:48:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F45CE1A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 21:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A1C9301724A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 19:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E6835F5E9;
	Mon, 25 May 2026 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVPtEeFC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8759F1CFBA;
	Mon, 25 May 2026 19:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779738474; cv=none; b=p6fMyrz8UghAjRzj6oUdagAlu9svaMtr1TNq4eCovdHLJtAClt0XKlrRS0DtrY0NRRXaAxkZY+cIWLAohnyDHgecjoFly96Mtwebe3YNprfypk6c+1so8/SNtz0m19uYUUKGe3VbQguj+lUso4Vufdv2SnT9kpn9iDocc/6wTtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779738474; c=relaxed/simple;
	bh=63/2YWqsD7Ors963G51wcV/l7BgjtiH2c939Q4Bz/2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjpfImdWaHK60KPyHRdq6msc2i78AiShDnXOywDNsKsskEv3Uob/C5hbnp+IIAYxpuwhqVJoLdZ5wxztMD0EwcErUfdN5OhZBVgEQugQa+BtPR7xamc8gW49XE1yYNCQ4zimC/JKpwMECBM40I924tBFYN0pF02++qixOk27f9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVPtEeFC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4811F000E9;
	Mon, 25 May 2026 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779738473;
	bh=63/2YWqsD7Ors963G51wcV/l7BgjtiH2c939Q4Bz/2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GVPtEeFCZQSk9Wea8Lxyztx9CSsIescfzNCXFArUSSMYqsGkxNNxKQEysr+S5MOda
	 z46juzqnVw7Mb+v342+1B9m/jrFkMEIgWqaK5n/mgl6ADz6Hr4d7HDV4p1TiMZ4SJL
	 5uA4KBuSf6127jq0dFoqnzpahbM4f/PwE4x9R3UlC8/X5WZMZiDvcgMfr4ZL7036Al
	 95+YVXShjuRvwQoapHPi9Fl5589retks03tP4Ih14LsRxoGSJyYz8DmcttDl8lRTqn
	 aFZLp74USzwDnEzyzwBhY5vznHjeXgkRRosbNhEJz4qak3rSM/5HjPf7Y57DXbHfZp
	 xlFEnvD0BvqTA==
Date: Mon, 25 May 2026 20:47:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace
 clock in R-Mobile APE6 example
Message-ID: <20260525-outrage-lego-2858c3eed769@spud>
References: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iMjt770BTEZflGTE"
Content-Disposition: inline
In-Reply-To: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33097-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4D0F45CE1A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--iMjt770BTEZflGTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 09:25:50PM +0200, Marek Vasut wrote:
> Since commit 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks:
> Document ZT/ZTR trace clock on R-Mobile APE6"), the APE6 clock node
> expects two additional "clock-output-names" entries, "zt" and "ztr".
> Update the example accordingly.
>=20
> Fixes: 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks: Document ZT=
/ZTR trace clock on R-Mobile APE6")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--iMjt770BTEZflGTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahSnZAAKCRB4tDGHoIJi
0vl2AP9l+ryVmXD2JyeSGAK3rZF8YEqWuxvXoEPpknmVqr3CpgEAgMfUE6J96aiu
6Qv/mObJL5G8vRFckeaPOk30b+HhLQs=
=5QF5
-----END PGP SIGNATURE-----

--iMjt770BTEZflGTE--

