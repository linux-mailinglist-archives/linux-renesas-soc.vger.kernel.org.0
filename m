Return-Path: <linux-renesas-soc+bounces-33788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id egvtDNagKGrJGwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 01:25:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32773664C5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 01:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WELQ078C;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 232CA3014275
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 23:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E863EAC86;
	Tue,  9 Jun 2026 23:24:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85997320CAD;
	Tue,  9 Jun 2026 23:24:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781047499; cv=none; b=cORz/ByqEu7uQVMJj/BV+uJmC+vS2c/mA41lbYCw3vvXBq6PM+1GsXbtzJ3wr7Dud1dTrFShVTYexGjjG4tDgA6YoZYH/aDCdxDYJp/Nz9W3k+a9VE/od2qVplJD/H+XTjkZ/0cJ8UK59R7c54XQPfKVGT4jb+Bb47Phg9ScJhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781047499; c=relaxed/simple;
	bh=9MdWy2QrDz5exOOLcEuBuj6NyRKlWXPx6gtf5833H4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRpwundnTRiQ/mOcV58mrJG7NJ5IPUEjsxhZce60FPCkeMWpIItVpA+GfE+T4AFS2IZQV2t2YG7R1HrXJ0Pro5B+Vhv2E5YL0VN5dQcfOgV1lbfrwMYwvh87TJC+y/mFbRnDNnZqip2PUWVqbv8nbNpPJ+70e7loky7OuJKxFao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WELQ078C; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D561F00893;
	Tue,  9 Jun 2026 23:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781047498;
	bh=XECSwOdG7aWv+AWzkviwG4lcJ5iemprDQN3GLacZFEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WELQ078Cnx3ZRgxOd9TJSEoDMyp4ZPhSZQoulwds1G3zBSC/ve1v+j8gSMDVmqo8Y
	 N721YOKAn20IE0/TAql5rkEUqo86waFSU9AhrjTyMRuVJNxDoAPjKP4JZfLp9xrY48
	 4WBSTcXWPvwABjPWblyjWVQwZRflo06m1juhCm5bmXhjUKgP0v5W6LA2g85vYyY0ne
	 Qox08IOwOPpG2XLO/gPu8Ma22b9SMQvfmnqgdRtMVfYWPzQeLTrbsC9+/BuWOREr3A
	 zuOaRaPnRw7DHvKXzo9JZlVcgr5SRZAfMZB6ePMBxf8Tn9fRETUsJXEORVPzldr40W
	 m4tqDeuyC7/Kw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 856FC1AC56BD; Wed, 10 Jun 2026 00:24:39 +0100 (BST)
Date: Wed, 10 Jun 2026 00:24:39 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/11] ASoC: renesas: fsi: Add SPU clock control in
 hw_startup/shutdown
Message-ID: <aiigtwDM-qEBxjH5@sirena.co.uk>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
 <20260609113836.45079-12-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rIVLtUXf0Jj60L4V"
Content-Disposition: inline
In-Reply-To: <20260609113836.45079-12-phucduc.bui@gmail.com>
X-Cookie: Leave no stone unturned.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucducbui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33788-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,glider.be,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32773664C5C


--rIVLtUXf0Jj60L4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2026 at 06:38:36PM +0700, phucduc.bui@gmail.com wrote:
> @@ -1560,6 +1560,11 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
>  			  struct device *dev)
>  {
>  	u32 data = 0;
> +	int ret;
> +	/* enable spu bus bridge clock */
> +	ret = clk_enable(fsi->master->clk_spu);
> +	if (ret)
> +		return ret;

This is unconditional...

>  static int fsi_hw_shutdown(struct fsi_priv *fsi,
>  			    struct device *dev)
>  {
> +	int ret;
>  	/* stop master clock */
> -	if (fsi_is_clk_master(fsi))
> -		return fsi_clk_disable(dev, fsi);
> +	if (fsi_is_clk_master(fsi)) {
> +		ret = fsi_clk_disable(dev, fsi);
> +		if (ret)
> +			return ret;
> +	}
> +	/* stop spu bus bridge clock */
> +	clk_disable(fsi->master->clk_spu);

...but the matching disable is skipped if !fsi_is_clk_master().

--rIVLtUXf0Jj60L4V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoooLYACgkQJNaLcl1U
h9BikQgAgs32gfdN4Rngk/+MZu3KLIyYeq4PEjHKyPBS45e/hcQAox/9hL3UG9ok
y41NH8g3rJIB0pGpxqkdhgy0comqz/j8jke5fF2Tutv2nnzCKeZ8u6ZZqY5ZgI6Y
ttlqSXpeRuCNBKLr+Psk27CJsvUALBTrahTK9IraRIbODD27+BYqbpH5u2eq4NTJ
cBHwq+GB+8IDWUrVq39gZA6+/u7mY4YfuWe8r8EhvkOyEfcW414tjaPiMCEEsu9c
tXejrZloBhnG4xrH1c+dmvC+aqhhBGoReDUPWEjqsc7RQIqK9rNumDb/s763UxYd
gxKLg1je7le4XGT4P+ojFZh6gLU0kg==
=q5yz
-----END PGP SIGNATURE-----

--rIVLtUXf0Jj60L4V--

