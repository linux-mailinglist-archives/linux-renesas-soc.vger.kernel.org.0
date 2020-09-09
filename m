Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124AE262E15
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 13:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbgIILob (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 07:44:31 -0400
Received: from www.zeus03.de ([194.117.254.33]:55832 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730021AbgIILo3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 07:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=tM7cWgnJUQTZ+8zw0k6ph15lgunQ
        9GxTudYwUe71iHc=; b=R/HBDZ8OmO6QIUJhgdqM6c8SrnR6HTXT0y+7YucZrOJu
        IAjwHmv9NQ0F4Odfr/e8jeitJtjlOVVyZuqxH3V6fjqnTTrpaDCdLKi/Krn1um23
        wobk3sSKVnrV77pAL91SA5JX65WF6hp66mtO7mx2iiezHSfI6HP2M67LMjodOFw=
Received: (qmail 284838 invoked from network); 9 Sep 2020 13:37:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2020 13:37:46 +0200
X-UD-Smtp-Session: l3s3148p1@nFxm4d+uTIUgAwDPXwesAAPl1NpCEY8B
Date:   Wed, 9 Sep 2020 13:37:45 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFT] mmc: tmio: reset device on timeout, too
Message-ID: <20200909113745.GK2272@ninjato>
References: <20200821081654.28280-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFp7rsHDY2vREakrR+PFJLs0n8JBR+URV1vCu5bydEhHuA@mail.gmail.com>
 <20200830130357.GA2194@kunai>
 <CAPDyKFr24YxoJ3m5r1C_4-UAdtJQp_MK0+wwZjsQXzrs5dxLjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKtFalx5NIx0HZ72"
Content-Disposition: inline
In-Reply-To: <CAPDyKFr24YxoJ3m5r1C_4-UAdtJQp_MK0+wwZjsQXzrs5dxLjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--tKtFalx5NIx0HZ72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

> > Hmm, there are some wireless drivers using it as well. I am confused, is
> > this considered "upper layer"?
> >
> > drivers/net/wireless/ath/ath10k/sdio.c: ret =3D mmc_hw_reset(ar_sdio->f=
unc->card->host);
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:        mmc_hw_=
reset(sdiodev->func1->card->host);
> > drivers/net/wireless/marvell/mwifiex/sdio.c:    ret =3D mmc_hw_reset(fu=
nc->card->host);
> > drivers/net/wireless/ti/wlcore/sdio.c:  mmc_hw_reset(card->host);
>=20
> Correct, these are "upper layers". The same applies for the mmc block
> device driver.
>=20
> In this way there is a guarantee that the struct mmc_card is still presen=
t.

Ah, now I get it. "upper layers" as in consumers. And because consumers
sit on a card, this guarantees that mmc_card is still there. Correct?

> That would be great. I appreciate all kinds of improvements on the doc pa=
rts.

You are welcome!

> Perhaps a better option is to return a specific error code for the
> last request, that makes the core run mmc_hw_reset(). Or potentially,
> add a host cap and let the core treat some error code, specifically
> for hosts like tmio.

A specific errno could work. I don't see the advantage of a CAP (besides
it is rather a quirk than a cap). We could also have
'mmc_controller_card_reset()' or something which ensures mmc_card is
present and let that controllers call when they see fit. Or?

Thanks for your help,

   Wolfram


--tKtFalx5NIx0HZ72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YvokACgkQFA3kzBSg
KbZfmA//azKjz4Gk7mPb7bDj5wnUWB/Vo6zpR/nlqO8njiKu5635jNow9XZLMEgT
CgPLPAnLyNj1/yBKHLmTdu3CU/3eg6Grelp+QrghWRdxkXiQyN/nNKZxbMYwGCg7
Bdl+qbCLJ/99LcHfF7w9TZeMRh0hrFHR/Ch2WKV/w1YwINDqe/FUi3DLjOlYdMsl
tbfTRiTIgNGtIbOMtJA6c3cauoIwO4v4bOMDGMr28gGW7VyTWauQ9hDkUZQ0pSdE
nOnI/7i6gcdTIA8cWEoXfHKKzwFXm+8mj/wsetE7YnqHxW8vNdOaFaIrsgaDFlXO
hY3MF2Onv7/KGrB8c2x5A3DZJDQIZpnWMPdFMFTZL6NMoPAdyM7SF7bDANQxU+0Q
K/s2c9WW3XcNCEMRreHMka/WzQdzBdM79X28Yw42pPKBt1IvPzJVBuld4aVga7eX
fA3ys2j7DDVjosSLH0xeAC1t/MjTmYc/SNVgLt7lcoaUuOpVTUpqZna8IQWXFFS7
Bfh6P3EeH2Ns6k1HirO5D6JzCzl/B64sD/ABrXQColY1Ls2YJ312bjtUvNb05zdN
jpALQYhjm/t02u9oPwRExGI6f5+UkV1gOJ6134S2sfgaHNVCNOIuEhlTnlh64n22
kXheME4ISdeZ+MdcxF7mlMmF4Bc3A13UcOvA8+huMFsXiWLWasU=
=J+pI
-----END PGP SIGNATURE-----

--tKtFalx5NIx0HZ72--
