Return-Path: <linux-renesas-soc+bounces-34625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CdyBAchJRWp0+AoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 19:09:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6439D6F02ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 19:09:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bGcLcNfT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CA32306405F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 17:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62953386426;
	Wed,  1 Jul 2026 17:04:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61A381B0A;
	Wed,  1 Jul 2026 17:04:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925446; cv=none; b=WPscg+Uvp9OGuw1ogy38Ow0Xzv9ZxN1jDftBwpJB1WUUEuO7zooGjUqveq8stl+aXt0sPE31ukGfIVLbsZkSbzqp94TXUaJxPJujNqtQ3QXAgwBNJI2l8YVo6d1SKAzblqshbnHTrucj0ALVL3MtsAs5QqiNyT6EsYMRUjUKqbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925446; c=relaxed/simple;
	bh=VYRiDD5Iy0yRoaO0lkvXQT4aI16OlIvETD0ylWTOlq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhkfxl1TtU1wlQL1qeNaEgWoGnFD5uF9mZuqEr7e1TfCBrtzfzLo+GEHpIz43NssAHOapJS9DlpeiLO7rQDg+ra74VcH+vMcp8Fh74Ts2cDt4Oebv2HRFWRL1BXPD8j0SWbiiJ4JXTRRyjVD6+sNnpczq1ZOSCnBuYqZPkUOvpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGcLcNfT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCC81F000E9;
	Wed,  1 Jul 2026 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925445;
	bh=VYRiDD5Iy0yRoaO0lkvXQT4aI16OlIvETD0ylWTOlq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bGcLcNfTLHxJHGbdy1TAK6T5uJzDc6t5iOIFRyFqa2mEhzGHPONBbKTlLa495bJo8
	 1R6KEgdWjeGR1323zsB5umuzNttFXGHGftCoi1iW2en4lZq0u0DOdtkZtB4SriMpp3
	 1ivybLoCT+SmW4V2WOj7e4kYv0mZzoog67CJvab62clJ/cS1OgJZoVxgXS9fi5lgTS
	 l3iARQMF8YKkOE0HPRZ0c06Wt5As0TPg7ZuhfLag1OBiy3uQug3i148Hl5tOC8mQZu
	 W4boHneklgKXyRhjdNMVCBmmZRQTp4rjhut3ObKsIcq5DZDEdIc3FC1d9XT0VrS9CH
	 vTGyNoDGez2sw==
Date: Wed, 1 Jul 2026 18:04:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] spi: dt-bindings: snps,dw-apb-ssi: drop
 duplicated RZ/N1 entry
Message-ID: <20260701-bundle-rocking-14216ad464a0@spud>
References: <20260701131248.4545-4-wsa+renesas@sang-engineering.com>
 <20260701131248.4545-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0FbztNpUHJi8R2hM"
Content-Disposition: inline
In-Reply-To: <20260701131248.4545-5-wsa+renesas@sang-engineering.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34625-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:geert+renesas@glider.be,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:wsa@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6439D6F02ED

--0FbztNpUHJi8R2hM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested
 (by mark)

--0FbztNpUHJi8R2hM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVIgQAKCRB4tDGHoIJi
0kFXAQDlsj4mUWdeSW956sf2mzdL0Iw4t0eHc6HyZ4lAs1b3egD+O8+4Tb1zWA3L
h2g+Q0SP90pwU+fib/mnGp1AwvMM3gE=
=yYiu
-----END PGP SIGNATURE-----

--0FbztNpUHJi8R2hM--

