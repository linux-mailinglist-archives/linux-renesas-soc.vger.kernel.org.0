Return-Path: <linux-renesas-soc+bounces-28735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBlTE3tSp2lsgwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 22:28:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB8C1F784E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 22:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E69C301F9E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 21:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C30395D8E;
	Tue,  3 Mar 2026 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UcxqS9v9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB63A5E9B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 21:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573183; cv=none; b=j1QsiE1m9t/eZ3l4tOjV2IOPK9nD996WkkQMWkpAMq8wfPyjK75QVw1XU9eloL3Rni446benrKgw/QJBvlbEEG6v9NBjDrlXh3auvR6hX15lzXjAK9Lebta3DvxybVlx45PMk3h3S2BHEdN/rBuy+isW21osxpj5FcpcfInkI2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573183; c=relaxed/simple;
	bh=Y574Fl0OiqR2KqEOzbqUHmKfgh0+dvoWoOd8ael+Dds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lP1WwC5DikeL2EVg29DWbZpcAYJAvvzkGp6vbyeo4a0u2Euhw2XjTuaWXtZboNa0iezY/kYSRsLeg51gOZnsFeEBpmuGRNcC0tGnkNFuogIu4stf0fZj9w+4ZxpgxwZJmVBvAb5W7mS66+sLC3ZRXujzwme4+zQUWGjjI/zFDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UcxqS9v9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XhjL
	Z1dfC1CK1BKBjoSY/No/iIQR7G9xeALkkNiLYeA=; b=UcxqS9v9OvQSSXITL48V
	+E756/kvY+fKOF9a5+YyPexVL051g2FkOM/gxgZFi55luGDuNqopcKIgGVQTIY5g
	qhYqyS3cYPkw1LtORDxuGuzCpZRTPWGQSmtHayR8q4Ndl/pr8szn5VzF9VijRnI0
	RL8GBABRpjmmrYU3pU/JM63xorS0BxMsluHBkLEe06SZmtPhKPiJE9gsslcj1Rt1
	r7xk9FhSBv+G9/fcxJETABunKoXVSb7At/ylyC2/x4ovdo+RRiFBHd4HXkELR1M/
	msBUGpP/91mXGiyQZF5QLj5mFK22IssUtMCql4Hy0+jDXbRCeqCYb8cjgcI6Pd2O
	pg==
Received: (qmail 461057 invoked from network); 3 Mar 2026 22:26:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 22:26:16 +0100
X-UD-Smtp-Session: l3s3148p1@38iFWiVM9MMujnu+
Date: Tue, 3 Mar 2026 22:26:15 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2] mailbox: test: really ignore optional memory resources
Message-ID: <aadR9-kbAE6cyKXb@shikoro>
References: <20260223123022.7657-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUuh3-cryVknRhN+WGQQ_YaqNK=EvBzbo_XZDik6Vkv_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fh6IITzCe7KHN4DP"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUuh3-cryVknRhN+WGQQ_YaqNK=EvBzbo_XZDik6Vkv_Q@mail.gmail.com>
X-Rspamd-Queue-Id: 9EB8C1F784E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28735-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--fh6IITzCe7KHN4DP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

thank you for the review!

> if (!res)
>         return NULL;

I applied the 'single exit' paradigm, but your solution is a bit easier
to understand, I think. Will send v3 soon.

Happy hacking,

   Wolfram


--fh6IITzCe7KHN4DP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmnUfMACgkQFA3kzBSg
KbY1WxAAr764EZwBUcBc5C/eTD+jO07fVoG/nrJDDqMQ9NimN+p0HgkhgWwGp+t1
JEcGEY0TO/UZK0TlEgJ3FGZ3H4oOgsQ8MyscSOP0uyUhuDE3cUOhi5tKVOPzQtyj
Ebelo0Jsf+3/AOHBjZCfo90MCKJoyw7Vj61WP77lpyNzBeWHAZDMede5jDyeFwS9
UJLGbtyrXpS9zClzNIwFES60jVpPzdDGfmsz+2ic4SwpiS3DlH2w9OQIaqBLvyL3
puErSbVYhw6rG3eiXgV+t9VrP3ccMDezlKB4OvnLzw4fkzUGunqiA+pgTbGyKUfm
Df8hokjPDxk2gNosiA8KCmjF0ObL6ISeMEmr4GIy1NkwfwuuYBPW6OGn5XDzfZFG
4BtjIdfkaLTERcgazkoPONLZbIMQmYHSU6ip0A8tM0/M/WxEMipMOoc1O2nLAHfu
KHupy1nIZBF7Xhg7JWbnd4lclAk/cysAaHonNqc3b1Um8TSU36uo0WWCOuonirkt
oq6tw16W4iecHgNaqnginFvUfufd2CUz1MH0Cd2iGBKfRps3d1QQl8pofrRLHxE7
/zDgs7959V857RJbc6ntMniRhXTfQywnLAkfxnZXftS+GQYuJGVKZfWlxTcUcy7u
icjjPSzYlF2SPg6NeE61dluzZ9ldmFh9hMx27aitQ6JofqoEMUc=
=f6zn
-----END PGP SIGNATURE-----

--fh6IITzCe7KHN4DP--

