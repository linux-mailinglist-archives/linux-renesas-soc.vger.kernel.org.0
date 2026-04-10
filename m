Return-Path: <linux-renesas-soc+bounces-31153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMBUDVQn2WkPmwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:37:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D38393DA7A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E6223026606
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336D63DEAF8;
	Fri, 10 Apr 2026 16:36:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72033DDDD9;
	Fri, 10 Apr 2026 16:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839005; cv=none; b=p/FxzjbfWFmz0TWfMGVrO2RoZ1VeAJurETysZs3Hkk76gCwga6eBorrZ5JfXJQrWlcHEEia1Q2AboVgqhpzqJmpqRAsbJt0xawsMK5E90KYyHMuELjWxbtPn63QloyNUzxPpD0a2EAKulNRzPut/PvjJI66TkFocgARWlpqK0Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839005; c=relaxed/simple;
	bh=sufVuvNQinHIAexUa5MPTsuAmyuW3dk6GU8kl9oUA8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhuetSnoi4jEzFr7foO7kLj0yU7+7TbbQhbL3LdOgYBfsK9HLoTjvbJbnO+cP6NB3edqz4Qq3kFW1KkgmBfN2mCJpIpgUJdlQzIAxEd2P8Bugka4Rdc4dzz4kmAzUWllw5HGTkmPkXz1T0NRgbLic3w7Gf5chaEdB6hmN6hAZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: GeagbUUMS5eEFNX3ujPp0Q==
X-CSE-MsgGUID: zhNL1ewLRxGICuMZmBRUHA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Apr 2026 01:36:42 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.85])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1DAEB400CD4E;
	Sat, 11 Apr 2026 01:36:36 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 03/10] mfd: rz-mtu3: use device-managed mfd_add_devices()
Date: Fri, 10 Apr 2026 19:35:23 +0300
Message-ID: <20260410163530.383818-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31153-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D38393DA7A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace mfd_add_devices() and the custom cleanup action with
devm_mfd_add_devices().

Remove the ret variable as it is now unused.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * no changes

 drivers/mfd/rz-mtu3.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 6b9c6831dffa9..3be6f6c900b82 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -300,11 +300,6 @@ void rz_mtu3_disable(struct rz_mtu3_channel *ch)
 }
 EXPORT_SYMBOL_GPL(rz_mtu3_disable);
 
-static void rz_mtu3_mfd_remove(void *data)
-{
-	mfd_remove_devices(data);
-}
-
 static const struct mfd_cell rz_mtu3_devs[] = {
 	{
 		.name = "rz-mtu3-counter",
@@ -320,7 +315,6 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 	struct rz_mtu3_priv *priv;
 	struct rz_mtu3 *ddata;
 	unsigned int i;
-	int ret;
 
 	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
@@ -353,13 +347,8 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 		mutex_init(&ddata->channels[i].lock);
 	}
 
-	ret = mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
-			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
-	if (ret < 0)
-		return ret;
-
-	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_mfd_remove,
-					&pdev->dev);
+	return devm_mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
+				    ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
 }
 
 static const struct of_device_id rz_mtu3_of_match[] = {
-- 
2.53.0

