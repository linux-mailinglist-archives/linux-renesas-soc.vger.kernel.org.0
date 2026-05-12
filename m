Return-Path: <linux-renesas-soc+bounces-32465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKOSICcDA2pczgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 12:38:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9051EB61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 12:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12B65300E28E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 10:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D40383995;
	Tue, 12 May 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jIrUGRBg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFC395AE4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582308; cv=none; b=W2ShVAPSr9k8BhfO2POKMdWo3sssVs6K7w9LM13eZOnFSOnm1OTZy+x0VGYvXS+mL4eIQ7zBS5rcU8fLkWDP6IpngNM317SU9lErmaGHinvZPiKcIv/cM3Dcv+nhQCxyb/fdDSdRPA7BHQBkztaKsLQq3LSC5Ul1GqKlflcRRrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582308; c=relaxed/simple;
	bh=uSc4Uk5ndet+gTRsUAvT8KIaxikSv3hGFbqTwITcS5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6H/ORqW6IoY1Rb19cUXx5BOGLE1bc904LLvw/5DL0DQnoySC5ywIaVuW88fmh6829nrdAgHCn43ZTviJJdmAwSu6M1yRR6VJMkfCKT45pmyTcolHXgBvg7XYwc82XEK5j6HWjkcubFZXjuxBfDiHJJ/vWE9y2i89Q3eHDhWPMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jIrUGRBg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:mime-version:content-type; s=k1; bh=NOyfNCm4880N2TyZrQF+LofeXFP
	siXAUsATS4C1WbbU=; b=jIrUGRBgAdUUHM9MizscSFTP3Jy8YfPchEVmqiu7iT9
	aepJbPWKsS+LeTtOrCpRJjNN9RFjbsKg4BJlZEhdKnnehpPYB+QkotBzskK4IoyT
	xAwjArSduNN5EzjOmYfwg6TZQVL7BZbxcXK8phn4LJ+FkLleVdHlkqh94hl9i7jN
	LyEWncL1sXhLwJuroJi89pB3YQsaddwSwmiVaGzZuuXP9OEFiE5EfsUIV23ppvuv
	u4GqQCnln2mRIlghFzEIaZo+4LxMA9TY0RiWyySUAcNljKVx4PsqcIhROYusIN+b
	mawlFdBdolkyclREq77/ZS5ceWobGmScBVLxxCRHA+Q==
Received: (qmail 2954428 invoked from network); 12 May 2026 12:38:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2026 12:38:20 +0200
X-UD-Smtp-Session: l3s3148p1@rboydpxRepUujns3
Date: Tue, 12 May 2026 12:38:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-remoteproc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: [PROPOSAL] hwspinlock: remove 'unregistering hwspinlock devices'
 from the core
Message-ID: <agMDGwHuh-mqhk7y@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8KjfHD4l9zYmj8YX"
Content-Disposition: inline
X-Rspamd-Queue-Id: 21A9051EB61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-32465-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--8KjfHD4l9zYmj8YX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

TLDR: I think that unregistering hwspinlock devices is broken currently. A
correct solution is complex. My intermediate proposal is to simply remove
"unregistering" support until someone actually needs it.

Longer read (I still try to keep it short):

Problem
=3D=3D=3D=3D=3D=3D=3D

I recently worked on hwspinlock device allocation being done in the core,
rather than in drivers. This lead to a lengthy Sashiko review[1]. The comme=
nts
about leaking the new allocation are correct. But the underlying problems w=
ere
in the hwspinlock core even before my changes. See the current unregister
function:

566 int hwspin_lock_unregister(struct hwspinlock_device *bank)
567 {
568         struct hwspinlock *hwlock, *tmp;
569         int i;
570=20
571         for (i =3D 0; i < bank->num_locks; i++) {
572                 hwlock =3D &bank->lock[i];
573=20
574                 tmp =3D hwspin_lock_unregister_single(bank->base_id + i=
);
575                 if (!tmp)
576                         return -EBUSY;
577=20
578                 /* self-sanity check that should never fail */
579                 WARN_ON(tmp !=3D hwlock);
580         }
581=20
582         return 0;
583 }

Let's say lock 5 is in use. Then, locks 0-4 will get unregistered. With loc=
k 5,
-EBUSY will be returned. Two problems now:

1) The only caller of this function (devm_hwspin_lock_unregister) ignores t=
he
   errno anyhow. All locks after 5 are leaked.

2) Even if the errno was considered, a later try to unregister again will f=
ail
   immediately because lock 0 is no longer present.

Correct solution
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

As I see it, the correct solution is to decouple the lifetime of a single l=
ock
=66rom the lifetime of a hwspinlock device. It reminds me of a similar prob=
lem
the I2C subsystem has. There, we also still need to decouple the lifetime o=
f an
I2C adapter from the lifetime of its users. Given the experience from I2C, =
this
is a complex and time-consuming job. I, at least, don't have this bandwidth.

Simple intermediate solution?
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Unlike I2C, I wonder if the hwspinlock subsystem really needs to unregister=
 its
devices. All current users are IP cores within the SoC, not hot-pluggable. =
This
is unlikely to change in the near future. My proposal is now to see hwspinl=
ock
devices more like critical clocks which can be probed, but never removed. T=
hat
would mean for now, the unregister parts in the hwspinlock core can just be
discarded.

Benefits
=3D=3D=3D=3D=3D=3D=3D=3D

- no false promises made (unregistering doesn't really work)
- simplifies the subsystem (less maintainer burden, especially given the
  rising amount of AI generated bug reports)
- simplifies further refactoring like device allocation in core
- no oneway. Proper solution can be added any time if needed
- I have bandwidth for this intermediate approach

Looking forward to comments. I hope I am still seeing the forest for the tr=
ees.

   Wolfram

[1] https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sa=
ng-engineering.com

--8KjfHD4l9zYmj8YX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoDAxgACgkQFA3kzBSg
KbYsUg//VestcAAbP5TQOz8whmTfo4EKSbvnLBNepZYuLq0TGKCdqibPtq7NL91H
hZj/yh8PaoyqC1vest6gO63+jYbhIE/EI2JuQrCLf1KZRLqmjs8SWXxJKBzBP3eH
S1sDkIJX17t37psL40XACCMwldIGboZt0dWuQdl+lVG/REMz8xa2G7JFgQBK7PCv
KtdUIO1XYptBiQvd5JgFGK8hOgZd2KvW9Y2ykHBi9PsGKUd9v+XhwU5pkRNEn9I4
43ik5QpEcitELlBMrddu6mA8jFyVvTVOYhKS0WdfBUtA5YtoaAktQ1mZhpIMVZKY
xWk19b8gf4eDg2cr5ZNywesfoTODYegWC8OFMMyfC1wTdyVnv23Kw0gzz5cAh9RG
bTmosmiat5sTrNjTjtzwY8JMyUzFeTn8wRrELgT3Dn4zxGnXz9dZOBQODfopYSYZ
SgcLjQV2RvBqC+FQ4UiCWLjH2cbdpv4zngLiu6iSfoz8zBVtNfuL9dn5b5IcVNUa
cFk2xHNhBs3wkYE0mV8faUYl1CFBHQrPskZBhcrS5TVhPpK6yT9W2JlKcyacel6f
eVa5rbOeE3/Ccp2mQwqvx+9DistRPY79R4JPbCfjAbuJ/we4psHDgnrpJ39G7gUN
LMm08FBOFDj+jRZLmZdN0bciiKpAeJ/7uhUZ2Ey49U46Vm3PxMs=
=NZqf
-----END PGP SIGNATURE-----

--8KjfHD4l9zYmj8YX--

