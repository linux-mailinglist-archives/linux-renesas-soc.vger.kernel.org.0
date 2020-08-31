Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AD8257895
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 13:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgHaLly (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 07:41:54 -0400
Received: from www.zeus03.de ([194.117.254.33]:44158 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726775AbgHaLly (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 07:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Rlo+b87xmJ7xqCoMXBaqTI+im096
        OJ7Uj5B+OJVPxWw=; b=g9eF1cbW5ONJh1qNNlEIdhNXwmkncIhnUfLApfGrm2rm
        f/6QwM1CekgZ8P3M+RMYV6UBVBOjFCRAS6gpvkeaVjSeGgPcwIAXhve+AqqihFJi
        dDdxmrJ3rUIcIdRTmEbOBCvsh+j0K4XHW5cSbKMDdhAS5Um+dWm22pD0CuyuP6k=
Received: (qmail 2106240 invoked from network); 31 Aug 2020 13:41:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Aug 2020 13:41:48 +0200
X-UD-Smtp-Session: l3s3148p1@cYdD4yquztAgAwDPXwczAOmbI0TU8LCu
Date:   Mon, 31 Aug 2020 13:41:47 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH 2/2] mmc: renesas_sdhi: support manual calibration
Message-ID: <20200831114147.GC1070@ninjato>
References: <20200605101222.10783-1-wsa+renesas@sang-engineering.com>
 <20200605101222.10783-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB369224E06BAE72C1711B681AD8510@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB369224E06BAE72C1711B681AD8510@TY2PR01MB3692.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

> We should set the needs_adjust_hs400 when HS400EN=3D1 is set.
> In other words, we should set it in renesas_sdhi_hs400_complete(),
> not renesas_sdhi_prepare_hs400_tuning().

Oh, thanks for pointing this out! I simply put it into the same function
as the BSP, but due to massive refactoring in the upstream driver we
really need to put it where tuning is completed. I used the following
patch on top of this patch:

diff --git b/drivers/mmc/host/renesas_sdhi_core.c a/drivers/mmc/host/renesa=
s_sdhi_core.c
index 2834b30c3ba6..b54dd8a7ecaa 100644
--- b/drivers/mmc/host/renesas_sdhi_core.c
+++ a/drivers/mmc/host/renesas_sdhi_core.c
@@ -419,6 +419,9 @@ static void renesas_sdhi_hs400_complete(struct mmc_host=
 *mmc)
=20
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+	if (priv->adjust_hs400_calib_table)
+		priv->needs_adjust_hs400 =3D true;
 }
=20
 static void renesas_sdhi_reset_scc(struct tmio_mmc_host *host,
@@ -544,12 +547,8 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_=
mmc_host *host,
 static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct =
mmc_ios *ios)
 {
 	struct tmio_mmc_host *host =3D mmc_priv(mmc);
-	struct renesas_sdhi *priv =3D host_to_priv(host);
=20
-	if (priv->adjust_hs400_calib_table)
-		priv->needs_adjust_hs400 =3D true;
-
-	renesas_sdhi_reset_hs400_mode(host, priv);
+	renesas_sdhi_reset_hs400_mode(host, host_to_priv(host));
 	return 0;
 }

and got these debug reports from my M3-N:

     kworker/0:1-21    [000] ....     4.171435: renesas_sdhi_fixup_request:=
 code 17 replacement 18

which was different without the fix:

     kworker/0:1-21    [000] ....     4.171435: renesas_sdhi_fixup_request:=
 code 31 replacement 31

> When we read the calib_code at room temperature, the value will be around=
 0x10.
> However, we will get 0x00 here. So, we need to fix it.

So, my new debug output looks good.

I will fold the fixup patch into the next version of this series. I
still need to get the stalled-SCC issue tackled first. But I am now
working on it.

Thanks again,

   Wolfram


--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9M4fcACgkQFA3kzBSg
KbZqORAAjtXdyjdaveVv7rrFD0pPRakeAlR3dsfbVVIKH1DheeieIDUll5VmlAtV
Jr9q1OeC49GRijWh3dveZH7cyPjpXwJ8YZuW8HXpAj7ET0ZrB1o/fmOxPsDMLlVW
rb5Ma1RBIQ206r394cQsb3AscTpDw9mn5evKdoLw1MeiKnzHOfgBNprT+VXWnp+t
7WORFc04MnJ+WulztmUczcnAY1qbtiYkrH47sJRqvXIf4jS3Wayb1jJyJVM2IAlk
aw5KDUd070EcTHL2tGqL9NRubAjPlYb0vbHPbJ99X+DyvypluoO2g+mMkEKeyn7C
WQzHoC97E0DXGnCddFmrsjgyUpGsrhgt62doEjD8St8yf+WcUJbOGSovZHwSOcIq
VnfVM4K8Q55n0XfbsTcWgedtBlAewV8PuxRMSx2uUrOpj6r7mdZ0zmEzDbs1l+lN
K15R6R53mur4eAZ2DHpWd4Y3UnFktHDK/9p5BDtfquu9jXQayZheizzM4hVOTR7S
hOmgCCusVuCQFSv8f/2udqHtQI0hTdEmp2JdX4G2cetSiYep+bTq/bPos1kv+LkB
6/1Xh0u9ff/e54bPxVqF4JrBmQaL2T/U5m9tITJV0drKASeNyeWZP8W0qZSbJQUY
g9j/K0ZEqYmAmkEfiJn1CTbVqklexakWxWtadb4fj7SAJNJR4Aw=
=+7nk
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
