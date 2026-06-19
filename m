Return-Path: <linux-renesas-soc+bounces-34228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioBiLDHtNGoZkQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 09:18:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 093576A44A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 09:18:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=TXeYzvBv;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEAB4302FB4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 07:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CB440D579;
	Fri, 19 Jun 2026 07:17:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066542E7375
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 07:17:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781853462; cv=none; b=rkxNb/h+QVR0PsirYiNtlj9V3uKgL3Ux4OvCj4eA16uwibu5fRXymv+sJtsYpG+sdB/FgGJC+FlJiIq6T00DgFNQCY1TLiL8LGMWvvZNbgPpcucXmF2aseM7/dAheLmo5r6TC37p2IuwEdW06ijaBSQ6tnbrpxHv/DWc2c0rT6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781853462; c=relaxed/simple;
	bh=wGXREsTwKS5/luf8Y/W2MTL5FKoYVc0+yg2PK0+PgI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u21m9ZaU4KpheR9E0Uekojaow/3hSScEgdreZQM5ZKGb1tpYOLwvONpIu2ueEeu+uWlLv0/hD1uXmqPsJjecg2+vc0jPJJZaPhdzfsgEsZjd11iK72DcrlG55o8dstzA9YxDEacxxJhHS6j7Yo+61Gn7r7aEzw7BdslNtAtlhkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TXeYzvBv; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eTfs
	mMjoIaFZOLfQvk3UjnaihDkZSvyn09So7HZ2Oeg=; b=TXeYzvBvYd5+2k9UhlMi
	sVHQOYfei3L3wViI7UEeq4SpBu58hgIZJBweY7LKdiRNIJ6BjT/OB3trydCEZy0e
	NBmOAZNyJcl5BopBXvsAGCxDOrSEbI4DcCy9EfyIVqo6GGYbruTTgEdHYGkvzm3P
	YxlIQe6+kPgZcSRRCHG+7aucvSvNaS3AAmxVcdcurM6Hrkf0FyxUFEnHMV93IH4N
	1x10alL9Gy++m8rmg5zrZg0nq2fwcEQLpP0D1dwSMwMiS9+LuGRGme+P1J11JfN/
	qx7o5S2YmtwiGuoFcwhzmSsyAzUdn+aCyACo45ckn4iSKLvukO2EdV6nmwsOSIrL
	Qg==
Received: (qmail 854806 invoked from network); 19 Jun 2026 09:17:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jun 2026 09:17:35 +0200
X-UD-Smtp-Session: l3s3148p1@KQo6FpZULKYujnu2
Date: Fri, 19 Jun 2026 09:17:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwspinlock: reverse logic for used channels
Message-ID: <ajTtDoR83MuAnvs8@shikoro>
References: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
 <20260618163422.17604-2-wsa+renesas@sang-engineering.com>
 <ajTOWqp38ZtTZGgD@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a7FEBDeal3g8ZYzU"
Content-Disposition: inline
In-Reply-To: <ajTOWqp38ZtTZGgD@shikoro>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:baolin.wang@linux.alibaba.com,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34228-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 093576A44A9


--a7FEBDeal3g8ZYzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri, Jun 19, 2026 at 07:06:34AM +0200, Wolfram Sang wrote:
>=20
> > > @@ -42,8 +42,8 @@
> > >   * used as the ID's of the hwspinlock instances).
> > >   *
> > >   * The radix tree API supports tagging items in the tree, which this
> > > - * framework uses to mark unused hwspinlock instances (see the
> > > - * HWSPINLOCK_UNUSED tag above). As a result, the process of queryin=
g the
> > > + * framework uses to mark used hwspinlock instances (see the
> > > + * HWSPINLOCK_USED tag above). As a result, the process of querying =
the
> > >   * tree, looking for an unused hwspinlock instance, is now reduced t=
o a
> > >   * single radix tree API call.
> > >   */
> >=20
> > [Severity: Low]
> > Is the documentation internally contradictory here? Because the tag is =
now
> > exclusively applied to USED locks, it seems impossible to query for an
> > UNUSED lock with a single tag-based API call.
>=20
> Can reword to "getting the hwspinlock state". The core doesn't offer to
> look for just some unused hwlock. Only specific locks are looked for and
> their state is queried.

On second thought, this still shows the original intention of using an
UNUSED flag instead of a USED flag. I will probably drop this patch in
v2. It is less intrusive and probably more future proof.


--a7FEBDeal3g8ZYzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmo07Q4ACgkQFA3kzBSg
KbbaeQ//Qepb/SnOO7wCRdhaBdoVZXYKGxyH9POgRipDqIjSD4so6TLbzOIw3EIq
z5958MCyMhnJak0NcfhzMwnHlYCPRPxPD+B0fj+0KMwTgq8aeVA6IzMJgE3voLbq
jFdCGkR+xxeDerBqdSDrRaLB4PdCm6xNYonfnnyHw+Qlk8Z0U1XJctliPL/9Mp1Z
9sQaA2D+YU9Ze3zkE8bjGvmJboQPEDgVo+aYJ6DbOq0rvPltN9d7+o1AKyTfqkC8
mJfLVqp0SkIAHbZpGpTW389LsVISkXJklpkCD51wfUIEQCNYWXOVf0n3693RPuLM
TYU8bffr7LV8SWu7rpvZ87XVAHlS9Vgt8Xy1yWmxnn+rQp93DRI7pkP9saQ5ZB+L
jho0u5AQk9ZwRsTP53rBLfcw7uZm+7wsulURCUuCyGJx7h3KfkHMyEzJZBn6/2X5
E1qjiUo5I2ur4RE3gE3GRXQBJXK6Nqemgq9UDzdBKU//yK9T84vKBaGJZxiQt83w
jvQn5hRQESXSzcfL0a6Rc2vXWBgxovYF5MhrO5+o2Epda348vVB3pSEoie8o28/m
Bod+xIEEmbACLkn2AROQ1qSTef5JJzjJ4tA1cu6CRz70fmseMHh2oFI6+fLD/gdw
f5ovT1Vk0SHVOspVpRK3XmhXLVmomJ3k6DJdzhM5ibt5ZbzO/L8=
=uxIE
-----END PGP SIGNATURE-----

--a7FEBDeal3g8ZYzU--

