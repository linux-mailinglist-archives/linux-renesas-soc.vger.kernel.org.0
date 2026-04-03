Return-Path: <linux-renesas-soc+bounces-30847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMCbGnClz2mZyQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:33:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5CD393B70
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 623B0302172C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 11:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0E13B776D;
	Fri,  3 Apr 2026 11:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccxMQBML"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E34E3B894D;
	Fri,  3 Apr 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215976; cv=none; b=Tw/fJ3IuUokV8MtomIw32f+Lo9AwHlS+jn2vzxdQbbqccs3VeONv1xOG43yZyOYQB3Fw+OluH6yifDSw99C9FHW0ky56RuBoueod0guhzgoLzvEqMCKi/Uyo1xsdDAMb09RCmlymytOyPTgiEgBKs0ATZfzhtI2Weem4UhS/wdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215976; c=relaxed/simple;
	bh=lE8a+mYfWMdkTa09vzd+bOH6CMIeb1HCqK44Fql+uV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgUFgbWiwlQptgQsGEkCI7uwQNCV3k+1oWZZmhEHsYZVHb8N/qfncDQg/x0OPkuHNot2CFAYmqkf/QgtHMtsstEHd/ywcRrqLrvKEBR+EmUh3hP4LNbVd4FNpy4nyhtwwrWWnr5Zkb/u3eL9j3Bu/9UG+H3VangNlBEap5kTS4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccxMQBML; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A71C4CEF7;
	Fri,  3 Apr 2026 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775215976;
	bh=lE8a+mYfWMdkTa09vzd+bOH6CMIeb1HCqK44Fql+uV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccxMQBMLj6NwJLvT33fALrHA8wN7C/DqX1un5zy+2aYV10jTorPgueTHUUUGb5N1V
	 t0qYVeh32go82uUY9OZmSZjQyanKSqoz9cqE/tZHi/zNGGtpe70hnrt7eGwXWI8XDl
	 orx9vONSQF4VG7X2J4O3yUS+sJzSKyb+LiWTu4kylUxpgV+ealnIATkXw/H8PHo+oa
	 Z9GPo4p+4bCliUQiInCnJirQT1SVY7KxVyvL7tYJ41Atxa08cWSMpE6BB1DVWFyQwI
	 cYb1GA/90kNs4Gq34+K372K+lh0niOKpweRWoS525BWncyx7jrmG8k9AKdhHfgKwqH
	 QPd35Lye40zWg==
Date: Fri, 3 Apr 2026 12:32:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
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
Subject: Re: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Message-ID: <91a44b9e-b82c-49af-8c52-c876d271baa6@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-8-john.madieu.xa@bp.renesas.com>
 <a457c427-95bf-43be-84db-02144fcc2bd6@sirena.org.uk>
 <87jyuog7u9.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IGWz7nPE7XurPHlI"
Content-Disposition: inline
In-Reply-To: <87jyuog7u9.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: The Korean War must have been fun.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30847-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD5CD393B70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--IGWz7nPE7XurPHlI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2026 at 01:18:07AM +0000, Kuninori Morimoto wrote:

> > > @@ -160,7 +161,8 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
> > >  	/*
> > >  	 * SSI_MODE0
> > >  	 */
> > > -	rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
> > > +	if (!rsnd_is_rzg3e(priv))
> > > +		rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);

> > Perhaps should be a capability flag like the changelog said?

> Have or not have registers are depending on the each SoC, and (probably)
> there's no regularity to it.
> And SoC special handling is needed not only for the register settings.

> There is no clear rule on this driver for now.
> Handling it by flag is one the idea, but rsnd_is_xxx() is enough for now.
> Because it is easy to find SoC specific handling part by "grep rsnd_is_"

To be clear I don't mind either way, it's just that the changelog and
the change don't line up.

--IGWz7nPE7XurPHlI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPpVwACgkQJNaLcl1U
h9C1nQf/eoowzhKjAjgdBAkzUCpG6HqqnzbQWfDtFLVfufwo8Tc+w8hvY/mRg6Wg
SA8pulGLmsSQzq5KWrD2l+ZeMytMvGzd0IuH5CQLXEbiabf+WqH646PC1d9T4I44
13i5z8TMMWRKicFDBJD7YkbJCGQ8Q1yjojzDSYP/ZzWHJCen54cWN6rP+WXZ3b6s
6/QdMNnSaXXc3ihRGs5lzR9XgX6sWJiiI4SdomfvQLb47CW9vM44RB2mnNBNzj2R
9iTCiuPnAwwsSI3f5kMD3Ih9AxzDGDzxHAc7m5kT6TwD1Gh+k15FppIyutnYa4qf
2vtVMKAhMozTL8zRYkQll+RVR6z37Q==
=nvm5
-----END PGP SIGNATURE-----

--IGWz7nPE7XurPHlI--

