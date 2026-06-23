Return-Path: <linux-renesas-soc+bounces-34372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oGqQNImWOmqFAwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 16:22:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E476B7D3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 16:22:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=UJgh57IB;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 883B13010BA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 14:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4500C363C64;
	Tue, 23 Jun 2026 14:21:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF6384CF5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 14:21:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224499; cv=none; b=IyDVy4pcT8YWD04hrWVHbdAUYX7yxTzT2DkTy9eCl7vVoQOOiWBRIk+Ylp9utoHs/QVAPwktU5S6wYLj3+c2RgomSljA0kEysNqWHcWOrrPcC2JKAbymech37LnDmVx3P8eHvRU3TIcL8bMzZ2gMu7GY6qijv8dR9ZpuaojMp5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224499; c=relaxed/simple;
	bh=e7N+HDs2nXG0esf0jlkUhDjN8JUQhq31e8fOnGcgpyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ggr0qeITMwRcqKXh5QGvjVFKU3uaApdRyrU92402eGQMqU2xm723mEWeHPEqOp+YZDxOLboqDYJ8wrihNYu3kyz8Pvcb3K70a/idt5mB4WgStzbOzOyFWVs3tX40sSe4WNtcMpEAZ42J0Mr2SEnZbpDsBhNxtbk5rVWYVpuNC4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UJgh57IB; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=y/2m
	3hZaqsd9nnONVqnPgUdhVzzUKKc6J6vw1kIhrc4=; b=UJgh57IBgaM0MSfRgRp/
	VfbpU3BeaV26Mk/KV1NIV88JGHNIOZmW/WsG1XfDwplqe3HcmjBQiFKGdNk7T9OK
	oU5ms9rOCJJL+3Eab19rIH8n5rZ5elLYt6YYfc0OImWZ8t8qWgyn441q1Q/GUCpw
	6agETU44Nidk308X93UjK7r3g0NvdfyDS0RU6MPptPdREMvwzTFZZ2dDyxyG9a4P
	6QwfZIB294gzc6LNyjeMzF4iKClqHyOAamPB/aLNgmLJENeUJwLRdvXVU0LQm0Wj
	XiIUgO1OQ0dEs2ccC6EXOMIdvDE12rXWQMQ00SCdgRKd7VfZ1YaQGb1ywWkFYrmq
	RQ==
Received: (qmail 2404897 invoked from network); 23 Jun 2026 16:21:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2026 16:21:26 +0200
X-UD-Smtp-Session: l3s3148p1@DnhteexUvs4ujnuj
Date: Tue, 23 Jun 2026 16:21:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: renesas: rmobile-sysc: propagate power-off
 timeout
Message-ID: <ajqWZjI3RNzSTZkV@shikoro>
References: <20260623135439.44970-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZAKciA4DRSgNXMwN"
Content-Disposition: inline
In-Reply-To: <20260623135439.44970-1-pengpeng@iscas.ac.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34372-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:ulf.hansson@linaro.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,linaro.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url,iscas.ac.cn:email,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30E476B7D3C


--ZAKciA4DRSgNXMwN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sashiko found issues with your patch. I curated the list and left only those
which I see as valid. Please have a look at these issues.

Thank you and happy hacking,

   Wolfram

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>=20
> New issues:
> - [High] Propagating the power-down timeout without canceling the hardwar=
e request leads to state machine desynchronization and kernel panic.
>=20
> Pre-existing issues:
> - [High] Inverted polling condition in `__rmobile_pd_power_up()` causes p=
remature return before hardware is powered on.
> --
>=20
> commit 8269f5684034da68db8ce9747b740d278e00d7c9
> Author: Pengpeng Hou <pengpeng@iscas.ac.cn>
>=20
> pmdomain: renesas: rmobile-sysc: propagate power-off timeout
>=20
> This patch updates rmobile_pd_power_down() to propagate the return value
> of readl_poll_timeout_atomic(). This aims to prevent genpd from
> considering the domain powered off if the controller did not acknowledge
> the request.
>=20
> > pmdomain: renesas: rmobile-sysc: propagate power-off timeout
> >
> > rmobile_pd_power_down() writes SPDCR and polls for the power-down
> > request bit to clear, but drops the poll result. It can therefore return
> > success to genpd even if the controller did not acknowledge the
> > power-off request.
> >
> > Return the poll timeout just like the matching power-on path already
> > does for SWUCR.
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but is the matching power-on p=
ath
> for SWUCR functioning correctly?
>=20
> Looking at __rmobile_pd_power_up(), it uses readl_poll_timeout_atomic() w=
ith
> the condition (val & mask) after writing the bit to SWUCR to initiate pow=
er-on.
> Since the bit was just set to 1, this condition evaluates to true immedia=
tely.
>=20
> Doesn't this cause the macro to return success instantly, completely fail=
ing
> to wait for the hardware to clear the bit to 0 to indicate the power-on
> sequence has completed?
>=20
> Could this lead to a synchronous external abort when the device driver ac=
cesses
> MMIO registers before the power domain is physically active?
>=20
> > diff --git a/drivers/pmdomain/renesas/rmobile-sysc.c b/drivers/pmdomain=
/renesas/rmobile-sysc.c
> > index 93103ff33d6e7..9abf60ea0c399 100644
> > --- a/drivers/pmdomain/renesas/rmobile-sysc.c
> > +++ b/drivers/pmdomain/renesas/rmobile-sysc.c
>=20
> [ ... ]
>=20
> > @@ -59,8 +60,11 @@ static int rmobile_pd_power_down(struct generic_pm_d=
omain *genpd)
> >  	if (readl(rmobile_pd->base + PSTR) & mask) {
> >  		writel(mask, rmobile_pd->base + SPDCR);
> > =20
> > -		readl_poll_timeout_atomic(rmobile_pd->base + SPDCR, val,
> > -					  !(val & mask), 0, PSTR_RETRIES);
> > +		ret =3D readl_poll_timeout_atomic(rmobile_pd->base + SPDCR, val,
> > +						!(val & mask), 0,
> > +						PSTR_RETRIES);
> > +		if (ret)
> > +			return ret;
>=20
> [Severity: High]
> If this power-down request times out and we return -ETIMEDOUT to the genpd
> core, is the hardware request to SPDCR canceled?
>=20
> When the genpd core receives this error, it marks the domain as ON. Howev=
er,
> the hardware power-down request remains pending in the SPDCR register.
> If hardware conditions are met later, the controller could asynchronously=
 power
> down the domain.
>=20
> If the genpd core thinks the domain is ON, wouldn't subsequent device res=
umes
> skip the .power_on callback? This seems like it could lead to a bus fault=
 when
> drivers attempt to access registers in a physically unpowered domain.
>=20
> Should we explicitly cancel the pending power-down request before returni=
ng
> the error?
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623135439.44=
970-1-pengpeng@iscas.ac.cn?part=3D1

--ZAKciA4DRSgNXMwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmo6lmIACgkQFA3kzBSg
KbaQoxAAkBXIfxpOlVzpy+bvpypKPMa6NDAvgxi2JFIMHsTUUMF905Qeo4gwhGB6
a25gQ21Q2H7GRZcBx6BIIRzytutHanf+B7FBVfgVxHrwcyoGghFYGjLbLuTwuH6Q
0tgbqAswxzA5yjhuJHDBHTQASuoD8ywEDjnu8NfAkSntTymoRKRzbqqEkkitNmw1
/JeK0TIqwK+r64ugWyYPFx1JhGwi+mxVdNwbjK5YcgJb6s657jHgOQWdOXEfqWF7
jtwsUWDsv9fnEsfcCHT9/fFn5jIKTDbipOkl+QJhVcj9KVTI9yg1SvYm+Ky1d6I+
rdltWI7QtS+hP2IbiLbSiHZF++tUV6/2ZTF3rdQmdthJZz8bw64epcMP53n6h7c1
UPDUgFuAREVzn4PGcnJWicfHtGpeggltoRKF0xzp4tPsdNonCMUfjqiMBrhDlvCM
FamGjePJUD5JtAx1vDsOESO3C8U7NLBxb5rFieN81oHYOtH8SbrBCYVtX7NJOPM7
tm2s0qrntTzt/IbvhhI/9Q3v3sRjq6SWR4GCknhmh2utrH/sZAKTbQCkIg2Y2UzJ
bL+vy9gTKPb+piKDrf+xgkJoLK207BApiBbk/3U+kkPCq0WRu0mxQgQi/HTs7X2o
ggh+2ojBHeoye5pEVSLWdqW8tkNLmGQQpOdhM1PMn1KBL2xSji8=
=6KQP
-----END PGP SIGNATURE-----

--ZAKciA4DRSgNXMwN--

