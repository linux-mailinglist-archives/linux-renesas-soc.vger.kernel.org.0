Return-Path: <linux-renesas-soc+bounces-32639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IxTJ0I8BmqmggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:18:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D92546FA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA26C300D332
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 21:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7C13A452A;
	Thu, 14 May 2026 21:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="JIxhNPeC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3961E37DAB7;
	Thu, 14 May 2026 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793533; cv=none; b=ZKSIKkguOFxnmIMfz/2t+MF6nwCmM/YlwrMAWSHs7KYYvrXl47SQVTudfYRg6aPGWH0taGBWfGnq/gm2zUXjlcGkng6/wsIOkU16EQ5YPyYaZNnzexclzRHMBtR/kSZzpc5p1One8Oe48apyABGJasUphQokFnjBSdZ7hqrVIL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793533; c=relaxed/simple;
	bh=nHFN+EeGy9H4fiYsR/Tzdsuw8cbjSxNx8CM71Qksky4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDNV01WsDUBTOjMNTviO8p84I0fTkv12J4sR8CVebGPcngASoqZ0vKzw+yvfiZ21LDcnw4PAIQtpc2GZqDgbS5L43Zyc2AZl62qTbs7cS6GAoo1DmzMS6PfiDUwLSt8C0ZCK1Mdv4ZZTuKCuuEsduhxmLghfDCGIebbpVBtXRNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=JIxhNPeC; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5894610D2B0;
	Thu, 14 May 2026 23:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778793528;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fWIwSSucsz37Y4TFwVU3mNclvHt2V4rfnNHQHEULdZA=;
	b=JIxhNPeCmXyziGyByiRcG07xZvIvWVrbCZ9A0Q2CqNJ81QOMUF3A2Kwctfb/0BAfBak3Rm
	1VKU2QkHsG4wqMb2ecFg3ZKEWS3Cm9BoQ2nNacQKqjfmW0/7pXFTsw6hTmC2wRyot5sOwC
	eLrIeaQKRbrPu1BzUqqVnWZ4Ihgn4vcGdOGEa2/iuFvd+K6gCQrMAfixQW007uDM3sCSjm
	C0KUsZDsgcLMjc7Dn2dcZ9oy1Uwm4Z3zYh960Mhx8WyMsUni/wy46N+Iav7bN2t73DSbcv
	pHHMOl+P1FV+QW8mpdhlbWPqCPWUnimMtOcSSuopnhhGnWOaXtb8kOuR5Iff1A==
Date: Thu, 14 May 2026 23:18:44 +0200
From: Pavel Machek <pavel@nabladev.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org,
	neil.armstrong@linaro.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org, Pavel Machek <pavel@nabladev.com>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic
 context
Message-ID: <agY8NAyCcHkhBvBv@duo.ucw.cz>
References: <20260514111300.2152386-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y638fiKJVX+YDLWt"
Content-Disposition: inline
In-Reply-To: <20260514111300.2152386-1-claudiu.beznea@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 07D92546FA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32639-lists,linux-renesas-soc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,lists.infradead.org,nabladev.com,nigauri.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavel@nabladev.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[nabladev.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,duo.ucw.cz:mid]
X-Rspamd-Action: no action


--y638fiKJVX+YDLWt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The OTG PHY initialization sequence needs to wait for 20 ms at a specific
> step, as described in commit 72c0339c115b ("phy: renesas:
> rcar-gen3-usb2: follow the hardware manual procedure").
>=20
> Commit 55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware
> registers and driver data") tried to address various problems in the
> rcar-gen3-usb2 driver and converted the mutex protecting HW register
> accesses to a spin lock, leaving, however, a long delay in the critical
> section protected by the spin lock. This may become a problem,
> especially on RT kernels.
>=20
> To address this, release the spin lock before sleeping for 20 ms as
> required by the HW manual and reacquire it afterwards. To avoid other
> threads entering the critical section and configuring the HW while the
> software is waiting for the OTG initialization to complete, introduce the
> otg_initializing variable alongside the otg_init_done completion. Any
> other thread trying to configure the HW while the OTG PHY initialization
> is in progress waits for the completion instead of immediately returning
> errors to PHY users. The IRQs were also disabled while waiting for the OTG
> PHY initialization to complete, as the interrupt handler may also apply HW
> settings.

Just... there has to be a better way.

> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +static int rcar_gen3_phy_wait_otg_init(struct rcar_gen3_chan *channel,
> +				       unsigned long *flags)
> +{
> +	unsigned long timeout =3D msecs_to_jiffies(25);
> +	unsigned long ret =3D 1;
> +
> +	lockdep_assert_held(&channel->lock);
> +
> +	/*
> +	 * The OTG can be initialized only once and needs to release the lock
> +	 * and wait for 20 ms due to hardware constraints. Wait for the OTG PHY
> +	 * initialization to complete if another PHY executes configuration
> +	 * code while the OTG PHY is waiting. This avoids returning failures to
> +	 * PHY users.
> +	 */
> +	if (READ_ONCE(channel->otg_initializing)) {
> +		spin_unlock_irqrestore(&channel->lock, *flags);

This is not nice, passing flags between functions like this is a red flag.

You are only accessing otg_initializing under the spinlock. That means
that READ_ONCE is reduntant.

But AFAICT spinlock is only held over this function to protect
channel->otg_initializing access. I suspect correct answer here is
getting rid of spinlock over this function, and using
test_bit(BIT_INITIALIZING, ...) or something similar.

Best regards,
								Pavel


--y638fiKJVX+YDLWt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCagY8NAAKCRAw5/Bqldv6
8kIyAKCub4uUA4428i2iky/At/AjsQbCUQCdGEn8frZbIA7Svvvs4RzSMZ4QgA0=
=iyqe
-----END PGP SIGNATURE-----

--y638fiKJVX+YDLWt--

