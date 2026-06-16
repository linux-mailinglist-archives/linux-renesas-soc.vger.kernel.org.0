Return-Path: <linux-renesas-soc+bounces-34070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JldCKgIqMWoAdAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:48:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3342268E746
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:48:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jXmxQpMm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3F903194857
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 10:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20D842EEC7;
	Tue, 16 Jun 2026 10:45:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E37A438FF7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606718; cv=none; b=hxWbkuFtJX6viU6uv0Gz9R+PDoRGXuMOt2huhOfTN7HCpKbxndlEMoxyGTshjKty9+KyFGuBAWPClPY0X5Qk0Gs1LbxG/2yWD1Xf2i1ZId0hvam91+Ir341u8MsEZYvC4q1jBAp5VQYnrRmPHVU5tuG0bQfkocRS5X62jYYnSAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606718; c=relaxed/simple;
	bh=dGGROEN7QcENZQr73SEQI+mm4aaCBJCZZCDhA3jl3Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4wsRrngfgro+FJJ29DTpwOn4Vw8Wu1/uzDfOcL3jjwaW4ydeZcj2qbQXeP22zVzX6GHWu3JYbcWSGGcW42gKM/1BITNzGgwP/VUlbqvK4KXcrefnYXHhGsmlM56le5wQDcM2ftuP/zC+qdZYN+ROEBmJvpU5a3Z/B57hRU5Ovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXmxQpMm; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b64c8311so43453395e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606711; x=1782211511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YF/Sp3s2vZvjqvWbtmfXpsR2PoIW2DUzGMC5qIcCdA=;
        b=jXmxQpMms4ApzE+nTJJ0ehz8U117uGrxt/92FwdgS4hT9xESfEwooB3rnWPdTfRLLK
         T6bb3A+fp6sBSsfLHAYpz0peHj7hlEGY4RZozpkgxBRFBajgF3+Ob3Dxl3j3qRauLWUx
         hh5g51ufVVvRgR5VMFcitFy7biqk6dfTAGak42oQnR2WFZS2xt6waWO/6sCJjgUe3Nuq
         LJ6SrbgLsC82ai+m8hrKHjCx33Eus94vdGYXv6um1u+J/OOrzhPYavV71jBozbN1amq8
         0EvFMk4wRT3o/5NAsLAUP2861HghNrih8gM3d6bqS1FxgWR2Jkku9EuxkYeCwbip3+xZ
         SeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606711; x=1782211511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5YF/Sp3s2vZvjqvWbtmfXpsR2PoIW2DUzGMC5qIcCdA=;
        b=iKe1OXkMyHFVIObaQ3fW+sJLE/F90XK5L2EhGZCXve3rYff/pYCq+bpUtPAaDjeIUA
         rwuZU+4PPW7/enPZC3ndyj1IBbTiYTXuVVogn46O7K+BQYFsmc5ya45lrV5CUweOx9Nw
         nSgOGE2KbfuE/ya4Oj5Qy4KdDXxWkSgT9vzRkIyqk/d1hP64SyLMcI9om8mYwC1z4SED
         mHsrBTqAnzakzW9veGr600XcLVnF3qMQOtW4lGBEmqwJKzcqRnGDnTzzD/wqvrlclYQ3
         +yzjfbAWbjZdiTS2YA7J1VubB7H9Eo+5ubuRE2BxYCDWyl8FuwVVoNOmEEPZ4VmHtHrP
         d1CA==
X-Forwarded-Encrypted: i=1; AFNElJ9mExb0AzRyzDP27ZlAhA8lhC7FKCto8GuzKmOJ6WFHJxcGuFZ8TEFWNC9LCiDuaYAdyTZCQ5caRvoBkY6GSpKV1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ2fhqsyIIj4iR4wkqV/8Cno/iWqGY7UDBlV5Mp8W0kg6VIHRu
	ZmQk3yOxTeLNKHr2OvlHKXPbDVHOXoo6LrWJUWYkPARkfv7Kwb6XAXcT
X-Gm-Gg: Acq92OHtMNC+MpKhBfvVreVOSrvJWIpwlRgSubg53PJxXx4xYqlhwbhRcXGm1HIK/8c
	ihoBCcN6f/ScfKsPFfV+p0c52pAPQsBeOgV6QF5JhiqHD5czUWt7SWNhCb80EJH+dLGfzW+Lq45
	pqryqqjNs/jk47PjwUhwQYhXRjCO0CcFljU/EXHtArYGg+MwWB44yBI+CjynqIFeW+6ze8vYoQ5
	pAENqqCd0LJouBwKeJSI97dCIgQnr86U8sCFM5BEblC1WM84ysyN38nTSSV7Fj0cDs0FajQHabK
	xGVhEEfbX7YzYUh5W6eafmnQPqdNtPfyJYlL0QQQYe7oyBmpkpyd6Q28cUwmdmR0FGt9SsFpNNZ
	GMCyXUkcqeYgcTWgQxwgS8xlUlgbgyv7MJzMQdvpFvf2KRpnlHp9HORUirFWMjxThbw3XHIb7he
	EWj2wR3nyQe2M6ql/HtQh5yXQwMZPXyie6+t3+4JxWxukj9FSM
X-Received: by 2002:a05:600c:3490:b0:492:324b:dc66 with SMTP id 5b1f17b1804b1-492324bdc83mr9063035e9.5.1781606710315;
        Tue, 16 Jun 2026 03:45:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 08/10] phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
Date: Tue, 16 Jun 2026 11:44:50 +0100
Message-ID: <20260616104459.410743-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34070-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,pengutronix.de,vger.kernel.org,lists.infradead.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3342268E746

From: Biju Das <biju.das.jz@bp.renesas.com>

devm_regulator_get_exclusive() initialises the regulator with
enable_count = 1, requiring the consumer to disable it before release.

The devm disable action was previously only registered when the caller
explicitly requested enable, so when the regulator was left in its initial
enabled state without an explicit enable call, the cleanup path skipped
decrementing enable_count, triggering a WARN_ON during regulator
release on device removal.

Fix this by always registering the devm disable action based on the actual
enabled state via regulator_is_enabled(), regardless of whether the
caller requested an explicit enable. This covers both the explicitly-enabled
case and the initial state set by devm_regulator_get_exclusive().

Fixes: 24843404efe4 ("phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d06fb52ed5f1..ef38c3b365d4 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -905,15 +905,17 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
 	if (IS_ERR(channel->vbus))
 		return PTR_ERR(channel->vbus);
 
-	if (!enable)
-		return 0;
+	if (enable) {
+		ret = regulator_enable(channel->vbus);
+		if (ret)
+			return ret;
+	}
 
-	ret = regulator_enable(channel->vbus);
-	if (ret)
-		return ret;
+	if (regulator_is_enabled(channel->vbus))
+		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+						channel->vbus);
 
-	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
-					channel->vbus);
+	return 0;
 }
 
 static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
-- 
2.43.0


