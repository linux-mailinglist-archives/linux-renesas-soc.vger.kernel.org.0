Return-Path: <linux-renesas-soc+bounces-31238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKDaE3ja3GmcWQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 13:58:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E80443EBA12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 13:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B9413007BA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 11:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677B63BC689;
	Mon, 13 Apr 2026 11:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SkPc5JO+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B518D37C914
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776081525; cv=none; b=NINfKSekfitRLltpvIt99J4SGTQHZ9HefODsO35PIH2UKaMayr45lA0qhO9Q8IVG7PHSsuv3/RINBdLm+5SNB9o18Hg1kH1f5eV7nY1F3bXV129/qfJrkvrN7HLkbY/y400UBr1UFkGtJIC6Z7jElqy1Q1KuB/BJG1/QTO8S/Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776081525; c=relaxed/simple;
	bh=CTaj2fBb6tBQrC29q7U9VIzLkGb/XoplmVPaGMhEfms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjCoXErw4yJBbe50BaNScJusCAUXY78btTuuLDp0896m0HO3yiDOPYGD7dKAkFfHilffI/YIiiB0fNhk8z94tKyi2Wsa9w7HrzXs2STJQuN6kgwDGK/LqwVariRpm3j+wAQ2zMwTL4GUj9P6KB47RWufknROwtXRbErBUX9jXzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SkPc5JO+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=J9yI
	zcNG17Fe8KvlX3huEhtWxnTshE0yYgtLfeu9plY=; b=SkPc5JO+QFhnwa13v6Fy
	T+7VRSn/oU/0vDBYd54PXNcQ5M1Ez5ixs7OAUFG5ZDjvrfQps7RbLrQebcGdIYh8
	6wnc46icRyGmnn8LqiDHt9NAkxcplCDG6swdln2cakjmI71DNdwYRPeDPT4ZnHPA
	KiOSaAyOw9IMKoKzzF0YbgaUz8HEUQHjzby0Dc07+e5QBh4Cbc23OuiGU6TUpQsE
	su43ri5/NFzjlg4+6vm4U8uTghtmF2mCkDo4XqBrv87NIqu0PwkZtXSp6iz+9KWf
	UkmXKx4LtNLI7M9FM7Ce46UHmGVhGm4t9b84dqSI7rx16US/8xSWujUMvA63tEAd
	xg==
Received: (qmail 2281618 invoked from network); 13 Apr 2026 13:58:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2026 13:58:41 +0200
X-UD-Smtp-Session: l3s3148p1@m80wNFZP2Ngujnvz
Date: Mon, 13 Apr 2026 13:58:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2] mailbox: add list of used channels to debugfs
Message-ID: <adzacXjbYoLnycHv@shikoro>
References: <20260413115416.35830-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PxXVwfrsMrdXLUPE"
Content-Disposition: inline
In-Reply-To: <20260413115416.35830-2-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31238-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim]
X-Rspamd-Queue-Id: E80443EBA12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--PxXVwfrsMrdXLUPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  #define DEBUG

Damn! Sorry!


--PxXVwfrsMrdXLUPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnc2m0ACgkQFA3kzBSg
Kbb8CQ/+Mqlewf0SczVz8PLd6y9QxvYYIw9NX8kXL9pZ924C1CsZzDfVgrQ9qrva
APfAXnBNRtAWrUfQ8Iai4ygqD3WY8S0b2JvoTeNq3jTsWto68HhnhASmV9lEIsIl
JKTk+2ZJZT1Kt4xsV9pRwIEvng/Hnfxtx/ZTKc4nh0/MDPbyW3ZsmgCd3+KOlA4B
BAVsTCCZP5loJUtFgvrp9T2deQM9EZg3Cly1B4dGptRC5NrCQY2vAFY7jhMT1cfF
LAorzdFgZta+QUGZKOfWOjFcOf/VO50BmA6p1L0RNzUP8q80gwACpU9EU3CTuNsu
CuaPtdlb4wPpt14q77fXEo5nCOPvtYrh7lu4IUJbxM/OMyKrpSXTiXOvOzDGr2JL
6VtJ3q/DIicb0X0umt0Nu/qmaxLCfx/wm3flJNTKmK2e1tk8jvMNq0utJs5TeDS2
eLokiFK0xz+8OmV0Tedq3fzO885nC1rPMAblQxv/jIsCHIbkGXrlOmybhb5tuiuB
vy5IVcGiSmk+QDa+hxFFFKfJsRh0pnGjVF6Y1NKDEPh8alVYE3EJcTCSvbE/Vt0c
2SKkfcSK6TLej11ILn1ojUQhpg+iEGIHZ2djxPC+v5e1GLg3HXOXug1yx0G1thMF
A6T3cNiN33vwkgwLmxd8VUdQwUNvRjj7gYzD891F8Ov1aGZJJgE=
=vb58
-----END PGP SIGNATURE-----

--PxXVwfrsMrdXLUPE--

