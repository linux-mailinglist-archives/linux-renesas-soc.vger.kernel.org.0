Return-Path: <linux-renesas-soc+bounces-32834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJVzOCafDGq8jwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 19:34:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633758323A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 19:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2F1D3071871
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 17:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46E6409124;
	Tue, 19 May 2026 17:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnJxjRCV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C8440910B;
	Tue, 19 May 2026 17:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211888; cv=none; b=HpGYHOjK/LtVYcpo9vPGfezvl+eyH1U1z3RldLNKQagn09rgJpp/4F0q9FrdAouDQ1vB/7McG22Uc3Q05q3NE5yX++DqRHUU2cfKW7P3+A2WgBNROo8upbKPiN+inTwuMKGgBFvOtUR3WZqtl/uklNAorJOF8tojkjzGc2ge6+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211888; c=relaxed/simple;
	bh=wdSAoO+zV4jfBKXi2yopcIIkgL/D8b+nfqxpH/6X7Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNcGmRDgKBosmIeW0ovx+G5Qea5JjAO9ud+dfsQFP3wpBDn7+xEegyisZjAHnbycoazpFcuJnj9PobmZUyPXuNLYwBZ8qvZTXVJ9l3wQOlOJ80wXTPqT4fJxPo1VWJ6Dcg7xiD89RZHKgKD4NKvIPK0eGgL8Rw9Ia1y2cP5Jbfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnJxjRCV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7CFC2BCB3;
	Tue, 19 May 2026 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779211888;
	bh=wdSAoO+zV4jfBKXi2yopcIIkgL/D8b+nfqxpH/6X7Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnJxjRCVKzlsywR8BuCkhaQI4bGWQI57gFhrln7i+pUj54So+nEkNuSjpYcram3aB
	 zIq/3il45lff6qZmMiq7RAwj5pgQw71hJP9mFKpBFa2ubMCknGq1z4mieH9EPpFmEI
	 LbPeB5+g1SuXDxpnTA9PK1GUjLMUQeFEwbpK/9oU0e8i87MTACvyu9Vt5hIhPgICSp
	 WQJ6C/Y6YVyH9CmMmFqfDMvKSf+ebo14ka4AerSi2pH8RcexfyW5idKV7qU1uMYE3V
	 WhniqKgVaQLyw60fhxuPqx3zpppbuuHvtMzwstjM7yd+3pcdusOyDLgplxW/yfr3kN
	 9+Toe2vln/6Zg==
Date: Tue, 19 May 2026 18:31:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: renesas: mfis: add R-Car
 V4H/V4M support
Message-ID: <20260519-crewless-avenue-a402b90773c8@spud>
References: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
 <20260519075620.4128-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eIsJkIsbP/VR6HTZ"
Content-Disposition: inline
In-Reply-To: <20260519075620.4128-2-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32834-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7633758323A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--eIsJkIsbP/VR6HTZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eIsJkIsbP/VR6HTZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagyebAAKCRB4tDGHoIJi
0rorAPsG5MOqSXqSR1A9tHzKzbEX0OxGdOKVtstJhA2XuZX1ZAEAyEOM/aUZRzMO
myCnWtIus6uWHOkcQqjsWvSUM8qh9gE=
=6xzR
-----END PGP SIGNATURE-----

--eIsJkIsbP/VR6HTZ--

