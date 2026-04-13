Return-Path: <linux-renesas-soc+bounces-31222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJenNm6S3Gl9TAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 08:51:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D50913E7F13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 08:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB9343001043
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 06:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4714A35A398;
	Mon, 13 Apr 2026 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NVhMi8ox"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4157F190462
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063081; cv=none; b=kCfiWFqQgfVNk+fPNA4yFGFt/Iy/uNtdSeneFcHMB4phumJy/FJZyi0i4jagkotOL7rMpIvwdz8Laxa+9Dp+nGpYWX3fMX4N1lFo3KRqaODS/raowqAd+xC6Etpc3G6tuJ5wTtNgKUWQ7bQtokYyl0Z6+wmZXYI20zi4wSXAx50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063081; c=relaxed/simple;
	bh=ppwAe1ufjjpJC2xTboJjw4J6RBqutLU2fdtlvTvijaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnetWrn/I3PPYlqnEiuOfYCEDORbNsHFfrB+Yv/Jg5v2OzEV8b/CSFfeEOIaPE1/TA3vW51IGL/hpghZrOeZYQMbyH+00jP4I+fzLZdBtCv35Fab3iyvDurZtXj1GXkjZ7OGC1uThrZP/fWbrbmiaAJFbOimX+xBMm/9Rep/laM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NVhMi8ox; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3AD3
	dQ/Sa6MmU0OgqfktpcVrIQMJj0phUiR81f0BOO8=; b=NVhMi8oxLrBYjLPmXjy7
	c2vGTM+Z/gGYjMJ20j8L61ZfGGpKQTTrJFThUKuwPLzyCC4abcusTBY0WlxaFT+a
	jh7hG1E5zqmkz8ewTaJj815pPMzEgA35xBVcd7yDUIixUO9cU5fAS/80LDC/3hnV
	k1WVeYFPHX/XEj8VWwTN+klVASKBJs2mSLa9FSzkH394vRLgiYAUNbfoQ+5qU6m+
	/ph1Riw2FE1SHJeT7MA4Eixaq1s35Y637duRoDK0YhlLfvmOGVJuHdFqhqx/3gSw
	nHwBnPCszOZR0+RGIqTb6hkFqQ7CQFIxRzrKiwbNntg9T6sZDID+BD0HqIaHsqy+
	aA==
Received: (qmail 2173526 invoked from network); 13 Apr 2026 08:51:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2026 08:51:09 +0200
X-UD-Smtp-Session: l3s3148p1@k3ZN6FFPSr8ujnvz
Date: Mon, 13 Apr 2026 08:51:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, roman.gushchin@linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>, linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: Sashiko review (Re: [PATCH v4 2/3] soc: renesas: Add Renesas
 R-Car MFIS driver)
Message-ID: <adySXGzjq7VFvIxX@shikoro>
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com>
 <20260402112709.13002-3-wsa+renesas@sang-engineering.com>
 <ac6GcLutDew1wMkS@shikoro>
 <CABb+yY0bpu8rTiQKQu17ZNKkEK=y1_jNYk8fPbnpSxpcivfgog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6QmngqaaQvrvJHZH"
Content-Disposition: inline
In-Reply-To: <CABb+yY0bpu8rTiQKQu17ZNKkEK=y1_jNYk8fPbnpSxpcivfgog@mail.gmail.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31222-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,kernel.org,mailbox.org,renesas.com,glider.be,gmail.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: D50913E7F13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--6QmngqaaQvrvJHZH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jassi,

> > > What happens if request_irq() fails in mfis_mb_startup()?
> > > If request_irq() returns an error, the mailbox framework handles the startup
> > > failure by calling the shutdown() callback.
> > > Since chan_priv->irq is populated earlier during of_xlate(), it will be
> > > non-zero here. Will this cause free_irq() to be called on an IRQ that was
> > > never successfully allocated, triggering a warning?
> >
> > Uuuhh, yes! But this is not a problem of this driver but more of the
> > subsystem. It is definitely not intuitive that shutdown() is called when
> > startup() failed. There are more mailbox drivers which fell into this
> > trap, mostly by freeing an irq they never got. I will have a look at
> > this, but as said, I think it should be solved on subsystem level.
> >
> Honestly, I'd treat this as a cosmetic issue. If we fail to get the
> IRQ, the channel is already dead in the water. Seeing a warning during
> the subsequent cleanup is just a symptom of missing that critical
> resource.
> How often does your client acquire/release the channel and how
> probable is request_irq() to fail in your platform?

I agree that this is unlikely to happen in practice. I still think this
is more than just a cosmetic issue, however. Because the above code path
breaks an expectation a programmer likely has. If probe() fails,
remove() is not called. If request_irq() fails, free_irq() is not
called. So, the expectation is that if startup() fails, shutdown() is
not called. I surely was surprised about this behaviour. And surprise is
not good, boring is good, I'd say. The free_irq() splat which this
currently causes is just one appearance of the problem. It can be seen
as "not so bad" because it is the follow-up of a previous problem. I am
afraid, though, that more subtle issues might show up in the future
because of this broken expectation. It is easy to fix, so I'd still vote
to go for some fix.

Thanks and happy hacking,

   Wolfram


--6QmngqaaQvrvJHZH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmncklgACgkQFA3kzBSg
KbYmvg//Yt1Xx7GXDWE2uHx5BnzhJov+p3XqSEvyMtmmK7c6YRLR1pq1hKIfGka9
bUmXuZnVFnRyDES1hBGtWLZ8W3sC4SW7RQLEAW3/ctqur9sB0akVLv4UCmGUrckt
dGg9gFPoKYCYtK9Gd4sTpDQEnV1rNq14sqhmDa/ieDI4cWK1ilZxfHwemj/C1F7G
DEu+OeG5td35RnslhYfVcVfP7mRMouPPn/IW+f+7mlSrm2p9vKuk8g1/+4OB054i
sBwNvbndP1B7q9IiHdOjh1OHrW44FIhjqWi8Oi5iabfI0Ky1FEjB/D2bycepHGgb
qFPSLo2tPbNTj1LmjKtHMKRGohZZJt4EWwGjvjeSkp//RqWn1p4Gkqc9Zz4kbqLX
NSxEe+aHNONuhkns/qNEuowvA+3ibHrgGfpiq2ZtJPG7V5EjGgCh449RMAN5ljwl
BjKXMfv2PhTCp2wZnmYK+uzwMJGihRXR2UBRJefuc0MZQHMyWT4TniGDhi1oa9kr
sBeD13VvjBbbZoFpAb9tk59RniP0aNa0TIW2bqtAtmUFfQxDUZuIy7wW5Fcfm9DM
1pIquOZtclPbVjAojpYXElnzGOih9xuEAS3VJpIaKHRqU61rACGIERcv/3nqD8Fh
soHd5+4oNGzups/Wo1n9CbVFq/kS7FckXrp90UQFlPgrCIecKSA=
=OAC/
-----END PGP SIGNATURE-----

--6QmngqaaQvrvJHZH--

