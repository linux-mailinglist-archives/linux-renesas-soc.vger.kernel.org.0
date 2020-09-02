Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B15225A79E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 10:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIBIS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 04:18:27 -0400
Received: from www.zeus03.de ([194.117.254.33]:39454 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726355AbgIBISW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 04:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Uuyk9WpogQlzQ9
        IW/RZEzaeJ50UDsHYdwzYclpjd17Q=; b=UItV0Ydv+8YMWME6Ru4SMk/Crr9Kbf
        iUBQ4xcwSjGTIeUTChLnDvuV5L+kMGfhBR3Fj+yEHhyJDjXq1CUt7NtOCnoZMGnN
        cip+9oAR0caOB5TAk3AOjDdBZnwo6EW3CKISP31L0E6dNobAEg55uBSmXnGibmql
        asSX14yzMHdu0=
Received: (qmail 2768733 invoked from network); 2 Sep 2020 10:18:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Sep 2020 10:18:20 +0200
X-UD-Smtp-Session: l3s3148p1@Zv1IR1CuJs0gAwDPXwgJAIvFhnYIE9zj
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] mmc: tmio: add generic hook to fixup after a completed request
Date:   Wed,  2 Sep 2020 10:18:11 +0200
Message-Id: <20200902081812.1591-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200902081812.1591-1-wsa+renesas@sang-engineering.com>
References: <20200902081812.1591-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sadly, due to HW bugs, we need a callback to work around issues just
before completing the request.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc.h      | 1 +
 drivers/mmc/host/tmio_mmc_core.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 51b5f388f6d8..9546e542619c 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -179,6 +179,7 @@ struct tmio_mmc_host {
 	int (*write16_hook)(struct tmio_mmc_host *host, int addr);
 	void (*reset)(struct tmio_mmc_host *host);
 	bool (*check_retune)(struct tmio_mmc_host *host);
+	void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 
 	void (*prepare_hs400_tuning)(struct tmio_mmc_host *host);
 	void (*hs400_downgrade)(struct tmio_mmc_host *host);
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 0f266cbf82b8..2fce0518632d 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -809,6 +809,9 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 		return;
 	}
 
+	if (host->fixup_request)
+		host->fixup_request(host, mrq);
+
 	mmc_request_done(host->mmc, mrq);
 }
 
-- 
2.20.1

