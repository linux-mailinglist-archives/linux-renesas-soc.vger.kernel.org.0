Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253C53E3AA5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Aug 2021 15:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhHHNvA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Aug 2021 09:51:00 -0400
Received: from mout.gmx.net ([212.227.15.18]:54249 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229923AbhHHNu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Aug 2021 09:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628430627;
        bh=Ktznl9CYvf9P3FGZ74Aoo+T36/BoOc7RBNfte+REZSo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=R2zko4oE7hSiINxxBxFzyLb+HeAqm/NLJydnAPe00vh7CzpnF4YqZhhbEBhEfwl1j
         0yuInVZpmmJazA95y4+osOLeUc5g0dAgeF4d8jQ2J0IynyOhWCOxiON84D9AuwZAdh
         eElg3Zlv6hdAH/rKINp2IZdBrtV6ZqEtgK/77rsE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MiaY9-1moHo52zRf-00fiW9; Sun, 08 Aug 2021 15:50:26 +0200
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
Subject: [PATCH v4 1/3] drivers/soc/qcom: Prefer strscpy over strcpy
Date:   Sun,  8 Aug 2021 14:50:10 +0200
Message-Id: <20210808125012.4715-2-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808125012.4715-1-len.baker@gmx.com>
References: <20210808125012.4715-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bKMKh4yUQahWuZCqr9eYkhBfX4qp+zip5+o5puFZDzukWBlvHsz
 cFlJ7S/doOPwSj0tmIHU8PiOoVf/dMxmaZZwkZzK+3CoOFCR/Fq0d8OACmZ1z+kfh1pbNHR
 fo7Cmr7vOF4JkT7VadJ+xLcnni2w6bPY/jGbw9m9UGu0DbbW/uH+WD0OJn5xnW1f9z7sApP
 phIE7IwrGdHZ417jSOHJQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SZaMBMHMq9U=:X4/f8pnYnJFLjNOfKICyc9
 mN9/w9eAApH3pfHskmcO55ch3pe7vhMM4yM8GtxA3rB65FUKM0uyN2H+dbcwnRUyIq5JXX5a0
 dM3Wqy9wg+1o8NzMylWJF5+/fESEUdAZwcpFSTlEr72aqr/mJHT9wUcX23wDmfyYocosuKWOk
 qsFUXYorMzk0fg5Nt52iJZfKr0/acRKc8OQ8Q3rLaOPyscG4F/szyduaAsu/r8VZXxYXxzwPn
 uYomkjJJrTmpYozdKeZkmZWXLsSCIz8asvMpp6CpXZsJSTKYOBj2LEu7LjbKwAW3/qhpdAbUT
 HDg0SJ2Z0ha/tIAlqjURCZvfTVn2SjDEKJhspxt1HVCs5fnyxP0sgSJBwEAhz3noXDXbDjzHs
 SgKin3LADIYxlBzO3hCJWHJZXWrzR96f0SX0BZEVwWrFf4tSq8DNjXT69wQhPX9GfuTm6Gjm2
 x2DyKDxNqAOsbbqE5ZOhjXfp1VVZo0Y7OYulB213y7PedDTuQsV8l0AjaAOjFzxs7jWriWbDD
 33A/a7TMLuT3hejk/+6adPB/E17J1+6EQvnu73cCRCVBU6GF3TwesFO0tkoppF1gn6qCLWaTC
 G3o08F4sKoRUfkH4k8eH0QIytfCsclzJGYb5JD5w00dQlXfYTB/Dqsae8Z+u10wA08GVcYtoC
 EQ2vkQsCW5a10gPkBM3qXHq/CpFm032QEqe9mtyvq6oVZUQNODYBL80AvBA8itmnNOF01UkBd
 UfPnI9xCg9dbbx1Nt2Qlu3vpwRkAHVNz1Ud0drZeAj7fYXuZ+nCNWdbL4SEmwANAha3YzIRjS
 XNl5qeJoik1Mzxem3PWKPcEHR75lWtgciRsDO7FpiQnD3GeNZ+TfUdYmP8enOD+2Wjxo/uurx
 AUK6IuMJ6R7pj83YolXI0OIE+v3qWTr/BIFxWtU7N7topeWfoviMCU0ANGms2vIgal3KwY7nU
 g4nyb/cCbIIRfEnYzgYK3xw2UF8+8PKf47b57VcjY/1EdqEfFMMaULilswhuR6zKnc9VPJfWj
 Z0df82eECByJdelrXpMdatoaSs0oBbWFNy3O7yT5kMWA1CCsDXIuh5rp/Z1XOGWXzIPwzcHU4
 5dQE14EF1zSyA+PSQ83e9wrSZHhZYdHpSav9VGKPnLG/wSamz4esasimA==
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. The safe replacement is strscpy().

This is a previous step in the path to remove the strcpy() function
entirely from the kernel.

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/soc/qcom/pdr_interface.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_inter=
face.c
index 915d5bc3d46e..fc580a3c4336 100644
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
@@ -587,7 +587,7 @@ int pdr_restart_pd(struct pdr_handle *pdr, struct pdr_=
service *pds)
 			break;

 		/* Prepare req message */
-		strcpy(req.service_path, pds->service_path);
+		strscpy(req.service_path, pds->service_path, sizeof(req.service_path));
 		addr =3D pds->addr;
 		break;
 	}
=2D-
2.25.1

