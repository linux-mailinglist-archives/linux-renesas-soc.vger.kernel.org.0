Return-Path: <linux-renesas-soc+bounces-9365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A6198F5CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 20:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 109B2283100
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 18:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F3C1AAE36;
	Thu,  3 Oct 2024 18:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Yj0A2XYQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819A1A7040;
	Thu,  3 Oct 2024 18:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727978739; cv=none; b=LccYhkosVzSQggjDO31cW/vBZvzTiWw5ube+li+XDDmJGES+VbhiWnBG8seRc2Dt/FP8z17U12zwjYK04UKhI6pqyW1nCcTKgpTF++5O2ebynjsthEI//Nn1pmjjSfY966Y4DepR3UKex1QVsN439W9drbyb2L9sFvkoEoGiJoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727978739; c=relaxed/simple;
	bh=NS7kXQUKxlrTfeb+LWgoodsEtPxJoaNeIkvDx3vZ6b4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UPtnzgrTITaCBxVe1TdnKCNDtz77NDoB6bPIbroY+zoIM/ihTgOTDHd5huyqpjELO+Go2i1Y05g6AxhlzgeRVH/WZHL2bU/vLLU+/MOgg4zKVsJC5UE5wKyn73gsiYcf7ZJxlS1IwZHvY3puoRoXZ9wRLITLXndOjzwyw+QkIEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Yj0A2XYQ; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727978728; x=1728583528; i=markus.elfring@web.de;
	bh=sXYDfNxNXvlLEtQjQyqH5jtoLuiiUVmTvTAFLF5cYH4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Yj0A2XYQGXuhXxxN9faAUpkh7h8aqrJAdmqh6yy53MopmHhzb770NWpRh4QXN6lP
	 YmR7bzEDIGEHiuKI08BCvW7CdhxgkUfuqBP8SbTY4wDpiXt2TN1HZKVIc1s+tWBTd
	 +SUX6HdzgAQ6tOGEl+8xMGEd+rTvcdacmHyxljEFH4r/Nv17Y6g8AzAAOrdFYs7HT
	 Lew3vxMKgZ4gh+08D/Hq8AqDoJ+18Qa46h2lxn1R1kSAptzYfNId7lMmtV1Ovswjx
	 YvWLZBm7Rk8JQZGiBk1fWY+Lx4gzSexLaJn6xiZaKb1H5ITDwaWP+25woNieR3fmL
	 kDIvehaqHhKWxb2jzA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MaHWx-1sQkA90WnN-00Xucq; Thu, 03
 Oct 2024 20:05:28 +0200
Message-ID: <504bb76d-d8ee-4332-ab3d-ad6b2482c29c@web.de>
Date: Thu, 3 Oct 2024 20:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm: rcar-du: Reduce of_node_put(cmm) calls in
 rcar_du_cmm_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GzLe1BNnQpGneYCLWGjV3Sn3P+BLxsHJpEIfsLxgOab82VnS6Vz
 QkzMxzHjENmdN1thEhr8VdufpeTW6LgLWN2gGtzn/CXg8YisrdRUyUhQZgtw11eWMymAABU
 l1llAqcyVO+MRL+E9G0rU3tAGYUJvWNrV3CFkeLLu6LGhqxB+JjJuLiTwL2dEXOjp0jJ/SS
 YOhb1AaIZPbXcPKypO5/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SWAexnI8TKo=;MdJndK/inRWqYpfmqoqzxcuKWTH
 nPRDm+jzUy0JgiXlqXtt6qLdwa5gkXWX9WPO5/axyidQp36+w5JXEX2cHrqcgze+VJ0GSxOcQ
 jAQ5nc5NZBVfVc2cQXZ6f4gAuSl/3EFT1f3SbiomB6DQ4p16H9aSBPGDhG+kdnUJAbaHAT3/x
 RGBBxzveg0ob9At1ri5zOB1z+W+hXuKk1Jj9G/y5/Hv/TR7xe2DHf9wcU7NzkHbgNwEktXjDu
 PsEvE79oSwU8QOoqsJ8Ab6G4ne8HzlaLS6sLsqFRpzQU6DZnYXPeAHOadZA0ClrurAi7so373
 RNZafHzoFfn34DKDUGvAP/JbpoJjjK+tpQwrWTTgJ0lX0L2UEGVxbc+UM4cbPIlU+jTn52rBJ
 d/pT0H19YjI/OyTJqYiGaVEilFVIHexODiI6gnpVd9XxFwCGNNitvu4ScQjqWnePw9A0ONFJr
 KfLLbaEZh4DoGKBCftfpiYISpuyYY7zrX4F9iId9Y35UgryxRtS6GnOx97bS+ucT1yhAeE7tp
 /nXVPQL7fjDl+NGbU7fTpRcKu2ltZL3dcreA73D4Yt2K/lLYY2NcvqbxqiuVHwyMlXIPRuf6l
 Wnian0RZFHwboHKfX4IYF3flBhVFWwLaH4Vad2SpJyEB0UPrgXAP70f4jbDh3Y1br3Wgk4UrA
 G97Ji9xN5Mdn88WO/c60R1xsG4VZJaN1kOoXzy6RaK1Yw6QJUithrkdaYwM49eXqWuqN3ghsR
 daH3RuWdx9hHmzWmQaljdr8HU2dBhsqla72uQM+p++8rzbzf60un6s3oXzS7aYfJdqFk2pcVe
 eBYbYtgrWHyKoinqZ1i2qtog==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 3 Oct 2024 19:56:29 +0200

An of_node_put(cmm) call was immediately used after a null pointer check
for an of_find_device_by_node() call in this function implementation.
Thus call such a function instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/d=
rm/renesas/rcar-du/rcar_du_kms.c
index 70d8ad065bfa..a854b2b085f9 100644
=2D-- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -792,14 +792,12 @@ static int rcar_du_cmm_init(struct rcar_du_device *r=
cdu)
 		}

 		pdev =3D of_find_device_by_node(cmm);
+		of_node_put(cmm);
 		if (!pdev) {
 			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
-			of_node_put(cmm);
 			return -EINVAL;
 		}

-		of_node_put(cmm);
-
 		/*
 		 * -ENODEV is used to report that the CMM config option is
 		 * disabled: return 0 and let the DU continue probing.
=2D-
2.46.1


