Return-Path: <linux-renesas-soc+bounces-30545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XvlrI5T/x2lIgAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 17:19:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 011A134F258
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 17:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFF8A30234C9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52259395DBF;
	Sat, 28 Mar 2026 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aktMFlSx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5252D3ED1
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 16:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774714770; cv=none; b=mRPkxw0XPMNHwMQMDmCnktGwlQtuWhOUsLtxJUh7KCU8l/GS1Fi3Phfhed02TlfNKtvaXusqtZDgylOoxXmIGN+nCttWOvNQkLhFDRjICoGE1Z9o9TFeQZfridi4W2WlifhQcrZinlPuDQjr/nIIuChO5PxDGRX0rih6Qhwkigk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774714770; c=relaxed/simple;
	bh=IJdM+FgXWNa3n4Hk7aw9nDnOlMriOU5PjKIV7VbvjJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioW+dlPKtgTSqf02/dTjvylIgWBSghqedpKv7RXCm9YQpGRuGESSNjJrns9+rLaQ4oLcG/Zh+qBlIWHfENDQUn7oWE5VCz3Y5XZ5laTGWaLzBqU+RDwjBSaWzpwTIDcFuJ1MsJMwzXPLQHy21lin8zILv6PJKCWa0sIio4FSsSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aktMFlSx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Y9Ci
	A1TGCx8K71tc9Mo4gxxtgpSdEVQqP7FQrNlGHeA=; b=aktMFlSxrskBOLWOyPu4
	0dLgcoPMRp7dvFgH7PwhcajY2eDzhbksWakYix9hBf+RRIr3gILwUC6GQp9wo1GT
	tnhO2WLOD3Le0R/Z2EeEtsyRKazpVXQAfP8+EJJF9UDwrE/bnAJTu3+UcAHnz65r
	vWPWbW0GAw0RN4vtn1aWdB7MWjECHpY800AUIpVnXiWMpt+VlFStgD/uny0M33z0
	ryiN7mPTr1oS2t97S1pXWWGfxtQ3tIG2rPzFWw2acbc4jzPvOwwHTAfBRiI6D8Mj
	eLHCFurDpwf8XZxHU1WiIup0iIYXSkrTt2MGCDPeRfxLV3xmOidWso4lpxERQm2p
	2g==
Received: (qmail 607378 invoked from network); 28 Mar 2026 17:19:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Mar 2026 17:19:17 +0100
X-UD-Smtp-Session: l3s3148p1@lPmt+hdO3MwgAQnoAGhzANOp6TCWxn14
Date: Sat, 28 Mar 2026 17:19:16 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
Message-ID: <acf_hK6_TiAa4cWx@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju <biju.das.au@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
 <20260328103324.134131-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ZJ5biZsojpAQNQR"
Content-Disposition: inline
In-Reply-To: <20260328103324.134131-4-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-30545-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 011A134F258
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--7ZJ5biZsojpAQNQR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +static const struct irq_chip rzg2l_irqc_nmi_chip = {
> +	.name			= "rzg2l-irqc",

"rzg2l-irqc-nmi" maybe?


--7ZJ5biZsojpAQNQR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnH/4EACgkQFA3kzBSg
KbZ0iw//ZoEiP29yUG33hp2PoxAQ1UE2j1pzYDhlehyuGtQWN0pf1tQIABgJqBN7
2MWrEOvdDCjsgifPQQyxuJeafqBRrZj7iu3mtGUmqTdtEDVmHXxYdGeO+hLffGzO
EgV/PkEDIkVSYczW+rZO4iaJEh2Tf2b2p4ip1vyehYPr5oZZnbpul2h84FZsCOHV
Vt8CSP5IYCYhrjrqZ5FBJlzKxwBwaawRktUiU/GURiLVsb2yq+fIlGXn3HF831YR
zvv6hqV/uGL7Su6cy0X6dxF6V9+IU0A3BAkEwpGlouOnE05GDz0Ykr5bgQ6/Mk0d
ar5I+SXfSQ29uVxX7BDdN4J8hAv4oG6DIzAUNOAJd0pAkfTGkaF7SnY9wQCSt2uJ
i3+A5v04CJPenN/phcWgYutq4jFcnr/kiOJLf5VvBJZHC8AFDQkCdE6pVK9HQo8Y
lkpxXvyMpIvjUHjOxehgXySvKycTJXt7r1bY4vOesnKTvXkzKLBr8wnpO1pcmTfi
Box/FEi6wVVf+qSU6BD9EKIlDUZWtnC7QcT+5IaS5VgVLXbrODjKVDl44/gD8euA
0c2mUIY7RfRqY1fl4Hfo4iMwnToNrKYclwNkQ6jh2uDW9yaJvUI+GrI1rszsyBnR
ePhPT8DjZCLW+wPJLTo4baizMxSsKn7StGAgfTk5L1E3MrCI4O0=
=vBEE
-----END PGP SIGNATURE-----

--7ZJ5biZsojpAQNQR--

