Return-Path: <linux-renesas-soc+bounces-31267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N0XN9td3mn+CQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 17:31:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691C3FBE4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 17:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F910307E296
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 15:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E10A3EB7E8;
	Tue, 14 Apr 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SVtfkoUo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0443EB7E1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 15:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180542; cv=none; b=bhFCutHPQy6GOA9eMn+ZBmv+w0V8gk+mvbYnEiLnW2tdYjzObAt10a6VeDT7cXy6vQRlATHMs1f3sMM83mxS9WPaDfftYm+asu9c3DuC4GInET7auKl13zzFFoijb2VzkIMm3d+WdPH7vAbvxgstp0G0M+DSnyi+9Am3L3iiCIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180542; c=relaxed/simple;
	bh=fz5pRjhkjMTuP+brTZUaRV9J+qrUwjzMAkp9Go4tr6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLUWISuPqlMkaMNcOyZm3+HDvTjQFPOAeY5HY5p49pulxMch1VsQ17coXgWlicfuIevuZ8u8+/f4NHdAlvooa6eIh0OmteGufn2twoO7CDN/TON7dMeL6zXGW8vRpiybux+XXWgbVb41N8KNgGpCyWxcLRX51srlj/EAmC1V/eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SVtfkoUo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0l0J
	6yshapco55lEyBnphQBbeRE4G1o50MjKKLxeTd4=; b=SVtfkoUoMtW0myd+X+UD
	cggn/CB/uJsRv9UuqeAs/KzdUuXlt2V6wlMlMsNyWxPGPwbnH/NjTEMi9wQanAgk
	QU+vWbL3jPu5kL3ySRyQ6tYD8XikOzuO8oDswcL4sRm9mwOhC3i7YkgSb3ITyWto
	HzfUfDD3i60LZ7IHLOxQOj5xTl3ySdxElJw3TPcCWO5vCvxLSXlXuw8OHYLPRqsR
	lnvQeY26SJd4Zbt4YLnZnP2mNRxWDleov+shX0YG+Wm+CdKIzrC24wSyqJiTIVyF
	JDxFptdMGkM3SYyecDB9uvZA0Ji863+W64Oymm6o7QATmKB2y7+cmbRRyV+oHoai
	oQ==
Received: (qmail 2780505 invoked from network); 14 Apr 2026 17:28:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Apr 2026 17:28:47 +0200
X-UD-Smtp-Session: l3s3148p1@/9dbQW1P0rgujntG
Date: Tue, 14 Apr 2026 17:28:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3] mailbox: add list of used channels to debugfs
Message-ID: <ad5dLuPq15ic_69f@shikoro>
References: <20260413120139.36287-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdXr2cM0KZhvOqueMZ+wQ6FqEeoPGvdOLG4g+AzWirpcGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rJYfpSWLF6RptIQQ"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXr2cM0KZhvOqueMZ+wQ6FqEeoPGvdOLG4g+AzWirpcGg@mail.gmail.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31267-lists,linux-renesas-soc=lfdr.de,renesas];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5691C3FBE4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--rJYfpSWLF6RptIQQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Thanks for your patch, which looks useful!

Glad you like it!

> Can you please put it in a subdir, like all other summaries:

Sadly not, because of the paragraph from above:

> > Note that mailbox controllers currently can be instantiated at any
> > initcall stage. So, per-controller debugfs handling was discarded
> > because it is not clear when to create the root "mailbox"-debugfs entry.
> > A central file was chosen, similar to the GPIO subsystem, which is
> > independent of the initcall stage because it will be accessed only when
> > userspace is available anyhow.

I would need to use core_initcall for the mailbox-subsys. debugfs itself
also uses core_initcall. Then, some drivers (e.g. hi3660-mailbox) use
core_initcall. I don't think the subdir is worth all the potential race
conditions and fragile solutions which usually come with it. Or do you
know a solid solution to this problem?

Happy hacking,

   Wolfram


--rJYfpSWLF6RptIQQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmneXSoACgkQFA3kzBSg
Kbb6qQ//VjSw5TK0Fk1gEM5OUCsqNTgOnBpfugmUPCAQ5DRWcynJyIfuWY2tyquU
xQcJPhWlTd9U/Ru3BPjfWXe19DPYkMzylMUocJjivA87pBsgvFaYPfvdducG+7dR
AystKTGDM8DTPchSMJb1CnKAaqRbZbGGhklJXg51bKnbeGGSilyCbLbdzYFeO8Z3
ts1ni2AFS/XMVZKaNOxEhP0eJ0BCmClPnK7eou6bcZU2Oxw4/ZtXFfr7MdOHNMch
kOciAslZX3LTZ9+ajhv4uAbUH3Rd31JzUH22TUQ/Q4uNc6mVcpIRmPGvvMq044Vy
Xyc0O/FYIb3jGM9m0uKTIn7eLm+8suK6OHnmlietzHVfG3oU+sJOL4mkf7bSul5s
utjyQ4jjyKjPAOccY2tpllwWbELBmeHIwRTY0pE5PlT55LSVl89aPR7LCBJ0SfdY
B2Eva6e+L0AGciX0gk/cbBijd4mPvzhrHyqv2njfpjJigttTDgaLNe8GjwJqCjMb
7oNFWprMpvDgMf0bVpvrqiI952m14/gysUMW3kufXiJKKeY9zZXNBLgZS5rAWVd+
GmQ1ak0CdlJOYMnZNxF2/qZ/Fa4/5GmNZLA5rkDV3mzHw3jLaBKrOONGMTQ6CMqF
ybaWzhOKObszD3qmXGTP/0cBQrLKIUpeyI12PSwHJTKSYwudKKU=
=MBRR
-----END PGP SIGNATURE-----

--rJYfpSWLF6RptIQQ--

