Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70663DC729
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 19:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhGaRTO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 31 Jul 2021 13:19:14 -0400
Received: from mout.gmx.net ([212.227.15.19]:52131 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231225AbhGaRTI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 13:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627751926;
        bh=u7yjtSYNz4HyDszjNhkNZXYfNya6qUKab46f4Mhr5so=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Zp+LfVy7ug47T2C0dei2QZTdVdwDS44XIA0Azb5FlRURubjN1/UU9tGD8WytLSeBd
         6PO2rE5OIbuR6nZ8deKUJTZ6foCfVg8SJpyLkwmLe/qGc/yfR5KN8fl8NPL7PrMy98
         rVBVQLvteIof3PM4An35MKU7YmtYWm1PZ7Y7SItc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MFsUv-1mOVk91guF-00HLu1; Sat, 31 Jul 2021 19:18:46 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     Len Baker <len.baker@gmx.com>,
        David Laight <David.Laight@ACULAB.COM>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] drivers/soc: Remove all strcpy() uses
Date:   Sat, 31 Jul 2021 19:18:25 +0200
Message-Id: <20210731171825.12865-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Au+nrlQpMdvWy79nfIt2LLXjxgW6PbYxuny+O3RAHqLwCr3h3K2
 bOaopYg6eC/P4mrhTT/fr+zrowCdwnn3BZJhUPiB8zn27hRkcv/IElAnydYzwCKduk6cZkR
 FE8rRWqj6BtGj39C4JPNVsw2uzEtrrVzhUR45WHIlmUwTROjUEdCMIsQ5+VKGw8KP04+EcC
 9/4weGHfW1JXACKbmMpjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9QOp7//Mtn0=:5kAibdBBscP0labxVPY/qo
 42xUlkpjcWTTnpttDFhCZyf35r/QuN+5FApvQuqxitSDij2m0JqA7NIl68jqUEiZ+ZD5jZWlu
 wLNJUkZ9l/YrBcaGB6OeXFCnVBUA9C5uRChxIYq27e19cmTyy0ON18XdpUAdbsE+Ps192LLr7
 fa1BjU4ALFQuZFJ9RhnOf4+P4sfqgf3nuyyJfwbPzWczb87ggmKACvwmObnZkhvlJ4SUGAS4S
 XPPDk1xD6Yt8I3xwJcsEcLBkFV3WcKyCKHJw9FVRUSNnjyPLe+B3Z1yXF6QAZgqm5M2bg6/rp
 uRH9JnDHZpIPr4wfB3CWpxTLnk4ZVMtBjQvXo9qTG7IP2rpE+Kpso5UzjFZWKvpHjYhbl3gHD
 OfFAh6/2xyxO206Jl7JstLmZNyblzu92LmWS0VhfPNOh73DJK2mmXJ5phbs5KvldHA5Zb1L+e
 WDmZ0JGofa6blrcHAFohZtV+zfVuaR3twvZM15zqQ/rSrKYAMDoKkmI6hZXj5yonpJCVUBtIT
 zCAMn4v3fzAabbZn3wEMJMP97XFeo2TvrUJqYwH6NSMGocqaYpVqJTzhK3rj4ErIt6jvoaKWs
 u4mlD4ZKu9y3cZQKqh70jsFCvsbU9w/bZHcSvI6UQf8Sek7RUWev2ckawUshUDysl+MTzMAoa
 50X/SMpU8yyAFGhxRQhm5HlYaXjtaE2K5kmhgr4PBrEVhFvLgGn4L5uo9y2iKJ9rerzHYu44B
 fQvlaEfXcyQjp+TbAEA5VPokEiLRL68GpQvuuX4/KhO7ggUZVM6ntyKMps1kZ8YY2xd9y1Llf
 Rmwd+vow+f8wWlov7BaKR/dpWLsNri3pP5AFmOPQ3lalLg1Yr0eeDqwse74JEzQ5vh3OKM5hn
 CIUIYjL7JUKdcEc1RsYCKrk/K/Hp/lnWek3+nBJgldGySQqF01ngNAF8pS8vFD+l7YzZR2kGf
 +uG9eGLQwsIB7wIuTQ6y1np5p2myO3ulPBQwRPRAw1TJY5hUi1X9KNgkAZx7ifnL/Mkh9IfmJ
 ZPVKCPbsf19oox/oQtb8+tf8Bc6BNfy3Lp2QLDNQGryLngvnxANoF/jr7lzY6i0cVSuUh0zqi
 VYlORNzlqEus9R0k8Dkb2oga+qdP3TqI7hC
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. The safe replacement is strscpy().

Moreover, when the size of the destination buffer cannot be obtained
using "sizeof", use the memcpy function instead of strscpy.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
This is a task of the KSPP [1]

[1] https://github.com/KSPP/linux/issues/88

Changelog v1 -> v2
- Change the "area_name_size" variable for a shorter name (Geert
  Uytterhoeven).
- Add the "Reviewed-by: Geert Uytterhoeven" tag.
- Use the memcpy function instead of strscpy function when the
  size of the destination buffer cannot be obtained with "sizeof"
  (David Laight, Robin Murphy).

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

