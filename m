Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8105259217
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 17:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbgIAPDC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 11:03:02 -0400
Received: from www.zeus03.de ([194.117.254.33]:44214 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728316AbgIAPC5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 11:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=x5ApOR9vsduDWw
        9fCU1OFOYZBAfeB9wFp6Hb97geXIY=; b=1j9gQM6knyzNKlId+p7WOeEADc2kMB
        DACyEM/iVFFcG/ar21qlYHM6fEQNcWLuzXfdoE3Gn3gHeEe5HjtnG6K45xlrLV3O
        YYqdSm3dOXJHRO6gi02SWcy2roAcZFsQle39YDqoCja+4EyQucS22cPMd+9FWMWU
        WqRh+hjr5xJas=
Received: (qmail 2554205 invoked from network); 1 Sep 2020 17:02:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2020 17:02:55 +0200
X-UD-Smtp-Session: l3s3148p1@9U1k0EGuXowgAwDPXxBIAL7SzoTwUEK2
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/4] mmc: core: add a 'doing_init_tune' flag and a 'mmc_doing_tune' helper
Date:   Tue,  1 Sep 2020 17:02:48 +0200
Message-Id: <20200901150250.26236-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200901150250.26236-1-wsa+renesas@sang-engineering.com>
References: <20200901150250.26236-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Our driver needs to know when tuning is in progress. 'doing_retune' only
covers re-tuning, not the initial tuning. Add another flag to detect the
initial tuning state and add a helper which tells us if any kind of
tuning is going on. Only implemented for MMC currently because that's
where we need it. SD can be added later if it becomes necessary.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/mmc.c   | 4 ++++
 include/linux/mmc/host.h | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index ba2852b684b1..216bd1aed373 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1763,6 +1763,8 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 		goto free_card;
 
 	if (mmc_card_hs200(card)) {
+		host->doing_init_tune = 1;
+
 		err = mmc_hs200_tuning(card);
 		if (err)
 			goto free_card;
@@ -1770,6 +1772,8 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 		err = mmc_select_hs400(card);
 		if (err)
 			goto free_card;
+
+		host->doing_init_tune = 0;
 	} else if (!mmc_card_hs400es(card)) {
 		/* Select the desired bus width optionally */
 		err = mmc_select_bus_width(card);
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 799e23b0a23c..c079b932330f 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -400,6 +400,7 @@ struct mmc_host {
 	unsigned int		use_spi_crc:1;
 	unsigned int		claimed:1;	/* host exclusively claimed */
 	unsigned int		bus_dead:1;	/* bus has been released */
+	unsigned int		doing_init_tune:1; /* initial tuning in progress */
 	unsigned int		can_retune:1;	/* re-tuning can be used */
 	unsigned int		doing_retune:1;	/* re-tuning in progress */
 	unsigned int		retune_now:1;	/* do re-tuning at next req */
@@ -595,6 +596,11 @@ static inline bool mmc_doing_retune(struct mmc_host *host)
 	return host->doing_retune == 1;
 }
 
+static inline bool mmc_doing_tune(struct mmc_host *host)
+{
+	return host->doing_retune == 1 || host->doing_init_tune == 1;
+}
+
 static inline enum dma_data_direction mmc_get_dma_dir(struct mmc_data *data)
 {
 	return data->flags & MMC_DATA_WRITE ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
-- 
2.20.1

