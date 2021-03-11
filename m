Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11536337397
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 14:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhCKNSI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 08:18:08 -0500
Received: from www.zeus03.de ([194.117.254.33]:33718 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233251AbhCKNRv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 08:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Zuc41uOmSE70Dv7hPr9k7hK184S7
        1VttQC3DzyQ0e4c=; b=PKiuR3bQnNceDOqMnNgipBhoNXog7bAeF3SR11hAb0Cr
        4O1fPZzHkJ20X50ipIq2tna8JsZqBCR3CFXx6T3oAgJjbx3WcIIHC4S+7MBhPhi9
        YbfbZdphOoN3aDY7Bk3CZ5WudFwNcVPb7jjYGnX/G4I1zA1kKA+w30zc9IlKSJc=
Received: (qmail 22202 invoked from network); 11 Mar 2021 14:17:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2021 14:17:49 +0100
X-UD-Smtp-Session: l3s3148p1@OBUqnEK9bM8gARa4Rf6LAY0TkMkJSYgM
Date:   Thu, 11 Mar 2021 14:17:48 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 2/2] mmc: renesas_sdhi: do hard reset if possible
Message-ID: <20210311131748.GG3566@ninjato>
References: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
 <20210309092332.30705-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692A6D95BD60A17AE698DF3D8919@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NY6JkbSqL3W9mApi"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692A6D95BD60A17AE698DF3D8919@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--NY6JkbSqL3W9mApi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

> # In other words, if a controller doesn't have scc, the previous code cannot issue
> # CMD13 in such a case, I guess.

Makes sense.

>  	tmio_mmc_reset(host);
> +	host->set_clock(host, host->clk_cache);

What about putting it into the reset function itself, so it will be
always enabled (like for the scc_ctl case)?

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 473f155f6d3d..672953e3362d 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -572,6 +572,7 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 		read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 				  false, priv->rstc);
 		priv->needs_adjust_hs400 = false;
+		renesas_sdhi_set_clock(host, host->clk_cache);
 	} else if (priv->scc_ctl) {
 		renesas_sdhi_disable_scc(host->mmc);
 		renesas_sdhi_reset_hs400_mode(host, priv);

If you agree, I will fold this into v2 of this series.


--NY6JkbSqL3W9mApi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBKGHgACgkQFA3kzBSg
KbaS7g/9FoG3ukHoorA2wS8kNpJh/fREYQwlD2hb93RE6Cn/79VFZnLnGhyHx4Nl
IfK/ZJgITWRYrmLqeY5a42nfXd0I4K0IOtAJ/bTWr9xckh0dVxThevtlssQbDxrI
pmiZuMdZ/QNEswdImm8fAnEWMyeqWAJ2Z5imaEH0dFnr6r4sqq79aLPitiIhnmdS
GQewEGGwpNF/iZOd9y59PiV7APqNE2Z4soGjKkH7SljjWg8C2lZeh+B039kFzQbk
9hx/xO3BXFyJ1MbIG5XqbTynEQa2lVr5jGsRoWoj73l+7buTAlbSx4tBJ/ixoTwL
gphOQNNyG35YRQ/tDkLnq/4FGkosnN805OKSNnkZml0SdJkgd2LppC6sHs8iygsZ
xiuO9Z2zirw7JFEK1u2HKr64A6xKFD++G2oUBN8Ab/dL2OHPc1KubExIq+hYbw3K
CE6QZ7A8a7uDlMaGrDDTrcVINIVDygxQDj/AHIS8dPT3lmuQ3pPJS9/ZdL+L512H
mLKNKfInt+xYO/JKjGBwD1fVrymMk0stIJl2EW+jyreIGWyw89ePixJNOuDKxcAJ
raPZZz/puTIpAiXRec/RaHCFUqV9AxZP9YKWUHGGSDjubLcjY6YmRQY2jaaRQnJT
Ckr4hLCGnr1LmvWPAhw6g1BTdfGYLyDvrUQCeeKh7OEJaUB57wM=
=+ySm
-----END PGP SIGNATURE-----

--NY6JkbSqL3W9mApi--
