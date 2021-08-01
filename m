Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18C73DCBC6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Aug 2021 15:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhHANUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 Aug 2021 09:20:36 -0400
Received: from mout.gmx.net ([212.227.17.20]:49115 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231461AbhHANUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Aug 2021 09:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627824010;
        bh=12SUoHSYDBGt1hC0+tZ7it98pstpvxoKbmEjS94qv3o=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=lnv9cpDmbWbObk5BKhnhxKT1k6FY51TfDWW+t3b5wAYUBrCbhuuiNaLEzbeEhSR6A
         JdSWwNNxLmc+yQgI6TbCqDG075Bz9D7oDNwulCR75n3VuDjtV5TsRnedOXhUjtrA6O
         l47Di6Ozolbh6FLZymovj20Q3eWaTD6ymCD0q6sY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1M4Jqb-1mASMt1q9B-000O93; Sun, 01 Aug 2021 15:20:10 +0200
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
Subject: [PATCH v3] drivers/soc: Remove all strcpy() uses
Date:   Sun,  1 Aug 2021 15:19:58 +0200
Message-Id: <20210801131958.6144-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tTfcHuj+0ypGvbZo0LvioO/mi5Bv/AvCw96dIoajsIs0ln+YTgJ
 4k4S2nXfLuvErUmUBcMQHslsS2xRPF7StmHDcwaK5CIq3yP2QrYx6uiyLlZfsPpJgXC9W6P
 Lxvg5gzdmpkeP/ghkUYLshN6HtiFfpEwoZrY036JZOwqEHr0mkL9QHNJGVIhg9cSuTt39mH
 QPkaW6A3ZdeqLhxbf5z6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VosoT9dYQXM=:xIei2A0P1I+zYyhjQMM/Gr
 SMQlJ0psogAioUEsUwAS1ydrMrFJUL+nJrMhTabj6e9keRrsToqxHcvy/vWOrqpUHxsfbrC2Z
 0DCZZTfUR9+uH1LiW7YPbcOuhVM4n2rp8NpkL3wu87E6g9Wbce65bHHv6zhQ8g5UzLrX7T2MW
 85j7M+Gm/z5MstxUPUt4TQClwz4PH1ADmyIFSCdbFoeMVjCiOg/6HcBzjL4o401IwnQA2oDu/
 6FmVQoZPHlgqVyOrLo7alwrox//RwwjnMQRaQeZEq4TagzJZ+lJQrI72aDdoGjuy9RmRNir+J
 EPjR0uZEDyYRVsWfN6Rkju294FSz4/bsPeYNSkol6sOS5WTDkmJVBEymMcQWk1nqZLkDyNqMV
 G90UkFmU1PBy+/OxaDk1WqCO67WoLWbtLljzQhMHTxI3vkL6Qg8Pji5Mf4Wi/0jhKMEm4wWSl
 WJAs93F+xuv50DpZQEqZk5Ekc+RiCGv7TcdmtuoxEAnTOQ61u6OAYZcInQ7ETWDWPkozq5O5g
 OzkQCLhNfzcm9ZVm9EMc9tK6QF2NO3EuO7S1WIb4F0fR0XB9QJnJP3Zoq+IIiqiI6xOKU1d2w
 R4jEM/QBhSPaa/cHu7Y/d3JBcsJHt4c0xZFlfiEBCEqO8X1CRLf44sNr32vKFHWA6xAa6c4Kd
 M4tuhXWPA0LIoPR4g4zA0yGqbKKtk0dgQjf2Bw6vY1UpRx+laZSK1jIog/EJ7Bbq75BSga4iP
 2KmOIdoIrhaMaewlhXaUoG17a5qH/sO4Qm/SmStvH0X3QHKL4T5pgtZp7SYS0J0uHybhYS5ik
 6y69+FDelZ2ePEbMPPFJBuWSCYqYvq+uYwpn9OpVkh1D2XXxf8KOrLMFDXgtEFsSq3noqSbKI
 8lvugCWBeVnNTfP5CVcZmXqn3WazJinvKWm13f/zDNbWaW7VmtDoUsc4mgnR+CL1sKZBrGdpU
 MdK9qsyajaJLoHPRoIJiMD9NHs8HRgRxPObVimtkGAfLxV9hZBb/5CYuqvFdf6sBGiAt9OcZx
 O+kNIUw63rqImi99JsWo08JixFQRQgGfKUMCutaS+O0I/xl3kfoktMzWasYrfBEEXKKiRy+9l
 UXdQAgc3JpEnuRoOSVYpSdrIJkrG5lOLZ4a
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. The safe replacement is strscpy().

Moreover, when the size of the destination buffer cannot be obtained
using "sizeof", use the memcpy function instead of strscpy.

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

Changelog v2 -> v3
- Remove the "Reviewed-by: Geert Uytterhoeven" tag since the code
  has changed after the v1 review (use of memcpy instead of
  strscpy).

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

