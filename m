Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6774208A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Oct 2021 11:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhJDJr7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 05:47:59 -0400
Received: from www.zeus03.de ([194.117.254.33]:55002 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231932AbhJDJr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 05:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=WcOForZYX8JPRDJLYsCLMhVXUT5g
        lzoQLUNU3NNBXbU=; b=rsYKgt6fLPxpP+GMPY2D9GGiqtvvSOmWzkaDkLEHEqf6
        qIewT5z0KsBMps9PmZDByar/FprRH8x3WaDS7TKTwXZQuexCxASs/R7GFxdPrTNS
        OdI8r1fc1xRAjwI3Jye+yK2m8fzphSr3U8HCdFvqn6qoZIZSYC0Ks+BSD7x6UC8=
Received: (qmail 3384583 invoked from network); 4 Oct 2021 11:46:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2021 11:46:07 +0200
X-UD-Smtp-Session: l3s3148p1@wTU7yIPNIJ0gARa4Rcu8AdZm4bUzl/et
Date:   Mon, 4 Oct 2021 11:46:07 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH RFC] ASoC: sh: rcar: dma: : use proper DMAENGINE API for
 termination
Message-ID: <YVrNX1lxnM9SKNbJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20210623100545.3926-1-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692889E1A7476C4322CC296D8AE9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bJK+6kz71kOKZZMB"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692889E1A7476C4322CC296D8AE9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--bJK+6kz71kOKZZMB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san, Morimoto-san,

Thanks for the report and to the testing team!

> I'm afraid but, our test team detected an issue [1] on v5.15-rc2 with m3ulcb and ebusu.
> # Our test team doesn't test this on salvator-xs yet...
> I asked Morimoto-san locally, and he guess that using dmaengine_terminate_async() instead
> of dmaengine_terminate_sync() could be resolved. But, what do you think?

I agree. As I wrote in the original mail, I wasn't too sure about this
change because I don't know the driver well. While I didn't find code
handling an async case, the driver still too complex so that might have
missed some details. This is why the patch was marked RFC. So, I totally
agree to drop this patch and handle the issue the async way. Is it
possible that Morimoto-san takes care of it? I'd think this makes sense
because he knows potential race conditions better than me. If it is not
possible, I will try to have a look.

All the best,

   Wolfram


--bJK+6kz71kOKZZMB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFazV4ACgkQFA3kzBSg
KbaBoA/8CTtUYXXLysL2jzER56eMCkuRMndU15VDDDOYKXE4senEJe8p9RCBOnJz
z+/PIrABxgtLzv1R8/6d3IMAtkgEh1xP7NQMbq2ymOznpPnRSxxOyfif5Gv/Mc0k
o57pakjy/fZoYmU1uQ3l/+IffmYHIPExarW9M49WnKSIxalzIYF7C++Z1tnhLc84
/wYzl59q7UJXy26cPx1Msdjz65vvaIZusKAEHS971G2Ky12CINlci9+bE4q23Ea4
7BngLjcO4q01YYievrQQnn0bgEuzW+oCXswlbsS+Qg57sMN0Kig9m8zFw7P8CLlM
FP988GbDQF80JzI0hH0a/AUWqsGA/KSZdubCQyDnZCKtGgnWktgn3F3ZsW8eOhuT
N/6sz+V9/Jr9lSwRf2Y7rNkaQxqIofSUTAm4HJgN6JTaxa73fKuptD2ciDPEO3AU
0nkpwK9B3XO1TA1L2ndXQTOjkgedNIvFowKA1XAKhYDGl2OQkEiv/pfk4SeAO42p
/RakEgNBYXKlXgErGVDPMqKun/Q1NTpcVSraeLsZXpqrPE5YsnGFDqc7L4l0zWyF
zSZ7HVkpZESa9ESZEflsbEH7JTnd2haMIyNrngUYRfLsHPigLr/PAfz0AL0mb68O
SSqquKOTHGblqI0o4/2V3IzjhJSbNpAehDbs+pyjIw5hCx95Llw=
=49aL
-----END PGP SIGNATURE-----

--bJK+6kz71kOKZZMB--
