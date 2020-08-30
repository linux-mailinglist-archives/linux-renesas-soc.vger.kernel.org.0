Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F19256E03
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Aug 2020 15:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbgH3NET (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 30 Aug 2020 09:04:19 -0400
Received: from www.zeus03.de ([194.117.254.33]:55162 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728624AbgH3NEE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 09:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=LE6L2YJPOg9EPuBdt7s5WuIzZffq
        0MU75aTKorgEk9Y=; b=WegSttbZfRckBci5opwlsTtxcTvcaH1AJKY+b3uAIS25
        j3MMqH5eV9eYm5fauA9yp4sqpqWsGlTfsNe6ngr3oAA/jRCtP+mEj30QNkRPaqDK
        kOCsS0mg+Kteg2BGMryM1sxT+iQFgL/1/7JOiARycjdNXTTR0nwRuvOc25Sazx0=
Received: (qmail 1811957 invoked from network); 30 Aug 2020 15:04:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Aug 2020 15:04:00 +0200
X-UD-Smtp-Session: l3s3148p1@H29s6xeuDKsgAwDPXyx9ACJFoyCAs3WD
Date:   Sun, 30 Aug 2020 15:03:57 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFT] mmc: tmio: reset device on timeout, too
Message-ID: <20200830130357.GA2194@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20200821081654.28280-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFp7rsHDY2vREakrR+PFJLs0n8JBR+URV1vCu5bydEhHuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <CAPDyKFp7rsHDY2vREakrR+PFJLs0n8JBR+URV1vCu5bydEhHuA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This isn't how mmc_hw_reset() is intended to be used. Instead, the
> idea is that it should be called by upper layer code, when some error
> path is triggered for an I/O request.

Hmm, there are some wireless drivers using it as well. I am confused, is
this considered "upper layer"?

drivers/net/wireless/ath/ath10k/sdio.c: ret = mmc_hw_reset(ar_sdio->func->card->host);
drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:        mmc_hw_reset(sdiodev->func1->card->host);
drivers/net/wireless/marvell/mwifiex/sdio.c:    ret = mmc_hw_reset(func->card->host);
drivers/net/wireless/ti/wlcore/sdio.c:  mmc_hw_reset(card->host);

I'd like to understand, so I can add some docs. Because the intended use
is nowhere documented to the best of my knowledge.

> However, let me think a bit about this.

Sure, thanks for the help!


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Lo7kACgkQFA3kzBSg
KbbFqw/9H1aa8lAq+QseP3pyMMvdnAZcpkQD9kIq3ywhjiktFc4yqlRSxj5LKdN8
KM1c1WNPKAhNON2GM6TM5Chn76kns3BElu/XM7Hom4oe22idsA0N71qU910zDvck
xeuezOW77S9bfB7nVv0lVTNmNb93TKgRaHH07PAz8/+WvCiu6wfdVzfECdXklQpY
G6Kxdz2PK1DoeZELewMbj+EVwujbVfTA17SMzoVMLotqR9YP6AeP+1ckac1u8CBG
5/LgvYVTZFKBIiOmcgSGs5aMRAJV+fLdJM3MFGB3hgcBRp3JXBdcXrF24tChduDi
FECQiA+qSWF0Z+X/ph25FWXl/TIsrvZTcVNBk7k84CupUtRzCxpzcjD7O+qORNuU
tv3RSKAc/OkTCMDabi/I8XT4NGdXWgh6tJlcF+2EV8e87rpvAzZ/wcu9rWeFCR4z
E75XuuBfasmm9/Nuvwm40qFMjiD3U2nDP4nzVPlesIVVNB/uTlI+qpOGY0avDeBM
c4LPjbeCbtp4Wl/JCCryLexdMGA4r+dY3ildB7/F9ZvxqBUVQvsNfWlPNCy8nwYb
XqzGJys1KGZOrxL9WCuBTP3QXJfMQWZ9lT48115u52qCSrShzak43D2W5AfY3wmB
jKjLE1a8zVn2VmVj/InoBnWNeeBpuJ+tpnymmIs6JtcIkyfe94E=
=nM6F
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
