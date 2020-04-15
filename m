Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236221AA97E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 16:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636416AbgDOOLs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 10:11:48 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:34045 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633864AbgDOOLl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 10:11:41 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MW9zm-1jmSvh2yJ0-00XeCD; Wed, 15 Apr 2020 16:10:43 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 13B9E650EE0;
        Wed, 15 Apr 2020 14:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iaMgQKlB-XP9; Wed, 15 Apr 2020 16:10:42 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id BABD964C0D9;
        Wed, 15 Apr 2020 16:10:42 +0200 (CEST)
Received: from pflmmbl.corp.cetitec.com (10.8.5.60) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 15 Apr 2020 16:10:42 +0200
From:   Matthias Blankertz <matthias.blankertz@cetitec.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: rsnd: Fix HDMI channel mapping for multi-SSI mode
Date:   Wed, 15 Apr 2020 16:10:17 +0200
Message-ID: <20200415141017.384017-3-matthias.blankertz@cetitec.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
References: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.8.5.60]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B647460
X-Provags-ID: V03:K1:0bkCn+Y0mevlv5VttZgpahUL4dKGYZZLQ4y1vvto+7mMavfUh+o
 8JGMv4vZZjzQNhUrBFQ1NJ5bqdFYSn9yLfj6IZYnF4K8i4qGsq0671JsWt8ZgMT0qAUxb4z
 iUw86CuhTpzSWPug0kC7Q0uEs8W+bPnw8jGw4WrtSfdEmcfiMleogPsFKNQ4hDl/yXLkkxr
 6BjIqXo2hOtKSu7et7mCQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hIseBVQO+QY=:5enC21lnRILGCyitLuxCKO
 nrxFYTneYV5nnsqfjD3XwMp6PxensbaQmXS+TRUj+DDZx1mNUZq79Y1fvHyoKSbP2m19FnEHP
 6zXUVDRsQqEGYacWsUfhH23Q7c0NvdrOqXt8rxaw2abJyCuk0lPAC/47lXBeUUoM9zjKs25FJ
 upZM8ldpICdQ016k6mxBhkMfhRUZTWvo8bLbLJOHaHDzatN+07BmMG9y51JUNZjuJGJINfO09
 Ma7hFf7tICJGVnGmuRJ2XjCku60J5xTvMrLJKALi2ibsdi5FQxSoWTJJf9Jm/QRCllWdOpWsg
 gWqGHgQ7+yLhbUBbwy9XK/RjsHd//91Y4hF25AYDqGt3P3CfdJBmO38Nf7Yz5HQLEyfmwUvCP
 NDNgRDPMKN8yLkusWQ8X1V3Y1VaUUJyYMB4a1FbVwgHf9j69k2DeFqwQmsrJGNlcLOJZOJGVz
 CX10xmcGqciw2n4Bne85zsNnbSS7cHXsywZMswGEfjtvEK4JI5Y2XNk1VVkPfxRQozW1eTLwD
 HT9w9yKiaKY45UMgLyeMACxRV/TXSLS4I1kKFUNeKpXGtREm9er+DyI1WXnPHQQVB84EBS4tI
 iGjqCsI8tzkhhx8OCi2HF1vuMz7BM9bwqiedyDgVH2lAPCpP+yFrwPFU4AK5PWkyJrTakQCYD
 LUVwmgahT4MguqYCGOu8QRxrob8UB3E+VFsY4uIGtet+W7FQTZ7lJpp41fvQxTUMgHuY1z6b8
 WhP3lng9zG6PIK2bvE37kDlTc+Y24oBDyKCYMTW5vb8obo4IYUvw7amdYKqaVO9a76pHDO15J
 v8xKATPopjrCRDaQo+CsP3Fwla3O5cdcA3WeikuDxsg1qD4oWww7aKv/KLuEVnhG2Bn6bCuI1
 1Ncz9Tm+FGLjw5Ke8AMg==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The HDMI?_SEL register maps up to four stereo SSI data lanes onto the
sdata[0..3] inputs of the HDMI output block. The upper half of the
register contains four blocks of 4 bits, with the most significant
controlling the sdata3 line and the least significant the sdata0 line.

The shift calculation has an off-by-one error, causing the parent SSI to
be mapped to sdata3, the first multi-SSI child to sdata0 and so forth.
As the parent SSI transmits the stereo L/R channels, and the HDMI core
expects it on the sdata0 line, this causes no audio to be output when
playing stereo audio on a multichannel capable HDMI out, and
multichannel audio has permutated channels.

Fix the shift calculation to map the parent SSI to sdata0, the first
child to sdata1 etc.

Signed-off-by: Matthias Blankertz <matthias.blankertz@cetitec.com>
---
 sound/soc/sh/rcar/ssiu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index f35d88211887..9c7c3e7539c9 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -221,7 +221,7 @@ static int rsnd_ssiu_init_gen2(struct rsnd_mod *mod,
 			i;
 
 		for_each_rsnd_mod_array(i, pos, io, rsnd_ssi_array) {
-			shift	= (i * 4) + 16;
+			shift	= (i * 4) + 20;
 			val	= (val & ~(0xF << shift)) |
 				rsnd_mod_id(pos) << shift;
 		}
-- 
2.26.0

