Return-Path: <linux-renesas-soc+bounces-27908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDGEOuyKg2lWpAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:07:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44657EB67D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07F6F3014544
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 18:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1BF421EF2;
	Wed,  4 Feb 2026 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5WCtXxd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AC933F365;
	Wed,  4 Feb 2026 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228197; cv=none; b=o3xyPnsGgBB/RSrwODs36+ngvbRfXzWAbMAqC0/BnPn+W5vAN5npiYGuho8Ojbw7mfRLmXMdj0JixkbsHtmVKwt9psOxUV1sk5GueZVxXNKTILzdvPGFPyEPowxasp6eMxKvpUjJ+qGMdA/LB1NHZCYZfM19UcNmBtUdPcJfcZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228197; c=relaxed/simple;
	bh=2OFYk7iX+psFsXH0hDDyLMi1RI9ZoBRz6/hasMLy1Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQaP9w3usTEcN1+ABwgyn/ZN1i2n2Rei/qE+53Zv+VZsEqDZ/2UlQTZ2t9AE4IW3XmA240Xt4hgAXKwCvhpzY45UDDThT9xCOnlmsugvJVQSSIFGx9RgDwcjGGR+Nbp7Fs4wh4jxBl8J3UP0xSsFZ84Bc6S5uco2nE5c7WFQobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5WCtXxd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A84C4CEF7;
	Wed,  4 Feb 2026 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228197;
	bh=2OFYk7iX+psFsXH0hDDyLMi1RI9ZoBRz6/hasMLy1Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5WCtXxdtE+gp0mEQcA5JO4wHv6nTu1qDN+eY8uAOl1EeiqSmy6lmzz8GZopUZWls
	 OpxUfQbbhFEZI+Ii3ucLAqL4BzhbqUZracuhKXWKjLZ10ZKSkUJpt8LDxi1gXoZHVw
	 yQtAszY/Fyqkl5sadSGQGoYDV1L3euczwWYRxFPrRfTiHqUIaWGMJkDseqfHqQ75g8
	 PQkrLGqeu9QlQnVrqJymR+/nmRAn9W2bbt79CRGkuIwL4Wy1tTkz4YgV0OAuj8x9rX
	 zarFpSMpwuHGmV8YqdzjxJYTXsGow8gHDWgvWO+zGhY5zYZI7XWEOvafm/Pe9jfZcp
	 034gp6vk4+PZA==
Date: Wed, 4 Feb 2026 18:03:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: soc: renesas: Document RZ/G3L SoC
 variants, SMARC SoM and Carrier-II EVK
Message-ID: <20260204-edge-petted-56088f0ed8dc@spud>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qSR/IEu8TORPDLog"
Content-Disposition: inline
In-Reply-To: <20260203103031.247435-3-biju.das.jz@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27908-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,bp.renesas.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 44657EB67D
X-Rspamd-Action: no action


--qSR/IEu8TORPDLog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--qSR/IEu8TORPDLog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOJ4AAKCRB4tDGHoIJi
0tSIAQClYNysLvX4IXUpz1z/6ZsHtN99xPP6pDYi2xrwr5wagwD/VOhiWhvs4+7q
7o3mGKeoqg/xr0FHZrBcDqZkBO1ZkAI=
=6+QS
-----END PGP SIGNATURE-----

--qSR/IEu8TORPDLog--

