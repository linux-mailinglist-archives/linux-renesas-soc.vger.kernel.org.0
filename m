Return-Path: <linux-renesas-soc+bounces-30093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDYRHEAIwWmtPwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 10:30:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F842EF18A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 10:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92954302E925
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 09:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7568A37E31C;
	Mon, 23 Mar 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Wu2YcKtr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D61386568
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258177; cv=none; b=iiKoX6UYCiqiuGM5+ICy9CboZVmLGIWUgoBl6l+1uONfd9UcUkynLDqBUZ8y3v70Ev7uQD6n1AfKVWaA21tYY+udMyyvXXOOaz+qnJ9Pw1WsrSScErz//XLDL306g//iJvQYsR+k6cd9BedqaFs3d6R7u6hMLR48X1v9mIsri5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258177; c=relaxed/simple;
	bh=U1wgbEcH0s6HRDM5LJjpzrhJY7EabdBAdG3n70pOvBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNVrK7G6FYc5gos3JVKnNaAjj/94dehQC2XrF4uA1InQGwm+yYW3H/cVexnmERA/ASS4ZgN6yRou5hUgYdZCMC0l7f0WwzGalsq4Lj1FXDR6do8+Y5uGN3hdAzOQKkHVFkdsGe9KeF54ZwLst8vNlIBvYMgr9xnU+agHExKT1L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Wu2YcKtr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+u75
	SoLqZfG/rvUg6Xt980ChlIiIFv95YMmNKEngCMU=; b=Wu2YcKtrTpMcaukQDKD3
	CQNIsJZuK78eTSNLcm5/Co72cAEqW7VFYRU+qXmcmMxP1qhwe80XADJkapBE66JC
	FW7Q03Pxd/c681YZgbdUVuST3PMVf3ER6C74bP22WjvG0bvjuULAG4nsmEVlhV+H
	5tAaIrA7TOPpaRQBP0mJec0CdTxt4x2ZWM3LUjA1GJ48hgkm71gyrSPggwADXMub
	CH3VS7peW5Lyi9o8KtUamEdtML/OiKZ8/644Owq3m6uNRkeQYQ3lejsOfvcAYADC
	ohKa9OeJwsjBdQfxSOeN3CCC4bfIJ8hn7z1KgOH7rBRrw2l2Bntt/GrB2ckdyJqD
	TQ==
Received: (qmail 2600378 invoked from network); 23 Mar 2026 10:29:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Mar 2026 10:29:22 +0100
X-UD-Smtp-Session: l3s3148p1@8Tp9q61NOokvQbLk
Date: Mon, 23 Mar 2026 10:29:21 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add Renesas R-Car MFIS driver
Message-ID: <acEH8ZKis36cgxT-@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdW7jAfXmOHdmd77sB-7aXz3H8xDfAjJUWbU=7SUHiEfSw@mail.gmail.com>
 <acBJ_G1ZgZwrJfEh@ninjato>
 <CAMuHMdV_AFhOEi3fimZF467EWpupmcOQTW4SpdUffjzskBrNmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F3AtRm4xmOqq46sw"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV_AFhOEi3fimZF467EWpupmcOQTW4SpdUffjzskBrNmA@mail.gmail.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30093-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,glider.be];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: C9F842EF18A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F3AtRm4xmOqq46sw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > +       if (priv->info->mb_reg_comes_from_dt) {
> > > > +               tx_uses_eicr =3D chan_flags & MFIS_CHANNEL_EICR;
> > > > +               if (tx_uses_eicr)
> > > > +                       chan +=3D mbox->num_chans / 2;
> > > > +       } else {
> > > > +               tx_uses_eicr =3D priv->info->mb_tx_uses_eicr;
> > > > +       }
> > >
> > > "chan - mbox->chans" is the logical channel number, and should be
> > > validated against mbox_num_chans, to avoid out-of-bound accesses.
> >
> > "chan - ..."? You mean "chan + ..."?
>=20
> No, I did mean "-": you do have a pointer "chan" to the channel,
> instead of an index into the mbox->chans[] array.
> Using a  index would  make validation easier to read, though.

Sorry, I still don't get it: If 'chan_num' has been sanitized above to
be in the range of 0..priv->info->mb_num_channels - 1, then how can a
OOB happen here? "chan +=3D mbox->num_chans / 2" only happens when
'mb_reg_comes_from_dt' is set. But when it is set, the array of chans is
also always doubled to have the "<n> IICR, then <n> EICR" layout.


--F3AtRm4xmOqq46sw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnBB+kACgkQFA3kzBSg
Kbb34RAAsAokPxSPiULF0oPP70iI7aHY8wO/jMZt5udUNIx7oVcRrmafhFMh8mIJ
ZOTLpUPDEwkwiXISJ2xuFgV0PsYmVvZeWqrOJEh9n/QQuH8Jvh+5QxTq8NKWfKGM
4weR7K2EHCbJ7p/Fvkz8V0HL2WIiTDaE0rQqqxUDOwF8NpWbaMyA5m2TY2XYuWf5
/VrWvAOKnDq1ni/ffxvNd1GsVBMCzOfSiJbUXKV7aSxwv1pkMtIFqjhWzDmvmKiC
d+0I9OaRxz+0wPMZGPqFjKDVQoNgl7Q5lFPJZOXo32tTu/+Q2DndLvXYViTc1dkX
WZsgraJAi6IDG3Jdqrt9vDpVwA5M67aQOw59Drxk+9kActNe80rCp7ZKijULq5l2
yA7l5XwGKaSri04EpDRYSDLn0HzN2QFy4xF6i2LFxHMCnQ1MlX2HSmW1b//mg1y7
2zBSYxeI1YL7yuh/iUir6qBinL+EygCqMXYSYcGYNJfNzmpEuc0upcMwuaH59KFm
p/vgMOjIrOBGhGRi0Ajv1DGR+3Q19DB4JmDdlFyakcGjRbLTfXqTLrwtZFbubsE9
3EUQv8m7uXVKKRELUFq+UpCKMLbjGftYg2qXfBpJjJ211+tbJidEjd13mZH853rX
ZIUjfrM1dWd2WG1iOEb2xcAd8Hl9gX/IDyPwMrIXBo9x1HIbETQ=
=WFJB
-----END PGP SIGNATURE-----

--F3AtRm4xmOqq46sw--

