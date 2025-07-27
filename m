Return-Path: <linux-renesas-soc+bounces-19704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD6DB13041
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Jul 2025 18:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF2C3B72A9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Jul 2025 16:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3451121C167;
	Sun, 27 Jul 2025 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhyTGruc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30688266A7;
	Sun, 27 Jul 2025 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753632459; cv=none; b=K8HdtTnvgWd1CWGTpnVgp0P1GTvYP/+RovYb96eYt6pQ9nnTxOj/uN8WwcnPB3dlVFVWmFpY27NjHk6q2sUXFAgGjhUlk6tsLg5O/52daAOPxfNmQ/WGNHMPsc/Cd3KRgdPcjHg0TOfhOr2Lipra2yalGzXJ8IiPifti+bVrMuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753632459; c=relaxed/simple;
	bh=pZWpIDRldAnhhur7e2jNcZxhW0QKMXgm3GjVpv451yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K947E7ZjqfcBV7VL1THI0jR/NQmWnV8OzYKClUQk7Bd4xsJ3rNC3Xdm5WiwN0Dq67Wi8uLj1ckAG24f0JWFrEfpPuxBOsH2E89UIcdUQFtdh9C6RsNlP7uilZgoGXBhuoiG8PYQMiX24ogCX1wXAUUqZWSiy+X+/oNt6JvjVmnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhyTGruc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b78310b296so395871f8f.2;
        Sun, 27 Jul 2025 09:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753632454; x=1754237254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnjbDis0A7bH/zvFm0vxLxf4ewSGzdHeQArTdwNiWjk=;
        b=IhyTGrucenLLpMVA3UJbkUjZl3CQU6EVPRneyAoDbzsaMytSguE2P0Z8dtY3MLcrxc
         1C7wyopNaGcVqv0Flc/MfK0pDXBw77lIprPrdOLAZE05QtJfWNWHD3PJfT/d04EJg/Bq
         vYaCye9T1esBuMtGipw3kI5QZV1fPgg1qZV0Yl2WTqilXIEkDAysgbLzdLcFpMdaIiRo
         qNBiorZ5mh9m88fh0awqPSvmIrbDumIm+aRrDHsUrrzFM3zgPhcVeGSdEBgsS7Vaxfcd
         omjhy22EFDjDXd+frQXGUMO9Ubz++WBALrOFAwK3ZDKWPH0h4yhQ3eNso389Tn9mROtN
         BWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753632454; x=1754237254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnjbDis0A7bH/zvFm0vxLxf4ewSGzdHeQArTdwNiWjk=;
        b=kSfuydZGwhDEz2x0ET7RczCTyv2JABqvPgWKvg836W7KvI1RW+7thR3ixjOPQMSajy
         u8HdXp/R6j9qkD70bD6oenMuC/JVQvV3HOE2CYFlL8gL+6Ve1xvEEZYrekRU2dqsHEJL
         gUgqvmkUhagSKRgGfeH+KYYjv5AL7Jjqbq8d5M7Akbhy7wsOX5Uya2Bb+X2HTktqRaIS
         uYkaatv8HR55ve9NAwOlrmQOw2QsW2RM5E3PRH//dRW7cHeeo6VC5TO92jr/0rNRjOBN
         aTmF7TOK38wKuTetVzwIAp48PCe85dHVIHaRji1eIHDesDWBdpilq0iAy4SMQc0wAhRb
         QenA==
X-Forwarded-Encrypted: i=1; AJvYcCUCuV0HjbgBabSdYmHKacPE8W6shsjJFd/oEb84UjW7vqDMr8CSprr8G6f2QNAnxm6CmFzunVwbOlCtRgM=@vger.kernel.org, AJvYcCUvExY2uHni/uvg3nehTBzNgKfKsMQkcUJIrk6H2o8sFt00RCGD7E//Wl+9/G0IyzImH/xg2TKJNfMT@vger.kernel.org, AJvYcCXSNmt+GmNYO028aVlcWA7v+bxg96HTvm+K2tpKkyEO78RuvUiKLYrTJGwt3aivzfaVjSoDk1GbWp8m7uq+kwWnctQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0W/p7+SutLGYwNK8o/GPsqJuEfcF/wqZ5l59URQRqKo82cIZp
	poBTwnVTwTFWNvM6JVWWaa3fHOr7ggwGpfaCrWPrRPO3QjPmlcA28A+m
X-Gm-Gg: ASbGncsWVB2kZuIusrM/b2W/io6K7RMjccfnldo6299y1WHRyYj7NESqHACE5QFvV6T
	Ejh/CM7eW/WUg9GLEMj8dLecGIAOFe64/QVU7Og2llUcUn6C0PUxnVd83x9cMaxv4WTD0tqHNxI
	RtmjiRBBAHfYCVTXNpqoVTjfFMWE6ys0GW/dRYPnvRRA8BC2JqkaQeOnZ8roaD7oU2/XHdeJsbN
	X5KAQ2PSQmZPV+YBrGpMUXh7Mdi8n/hna1dn1NeGrmH0DH7nzQCykyeATbjHS3KL4eRuL+FiTC0
	qYdcmlQa2BMNCukEY9rir+8vBhigKh4dWE4aWAxiAuw07WoMPx7QuOAjRluODlfPVvIeGuDrQt+
	m+737FwiCPrw7uEZUHmjtXnRAMqMdYkP6NefCyLoZBa0qDNNAm4KLXjy6d4zrK+Q9+gcsDg09lQ
	==
X-Google-Smtp-Source: AGHT+IFv3lDskrmiFS760M9ZMDxE+kSMi9bS/qb0qGA1+h59OgvGSDucbPWlk6AmfK86FSqdOIPdxw==
X-Received: by 2002:a05:6000:310a:b0:3b5:e6bf:5e0c with SMTP id ffacd0b85a97d-3b77675b7b6mr5718194f8f.31.1753632454109;
        Sun, 27 Jul 2025 09:07:34 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586ec63d29sm107788615e9.1.2025.07.27.09.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:07:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] mmc: tmio: Add 64-bit read/write support for SD_BUF0 in polling mode
Date: Sun, 27 Jul 2025 17:07:26 +0100
Message-ID: <20250727160731.106312-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727160731.106312-1-biju.das.jz@bp.renesas.com>
References: <20250727160731.106312-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 bytes.
During testing it is found that, if the DMA buffer is not aligned to 128
bit it fallback to PIO mode. In such cases, 64-bit access is much more
efficient than the current 16-bit.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFT->v2:
 * Collected tags
 * Fixed the buid error reported by the bot by guarding the code with
   CONFIG_64BIT.
---
 drivers/mmc/host/tmio_mmc.h        | 14 +++++++++++++
 drivers/mmc/host/tmio_mmc_core.c   | 33 ++++++++++++++++++++++++++++++
 include/linux/platform_data/tmio.h |  3 +++
 3 files changed, 50 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index d730b7633ae1..8cf9be9833b2 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -242,6 +242,20 @@ static inline void sd_ctrl_read32_rep(struct tmio_mmc_host *host, int addr,
 	ioread32_rep(host->ctl + (addr << host->bus_shift), buf, count);
 }
 
+#ifdef CONFIG_64BIT
+static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, int addr,
+				      u64 *buf, int count)
+{
+	ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
+}
+
+static inline void sd_ctrl_write64_rep(struct tmio_mmc_host *host, int addr,
+				       const u64 *buf, int count)
+{
+	iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
+}
+#endif
+
 static inline void sd_ctrl_write16(struct tmio_mmc_host *host, int addr,
 				   u16 val)
 {
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 21c2f9095bac..775e0d9353d5 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -349,6 +349,39 @@ static void tmio_mmc_transfer_data(struct tmio_mmc_host *host,
 	/*
 	 * Transfer the data
 	 */
+#ifdef CONFIG_64BIT
+	if (host->pdata->flags & TMIO_MMC_64BIT_DATA_PORT) {
+		u64 *buf64 = (u64 *)buf;
+		u64 data = 0;
+
+		if (count >= 8) {
+			if (is_read)
+				sd_ctrl_read64_rep(host, CTL_SD_DATA_PORT,
+						   buf64, count >> 3);
+			else
+				sd_ctrl_write64_rep(host, CTL_SD_DATA_PORT,
+						    buf64, count >> 3);
+		}
+
+		/* if count was multiple of 8 */
+		if (!(count & 0x7))
+			return;
+
+		buf64 += count >> 3;
+		count %= 8;
+
+		if (is_read) {
+			sd_ctrl_read64_rep(host, CTL_SD_DATA_PORT, &data, 1);
+			memcpy(buf64, &data, count);
+		} else {
+			memcpy(&data, buf64, count);
+			sd_ctrl_write64_rep(host, CTL_SD_DATA_PORT, &data, 1);
+		}
+
+		return;
+	}
+#endif
+
 	if (host->pdata->flags & TMIO_MMC_32BIT_DATA_PORT) {
 		u32 data = 0;
 		u32 *buf32 = (u32 *)buf;
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index b060124ba1ae..426291713b83 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -47,6 +47,9 @@
 /* Some controllers have a CBSY bit */
 #define TMIO_MMC_HAVE_CBSY		BIT(11)
 
+/* Some controllers have a 64-bit wide data port register */
+#define TMIO_MMC_64BIT_DATA_PORT	BIT(12)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0


