Return-Path: <linux-renesas-soc+bounces-19791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EADB164F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 18:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 501E856279A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 16:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22F22DFF18;
	Wed, 30 Jul 2025 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6ucEYV+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4871519A6;
	Wed, 30 Jul 2025 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753893986; cv=none; b=sV0nIp+e3YoqhVTAaeYrxshQzYFWd7ABgiBgtSS5hmvF+RdYNN8Uv2kbDz4372Bz6z0+7uL8ggJjh9Klv7WT8+56Z8JpJWaGzWcI+Hgg+jtqdUMxtdwOocgsCfvdNtMzDkR23AP0iaiKpCmTntyNeGdgdOEw9aAt1B+PZqsZC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753893986; c=relaxed/simple;
	bh=EjRCe9TzR7mz1orMxx4GsZ+3e23eBbGyORO8sCaOQpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ekbZfmWwrhcsOuUvrKvfpAKZ+dhXvUEwZi/JORNDpxF+dp1thPiSFyYNpJA6H8MC5r3fCbZaZfq0e19Os4A8IFbhTEHjUz53NV+1PRJUkvUDfq+RIAUkVWVbFopR2wV+OdjccAHl2+cNbvl0SjqKjUbvrCQ4IgXc/5C7WpottdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6ucEYV+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b782cca9a0so18049f8f.1;
        Wed, 30 Jul 2025 09:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753893981; x=1754498781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJ/KOmEAJGaa8yiexDBcg6kmLxp6y9bxzKt4TIYBTAU=;
        b=C6ucEYV+3zFfiOa7jx2pgyu24dXHEfCV+7qjc4puPK8DVnOR2o1BZ3NNP1JQrdNVfp
         s3TzRNcaFJcfaQ4NJABcGM/fqEoMX29Ba5bEmSlrEoVEvDfqlowXTI6VM1GKRGGOooqY
         z8uVFIUWcRoL/cXlG4pXS73J0MOgP45SXUeUxykhkPvXHC5CFneAZvdMAd3Zwd8EbgPJ
         dBx4+l+3wLPIRQ12n5h2SYnLDOOGyCi/AeHy3fQOyPlz9Nvt+FRhglhGgrsGPzTep0BQ
         ABYHTyZ3CrR1B4qwznKMgKTMeZZitrcEHr4hpqylzgNk9I/Z43kIAQG2y2862iqa7uvM
         yswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753893981; x=1754498781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJ/KOmEAJGaa8yiexDBcg6kmLxp6y9bxzKt4TIYBTAU=;
        b=Z21ft0khjcXE6HK2Ae1zbsp2/XzRJ5YBwBzHPHqbGI/Hgca1SB5axMwO1dezIY3kQ4
         QiPLhFiRRZPf2wHtXIysjPHS6/qxdgi2emfe11muaQDsJqX3RPjwmyLQQS7U47/dwSKo
         vT3omJx9z7191UyDQiqrjdyFEn3cg1m/qW2bHLoiAb2i3OTyYQv+KDNJV6isofEeg9kH
         uqGH2WXzmQGtw+dD9J7gc5Bb6suraai7LDz/nsMjkOrWTsSuxlh7qUmkPsRbuw+7AU3J
         7PnO7C9IWYllfdEYwvc1DzKgwKqI8OvgMFlluP1jcS/QF1Mt3oY5ztcb/W+7GmWAlS8S
         4KIA==
X-Forwarded-Encrypted: i=1; AJvYcCUAXj9O13cT7u58sCX++akfs9Alvduq4loFrE/45Um8sz5oJtyj4UL/sQGOvJB8QlMd3RCt7Eik1Ema3Kc=@vger.kernel.org, AJvYcCUBppF3OpwBuAgesaF+uk11R3Lf3VRMI2CNMTRnLbH0Rg27Afc4RHY39i4MfHQDl9/69yMJJfP572SfhPA+fobaQkg=@vger.kernel.org, AJvYcCUuCE4CfxfiYYCKbNDL/ihUAu0fYOL7B718/KbR/wLEUTQ6sSK2RzlmnRdogJd+USaq7DeHMn4uPMiJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7//chuzqtg12DFcv0jsjPYGyR4+UJf1aGT1X1PA4a2OnHXyOb
	FUYaVVO1OGQtEXYcOTLtB79iA6zr5a7vv4iqVpxxFnZYoSSl5z53/f5l
X-Gm-Gg: ASbGncs+k7C88zEMhczvYdqg18bMajDEvtTXkssGMgzjGYfBOpTc+t3VA/uJg4NHHDw
	jzmEyCWcuGLtyShUP5fDZHvWgQ0oJkQGEyFjMuUUXuBHf//4QQpM9u1lDeL67WDmlxusUt11cvT
	T5sL46ERiKG+Lk3ZjIve9yrWwwoC8y0xqz3yaq6bc4eMC+L4DmTkqc7Ztgam7ZlRU6DovLjb0Mr
	HGwPPTuKCP2Lv/IdC4RXTudG2jBIU7BFJh2W1CYBZCsOW7Zdwu7ZT0Jirq6RGRyhgdPEBsJSsPW
	iRUKOhvmGWMrmN3eOWx0Vt7h/u7ipM9GYaSIYiCLHUJu9Nl1KTxUI9piqmsfyWVbvezl7dm5ojR
	1pAU94W7bWDWq045AJOhDevxhvuac1IJVVDzQen9T2rrNwn+CBSIKt/DWxMMvlbUjbewDBPYBMi
	t/ruK4rlFv
X-Google-Smtp-Source: AGHT+IG1L3AA+ygkfk/RkI2u9ewuhFBvAEZn8yYlFViwKd6a8NiEfEStxZxeznYflIsUVG8WUe9m5g==
X-Received: by 2002:a05:6000:1886:b0:3b7:9a31:2a10 with SMTP id ffacd0b85a97d-3b79a312c5bmr992848f8f.41.1753893981301;
        Wed, 30 Jul 2025 09:46:21 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78ba267e3sm8564042f8f.59.2025.07.30.09.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 09:46:21 -0700 (PDT)
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
Subject: [PATCH v3 1/2] mmc: tmio: Add 64-bit read/write support for SD_BUF0 in polling mode
Date: Wed, 30 Jul 2025 17:46:14 +0100
Message-ID: <20250730164618.233117-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
References: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * Added header file linux/io.h
 * Replaced io{read,write}64_rep->{read,write}sq to fix the build error
   reported by the bot.
RFT->v2:
 * Collected tags
 * Fixed the build error reported by the bot by guarding the code with
   CONFIG_64BIT.
---
 drivers/mmc/host/tmio_mmc.h        | 15 ++++++++++++++
 drivers/mmc/host/tmio_mmc_core.c   | 33 ++++++++++++++++++++++++++++++
 include/linux/platform_data/tmio.h |  3 +++
 3 files changed, 51 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index d730b7633ae1..c8cdb1c0722e 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -16,6 +16,7 @@
 
 #include <linux/dmaengine.h>
 #include <linux/highmem.h>
+#include <linux/io.h>
 #include <linux/mutex.h>
 #include <linux/pagemap.h>
 #include <linux/scatterlist.h>
@@ -242,6 +243,20 @@ static inline void sd_ctrl_read32_rep(struct tmio_mmc_host *host, int addr,
 	ioread32_rep(host->ctl + (addr << host->bus_shift), buf, count);
 }
 
+#ifdef CONFIG_64BIT
+static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, int addr,
+				      u64 *buf, int count)
+{
+	readsq(host->ctl + (addr << host->bus_shift), buf, count);
+}
+
+static inline void sd_ctrl_write64_rep(struct tmio_mmc_host *host, int addr,
+				       const u64 *buf, int count)
+{
+	writesq(host->ctl + (addr << host->bus_shift), buf, count);
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


