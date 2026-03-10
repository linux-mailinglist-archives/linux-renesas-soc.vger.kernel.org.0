Return-Path: <linux-renesas-soc+bounces-29113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNiKDIXUr2kfcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:21:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEBF247366
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55ECF3042B53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812333ED118;
	Tue, 10 Mar 2026 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YuoPz41F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E336827B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130768; cv=none; b=FAcIhrQZABGlrlXe/cn/Gq9tgyqbYG3chirlrvGm6/wachnG2gP/UMvtIScP7IetBKkvQ4bNqK4mkNIUJEuEplJBylQkcJR3H4InXXpV3wdvvh7ERB/+D8XJzcKtvsMD70WSkcFnTaEt27ux2rhtYN3CYWDo2Z7k/MxZ4EdJl48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130768; c=relaxed/simple;
	bh=S87IrjI8DfBYd19rSNX7bdJR26dlMNNcIv9/qRy15Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8QjgQKEnK5q8ZNjfjmOJYenY2/ezWyYFugXiTvVnNtvo0Ge7Y6zt+tW+tECpwuvtGLKn0Y0bZpcMSSxn2LmxeXzyUQJ3qNwxZ4glGyToG65kumYwi2wanPQA/bTjzQ5OW8qcRp6ubKYbEd+lIibG3aJ6t7s6YQzWR0sDZFZi3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YuoPz41F; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=enui
	IPfQ56HVPrdYOBF2RLtP8+33mL8RaVgzu8mOYBQ=; b=YuoPz41FSk7I/zMVDQHT
	+fYxgUhZ2irsOqfdlq1y5N+V8H2tnNjwFtSRSMlpEFun7TpyYmhzY2hpNJ3sS0JD
	7lXlVW+YyZAaTK2S0gjgOer/nI+RZFBqtLImxK9LbYj0AtIGV5YQIIC+9utD1oJV
	mzYqFXt9faIyuULipRGWnv2SRqb1rKLZ1M2dLgsV4K+mzGUDWChkCnkcFz1pVf/Q
	J0wfCon4OBzhCya14dj2QxZLnNbfndSpJma35C4qyi/dKMjno/THWrH0veuWMRW7
	Ze99bwX4ciCQHkBiFP3dj76hjNmwI5/UejKCCXBIw/WjjR+S3PtKOaV5sAgzatAx
	NQ==
Received: (qmail 3123524 invoked from network); 10 Mar 2026 09:19:24 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 09:19:24 +0100
X-UD-Smtp-Session: l3s3148p1@+c1eLadMapEujntP
Date: Tue, 10 Mar 2026 09:19:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe LEDs
Message-ID: <aa_UDLVN5VILrwQ9@ninjato>
References: <20251001065039.22874-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1CO3OisirCteyote"
Content-Disposition: inline
In-Reply-To: <20251001065039.22874-1-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: CFEBF247366
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-29113-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--1CO3OisirCteyote
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, Oct 01, 2025 at 08:50:01AM +0200, Wolfram Sang wrote:
> To be able to use the LEDs, a configuration switch has to be set to a
> non-default value. So, infrastructure to support these switches (which
> modify signal routing via the CPLD on the demo board (DB)) is added as
> well.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I want to discard this patch.

Actually, I share Rob's view. The state of the switches can be read and
the firmware should handle it. Dunno if I will ever have the time
implementing that, but it sounds somewhat interesting, at least.

Also, currently for the whole kernel, only Renesas RZ has #ifdeffery in
DTS files to handle switches. Dunno if those can be read, too, but it
feels strange. A bit like a bad citizen.

So, for now, I think the way to go is for N1D: upstream only changes
which are available using the default switch settings. Until switch
handling gets implemented.

Opinions?

Happy hacking,

   Wolfram


--1CO3OisirCteyote
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmv1AcACgkQFA3kzBSg
Kbb+wg/+LMvlDhjuSkV4QVSjMUyDSNzKqH+pJDdPe35VYys/GRsoERIMo1j34Xjn
eIDcX3ZYzq6CTjxpwRNJfq3lVgOHopnxHhOt6B08p/HRQUccRArG3w0fuNhCb5b/
0KykDWLfVKS5hLbw3xPf2cGurCtuTlz0+X5ESy/hYrmFtC9kzYOabkN73AqR7j4P
QTif3jEjlo4VxSJZSCj+K4lh627qopE6COULaRP+whTwXlaj8jzneEU3hXJmQ84E
f6QX3oEnb001wOshvTEpOo8b/jO9h27A7/fxM6GG+BMM0GfqChEDJJlGNPiTVE2t
N+/0LycodU/62KVoAS4q9NBou9J6PwXYFELPz6a0St6qj9AeotqlY1dXLHznAEjU
aDavFWba5ebvddyGS+vIW2PuMu3wKfPL/5MZK70WUagZFT2jNvElW9mGWyoEnPwi
rcIvi7zfQwVLvd4HPMdhRtv24LVioiRQXJxaH2pLjrRV02DS/nHrhDq3sI1QFRdk
XcyWwUYL5hAqrZGEjryKiTTWC+bJYunar1TIrcKihRNp8kU+gxLhup6NQMRQux6F
QbwE1VGfSGfKEVet2ESzTCztfNynqKkdqfzshg2K6J/9EHu8TK7EZ6TRjAcYjeCb
walpu9Qek2srw0jwkwwFX4Dwp5pTJYfWu+gWFdbP0q58K4GKzAk=
=0rmI
-----END PGP SIGNATURE-----

--1CO3OisirCteyote--

