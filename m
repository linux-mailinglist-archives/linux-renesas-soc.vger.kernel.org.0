Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB653E933B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 16:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhHKOGd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 10:06:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:55888 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231872AbhHKOGc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 10:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=PM8jlLGbLwSSkeLz4Yq9WkIVSFaG
        jcshV2vY27ztWOY=; b=TG76TbTUoFE6TabOCy6tX6nBdMET9oPAalSkth+L0oGi
        /SelrWhgx7wZX/fsqIHkkwIsz+Nu6IZqAUQsjvdkqRj30M4hcnjvn8YlbZbBLZSR
        3p27nlhCUdAJC+OgXu6QxgmWpVo6R9M6dnbAwj0l52lTXxX+A7ZrGkyH6MbJI4g=
Received: (qmail 2677266 invoked from network); 11 Aug 2021 16:06:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2021 16:06:06 +0200
X-UD-Smtp-Session: l3s3148p1@l+yWHknJ/J4gARa4RTP4AfHKOCm/nqrR
Date:   Wed, 11 Aug 2021 16:06:06 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH] clocksource: sh_cmt: Fix wrong setting if don't request
 IRQ for clock source channel
Message-ID: <YRPZTnptOXrKl4Tz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Phong Hoang <phong.hoang.wz@renesas.com>
References: <20210422123443.73334-1-niklas.soderlund+renesas@ragnatech.se>
 <7cf6444a-1dc4-a2bb-8fef-696e0b2b6f23@linaro.org>
 <YMMXJz4IwFJU4vEF@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OJKIXCCJBhkKZJZc"
Content-Disposition: inline
In-Reply-To: <YMMXJz4IwFJU4vEF@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--OJKIXCCJBhkKZJZc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

> > > If CMT instance has at least two channels, one channel will be used
> > > as a clock source and another one used as a clock event device.
> > > In that case, IRQ is not requested for clock source channel so
> > > sh_cmt_clock_event_program_verify() might work incorrectly.
> > > Besides, when a channel is only used for clock source, don't need to
> > > re-set the next match_value since it should be maximum timeout as
> > > it still is.
> > >=20
> > > On the other hand, due to no IRQ, total_cycles is not counted up
> > > when reaches compare match time (timer counter resets to zero),
> > > so sh_cmt_clocksource_read() returns unexpected value.
> > > Therefore, use 64-bit clocksoure's mask for 32-bit or 16-bit variants
> > > will also lead to wrong delta calculation. Hence, this mask should
> > > correspond to timer counter width, and above function just returns
> > > the raw value of timer counter register.
> >=20
> > I'm not getting the 'ch->cmt->num_channels =3D=3D 1' change, can you ex=
plain?
>=20
> My understanding is that if more then one channel is available the=20
> channel used as clocksource is used without an interrupt. This was not=20
> addressed in the patches listed as fixes. This patch fixes this multi=20
> channel use-case while still retaining the old behavior for for the case=
=20
> where only one channel is available (ch->cmt->num_channels =3D=3D=20
> 1).

Did Niklas answer help you?

Happy hacking,

   Wolfram


--OJKIXCCJBhkKZJZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmET2UoACgkQFA3kzBSg
Kba8ChAAg2P+Wjlg2ckRkdN95Y2H84KI1BoL2UPepNXXGPEkrb26LFkukvIl8ZNe
Gy0G46rVQ0riNqemetqq4XZw0+dj+W404qPwJdToDK0p5ey90EXEFJTZVBEGP90R
7UOnIlVuv829m+fycQrOSATDkGuSKNNL6Ckl4mrloqJeoeUNiL089J4vdTFj+/4k
pAEgOXrBEcl6kpPK3nXWqSaDEXOmwYSZnmcL8pN6DSIxoYi+A8OqjeRX9vu2edJg
jf3iQpXX4Eg2dmcwoERbE+Pxk2P6lrV3NgmEmQnPyEZV+NtKmgaNBpiCoUovNYCR
p6s9uLPvUK6s8Wi2sgtRE1tKkesQrQf8fy6A19fbyoXfaVvpolKDOQ8tt5FkdTLW
Y6GwgmnDEN+8RPZXBNuZoHVg/V4J/babwgVoCrpqn3sYDO95dOJ39niE5aanfNBK
UpemUCUsfnxI+Kf2bhrAno4t1clghwnSoSANs6TveaUBpjgfyJHbJGNxZMX4f8N3
HhevMo1DpjX+2Iw91/BvSGVetJCNvc+JPlZkdBZ6rfRS3bdXGP1CiPAZhgKSvg/D
bkyefySIlDoDLgosO715ROvos1wVQvgk59aD2cbOjy18X+3jtCKdW0/XLCoYeTuf
ED/xMLiM8Prlh41gqrao6PGgojGIpfOKoCIFhxwJEuSeqy5Ys8A=
=z47u
-----END PGP SIGNATURE-----

--OJKIXCCJBhkKZJZc--
