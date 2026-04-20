Return-Path: <linux-renesas-soc+bounces-31434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEvFCghT5mkDuwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:23:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2642F66D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3401306DE50
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 16:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0146347BA9;
	Mon, 20 Apr 2026 16:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBZ3xlp+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C687347533;
	Mon, 20 Apr 2026 16:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701836; cv=none; b=k87aqbE3s1cN/7+gbgLWxOu+9zsB/IRvZa1fkxNVLGzP5hUPTGdNJlHDgQoUeW3G6OB8SSPi9m9sdrNK+VSVYqQv8zOFEQcKxgXk4FfItL5NzBCmo2qErETmB9Uh3RL74D2N2DONXlrsIZnmd3YTLPlkcodu8CqSPc3Zn+tOa3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701836; c=relaxed/simple;
	bh=6Kt8as8mq2L8x/oiYrn71n4n+iBL8ZBduPggFgHlRBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Np3V/zJ4RJOyw8acUdxhKKGr6CSllr1HaMVF4N1TlN00GlPxVu1SkwIXDMt/c9zQ9vtDVLCuqt4g2w/EMv+Gjp4OkUfKRc8t22AH32esoUCnahm96JAr8svBuGPwdX2S+PGpZ/TA9XAeVsQSHIAYXY+/ZKl3cLlU9ZXUW9hBAk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBZ3xlp+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D75AC19425;
	Mon, 20 Apr 2026 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701836;
	bh=6Kt8as8mq2L8x/oiYrn71n4n+iBL8ZBduPggFgHlRBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBZ3xlp+PbuDcHXj3lOpYFdY/2W4q7wYZnaNho+iY/mcUC17oXEZX72D4CSiTEkHH
	 N3r2cW5D2U2AEVsaWUl+FpbPuZsO5Et5MJnNz3eb8KFIHH9DmgacJQ9qNV6yI6DDTv
	 ycIvJdZhE0C68y+bVHMvCivfsIAICbY2wPB0ehoMxk7yUqkZrhnFy4qhUnB3O3LE3V
	 DWNhChfj5k/EWqecpJXkLGbrxTMgi+ACN5Gg8xtdMfFe7xv94rFgaDks8a8JeHd1ug
	 FRAR3Pik5yo1Eo6Oy+GWV9JCmkbTYGtJU3wgsdJrFyLcBjFxEqiTtIcUkgqCvLXbGx
	 ci0EgAMj6nrig==
Date: Mon, 20 Apr 2026 17:17:10 +0100
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
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
Message-ID: <20260420-petted-hardwired-323bc49c237e@spud>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IGrUQItqXndu9owC"
Content-Disposition: inline
In-Reply-To: <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31434-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,0.0.0.1:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: BEA2642F66D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--IGrUQItqXndu9owC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 09:35:32PM +0200, Marek Vasut wrote:
> Extend the Renesas DU display bindings to support the Renesas R-Car
> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
> except the HDMI port@1 is not present.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--IGrUQItqXndu9owC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZRhgAKCRB4tDGHoIJi
0vUmAQDMYNW2PseVrsC21cn9Wv1ntbk+NzKXu24VD4tt5g6LPAD9EiJcDYGjU9gz
EBCGuVdoC1lg6lw4LFmY+kw9vVtH9Ag=
=c6pp
-----END PGP SIGNATURE-----

--IGrUQItqXndu9owC--

