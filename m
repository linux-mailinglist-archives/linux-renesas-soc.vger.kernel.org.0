Return-Path: <linux-renesas-soc+bounces-31436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALtJAEJU5mkDuwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:28:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01C42F858
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DAB6C306677F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 16:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012EB34C130;
	Mon, 20 Apr 2026 16:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CURfiw2D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03E334BA28;
	Mon, 20 Apr 2026 16:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702120; cv=none; b=QnTyyG+viI7W7YAd/4o9Cro9bP/V63OT0Xdy2QOXrplEAvt5XDw5GWgvBXSb7bIy9BK2NRQ43IT5j0RSfL7lD7CcFluKsCB6xx2llsuH9uvx+0dglL/JkDOYtTnQ/gxeTMqUlpdnuvjAaNa9xOOFzxTMAbBR3/Pn825g9VtEK4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702120; c=relaxed/simple;
	bh=7gSnfTauznAgCbps4yyQD5dJfmqkXOvSHr5T5TBqeI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Byuol0NIdPqKrI9fc3uuE981czux0H1GRWkfYw4tZuU3vtLRvr6eLbF0jXvEiDreKdzir/a3hQu/EQ2H6XZMQoeWV8RxjFPYQ7v7aG5cd6PPbT5c98UqKWyzm5zX9VbUmox6vqBaY+mKBpEFlQt+Zf5DMiihJa0plw9jWxD8G+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CURfiw2D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34EFC2BCB6;
	Mon, 20 Apr 2026 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776702120;
	bh=7gSnfTauznAgCbps4yyQD5dJfmqkXOvSHr5T5TBqeI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CURfiw2DVJrkCT+AMf7ywtgJkQwfXAV7uuVqT2nINKO8tQsw4AogPu9Hzv9aYSYH7
	 boI6AcEPH7BxzPXlyjAuwcIfOvvvFAscmab9N3urAKRqQpypdoQRChQZ3Hfz/z+15/
	 tK5LgNdyn7noKcS7Wj9FkrsrdMPr9gJ2YursU9gdmDLXQPZZaogvGHC8MPQTpGUPeR
	 mEZuigOzyFV9Ou6j6VLyEipcn6Mhx7fN+qCBx9CsQkR2rjwdkMX2TL/GrqqHhtJdFA
	 /hjGemxm4CGwfDdG+yNroSHeL4Q3Bchgxhf6ZZU+EBRrfPvp0iOgrxJEDtg0368FiI
	 flrthm5C93ouA==
Date: Mon, 20 Apr 2026 17:21:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: syscon: Document the LVDS_CMN
 syscon for the RZ/G3L
Message-ID: <20260420-carry-freefall-c4ab36009cab@spud>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w7TgQA/ijccKXpiD"
Content-Disposition: inline
In-Reply-To: <20260417175235.224809-2-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31436-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 8D01C42F858
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--w7TgQA/ijccKXpiD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 06:52:28PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3{E,L} SoCs have an LVDS Common (LVDS_CMN) region which is common
> to all LVDS channels. The RZ/G3L has single-link, but the RZ/G3E has both
> single and dual-link.
>=20
> Use the syscon interface to access these registers for scalability.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--w7TgQA/ijccKXpiD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZSowAKCRB4tDGHoIJi
0uArAP0Uwj/QDk4niPPOviDgu6KP4qYKKsSzJadtkpfptH/KcQEAlFi1i6IgSsHo
tSctM13zM671OyShM5Wpk8dxoiFxGA4=
=FZKM
-----END PGP SIGNATURE-----

--w7TgQA/ijccKXpiD--

