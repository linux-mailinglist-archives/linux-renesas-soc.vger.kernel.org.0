Return-Path: <linux-renesas-soc+bounces-34530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nHaBDlCeQmoG+wkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 18:33:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C96F36DD5EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 18:33:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=Ef95RGgS;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 787B73027369
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 16:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299C24611E1;
	Mon, 29 Jun 2026 16:32:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC9D4508FD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 16:32:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750778; cv=none; b=LHBCTymksSY7a/fXzJKq/Zl/L2Tyk7E4TcvNk6Y2x9lO/hH7+AFS+9mrKnkfquevdPPIYe8vnEN/daAUuSGQiywDD4Ti27wk7QNnufKOHZKuuiJ8u3VvdkHw/HLF+SjbZCHrjAw/HOOg0UfJZT6ULdNDZ0+wtVG4LYd+SAMBcYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750778; c=relaxed/simple;
	bh=k/KauXLDb+4VD4NJZORmKp/3CbnFt+OiAQC1meEkQnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9EjyqXrHsQZtMSP80Fmeak+0j6pFGPbu+nMvFnpgk0x5vpsBzMvTHmzVv93zrCEG/8AfYOkyqtnT9zHvV+6q5LpUYQCa2R4y/obyS5zlvesf0i2MVsUUHwuepLkUwKEPD0janH41WxMP/QY95d3EFJlIp+YxhlsvCpqDsu8ROU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ef95RGgS; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=k/Ka
	uXLDb+4VD4NJZORmKp/3CbnFt+OiAQC1meEkQnc=; b=Ef95RGgSCjr7A+1nVofa
	edr1RhelLp+qLRs26oZrJe2tbQ5kK44EdOXEviBvnuf34xFDsH6ybm4pWtQ3COeL
	tO+Q8oyHR2PEqdv37aUJk1VBpDIf9C3RjpH/esk7tazR7vTnQr0Y6/30jxaoO9Ev
	tj6a/oebq4k+sJ8Vt8sPo9a7F8V+c+kJWQ0xaaXjuAp0QXxK+Luz04EdPSU6Q/VO
	9oRDcmjoF+Ki34FWxKo4Sy7VGQRSNUOiHZmsLKXzMcgmq0Zgjpkv5sfFSUA3uttJ
	ftSIncR+eCMH3EGXgYVBQmcRlFn7cqkUNZdQRjcxuaszJXARr6pVRtsk2SgjVOhG
	og==
Received: (qmail 454215 invoked from network); 29 Jun 2026 18:32:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 18:32:50 +0200
X-UD-Smtp-Session: l3s3148p1@06lhAmdVkrMujntC
Date: Mon, 29 Jun 2026 18:32:50 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Felix Gu <ustc.gu@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Message-ID: <akKeMo_VeUm9RB6o@shikoro>
References: <20260627-rspi-v1-1-170c93ee14da@gmail.com>
 <aj6sEE5y62SOVsRb@ninjato>
 <TYRPR01MB156197735CBABA1699843B9B085E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <akJJ09zjt_dXp1jS@ninjato>
 <TYRPR01MB156195CB900B9054C94E4FB3785E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fam5c3vWWx9TE0aF"
Content-Disposition: inline
In-Reply-To: <TYRPR01MB156195CB900B9054C94E4FB3785E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cosmin-gabriel.tanislav.xa@renesas.com,m:ustc.gu@gmail.com,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34530-lists,linux-renesas-soc=lfdr.de,renesas];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:from_mime,vger.kernel.org:from_smtp,renesas.com:email,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C96F36DD5EA


--fam5c3vWWx9TE0aF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Reviewed-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Tested-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Your explanations were very convincing, thank you for testing!


--fam5c3vWWx9TE0aF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpCni4ACgkQFA3kzBSg
Kbbs2A//W8NYlkF+ERbUE2vrVSh77k0U49lnIJs0jfTNkJFdvAPliWJfoAh8oEfW
URuQ+bIz5N3XlSglfOfUwp+jBCCrm/pDD14DMUPS6AYVG+pVe93zqDT6Zkhu95r8
4MjVdKbmpxguGbMsLwhVEFOSggNiGajp3QnpPDSfbekxuQLGEI9VrHJ19hRavCSN
g0GQIHI4URyRxHyZoF1uXm5CvLD10bNoAH4/lR4wd1dO/VJMH7as4k+HXPdDiNOJ
S4t0LwTgX41Ane5TtP52EOz+pU1ghZA18CaN31ZCtzIaQI3iFle85Xtff60HTh4E
05/SCgIfOInw4WAOIbpsviQQ+inibpT32jHbD+Yl98sDxZOIy4QICWdgHB0lrHFK
HCCUjoM0ex9lVIgKlSrREjvkWQWadskfFk/M26Af955CqSjJd1cBkCuXwxDtzkDv
5l89Lb1kpQZmE81AABejtZ4a3f5NRhZ8176axQbB87vrP8G1RYN7mo8zK+lhoOcW
Ok8zUstte2e58WWrGeFMuwujTrMRkmJHMLhWaQd2nmQrT48IpQTM3UKFJrO2PmrL
qCqbdRWtovMew+D/jd3qBJ1xG0NRpatVKTlA0FmtfqQpj03+5UD9J8V5HPXaXF+C
YwZjT7erqF4OrL9MlXIV4U+NQZy4RWXHiFvAD/AIPnn/XYQ7Vu4=
=ZkOV
-----END PGP SIGNATURE-----

--fam5c3vWWx9TE0aF--

