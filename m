Return-Path: <linux-renesas-soc+bounces-34605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 05fOFjwjRWqm7goAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 16:25:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E436EEB17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 16:24:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TgPMDe+d;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4B1E3038173
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 14:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B8A25B095;
	Wed,  1 Jul 2026 14:01:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43201258CE5;
	Wed,  1 Jul 2026 14:01:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914474; cv=none; b=fWJBvOdZkErNcI5UgLIN8dABOKRYyzJGkcmnjUQ63aZJHVoCaXPtYoPVf8inB1iq+l3LaCYvq6KU3Q+N6XTJAki0k49pDYnGCelfmuQ/hMhrg38VEJCQW+jJA2M+pwJlhkZSt7562cUs0dDlooHLkZCbvYK/vgS+cvgRLa73EgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914474; c=relaxed/simple;
	bh=VqZCnCHSoI/GEJwsKuS7ZPBXcwhIn9kmWniqg9jwFnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OG7aCAXeHVMmnfaW2T8t2jwdMk1y2iwGK67RlU6w4u1bMqDhYvDcySox2RggJdDqKkzTuUbOmPoPhHDJZuRKQlKCflQnK4hMfpPDotqqqOTfCJhcYZnX9kIjRbhxwDiJ6LWmo6iDdf3YRQkOaHyhjJe5a9C0/uOJd5MPMcveQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgPMDe+d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4A31F000E9;
	Wed,  1 Jul 2026 14:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782914472;
	bh=VqZCnCHSoI/GEJwsKuS7ZPBXcwhIn9kmWniqg9jwFnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TgPMDe+dzdQzr08x0l/ofKjzb0vziIrOyUgzp66nznlm2Bv8iBbNF7B3Tqqi75dYV
	 1WxW9wx/rJhX2sv/33J4tZuQloXSXb15Vl4cYNoBQ56HZ2GI/s6HshUXC8GPOS5qUq
	 ZUtQ9Hkv3VeTaZsKtRM9O7QWr/wBLOOwF8qICKe9vqzP7BPErvZ9HucfH87ZEymlR5
	 AhoL436Y1bC1/tsjAkJljn0ISvCarS7ZspEdplJpZvyeHvcQy7tK9XMUZ2FmjCpig+
	 EfzOrr1Wx45yPv8GZXToE04rEUE8ZG86Jb4nduoVdsX8DHlcD3IaEPJvtRDGwYmCqZ
	 yncVA/IyN/0QA==
Date: Wed, 1 Jul 2026 15:01:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-spi@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 0/2] spi: dt-bindings: snps,dw-apb-ssi: updates for
 RZ/N1D
Message-ID: <364d2f57-db58-4ba1-a12c-025233fe35c0@sirena.org.uk>
References: <20260701131248.4545-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdQxpYIOjL2qDbmZ"
Content-Disposition: inline
In-Reply-To: <20260701131248.4545-4-wsa+renesas@sang-engineering.com>
X-Cookie: Do unto others before they undo you.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-34605-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linux-spi@vger.kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:wsa@sang-engineering.com,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,glider.be,gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2E436EEB17


--gdQxpYIOjL2qDbmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 03:12:48PM +0200, Wolfram Sang wrote:
> Since the actual DT additions are in -next now, here are the remaining
> DT binding updates for the Renesas RZ/N1D SoC. Changes since v4 are
> described in the individual patches.

This doesn't apply against current code, please check and resend.

--gdQxpYIOjL2qDbmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFHaMACgkQJNaLcl1U
h9ABGQf/Wrp+1MMYahe5qL1MB4SpNVJWw+/ijaZkh2uanUYr8F1UPMhbW+fwGvlS
pEWpO1vyKm2WLbRL6cdKOgcGmgQ+qNRDmyFXQigsY96NAgCU22LeRGOwt1dmkgMp
vurivW4k+mteTd+ZTSt4oeEjS795o7cEZdD2aKz5YJmYQt1O1yuSdGeynjW5/eB2
DQSvQkEZhkAJeEKmf6BiserEiFeW51SBfBhl9J4+7gePK/yfa7BoUYRWkXKrgDWg
TeJILao1tr/NbTy0MP3HCx/pny9jfpIP2k3nIjxAZxaSc6Tq6Xwh0BtrmlteW6RS
xEwckFiaAsjumK+EIHP2NCstzvVBpg==
=MIDP
-----END PGP SIGNATURE-----

--gdQxpYIOjL2qDbmZ--

