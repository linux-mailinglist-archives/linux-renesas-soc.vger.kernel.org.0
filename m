Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171F226A2AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 12:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgIOKFN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 06:05:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:58736 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbgIOKFM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 06:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XOBowYaVmojupJYOog4inV3cwrfY
        7+L6xVDbo9laZ1k=; b=uafcA0O8czE+epMBmlvlXkgoZ4e1XzgQtClgD+eLobLI
        CRyvD+s5Z1zgiPVy9E3vUdUTGGxIiiiiZb9PEzSDTdZxEa2TxFg2JNLFFTcb7DYj
        HMuxI36j/V/RHlT0hn7eLBDQCnOje+PQNn5lJA6E8KP/ifsxKX/IivlALGr7o8c=
Received: (qmail 2150220 invoked from network); 15 Sep 2020 12:05:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2020 12:05:09 +0200
X-UD-Smtp-Session: l3s3148p1@lF1DSVevYMIgAwDPXw6qAMHeLXt7MQSV
Date:   Tue, 15 Sep 2020 12:05:09 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFT] mmc: tmio: reset device on timeout, too
Message-ID: <20200915100509.GC2381@ninjato>
References: <20200821081654.28280-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFp7rsHDY2vREakrR+PFJLs0n8JBR+URV1vCu5bydEhHuA@mail.gmail.com>
 <20200830130357.GA2194@kunai>
 <CAPDyKFr24YxoJ3m5r1C_4-UAdtJQp_MK0+wwZjsQXzrs5dxLjw@mail.gmail.com>
 <20200909113745.GK2272@ninjato>
 <CAPDyKFoPn_x_NDp7pXpf9q8Kvf_fVA+xwJSfm4g-oLubmU9nyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline
In-Reply-To: <CAPDyKFoPn_x_NDp7pXpf9q8Kvf_fVA+xwJSfm4g-oLubmU9nyQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Ah, now I get it. "upper layers" as in consumers. And because consumers
> > sit on a card, this guarantees that mmc_card is still there. Correct?
>=20
> Yes.

Good, I'll prepare a patch, hopefully in the next days.

> Maybe something like "mmc_controller_card_reset" could work, but it's
> not going to be that straight forward. In the end, we depend on the
> context for when the host driver would call such a function. In some
> cases it must call mmc_claim_host() while in others it shouldn't.

I see. It seems we should try to handle it locally in the driver then.

> BTW, I see that tmio_mmc_reset() is called at
> tmio_mmc_host_runtime_resume(). This seems to work fine without having
> to make a full reset of the card. Why can't you do something similar
> to that instead?

Good question. I'll investigate that. I am a bit afraid that it neither
works and only RPM never kicked in because of a workaround. But I need
to prove that, maybe it is something else...

Thanks for the help, Ulf!


--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9gkdEACgkQFA3kzBSg
KbZLoA//SAWZefof2u+CdX0yKPnsBuitXz2ywHu0ESKM2fboKjTu/cBV9ZYhCask
R4CCBtZ46MwlDRJRijnOjPSyG/ZOiH0XGNhtalKV3vjW0dkXxVXHaXMICsyPKaRf
rxPsubXkDBkCkX0MVdUffG163YZaTrhLsSkLth+ExMC9ExGtimXNxMJlJ5ocZCyA
60pTcwFrRnFCQSxVQvPdsJjxEXnRKHCkt9Nf/5gz6y6Aauy5niLw5vbYGzA/MPeZ
l2hOR4ksXaypln2qOBf1E1FeaxcI0FqH8evO966Ll5QZb7/HJIR1ITTpgAsSwRc8
3KvIVNtxbxNAkpsQFcEsNTxWqWNrJnUkHpeoAiLyJ3l3DHm7Jo2UXnaUhFRPDmAG
XgYIX3iT0YbUfjM7EBBCr1MVP56cr3D0bPRsQ5M7JvcRCJ3mSWaevHviJyjemtdg
qU30ks2cXSsb7Ma8rC1ymPK8iqdVlDTon/bQUDs8At6wkZN5yNZUow3fRmRXFdAj
TY7hdbZyj40vv2WmyzWQYxCvKPAjnDr2E+9N0sA3iOYQ31u6grlyCoUrxpyiMIsE
vRbaL+t3pZb07xVVuZRkenL5akwx1tOpUdRe9SrJ6Wok7nEkpSO5m0eZKG4nhTWO
bGl8baKKhlVCGCtf4hwYxkw2tPQIGVPeBj62ZE0KIPEFgam98Jo=
=kkyq
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
