Return-Path: <linux-renesas-soc+bounces-2932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF73859979
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Feb 2024 22:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9A0F1F21574
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Feb 2024 21:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D7C7316E;
	Sun, 18 Feb 2024 21:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtPEyGxr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024871B4F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Feb 2024 21:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708290661; cv=none; b=MjHfBWUrlvp73X6jDC7RHvfYSFFH0jnnKwdKMSOmz3Mg6j5xyMg2uEN7GlVQ50WjfjQAd/TG/LDjvLgN0XcD9XYYJc7q4Ip1mqb78Wl4oQXufZRbdbJzA0cDYKD4qfF4q6tC5dcOBgmMGQlJWUbVa4GFv51ao1GmFeM+PtBFa7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708290661; c=relaxed/simple;
	bh=+8AZuHdMNolA43tMdz9wmzPln4C8IJ7hmoPNmJrNF8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzlOrA3z00K3S3sMCQggEpdS1Oa2/ZyRLaU90o6JkLwjeau95zFz96oHYhymJfjVxXuJ+/35D4LO4XbfyJ8QMGZxcwuxS7uI/og6CFqZvIQWWMzda0Vy1hcE5cAbmvKZf6VOdiz/T9gfYbemjIl3kHqJVH1vvlVuDtZGTDlFsMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtPEyGxr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21AFC433F1;
	Sun, 18 Feb 2024 21:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708290661;
	bh=+8AZuHdMNolA43tMdz9wmzPln4C8IJ7hmoPNmJrNF8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DtPEyGxrCe7ZDjoqq5C/qct0cABBnhAhjx3n+rR5w4N5vvJvMqEiAfGB9E1ZuFJqY
	 BOGNJhMEoa7o2ThyorbVShzsJXGgM2rslJjAL6czUpiR9mVA2HxZUS9/eW7Ettem9f
	 ObMvLmn8apMmw7tuzjzYeU9ullpaUj+keJ693PgoTu1dbAuMWKIiyaCiH/1zth/jyB
	 DidZYFSM9KNOHbWSU3xiYzzjHcMgxWrKpjSSnVQ/OGkvZoHrsLrJh+7ZR3imQ9sKIR
	 I3sy9R/9FT+OOmWMfA5qHluCiiFuGfMvgorNADozJmlNwHHONFwxVINVEUavW5I1RD
	 V7gszMNfpPWgA==
Date: Sun, 18 Feb 2024 22:10:57 +0100
From: Wolfram Sang <wsa@kernel.org>
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: mmc: tmio_mmc_core: Locking questions
Message-ID: <ZdJyYWIN4X9NbXe9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	"Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <8005c246-0555-45d0-ac36-b7a23002e1dc@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MAxRxcOkbcQCQQrz"
Content-Disposition: inline
In-Reply-To: <8005c246-0555-45d0-ac36-b7a23002e1dc@de.bosch.com>


--MAxRxcOkbcQCQQrz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

hope you are doing well!

Thanks for doing this analysis and summary! Much appreciated.

> Comparing this, the questions are:
>=20
> * tmio uses irqsave spin locks, while the bcm2835 uses mutex for locking.
> Why is irqsave spin lock used here?

The spinlock was introduced with 6ff56e0d8e02 ("mmc: tmio_mmc: handle
missing HW interrupts"). This was before my time with Renesas, but the
rule of thumb for chosing spinlocks over mutexes: they are lightweight.
If the critical sections are short and no sleeping is needed within
them, they can save context switching. Of course, this is not needed for
a timeout handler, but in other code paths this is more interesting.

> * In tmio the mmc_request_done() is *outside* the lock, while for bcm2835
> its *inside* the lock protected section. Why does tmio doesn't lock the
> access to mmc_request_done()?

The spinlock is to protect the private data structure, 'host' in our
case. mmc_request_done() doesn't operate on it, only with MMC core
structures 'mmc_host' and 'mmc_request'. AFAICS that doesn't need
protection. The mtk-sd driver has it also outside the critical section.
But: clearing host->mrq looks like it should be *in* the critical section.
There is another case in tmio_mmc_set_ios() which also looks suspicious
at least. I'll double check all this tomorrow.

> * How does tmio_mmc_reset_work() ensures that the content mrq points to a=
nd
> passed to mmc_request_done() is still the correct content and hasn't chan=
ged
> asynchronously in the background (due to being outside the lock)?

Because it copies 'host->mrq' to a local variable 'mrq' within a
critical section:

 236         spin_lock_irqsave(&host->lock, flags);
 237         mrq =3D host->mrq;

and then passes this to mmc_request_done(). It even clears host->mrq
before that to enable asynchronous processing of the next mrq:

 270         host->mrq =3D NULL;
 271         mmc_request_done(host->mmc, mrq);


> * Why does tmio doesn't use cancel_delayed_work()? Maybe because its ensu=
red
> by the interrupt locking no further work is scheduled?

If you want to cancel it, I think you should rather use
cancel_delayed_work_sync() to really know that there is nothing pending
anymore. But that function sleeps. TMIO approach is to simply bail out
on later calls:

 239         /*
 240          * is request already finished? Since we use a non-blocking
 241          * cancel_delayed_work(), it can happen, that a .set_ios() cal=
l preempts
 242          * us, so, have to check for IS_ERR(host->mrq)
 243          */
 244         if (IS_ERR_OR_NULL(mrq) ||
 245             time_is_after_jiffies(host->last_req_ts +
 246                                   msecs_to_jiffies(CMDREQ_TIMEOUT))) {
 247                 spin_unlock_irqrestore(&host->lock, flags);
 248                 return;
 249         }

Other drivers do this as well, like alcor:

 318 =20
 319         /*=20
 320          * If this work gets rescheduled while running, it will=20
 321          * be run again afterwards but without any active request.=20
 322          */=20
 323         if (!host->mrq)=20
 324                 return;=20
 325 =20

I'd think this part is OK but I will double check as well.^

> In sum looking at the KASAN report and the locking in tmio_mmc_reset_work=
()
> we have an uncomfortable feeling. bcm2835_timeout() looks much safer
> regarding the locking. Of course that is just a feeling and can't be prov=
en.

Yes, with a mutex and putting everything inside it, it uses a big hammer
and no questions asked. I am not complaining here, that is a sensible
approach at times. We have, however, historically been introduced with
spinlocks and a more finegrained approach. I prefer to (and will do) double
check the critical sections first before considering more intrusive
approaches which would need a lot of testing, of course.

> Therefore we want to ask here :)

I hope I could help so far. I am open for discussion, of course!

All the best,

   Wolfram


--MAxRxcOkbcQCQQrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXScl0ACgkQFA3kzBSg
KbY2Bg//RwHIxQOgyaL2NuNpNUXQkDUSxSpC/Wc3wOfD2iifVwR2JXEIoihlRCPP
AEFvPY2SAm6k7qIzZKEtbb6DGCA+WDGZMFnvny3rJC3x4ZGO6ua726/FnAYsFqHZ
J17K18TG8Sr3T9/5p0GJnPGZhit2P3hZIF+Y8xrUGhlBunpDMuFCozrh7Fal8tMm
sTq441iYJmOMNK+zq+UXhXNiSeaYDAxZ6R6G5w666DoBKbmr0SLr7gPyctl2xYxQ
lWlFsOsVECZ3KTp0WN0x2DG/dQcOsIaeVzSOcfZwWM/xIqJ4qthozS8qcmZUTAf8
rQLYi/wQUWJ6+VCU4I02zdS4pWGo8TU2RmGq36jn67tk+FYqfAfyd0ddBd13dV1i
4OhTqw10Db4iMYoNcpbk1db7L+KZOLr+hvvG9TzHLhpeA9krKzPrcSKVMDHxZcR7
041smdWlf/eiKgtLfg6Mm6NZxBeUplZodKLu5caqvkvf1O5hwh2ocmeaQ1vWmwIR
ix42TDRWYv76tSm8yVgbY5kPs9VOpvVAvHma8EngAQz9NCywSKrufTOVNPSyfSPh
1ojbxNheAaCjc99QQyJ28kB/00NJA8E0iOWn5LljKLwThNT1QBqLLcdir5SnSVrk
BM0NbqCB+QK6HHtHK0e/dY/XZbfEgeEHYEHGmjG5DpVxrDWDDZc=
=KW7j
-----END PGP SIGNATURE-----

--MAxRxcOkbcQCQQrz--

