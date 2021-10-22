Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8447F4377D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Oct 2021 15:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhJVNYa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Oct 2021 09:24:30 -0400
Received: from www.zeus03.de ([194.117.254.33]:59190 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230342AbhJVNY3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 09:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=RTqtPVw3g3tCKR7FXEuN2zio6hYu
        Au/lbAATBypQbS0=; b=IQ+6pJ7iA9OY7M3EN23kdhj/v7Y/lmqlpRhFzb9S5GCZ
        YaXGzeCBQ6D9wtRSVm4Hczx8f2S3tQbjJ/PV3NNa4daDqxqWopOcGL//HE+LANdc
        BZsLq8Kepf5XVaQTaF3G8zBT1FU1YGKivKxfS/19n8SuOpEq49XPWy4j8uhE2ZA=
Received: (qmail 3733262 invoked from network); 22 Oct 2021 15:22:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Oct 2021 15:22:10 +0200
X-UD-Smtp-Session: l3s3148p1@fFcG5vDOGrYgAwDPXxI0AHx8Irl6Mo8R
Date:   Fri, 22 Oct 2021 15:22:09 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with hard
 reset
Message-ID: <YXK7AfUYxuFWl3rl@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211006171605.6861-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKdUITAL/m6G6pzU"
Content-Disposition: inline
In-Reply-To: <20211006171605.6861-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--tKdUITAL/m6G6pzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 06:16:05PM +0100, Biju Das wrote:
>=20
> This patch fixes internal cd irq miss after hard reset by enabling
> internal card insertion/removal interrupts.
>=20
> Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

IIUC, the following should be the apropriate fix. Can you please test
it? If it works, then I'll make a proper patch out of it.

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_c=
ore.c
index 7dfc26f48c18..9416245a7b56 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -195,6 +195,10 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_al=
l);
 	host->sdcard_irq_mask =3D host->sdcard_irq_mask_all;
=20
+	if (host->native_hotplug)
+		tmio_mmc_enable_mmc_irqs(host,
+				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
+
 	tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
=20
 	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
@@ -1185,10 +1189,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	_host->set_clock(_host, 0);
 	tmio_mmc_reset(_host);
=20
-	if (_host->native_hotplug)
-		tmio_mmc_enable_mmc_irqs(_host,
-				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
-
 	spin_lock_init(&_host->lock);
 	mutex_init(&_host->ios_lock);
=20


--tKdUITAL/m6G6pzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFyuv0ACgkQFA3kzBSg
KbaHYg//RBzBLnEYi5DqWOrcHCh6rrtfl8Erqvh1papdqSmPtXoxvicJVO5AUFDu
8hplRX6iAHC8VmjMfDjwfW3MUD3GgzEjdoHlT7FJJE492HQhFbqMtWIvXz3vp7+E
/PK9MkQltbzHtzuZEorTzDfwM9PqjhUJ7UeJ6DfxwWAJCWeuOXQ3l/kaX1gQ527O
AScJ7bC7GklDVnlZPNiPSyvZJjgE1Jrm5MsjWqV7fzQ5Km0f5kW6+tppAZ6dEhzr
fHTzgpXauxNZdlDbDAuaeO7lljKtayWzmI7Pf8jw24dF/tvAweSum2iOxOjuA5Qg
u0V7pzevqdygA/vvjJbNzURQXT7fDdJFQXHwA1xhpNFXqUEEZa/FsY/JcEJbYpzQ
T744xsgbKnJ0hw49XZsvdsPM/GEaQOiO5bXGf6CrYOPn6lvxivpaPUXkeJGdBuy8
f9zWbeFNTGxLVdQixI7ZjGYZhHIwIu/KKTeTGpPS2EQs3eibDo3MT1gSaEqMvNY/
JS4rdK5fbCMN+z5M2RROUe9fBk9drYhLpFzGVPCGt8h91B/zQoCkfLvTDhkVRR6R
hboUj1uHqayO45qoqGH4XdIL7Gu1n9CWsMwIL/I/jkeGAelr7P+2H5Mh9zY42CXO
WxfUPlnj51TL8maSF4F/GEXWJANBAhfrYAsshOCEb4QRuzXTbPE=
=l/0A
-----END PGP SIGNATURE-----

--tKdUITAL/m6G6pzU--
