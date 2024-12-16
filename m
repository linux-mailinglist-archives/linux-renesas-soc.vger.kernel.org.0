Return-Path: <linux-renesas-soc+bounces-11355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861F9F2AD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 08:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46B95162916
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 07:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1FF1487F6;
	Mon, 16 Dec 2024 07:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="RoRWDaW8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470A21D358B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Dec 2024 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734333613; cv=none; b=VhmXLQxiHayJ2zJP8YenUn/Xycg/U0tsclOfjDLwo19L0O5PtzIW2PrndGssMU+Zto0AXPKY3lSly+0qlG92pWOERp4JtG41ePm4eK/LF4Mmn9rmTaJ951YFZBh21cBPKYjShk9Gldpk12jgxOnLKZDPtNk4Mv6++p5N5PlYhw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734333613; c=relaxed/simple;
	bh=2tnr8Bwh6X/FYoBAuSdjBG6lvqx9CRulw85LcMBiY9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W9UMJUIwHYnHbi/bXvajX9z0gmF7UQFbd2gtYiC4hrwcUz3ugFNYhyyyT2aGwoVeKWXuz1Rf7PVRhm/eUbMsgmSSgGZYzXXqQuM8oYSapNJMtQTmekC0STUymh+KRUOngjK7RPfLffsPPh6xZOlQHHpAx+J5X2eYiOl0OM1HH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=RoRWDaW8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a227b82so3664250e87.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Dec 2024 23:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734333610; x=1734938410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDorma76GwDfrQOXtmRW3Vi/QHYCkRM+JtP0H9DhWBY=;
        b=RoRWDaW8BhoHbU7XzolTUw8JLg7TxIbssoSsv0Ren3JnFgVrvuq2OxVCeRgaZGzkq1
         sTK9b3HdmP6nAP95n+UUOlwip8obpCJYGm7ZhovExFNBhxsxWTXzR+DkF385T8hZimyD
         H3y1xHEj7N6lLXD8rTgQpcmFruroFny3jb8HsOf0m8rSBhejyFWhdT9zqMEAfHZcst96
         RYzk2bfGLK1c0s2S8T+CmaCJ7nsfnkPvsTrmcr5cTkCWbmY1ieSuepVbO/ozxEYHu7/q
         CD1r/4+lISBwQJNAZaVU6zDJOGgL43s0TBSP1zvkkBvCsaqFN3vyqDwjZUIzyl9C3QEv
         CBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734333610; x=1734938410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDorma76GwDfrQOXtmRW3Vi/QHYCkRM+JtP0H9DhWBY=;
        b=Q0IRno6CZ2G81a29ZIOIoPTJwut0m59urN1L5+m9nE0idQGiEsLat9CgHWn7KMVy3/
         sGAblszmhPZQk2Y05hR7nrMJTmzLDUQObfgTfi9WAk52HI9IDlJ3zmfhdZsYtUINcmtg
         a29CvMY/k5z6BtiYl9BmUM86gQ6aMfQqlYVHhW/Bbg5ad3j+zPwzNvJrszJ01HEbHGMo
         xZyDWN4mZ3986bSyLR0//r7hSOG91mO8gU2mVdoNsJyiy5al2xC/0yj+81fVllPf4tjA
         gvzBFnLnJhSYw5uNYwNLP1mbNW9HVJn86xVH28jygkQ4tZCWl8Br9opyBNeGjSW16/C2
         15qA==
X-Forwarded-Encrypted: i=1; AJvYcCU7UXbZ9XgzHFv6hLyXfcuXOwnjXznhrLTSmCY1kYwiU0GlRuIi9iwIkKPKIuGzkIgSn/SwZlm4JgzKbCLnuKyz4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP3wNz+PVANrzsOSKuMZxJiBps0izEIJSSTFssJY3AfUlY+kI6
	1lo7wiA0ru3bSrGvuAnlF0qQ3xQDrP/giVFlmyEQLSaKuhzFFpzvIeM0Azy/lL0=
X-Gm-Gg: ASbGnctRuq2pBDqZwX3Ci/pHivINX5wXHhsGSHghccYm9xbQadiLa0OSWI48fdNWvE4
	KLGCnID1Rj8qjp5xsh6T+LASsTWW7X5ayoQCijfSdTXb4T5lsloc9Zkj54vACoBZNRIA1PsNXmv
	KErel8/JIUgwHuMktOUwUom6ddQ6ts9QYASebyNlyOhfo0r1tO768IgdF4btI5yK9Ivk+gNJuyE
	ff1OfChIr3+nuYwBIwjKoip71kPgho8BJ4lc9Xz0LugaOmq73b5QvMU01LWOxlx9TayziA=
X-Google-Smtp-Source: AGHT+IHopqkpGhBw9gHzXw4RFZJ8eHI7vJAH0G9GOleXtOF0VwnbcXx/A2P2rJLeqHcvXE4tjhMdyA==
X-Received: by 2002:a05:6512:2813:b0:53e:37df:6637 with SMTP id 2adb3069b0e04-540905618d0mr3129724e87.32.1734333610495;
        Sun, 15 Dec 2024 23:20:10 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9b2bsm748930e87.94.2024.12.15.23.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 23:20:10 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net-next v2 2/5] net: renesas: rswitch: use FIELD_PREP for remaining MPIC register fields
Date: Mon, 16 Dec 2024 12:19:54 +0500
Message-Id: <20241216071957.2587354-3-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216071957.2587354-1-nikita.yoush@cogentembedded.com>
References: <20241216071957.2587354-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fb9e6039c325 ("net: renesas: rswitch: fix initial MPIC register
setting") converted setting some MPIC fields to FIELD_PREP.

To keep common style, do the same with mii bus related fields of the
same register.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c |  5 +++--
 drivers/net/ethernet/renesas/rswitch.h | 10 ++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 12efee9f75d8..e1541a206687 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1164,8 +1164,9 @@ static void rswitch_rmac_setting(struct rswitch_etha *etha, const u8 *mac)
 
 static void rswitch_etha_enable_mii(struct rswitch_etha *etha)
 {
-	rswitch_modify(etha->addr, MPIC, MPIC_PSMCS_MASK | MPIC_PSMHT_MASK,
-		       MPIC_PSMCS(etha->psmcs) | MPIC_PSMHT(0x06));
+	rswitch_modify(etha->addr, MPIC, MPIC_PSMCS | MPIC_PSMHT,
+		       FIELD_PREP(MPIC_PSMCS, etha->psmcs) |
+		       FIELD_PREP(MPIC_PSMHT, 0x06));
 }
 
 static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 4b1489100330..78c0325cdf30 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -732,6 +732,8 @@ enum rswitch_etha_mode {
 #define MPIC_LSC_100M		1
 #define MPIC_LSC_1G		2
 #define MPIC_LSC_2_5G		3
+#define MPIC_PSMCS		GENMASK(22, 16)
+#define MPIC_PSMHT		GENMASK(26, 24)
 
 #define MDIO_READ_C45		0x03
 #define MDIO_WRITE_C45		0x01
@@ -747,14 +749,6 @@ enum rswitch_etha_mode {
 #define MMIS1_PRACS             BIT(0) /* Read */
 #define MMIS1_CLEAR_FLAGS       0xf
 
-#define MPIC_PSMCS_SHIFT	16
-#define MPIC_PSMCS_MASK		GENMASK(22, MPIC_PSMCS_SHIFT)
-#define MPIC_PSMCS(val)		((val) << MPIC_PSMCS_SHIFT)
-
-#define MPIC_PSMHT_SHIFT	24
-#define MPIC_PSMHT_MASK		GENMASK(26, MPIC_PSMHT_SHIFT)
-#define MPIC_PSMHT(val)		((val) << MPIC_PSMHT_SHIFT)
-
 #define MLVC_PLV		BIT(16)
 
 /* GWCA */
-- 
2.39.5


