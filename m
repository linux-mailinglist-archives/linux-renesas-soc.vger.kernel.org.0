Return-Path: <linux-renesas-soc+bounces-34930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VQ1eJntcT2rDfAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:31:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C4A72E504
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:31:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VD3rv0qs;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14F1F303B9E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 08:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4FC3F4127;
	Thu,  9 Jul 2026 08:31:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F23F1AD5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:31:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585878; cv=none; b=ZRinXw6KSyR3WUJ/bYooKTwVZidIrZ6zxQOmBTuYeA6FISRn9MpU2LM1XShYgn2itK1P8A8L4YzIMmKa3M04yRrqn8QKJn1WNwyJOxFAe+hADuKIAlY9tWTku9eBUTLYRl/zddflTegqX4PrV2Tak4Wvsiqm1uo/51iOicpVR38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585878; c=relaxed/simple;
	bh=mCtzdIHDapXvf4g/fe++MaSF/aACWWTUL5RnQUooM8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NzJdeZx6J8gcG9esz2RfITbyD5TsZb0YvA3xmA1TiJGuxe5MljGeG4sk9+o/qh8AQwUUpUGm6GcDkFOLWFEjvGizgayPnTz9ezqjSs62HYYcUJ0gNnnaEw74FKDddpdiNk4Tn2ps8EyKalJtP/fEvfI4opK9fNP+KfPxoeu7Bkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD3rv0qs; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1494423f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585875; x=1784190675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nyNRV7QcFyGnKa8fwRiCznyRGL3L2G6gLSo6b8sYAT4=;
        b=VD3rv0qsy8pf0/E5vJCswzPv36TnzZUabXzt68I686Wc2n7JWW07QjRicDWPYYzeaB
         di6pdkzDzY2WUpADrv+NQk3Um9Su8lliKfmHoFjgTxe9uGxq5kYDdzn5xumskF+n5n0P
         VwsQ7QugRmwlCqSQTXrO3qyEsGIaS2vzdfpgbRjYhVV2Jks4JCgOAPiilaMRczmQf43d
         94yqWaKKkVdQ3827tguzJdKDEOkGFUTJy5qIMsXMKjo2ec00LzaRSLDfBUyaAgdFf9lc
         Bpnhmqy7bIFRvfVflzItuNTy2hG9kENsVhSGLfp8oLtoz7+5ugBKhTV+HwUwQyuntQ56
         z6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585875; x=1784190675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nyNRV7QcFyGnKa8fwRiCznyRGL3L2G6gLSo6b8sYAT4=;
        b=rQ4HPPFJ6hjWR2kZGG2ZLYNlzQh/1f7hJ737V18AlsHpQjAxi5G0UruUvhXKGPMGEd
         68BcvilLxyYKlbMW0GtiqTgW+oaZjuiVlgzEROwjpoHAosR4ttQJlHF648ya/QiEQM8g
         d9xvh6NhL1YYcatAmpyQNR9YTK2J/Xyf4sJanloQPNYkNWseUX3clLKPCB38RbveZ3Vh
         V4pJVZZPMKXF7KmSgGNS8A5U3xrhWb99CnrtqpEeukJpOwDYmff4qZw0jp2TiSlvYa5F
         sBKAX1rwVIh5Y2iRoC/i+RcYj28JKLJe039JCg9GnxLWel15S3U/hG4NpvlTcMrNcp2h
         Kf8w==
X-Forwarded-Encrypted: i=1; AHgh+Rre3EikicwDgg2/D47nDMbyqCWrGGOzfnUaWCcueaJz7eIUnu6+pmg1R6Do+uXdVn+IpOXbpSaEIididssQYWuniQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJzu+9JQA+fTBEtLRCQb8XbBlLPotQubPsya6xjW6i092YHE2T
	DUCgN6fSduYe+salrBIcP8fUf0fswZCaW+3ej07cyaJO3pEq8L0nzTcS
X-Gm-Gg: AfdE7ckOTldmumaoaMDmtHUKU+eyufliXRcoAeXtfPa3yVj1oTOZmYr1fCH8POF3Gw4
	kAzlytRJSk/BVa7YogfjEQb06CszemfMH1QqmroseZKSQ9adrbeh3l56fxWD6nUx1YI8a4DEVCc
	HYKYBM46K8f7rJnrwvZOfaP2UjUMsFm0meNHqgZhLRV9QsajVtSphKWThpKminkipNtKcjzlKLQ
	chhCi0zZeAi0UYZTNtrunvRd3Sb98GRNOapqmxGsvsUT3Gugm7m48U0HsD8x/e5ezDEdeDwY/JO
	Obkgy52Slq1VufthphqE71cy24aZY0DPUoNbc96GC+wL3mJZaue+gpJT01ttXLu4mK8JBXYXPHR
	jxEHVUdHLXYHnSaGGPAV9DDJx6GXFU1ga4sxfgF3kwkTDbC2NCXvUGw+WC62XCrRpNJzJrWJ7cX
	Wv5IgAOF5SoX4MKhIGFGVg
X-Received: by 2002:a5d:64e8:0:b0:46d:d6e0:9cc8 with SMTP id ffacd0b85a97d-47df07979abmr6089508f8f.46.1783585874856;
        Thu, 09 Jul 2026 01:31:14 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 6/9] phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
Date: Thu,  9 Jul 2026 09:30:59 +0100
Message-ID: <20260709083108.108370-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34930-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,vger.kernel.org,lists.infradead.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42C4A72E504

From: Biju Das <biju.das.jz@bp.renesas.com>

Add renesas,usb2-phy-r9a08g046 to the OF match table, reusing
rz_g3s_phy_usb2_data as the PHY configuration is shared with RZ/G3S.

While the PHY data is shared, RZ/G3L differs from RZ/G3S in that it has
two OTG controllers, OTG interrupts on port 2, and a controllable
OTG_PERI bit in COMMCTRL for host/device switching on the port 2 USB
controller, which is fixed to host-only on RZ/G3S.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9a45d840efeb..d06fb52ed5f1 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -721,6 +721,10 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 		.compatible = "renesas,usb2-phy-r9a08g045",
 		.data = &rz_g3s_phy_usb2_data,
 	},
+	{
+		.compatible = "renesas,usb2-phy-r9a08g046",
+		.data = &rz_g3s_phy_usb2_data,
+	},
 	{
 		.compatible = "renesas,usb2-phy-r9a09g057",
 		.data = &rz_v2h_phy_usb2_data,
-- 
2.43.0


