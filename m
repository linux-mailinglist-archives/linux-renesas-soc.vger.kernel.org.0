Return-Path: <linux-renesas-soc+bounces-28906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JnAEYHSqWmYFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 19:59:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F52172F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 19:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25E5D300FEF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 18:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6628F2E6CA8;
	Thu,  5 Mar 2026 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VplKmPXG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86FB2DC359
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737147; cv=none; b=hSJkHbQqkeW8ltsZMNvUz+QQ1pcUY2txnqFBQDbIww6vCSy9g469nCBLOEufsVy2RUXC0+KCYBw4HKriBcQiwiB+TEKrPtskdzPIkQU7EpXE3Gt0k4HbZu+IwB6pzj3vlWACf1f8LbS1S5q5LDU0VZwtYyv7IR705zr3BywJ6Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737147; c=relaxed/simple;
	bh=ldi2xj3Wt82MNVAjUv4VLJ2IUzbzkeaaW86d6yvdw6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dq6CUF9LGTJmp/PgPkf8t3WBKXzHtdoaVTC7zaC0teAB/ErmpEr7F4QhJdWF99lqwbAlpcXuqBe8GGkN7S1Pht1d9ZXngzU14vBo2kkymrmO0VgeJbhOaFHp/l30c4G27zOIYgcETqH2d/er2sjWkXqfMYJkW0cpmIkc50oZCVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VplKmPXG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ldi2
	xj3Wt82MNVAjUv4VLJ2IUzbzkeaaW86d6yvdw6M=; b=VplKmPXGJQZxHJPDQfLy
	hvzvWObOIyp9cZ+S8shxcjF6m2YXirs7KO1QmyyPpOBoys+0YKeZSnSSLwGYOta+
	NOoRsL/mIOl+9CIQuBXr730I5PkFzUibquDcoHeqYbpQOtuVbdh0GV+3lE7Tq1pN
	G5dtT7ralC7k+8i4apwJ+qoGUxXA5UGjA+mz5mzfBNdHBETr63PMMDWiDGUm0Lxu
	Ja1CRbIQT/lRwCDifgdNOQ1oVtC4vAbpVVFUGSimpM7fUP3g0a9rgoNyDezUUu9B
	E5kY+LEs5wpG8fy4C84OEArbZyXiUr74S2453C0gfWcMd6jpM/OZEaCUzwtPSiwZ
	YQ==
Received: (qmail 1302348 invoked from network); 5 Mar 2026 19:59:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2026 19:59:00 +0100
X-UD-Smtp-Session: l3s3148p1@eCSMh0tMSNMujns5
Date: Thu, 5 Mar 2026 19:59:00 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3] mailbox: test: really ignore optional memory resources
Message-ID: <aanSdMk-Jrz6oaPf@shikoro>
References: <20260303212738.12769-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KAhyjUyuZBE5sbcs"
Content-Disposition: inline
In-Reply-To: <20260303212738.12769-2-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: 4D4F52172F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28906-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Action: no action


--KAhyjUyuZBE5sbcs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 10:27:39PM +0100, Wolfram Sang wrote:
> Memory resources are optional but if the resource is empty
> devm_platform_get_and_ioremap_resource() prints an error nonetheless.
> Refactor the code to check the resources locally first and process them
> only if they are present. The -EBUSY error message of ioremap_resource()
> is still kept because it is correct. The comment which explains that a
> plain ioremap() is tried as a workaround is turned into a info message.
> So, a user will be informed about it, too.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Got some buildbot reports about missing __iomem annotations. I already
fixed these and now wait for the updated buildbot reports. Sorry,
because of the new 7.0-rc1 requirement to use top-of-tree sparse, my
scripts went a bit haywire.


--KAhyjUyuZBE5sbcs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmp0nAACgkQFA3kzBSg
KbaJvg/7B39mtyBr+6y2AKUfMsYP6GjGZ8rm8wH27Mg9U30W65eIQwYix6SBH31j
2YCAvk3/cMZuxP5S2QnEAxCYSEHe5WthbO1mqLQd2yOE6yA5DR6/DskM2qL8k0SZ
hiTBzmlx1gEmdtK+7Gjlj/C0Zl7atqUuD9wMU6pdBGAwlfTcRjr1PxTwKyUX//Ld
SbkyFEJMGTvcZ/zu1GmThOgds0ltvq9nL+uPyBbYzup6uslQSWsxL40DCjJHHCN7
j3z/cNIx0duIIrrp04lpnUlpIDkNDA3q2zhj2JrgLh2d39rm4VK8NHI64JNiiFl2
bp7LBhHQdsbqK/ITBqcm+DR//EMg3x10h7m1Vac4cND0dnZZpXEjZW37MRkoDR+f
49cVzG7AiTedhANfWLtuaeXOAoF3H0xMNPH70LmpsX5HQ8uGjcd88sh1bf68Fdlv
UU3/YuzzLqkn1pL9uTnV/ZqPT5S+eZxlTaY8uXMSS2Wz5uRCcgeFYIyiWMEo+0ri
3FK4D+1FEylns4TTyRq9UOBbXuNMpdT1nyWNKSv2HjKy78o7Zh+E2JJjRFtQVRLg
eoVvEw1KNH8wnpUm0WaZZaZlxKIxIF2YoAlGvyQzApj4+kSagypI5xd6RfYhb61n
Fwcv6sgd7oytKj8629LjjIr8FHrTSc4kBtkDzXimKDv6ty7MkiM=
=35AH
-----END PGP SIGNATURE-----

--KAhyjUyuZBE5sbcs--

