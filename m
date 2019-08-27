Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D876D9E94D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 15:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfH0N1j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 09:27:39 -0400
Received: from mout.web.de ([217.72.192.78]:47807 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbfH0N1j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 09:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1566912452;
        bh=Xnd5LVmhc8noExp7aIizMSHiafVFucLYD9hs1U+rD+4=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=L8fMqmO7lhVWns3jAvEatSJYDkdvldQTjityRUXnYsSqjjs968DaXy5F4Id+xU+V+
         s8F4stAAqJwMS/wTYtzU2ma+gl1byw3pmyogOZSHQQtm47V8TtcTB2fcYJ0Y5qYeQs
         nPjYFyZ/l3l6PtOow5hc4wAujp6ONWubk33+zGoA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.143.232]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M5OYl-1iQBTQ34n9-00zTVO; Tue, 27
 Aug 2019 15:27:31 +0200
To:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] clk: renesas: mstp: Delete an unnecessary kfree() call in
 cpg_mstp_clocks_init()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e66b822b-026b-29cc-e461-6334aafd1d30@web.de>
Date:   Tue, 27 Aug 2019 15:27:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ASk+615opBrm178uZsylKNSotRbH9KO3sjCsXzbQGiHTbKpchIL
 nQloxfyfF7HQF4RpwgnOvSQJ+wl2PFOICtYdHGThgS4MmAC5Vm1QggA2BlnK2R4PUc/5ygB
 xpt0Wa2D/C5OP/79sElGOua120r3CbQjz6Jm8u/lpP/7m5WslrBZj2ZM1WL05GPvJI5UC00
 1cFEwl+rN5hC72m+b/B+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c/aMIvMV+eI=:rwemFwBnMQABKAfF5XuLgy
 8dxXLQXhdDlc/HTJ1uCS+NZroggLRAqZNFHewNZR3Z+xpseyVM5RDXZGVcM4hsvEHRsAxe4pC
 8Mb3D/q4gwXTKHw/8k2U25udxwHs3XdDnNUXnnrz+EEPXIWKRdlOam+SMRl3ytel/BQSufP+Q
 oH8pfQI+MKtVMUQ83D/PNX3aVfbDDomzyvtDMf4QsDpSejRetCu+0EKgII01K/4xenodffdve
 +7256kvLg+j+OHxdyiSlTexOPoUrMfmTwZLlRWLaCOlMUOom26domeyeHthi4TguCv8h3Lh4Z
 cDa8Q6YQMrED5LlsZzmDWW/UzGeLSQi2LwYDtWoKGC5CeN7GjiewVXmwZf3f51kKvhR+XbCK1
 fOmL3KKnBIrPSIzLy5W2Zsp5ivCsUxJk4qRmuRv6d6Z82YJo4tRLjGcKmGzQcNDB9zEvzYqLW
 84QSnCmawLHkf692J765BHlWk1huIl+LWkafIOCdOCvFBDZuChQ3QJpKMY6M8vu3QpDNHG22d
 IFM7TyQjQX52/PqEYi+0ejHYB5j7Y7pR+XCJ4WcKKimPwLtyGSahiNZUfUDW9KmERZaruSjpY
 PIWHsLYXww3LdPx2+MfGUzS5bzG5GY1SBkGzNrLOoZTqpiSnM+Bl1vKdmu6lR5+TcV/GxcRMA
 hg+9UVq9uTFFGd2OOITNz1CEbyFOjgLz4c1PWg2IpucnG8AWwX6u6M5bkm46mFTawLCTFXtBm
 Aqc1kDLrS+fQocvfN6dySZtIo1tKzQiFm+6d5Mw/BRKRr8DyIGBUf1O2qdCjjRJlhXz6/XH5t
 A+AgJt346RV3/pdCrnq4o8mB0DyYHUGuQ2Ym6Ur0fEsNAH+vknKDHhXcLjnm4I3RXj+7DqNDK
 Xd1E2hdwv9ZjGIUAuGjrkU1/2rXhktyfrDqFzkiTBz0thioCBuKjKN81IkQEzTq8zu8V4N4JK
 A3UK7Y3dWOm2n5x1U/kA3v5h2wKfsuzXfsh3UvgNmVrKez6vjny+FpP9isCRMQtUgsCPlMbYA
 bGX2qkR+Fq81l2N3oeE5AmWhnCvjjfwpWXqnA9TsFZzc+Bl8/pDNfOmIZ/IvJp2Y6b/dW5SBc
 t5W4gqlN6vfqBks1vmTayxyPgi/JDpgnEV3chpfOROYu4FyozEMerjYmot9w2tC80p+E1Pdbh
 I/hLU=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 15:22:12 +0200

A null pointer would be passed to a call of the function =E2=80=9Ckfree=E2=
=80=9D
directly after a call of the function =E2=80=9Ckzalloc=E2=80=9D failed at =
one place.
Remove this superfluous function call.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/clk/renesas/clk-mstp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp=
.c
index 2db9093546c6..09f8894bb91b 100644
=2D-- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -189,10 +189,8 @@ static void __init cpg_mstp_clocks_init(struct device=
_node *np)
 	unsigned int i;

 	group =3D kzalloc(struct_size(group, clks, MSTP_MAX_CLOCKS), GFP_KERNEL)=
;
-	if (group =3D=3D NULL) {
-		kfree(group);
+	if (!group)
 		return;
-	}

 	clks =3D group->clks;
 	spin_lock_init(&group->lock);
=2D-
2.23.0

