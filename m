Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022BE3D4E3D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jul 2021 17:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhGYOex (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Jul 2021 10:34:53 -0400
Received: from mout.gmx.net ([212.227.15.15]:46677 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231208AbhGYOex (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Jul 2021 10:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627226107;
        bh=8rguv78XNwnmnWZK3SbaUw5nZ9dEi1oGx8ZELlZ4YLE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=AvmKGBobx1CkRcP6moen3zXq1DCm04NWODEmIDHmv196pkgWSygkfaNJ1zcELSnEB
         QanE/Nkb+zqrDU4YMMg8YmcmtPt4ryivZrbwo+W5HtnQw7BBcDpmaW4410qrsEuyH5
         V9ZCF7s0BmluGYXXG4W5j+noHSEwVUHeyqzek7KI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([83.52.228.41]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MN5eR-1locrG2XWH-00J59X; Sun, 25 Jul 2021 17:15:07 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     Len Baker <len.baker@gmx.com>, linux-hardening@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drivers/soc: Remove all strcpy() uses in favor of strscpy()
Date:   Sun, 25 Jul 2021 17:14:34 +0200
Message-Id: <20210725151434.7122-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ojBDoB4/3HCiVyHlRM3rP0XP5p2z799QKBMKo5esN4lYQgrxh2N
 8kiynr9TY4DeelH6RCY9+7pqaT5PWXSO9CuqxYwlObiIlKGjv4Pw3fhGY7pq/yJb1uTMWDw
 LRWNMwQfw68Vz+cdy3wQZCa5fXP4UXXaX4WQ7+/V7DZV25teXPxOt1/wsQ60LWNgwtCLvFI
 4n06YcDX7/qvqjeXFVh/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bOkTUy8AAeI=:Z+wr7svOa0J7Va1hBPETzj
 Gv5OdW8mwVcs6Qcp6rGRVmFtX3JE4zeA22RphXt0UpzkcQkxRlvOOq0C0L7i0u+szK8HQAW6i
 AtssA2OPw3vjNngYxFvMFbQXHqebxy9jU5qvLuTG/nGf3+f6aA8YQghfHMhFxX1bIZgEBIfyk
 X5vD6kUPpnDf6KXBk6v82S2H0b6ew0cHgnKkGOEwuuEsbx90QwEbSCSM3opcDTGUyd/7FXLRV
 zUQ2cg8DuyWipBj4xnp8AaMDsus8YKnMwk3DOQrxyJbAMG3mqXG63BWgU5+EFL476kx+s+5Z0
 4JePOso8Tj/M3N8DWEDF2iRfShf4K1jBtJY0y9wqGMv4oheaZ4J4Mz9IL7cGJTghlRXTnMd7B
 5bGgKeSGujdmb2Fae6XkEGWtx1MahWcyAH/Uo5Ywxb83wZ+DTnH5IisU4+ujCfOwhkBHnAvuV
 1yREUiBxPnMNzDrX5soy2jf7sf6HSma7U0qdFWD4CKAEmkcRdfLo66K+8cxQxjXBckQtlwEgR
 fd/sZUJOz224a+K65TbSC/M8MdYmyTR216Gx/vXNCu/msDBNh5Kh0PXJIrXHN/ZvkYs1g5BCV
 0tPGE/m3I1WoUGRgdzB89uoZqSGh8wVWS8sHtz/+qOzoN8xJtioEN3pqFpESBJZzFpOK+VSFw
 BXJyz/V2+IejaT7De04Zw1REB3WVdVNfAmAOxLaG7qwR7J9lpv9HBPqEo91eAKOkOi6l369Rf
 FxvcHPlBCsESFUadOJaQeT3rEj23aA6Brw0TgMhkonsKvaeMwVGkUrFz0g5+S5FN8auqDrrPO
 4JIgYnzdtmqB5CFn0MSDY2vUEFHmLY2XJI8sfg0/MI9ds6xNlPPg1gBr4BtnpoA51mWu8EpIZ
 XMP5DA3Cf2mp+cVDXlNPTqckebPax3IGO1oEAqIcyWgYDVwV6unuB69Iq/UNM83s0sZxaiZBV
 Ng+uFSODJhF0YSwMQnAoUiPQ4tHhJeaxJGOcotAPVebk9i9Iwy7jVQxMc4jlZv6jrQFfTzIiT
 hPMj1+qhMhCCXC8XCXySi0qCzRxnyYSgqmxp8EJO45X9mlq+hkM2jTTf0TO1XAUSUZj+pc7lJ
 LKP6XntJoLv0X/Vh4eJWM52L60kGcxDfvWF
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. The safe replacement is strscpy().

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
This is a task of the KSPP [1]

[1] https://github.com/KSPP/linux/issues/88

 drivers/soc/qcom/pdr_interface.c    | 13 +++++++------
 drivers/soc/renesas/r8a779a0-sysc.c |  6 ++++--
 drivers/soc/renesas/rcar-sysc.c     |  6 ++++--
 drivers/soc/ti/knav_dma.c           |  2 +-
 4 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_inter=
face.c
index 915d5bc3d46e..cf119fde749d 100644
=2D-- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -131,7 +131,7 @@ static int pdr_register_listener(struct pdr_handle *pd=
r,
 		return ret;

 	req.enable =3D enable;
-	strcpy(req.service_path, pds->service_path);
+	strscpy(req.service_path, pds->service_path, sizeof(req.service_path));

 	ret =3D qmi_send_request(&pdr->notifier_hdl, &pds->addr,
 			       &txn, SERVREG_REGISTER_LISTENER_REQ,
@@ -257,7 +257,7 @@ static int pdr_send_indack_msg(struct pdr_handle *pdr,=
 struct pdr_service *pds,
 		return ret;

 	req.transaction_id =3D tid;
-	strcpy(req.service_path, pds->service_path);
+	strscpy(req.service_path, pds->service_path, sizeof(req.service_path));

 	ret =3D qmi_send_request(&pdr->notifier_hdl, &pds->addr,
 			       &txn, SERVREG_SET_ACK_REQ,
@@ -406,7 +406,7 @@ static int pdr_locate_service(struct pdr_handle *pdr, =
struct pdr_service *pds)
 		return -ENOMEM;

 	/* Prepare req message */
-	strcpy(req.service_name, pds->service_name);
+	strscpy(req.service_name, pds->service_name, sizeof(req.service_name));
 	req.domain_offset_valid =3D true;
 	req.domain_offset =3D 0;

@@ -531,8 +531,8 @@ struct pdr_service *pdr_add_lookup(struct pdr_handle *=
pdr,
 		return ERR_PTR(-ENOMEM);

 	pds->service =3D SERVREG_NOTIFIER_SERVICE;
-	strcpy(pds->service_name, service_name);
-	strcpy(pds->service_path, service_path);
+	strscpy(pds->service_name, service_name, sizeof(pds->service_name));
+	strscpy(pds->service_path, service_path, sizeof(pds->service_path));
 	pds->need_locator_lookup =3D true;

 	mutex_lock(&pdr->list_lock);
@@ -587,7 +587,8 @@ int pdr_restart_pd(struct pdr_handle *pdr, struct pdr_=
service *pds)
 			break;

 		/* Prepare req message */
-		strcpy(req.service_path, pds->service_path);
+		strscpy(req.service_path, pds->service_path,
+			sizeof(req.service_path));
 		addr =3D pds->addr;
 		break;
 	}
diff --git a/drivers/soc/renesas/r8a779a0-sysc.c b/drivers/soc/renesas/r8a=
779a0-sysc.c
index d464ffa1be33..25f8164b96d0 100644
=2D-- a/drivers/soc/renesas/r8a779a0-sysc.c
+++ b/drivers/soc/renesas/r8a779a0-sysc.c
@@ -404,19 +404,21 @@ static int __init r8a779a0_sysc_pd_init(void)
 	for (i =3D 0; i < info->num_areas; i++) {
 		const struct r8a779a0_sysc_area *area =3D &info->areas[i];
 		struct r8a779a0_sysc_pd *pd;
+		size_t area_name_size;

 		if (!area->name) {
 			/* Skip NULLified area */
 			continue;
 		}

-		pd =3D kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
+		area_name_size =3D strlen(area->name) + 1;
+		pd =3D kzalloc(sizeof(*pd) + area_name_size, GFP_KERNEL);
 		if (!pd) {
 			error =3D -ENOMEM;
 			goto out_put;
 		}

-		strcpy(pd->name, area->name);
+		strscpy(pd->name, area->name, area_name_size);
 		pd->genpd.name =3D pd->name;
 		pd->pdr =3D area->pdr;
 		pd->flags =3D area->flags;
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sy=
sc.c
index 53387a72ca00..0eae5ce0eeb0 100644
=2D-- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -396,19 +396,21 @@ static int __init rcar_sysc_pd_init(void)
 	for (i =3D 0; i < info->num_areas; i++) {
 		const struct rcar_sysc_area *area =3D &info->areas[i];
 		struct rcar_sysc_pd *pd;
+		size_t area_name_size;

 		if (!area->name) {
 			/* Skip NULLified area */
 			continue;
 		}

-		pd =3D kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
+		area_name_size =3D strlen(area->name) + 1;
+		pd =3D kzalloc(sizeof(*pd) + area_name_size, GFP_KERNEL);
 		if (!pd) {
 			error =3D -ENOMEM;
 			goto out_put;
 		}

-		strcpy(pd->name, area->name);
+		strscpy(pd->name, area->name, area_name_size);
 		pd->genpd.name =3D pd->name;
 		pd->ch.chan_offs =3D area->chan_offs;
 		pd->ch.chan_bit =3D area->chan_bit;
diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index 591d14ebcb11..5f9816d317a5 100644
=2D-- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -691,7 +691,7 @@ static int dma_init(struct device_node *cloud, struct =
device_node *dma_node)
 	dma->max_rx_flow =3D max_rx_flow;
 	dma->max_tx_chan =3D min(max_tx_chan, max_tx_sched);
 	atomic_set(&dma->ref_count, 0);
-	strcpy(dma->name, node->name);
+	strscpy(dma->name, node->name, sizeof(dma->name));
 	spin_lock_init(&dma->lock);

 	for (i =3D 0; i < dma->max_tx_chan; i++) {
=2D-
2.25.1

