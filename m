Return-Path: <linux-renesas-soc+bounces-27906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AvsHoiJg2lDpAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:01:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E558BEB4EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CA593004587
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 18:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A42421A1C;
	Wed,  4 Feb 2026 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjVchR9n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8453A9014;
	Wed,  4 Feb 2026 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228099; cv=none; b=rtmoMpAMU+tSPS6EyJ1DfUGWM/DfwYqFTDsq3gT2pN8d5nv58zgTybsMcwCSAt3IW1JDJCx+cdcb/r0DbnyLBS4gdAyJO+eDBcCrM52AGB7NLKDN1EdBsaRiBLC/YldSvm7wvBV16KTwAuUkjK2qUKDCULZuqd6akGbVdr/FeS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228099; c=relaxed/simple;
	bh=FpvnuqSxLUf1evy8jLZA18ReZo8eTAElpTcRgazV1/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9gpXp5+eBl+Lp1zUzSsPbAdNzJxRJCvuFzVYkZ3bqmcU7jgzFBx7oVxzZ380SeB3hZ24DENYPdLxZiLhax2nldUCpTP1/eAF1TSGkkBAgWEblb/HKIu45se0frSdRLZ9NpbbCsKvMclYoNuDG4uGojZq45siq0aHZOgXCvBoqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjVchR9n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01338C4CEF7;
	Wed,  4 Feb 2026 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228099;
	bh=FpvnuqSxLUf1evy8jLZA18ReZo8eTAElpTcRgazV1/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jjVchR9nmsAOa3YGEvxoDmFN/fWrako2moa2rh6fQaB9IVukv4ZPZSLvLzwlIyIFN
	 DkjpiymtZDJ3uAhrPhR1rzTyB0JtAisYdqL2IlUY+e6lvQ3yBSGejmNtwK3UshOwkH
	 pllghlUaYQq3EGIdiaW798mmmRElXRM0HCIZc7R6cmmHCK8qVups51pqDn2STylNIS
	 T4ax2HNxKZ463fTLFzWKCF4JtT/rKLP9GLX4BCsNhCCbTvolrwJKuFQv+a2riAcE6t
	 ODfGD8cxDX1fgaqja8xTFL+uvLDLntY69a8h+3OdAW3awztm2JIS0dy5rl7B3E6DtW
	 SqPW7o0no0QPw==
Date: Wed, 4 Feb 2026 18:01:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,rzv2h-gbeth: Document
 Renesas RZ/G3L RMII{tx,rx} clocks
Message-ID: <20260204-unroasted-obscurity-c3f5cde43036@spud>
References: <20260203104541.264759-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R84RhPBbHLhcO4T1"
Content-Disposition: inline
In-Reply-To: <20260203104541.264759-1-biju.das.jz@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27906-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E558BEB4EE
X-Rspamd-Action: no action


--R84RhPBbHLhcO4T1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: not-applicable

--R84RhPBbHLhcO4T1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOJfQAKCRB4tDGHoIJi
0n+xAP0Ynk+IZCwkCIDgJ4vDUtyzhOWXgd9iXUdDHos2vH66pQEAuB/EUCY5pkwI
xsVl3dE7jS12BWSVHazECvqrX2PF5QU=
=A/lR
-----END PGP SIGNATURE-----

--R84RhPBbHLhcO4T1--

