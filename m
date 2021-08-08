Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87CA23E3B33
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Aug 2021 17:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhHHPvG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Aug 2021 11:51:06 -0400
Received: from mout.gmx.net ([212.227.15.18]:33365 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229923AbhHHPvF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Aug 2021 11:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628437832;
        bh=8WpITWSAmjBFl5ukEIIIh0d8OHw71Lp48DGXmRGeV/w=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BYo69O9ZP31BaGHrttIW3DNXq5fsutLC41vClAk6H35xvuJnDEaTeQkt882+sli2S
         2zRg9IM9rLshVQr76zjdU/siM1XIhrV5DGCa8+OSeFvcFWuXPM4fnl62KG2W/zcnMS
         p5HBmLVDPLTX/xCePS6ePL3UqU+5U7dVMFUOgxHA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MmDEg-1muaHQ0Bxg-00i9Ax; Sun, 08 Aug 2021 17:50:32 +0200
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
Subject: [PATCH v4 3/3] drivers/soc/ti: Prefer strscpy over strcpy
Date:   Sun,  8 Aug 2021 14:50:12 +0200
Message-Id: <20210808125012.4715-4-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808125012.4715-1-len.baker@gmx.com>
References: <20210808125012.4715-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NAahUXrhbe23vphH2V5V8QzAnruX6eosbWznab34o/LlPE7OlPz
 ZAfqE/aSfFY2bE99SUHctzIhbGTUQWHJNn/Zi33p7hM9YmI1PaIFMOPJRHQnTYzgKnn6JtG
 TNmZoPeYiGN/nvP6EicoyWFdt6UhpXby+7FGeJAnE5Qm5siNwa/rOu+5cWNMuUolLKmgMet
 1iEvwDwn9LM+wXyxXKeaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u4E+rKRzLoQ=:p3dXkD+lKAXeP09tYd/b7D
 qn8vWRi74uC9vfxuScHam1WxhNd120vw1V40MrsM6nyCiFv9Uc33D374I0bN9CGAkfJkWKwt7
 bxG5BcKad746HcV7lgz4WImjOEkbmILVwkvt4YULxO4eFLQzE9VJShbifmodkfN7V3n1jrv3d
 HU3ltcoOaxStaDVSwcJ7MIvwWqJCP08wks3Fp3IvPhfS9GusREs5YrE5MncFt/uSRNYRiCqxX
 JCRzxhHVi9bx2epIa1RVZa4IYTHsw6QYn2P14bTi/dg6tHhjRK0+Ax005k5Rc6MxLl+uGVmPy
 7OlftBhjc14/CGGsFPtoiR86p+uFLP1CEMD4S81UPMER4UgAc3t03wTsocmJbpYh09V3gc9f6
 XmOoL8Aq3OV1WAymxGY0o9VvH/6F0H/HscnBM+hHScAJ4isMJondiGehJdIMCqqa6uS45oU7F
 33EKZ25HmfSH+E5kXT7XZj6OqkcV3F62BfkTGcghqZiCCpuPtdUc57weM/04Zt3xC0Z6ogIPW
 DVv+un8BttTZSBfcyq4GkAPt0IO0l8MMZRot12IAGClnAfTJTOJWsTF42E+prGhZBGYgEbbkA
 3K0z38AWuCSgyRWJXflj/4FNEYYk6QKrH6d2U+sSzM8VkgDzqGzElZqRU8KAJC8FaqMi0ccJr
 eyMRqePpr5jj4CbGuqldgl+gM0gPtuQ9MQJy2mRgvvtHfSBbbSVbnh59qybmlJ+3SQmo0ml5z
 mWsBRORfOFu1SR/980MlKJ9dY0s29bqcr8Lr1hIQ3WSz2AEeF9Ma1o0OBLIKd9TVPIzUTx79H
 bDrKeE4WYdVnkvtb5pyiuC7Gn47QwV4acL73BLQJvl25Mi/9bPDnRohcPpHq5BeT7wZX0dgTf
 fMJsQAcAL4nlEyopqtVJrQNdftSBfiipOkyFQupCTw4qGk2J8AAL2QAedYYWZ9yOT7fNbx+ue
 fo3jGU1RkiuHRzPS1OB50OgfUbpl9wQRrdJ3wdJUzTHDg0hZUjasOvDMUReP3VZCEoq5dCKNp
 BaNRaQ8RoJn31P9fd8crvjBwK4IgonyBGcajCsc0F3i6LrsFwKxu99hvCVAUS6I9eGWbKcVyz
 7XMSfwykaJABkmtEi2C+bgh4crafcW7oUDA6pvxmPkZEdBEO0pDSpLkrQ==
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
 drivers/soc/ti/knav_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

