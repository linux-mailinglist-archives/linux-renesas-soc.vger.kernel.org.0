Return-Path: <linux-renesas-soc+bounces-30798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKfFByKuzml+pQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 19:57:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 963ED38CCD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 19:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88BAE301A50D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 17:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03443DBD6B;
	Thu,  2 Apr 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMTMgYfw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A87C33E345;
	Thu,  2 Apr 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775152670; cv=none; b=K9IXDe6W28mRUoCQF8ceHkoU8xqchNmoOfxI97L2VQT3M/pVnjRleybSYXQTZ+1XJhUr1M7eWCFpjoqwy/1FyoNAOxFEGWXSR5nKCd4rHzZzTR48Siq6KQ0zsrikVC80ED+ZqzllDpgL2duHUAMsECbHSkLQ5pLwX2kKbnc3Gu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775152670; c=relaxed/simple;
	bh=9Z/F7oyXe0SHo7w71EvTg9ahRdyLawX8uZdlp06XMCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKMZzlOitBelT2PwkJFIN7/MlYgbTDBcB6GzJyW+WtRE3u977FtNsY6u/fQkuBbkvdq9uMu7X3wySD1Zcc+bU8PFzOyhrfVsrIp3G1JOWpSy9DauhvF51aPQWK1d0eiDGm/rpXNbKEpEJhawskCLieJHHUOPGIMZLkajlwptDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMTMgYfw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80219C116C6;
	Thu,  2 Apr 2026 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775152669;
	bh=9Z/F7oyXe0SHo7w71EvTg9ahRdyLawX8uZdlp06XMCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kMTMgYfwhqPZX2Dlq9lUsMJkp1v7xXv7U+gleoEukfdjsEv+CkkPzChlUKZpGr+02
	 jYW9XEWLSL/btrHtD+keg0apgNb5u1otjd3UtvYuoNs/jbF3KZcjuzq/7UeCoqKPaP
	 MZg23un2XNFXk5rkFPqCZpoolEswZlSJWm4TQ8xSN/bm3RWbUIz/ZMHoeHfs0KCQfe
	 dvJCTmp9aYFf7xffCwyRFLrau0RHzJdjZ1k0rK41nDOjEMRPbVRdqHZkeTgRcC0Y6O
	 Z+7SxHyOdIklczM4tMO7zjqUc3gI88LSUHWWiLIJ9yH/meDehzCuSFqaZa7UkDssDj
	 tdQILk4N0FuCg==
Date: Thu, 2 Apr 2026 18:57:43 +0100
From: Mark Brown <broonie@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCh v3 08/14] ASoC: rsnd: Add SSI reset support for RZ/G3E
 platforms
Message-ID: <cbd544c2-cfe5-4eb3-b414-7f3fc9b57346@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-9-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wV8n5Sf64tf9nEfD"
Content-Disposition: inline
In-Reply-To: <20260402162436.12059-9-john.madieu.xa@bp.renesas.com>
X-Cookie: <doogie> dpkg has bugs?  no way!
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30798-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 963ED38CCD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--wV8n5Sf64tf9nEfD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 06:24:30PM +0200, John Madieu wrote:
> Add SSI reset support for the Renesas RZ/G3E SoC, which differs from earl=
ier
> generations in several ways:
>=20
>  - The SSI block always operates in BUSIF mode; RZ/G3E does not implement
>    the SSITDR/SSIRDR registers used by R-Car Gen2/Gen3/Gen4 for direct SSI
>    DMA. Consequently, all audio data must pass through BUSIF.

Does the driver still support PIO mode?

--wV8n5Sf64tf9nEfD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOrhcACgkQJNaLcl1U
h9Dktgf/ctG93iO0kqN0X4IbcodqOdIYLrEctYlk6vOC/qEWOukqYDhrn/M1maBb
YxzFInawncEwEemIQZDDGKq3O/iKnPkm4NG0F4amViV4sMmBF0PzyPzLdENKjy0f
CXCgjq1NXX3vp77MPyDb05HYNSm5sLsoYSbMAwy0QpDZqGNtLffn2aFTdE7zsyY/
vRqK1KbYOSu7qm56Ap/zwlfmCzEz7tsxm6i63YlYjmp4p1PkzA4mCVnBgxc18ItD
AgcSke9Ydyr0gdDBhfwqNz4BIw6hwuSPGvvnvB0EBXNw10/TJNqpypHVabvjPSmQ
0qHs59pa31buFH5UzBc5nK5xtVQJug==
=i1zk
-----END PGP SIGNATURE-----

--wV8n5Sf64tf9nEfD--

