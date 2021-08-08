Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A433E3AEA
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Aug 2021 16:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhHHOvF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Aug 2021 10:51:05 -0400
Received: from mout.gmx.net ([212.227.15.19]:54195 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231811AbhHHOvF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Aug 2021 10:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628434230;
        bh=dnbnIgetA2HSvGj9st+ftD9THu1GINdsSq+4RvpezMU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ITqjeZmP19uQ5eS39HcPhVQJ04VERDZRvPlYhaOqe25rcXPcgneIiOwehe7RmgBnJ
         Ezssq4+CzoidNm/SWThQHqx2f5s0bmLLEUYK6CQw5x7lVyXhGzud6KbNggZ9uHXtwt
         K9oc2LIecG5P9lFH7uVeeBFoG7bWN80UW4DCFl98=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MpUUw-1mvfmk07dk-00pqqk; Sun, 08 Aug 2021 16:50:30 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/3] drivers/soc/renesas: Prefer memcpy over strcpy
Date:   Sun,  8 Aug 2021 14:50:11 +0200
Message-Id: <20210808125012.4715-3-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808125012.4715-1-len.baker@gmx.com>
References: <20210808125012.4715-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s+2GOJ9JJjsrQL+ZL7tVIYQT5stQLcH+ApXr/G0xsuDveEeU+Lc
 UFhX/NHZhKRTsI6HwSAQBN1JTxA00ohLhPKfajdptUJloOjUvvQVBAAXizU6zT6gn+YgC2r
 2vvhiyObK++tgAVoOdyDb7Zj4wPVz7pjQ18l7kJ47hob54tVPJU7QP5764z1tNq/Jl4eaFi
 9plXTxWkG1P78F3/uDkkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CBcb5hSVrJs=:xegYaanLnDtAf8ejrmzmke
 u27N1yH+y5rqraLuZv4PCarTIYwdRkwQCTYMrTwNiA46i65D+bz/qryrLyZGXo08pQzZI92xk
 QHwV/nsFDSJXfZh22hutInt4QkZCI1cKqMuSONn5NZ9g6EfIW5JP8RnITlqYw/FP3Y+awHYIH
 x7xJND8PUSyLfAQHr7KOnvBXE6yOc+FRP8zlv4Ofi4Sw33JaTZ9/wbhpw5y175a9z3WaPnJtD
 /va1ER2ZONP6bqpCrm3puSHBmJmMfYKyKzAwVOcqbND2GCxV/samcLS5WlNWsYROEXwX/uiBW
 Mu06YGsX9p8CgkhYQNOwmKQRFKlKdYbuQUfFdzGccuI8m91YTIucXoEL3mPr9NpjgSYQGNLtS
 5Ci7qFy16bkD3rUqSLHfgrqXWmW173MYOePC9U9CHO07bHvBrHnpQy/p+VFWMdZSzCxSxD6Rd
 +TOVg0xLfCKp7fJLG8Gz61PTh+iXs8+joFiyVTtUMEH6sv2S0cpIV+AgRPIB6l2rsTatfu5YE
 zAMprlVhgzsZVDHW5cMI9FEippsW+MEMQOilAdybuYFD3PY1nCi2vkSclTduq8s5r4xLVGHKh
 coGkvYR+l9dLzxwpYUw088g/E+8+/ahpTqqcDvTdtwDCRnpO60TYZaAaXQbvPVd5KiGvG1zf4
 rGRzPquFIhTIObDPAMkmrCYPplbML9l9iCA7uHHnr0ZCJFqq/26pWu6ijICM8sDdIlQp7/Acc
 4IuavGaljyKlm9xCDmri6RVBnPOAwSU7++w+vjrDbTUJlP3XLzUROJreZfYe9M4JqyFxlyWy5
 Dhw6Sn/MLtrZeuO4YTV83uVuUMGAb20I9Upe8oI5DC1mR8N/yUv/IVaoh/rajjpjtL7b+N7z/
 ipgrse3gJjVR7LfcFPxmmsig4vzDbB+Plz5Ea6PM5EuyHbYQPsoNkhUlT0jDnbWbGKZV4s0K8
 xTvY8QtfGhz70CB2olSzlrskA6pvZ9c85VnAfFhimC5SuXtHN6zb5VWF416rf53svJvVq3/W+
 tgSYPFzRdXYAM2i0HRV6LrNJPZwgDXkQ8ubfAiHEZWJOsB9h9V54a6fnrnUIRasrxSO/dR0Wx
 0TAUkC6EW5XdCwU4XW9eoalUmIsdDdBQhaoHwQvokN6F6/yyv+157B2PA==
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. So, use memcpy() as a safe replacement.

This is a previous step in the path to remove the strcpy() function
entirely from the kernel.

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/soc/renesas/r8a779a0-sysc.c | 6 ++++--
 drivers/soc/renesas/rcar-sysc.c     | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/renesas/r8a779a0-sysc.c b/drivers/soc/renesas/r8a=
779a0-sysc.c
index d464ffa1be33..7410b9fa9846 100644
=2D-- a/drivers/soc/renesas/r8a779a0-sysc.c
+++ b/drivers/soc/renesas/r8a779a0-sysc.c
@@ -404,19 +404,21 @@ static int __init r8a779a0_sysc_pd_init(void)
 	for (i =3D 0; i < info->num_areas; i++) {
 		const struct r8a779a0_sysc_area *area =3D &info->areas[i];
 		struct r8a779a0_sysc_pd *pd;
+		size_t n;

 		if (!area->name) {
 			/* Skip NULLified area */
 			continue;
 		}

-		pd =3D kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
+		n =3D strlen(area->name) + 1;
+		pd =3D kzalloc(sizeof(*pd) + n, GFP_KERNEL);
 		if (!pd) {
 			error =3D -ENOMEM;
 			goto out_put;
 		}

-		strcpy(pd->name, area->name);
+		memcpy(pd->name, area->name, n);
 		pd->genpd.name =3D pd->name;
 		pd->pdr =3D area->pdr;
 		pd->flags =3D area->flags;
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sy=
sc.c
index 53387a72ca00..b0a80de34c98 100644
=2D-- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -396,19 +396,21 @@ static int __init rcar_sysc_pd_init(void)
 	for (i =3D 0; i < info->num_areas; i++) {
 		const struct rcar_sysc_area *area =3D &info->areas[i];
 		struct rcar_sysc_pd *pd;
+		size_t n;

 		if (!area->name) {
 			/* Skip NULLified area */
 			continue;
 		}

-		pd =3D kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
+		n =3D strlen(area->name) + 1;
+		pd =3D kzalloc(sizeof(*pd) + n, GFP_KERNEL);
 		if (!pd) {
 			error =3D -ENOMEM;
 			goto out_put;
 		}

-		strcpy(pd->name, area->name);
+		memcpy(pd->name, area->name, n);
 		pd->genpd.name =3D pd->name;
 		pd->ch.chan_offs =3D area->chan_offs;
 		pd->ch.chan_bit =3D area->chan_bit;
=2D-
2.25.1

