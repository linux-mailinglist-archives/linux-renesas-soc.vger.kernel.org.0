Return-Path: <linux-renesas-soc+bounces-31435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGU+ICVU5mkDuwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:28:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED842F82B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D963300599B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 16:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606FB34B194;
	Mon, 20 Apr 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVqBnMsi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CABD33F597;
	Mon, 20 Apr 2026 16:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702104; cv=none; b=otygj8vrhGhqyqAD7K+pinFf6oqY48xpW7jipQGbbKpEPMlVA9gg8twvPmlJObhukzc/T/j0kniJfj0JkZRMX0uSUjYiiVWH0aPWQ9AxlIQKBaGr1/nOPe3G0tlBQBIBW3G60jPtvxXAFaQcHbMxP606A9SLK2YoFz90reGp30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702104; c=relaxed/simple;
	bh=nmfX6/AshaYubNu33nzp7Oq3mIT9AkbEmqQpS4dhMw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kf1xY/W5Qrg/PPoyhPZBNDDeQYSpE1wVMwStkc1XokGOtw7XP72XtlGOWOnqGbQMENQAXKs8ECi1JgQCEuDFWjxRWo/DSyAmE8jTzY3SGjG+pTQWjDdnx0u9a8jIdskPNeSdnKBzCAR/CUlxc9+Tg/uzgo10HdEo5qf/Dl7AK8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVqBnMsi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A14C19425;
	Mon, 20 Apr 2026 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776702103;
	bh=nmfX6/AshaYubNu33nzp7Oq3mIT9AkbEmqQpS4dhMw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVqBnMsi8O56tRjoHgjv541agVfC6vIyEgGmu9sXX3BkZF87yjuY8FU4Ct5VK8uhN
	 jwnHyS04zs0+o8m7EqN/JXyBxrwJU/bVLt2q7UM0iIzaD4gaPbmhabwk9egItZbYCB
	 zFZFZB/2hRWm082+7PgAeiZKzQ8FBmKMuGaXGCLcEBRTwCOp1E5FiTuXEHaTKhXDFI
	 r4yApK460wGpo0Bh5E6M3BIiF91rktoDF4hR7jigdYBne1gtj7Bmcd+3ap8XhSWt9q
	 vY7vXjJ1rE2kJK1gJM74woMCBMs2QkLES+JCOYkSZTupyizbFuBMM34KYpEhHftRya
	 eg4+pRYPLCrzA==
Date: Mon, 20 Apr 2026 17:21:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Message-ID: <20260420-cost-ocean-11c35168acb5@spud>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UcF7L8cDFJ7eoYqW"
Content-Disposition: inline
In-Reply-To: <20260417175235.224809-3-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31435-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,glider.be,bp.renesas.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 1DED842F82B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--UcF7L8cDFJ7eoYqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 06:52:29PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
> single-link mode. LVDS and the DSI interface share a peripheral clock and
> the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
> used at the same time as MIPI-DSI.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--UcF7L8cDFJ7eoYqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZSkQAKCRB4tDGHoIJi
0qPEAP9pUYTcU8KoPFuGpouNSZCnlUw8AghZWG2NklflqHNNpwEA73qYEerYVFm+
jYPEq9I0hexnWrBO7vPTyEw26WladgA=
=yV67
-----END PGP SIGNATURE-----

--UcF7L8cDFJ7eoYqW--

