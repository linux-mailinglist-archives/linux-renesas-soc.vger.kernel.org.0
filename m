Return-Path: <linux-renesas-soc+bounces-33299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP4HLxNOGGpMiwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 16:15:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 279FB5F3849
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 16:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D0513051D5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 14:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E642E2DFB;
	Thu, 28 May 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DxUpZ5qg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3BC282F3B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977315; cv=none; b=A2jTVRFp9T/Uk+Gfege5UIwljXoRGAL/C7THk/0vvb1CYWdEMNwCB+F2u/TKf2k8/piZUujV6i58ZG1x23qA2LmrhZy/YdVKvkodIURVdr0SXJwYNGpicbpEr/tI/2S9VZIzVa0a5eYOFQnl1dPWaIVb52jrqP42cdPcidOH620=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977315; c=relaxed/simple;
	bh=JLQX38nLH9+O/Bja1gD0Ziz6Bsq3AgjUfSR9QpVq2Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uP2DEvT1MzzOAzTrpr1nG0lFbfRvhU6FY6wCFuirevY/SlBElrGk3zT1F0lhRESNLUjKfFehokunYMYYC7mKbkeYQ/cUu/StY5SORHpEm90BM+JxeWRtQWBczJCjJhaeoaBNxIZMou07BV8gSyYGTQZ+4Jdn4FgcLHijMypTULA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DxUpZ5qg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aN7i
	LtI4cLYrMvKn+OtCEMn+lpwQ6zI0H0dmRE21XKc=; b=DxUpZ5qgU2zh+vQYFVwl
	JmDpQ+8kSIPmBQlDZc/IqZtgEsMQqX25AK4kL3LEcoBtQTWZvdAf+w/UY0OuxrR/
	pbM0uPBxRuoM0Bbd5ZXRZbuJ/aobp5XwKl0eMeSHcWDdaG6v9CuhwcA/iQdC/w4R
	z4Cq+xQlscqDtRAFfQ5Il4/ApMpcDIgNPr3j7qpI7kDEJnY8P4+MOt0dmO6zAQCP
	G3VQN8rt6ANUYVkW+YTb2T2ReNqDSNSsIGK7tDPmA/ZmZTCsvLGMQlQqzH+wlC+a
	ln+XIuk9fE2uCZh6LEGaJ5EUWY02183jRTBweZFmmnc5WWvMdmqZtP/BGbu85gUe
	IQ==
Received: (qmail 1062334 invoked from network); 28 May 2026 16:08:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 16:08:32 +0200
X-UD-Smtp-Session: l3s3148p1@xzReQ+FS5ZKSAB9x
Date: Thu, 28 May 2026 16:08:31 +0200
From: Wolfram Sang <wsa@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] i2c: riic: Drop the space in front of the "out" goto
 label
Message-ID: <ahhMX0hdr43K9eLa@shikoro>
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
 <20260520131206.932050-4-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZrU87jUP5POKIU1J"
Content-Disposition: inline
In-Reply-To: <20260520131206.932050-4-claudiu.beznea@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-33299-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 279FB5F3849
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ZrU87jUP5POKIU1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 04:12:05PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Drop the space in front of the "out" goto label from riic_xfer() to follow
> the pattern used in tree.

Time for this quote again :)

> > "> It is generally accepted to indent labels with a single space. This
> >  > avoids breaking the -p option of diff."

And yeah, I have been bitten by that.


--ZrU87jUP5POKIU1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYTF8ACgkQFA3kzBSg
KbaI+xAAq4yMvz5Ztwx8r4X5K7aepIgo/zsxfGcMOlFDb3UO9L9wnucV1H+XQwvq
F43yMQgsiXM0hUv56tsJ5oKWYL8tlwOCGr5C2YCBqsQfP+35sHyOjC3BG4HxPKUd
+tJAfH0/ZRAL7jal8pXA5PxirRYm4/THT8UdMR6pFudKN8iP1m+waDEiJa9b8AlN
s7NUSMynse/TVil0Qb0CmtSsladu18kf54dK1GplL8IwvNH56u6oRwof2aqaqIpq
ftzw92e8kpflq3vkEPHgo7wceJTZ2MaLYa9fNI5GnG2XAAa8b2tI/zeev2RMIMFn
FqqPddP9x/YW5EFJu2SZG15UjfqPjTHF8jVsB7S9/M7m6zFxDInR77WKZNnfJj+b
9pUI209mLaIbZg/T0o7SfaGfSBV5hBT4iF5zuUR8KJz4/iaR/LCNlwAAI+gNGUqW
RopDzHCWTqIfWHbpwsZ/rHIeCdBvrjWC4XvHYP+aEUKnbScuTQuvNcvCH9/RmVYy
bS1T/AzJ0aEQsGTEW3HcL3YwBcgtMdW3k6qUILziDdnyzqCcTiK6XZ5Vs6ECtWln
W/bami4tKXdxRODKITi3wZRq4kqSyNP/z0W3a+XEOMEOqeBoGTXD1l1yVDWnTGuj
A4aRlK/bNmbfY5a736SP7R50As2SDgrpyqpOKYwZt7d3TWlxBaU=
=RGnj
-----END PGP SIGNATURE-----

--ZrU87jUP5POKIU1J--

