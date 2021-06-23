Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0B33B17BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 12:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhFWKIJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 06:08:09 -0400
Received: from www.zeus03.de ([194.117.254.33]:52736 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230308AbhFWKIE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 06:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=kabrVEEGJjYBrBwnvILlfntoSEJ
        wnZfugr2rpyGl6Ew=; b=KPfcIVCU03B9ALfeG+OtNa+BGxTrwf667War+Mh1e6V
        EG46BpFXhjCrXfSXZfRn/3WIpT3w+Bu1vsRXuMq4ut2WpsXF91NYyAoR5xHZWO9D
        wYQqNyVW6x5jkg1gn1KS+LGZNxj5BJnW4w4Am07ds+C0gps+WTSG2glU4W92KPuU
        =
Received: (qmail 2554623 invoked from network); 23 Jun 2021 12:05:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 12:05:46 +0200
X-UD-Smtp-Session: l3s3148p1@rRDRDGzFJKogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     alsa-devel@alsa-project.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: [PATCH RFC] ASoC: sh: rcar: dma: : use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 12:05:45 +0200
Message-Id: <20210623100545.3926-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Here, we want dmaengine_terminate_sync()
because there is no other synchronization code in the driver to handle
an async case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Morimoto-san, can you please double check if this works. I don't know
this driver very well. Thank you!

 sound/soc/sh/rcar/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 95aa26d62e4f..d1b46057df9e 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -101,7 +101,7 @@ static int rsnd_dmaen_stop(struct rsnd_mod *mod,
 	struct rsnd_dmaen *dmaen = rsnd_dma_to_dmaen(dma);
 
 	if (dmaen->chan)
-		dmaengine_terminate_all(dmaen->chan);
+		dmaengine_terminate_sync(dmaen->chan);
 
 	return 0;
 }
-- 
2.30.2

