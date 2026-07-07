Return-Path: <linux-renesas-soc+bounces-34818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 51uSCPgSTWqRugEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:53:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3B71CDE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:53:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hvxsf3bR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 673EF30A6F7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E690A431484;
	Tue,  7 Jul 2026 14:36:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CD3430301
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435018; cv=none; b=WDh3FF9adFkqDyWL+d2+xs33sGCH8dQfeXqJs97Zng/bjteAPPeDU/Cdoa9ZlV7M1T5hnSaMPdTrnsjFIdJ/X2FuXETOLY2C854yJy9BHzipWodFkZ/a/Jkq6ZNzU+XC3idDkeiyhgLYNPVM2w0ff6JLmFT8TQL8c6vGIQJ1qU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435018; c=relaxed/simple;
	bh=a0Rd2m+a2VlLVpFA7Wy2kvTUtyFX73HcviYn02IWZZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0JM5nVagx5zw/v1141lgjALpvKSKLl/DWpcJP9nHvBbPrCQOtAs+HdA2tJgMcYHXdoCJ/dH9PqBlTEFRZrjaMRkUhkox/b6KWpkuOcNXp/0uENHaLg3PU7iaaNIIh3kSnFCjZxSKDz+9+8pZpI35mFw/EVwIijCxfEM3ZkaTOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvxsf3bR; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-476a130c138so4434550f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435015; x=1784039815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcqb7hfRKJFzTdqyLnJCwmjybJe2GYIdqRl3AnrXzRc=;
        b=hvxsf3bRts42pF5zc5CS+oduxBT4uwazzigZDcsAynY+Uo0RTL7b6hK2Dq1evzmNaz
         N87TpjA43M7KlcjI9BaMssAcEU86LTz3Y6fX5YibW93UwAcHzizDaXdxXHfLApoK/dH/
         poCn3Nu+A4ECvP6A5xjhCDFC183IIgxKIZOeThynbvAHDqYknhYySQq/Xr2m3bWPoFcf
         bitiy4uT+A2X23sbV2kDbtRA6enXwhMxulCMz46LARLs+mkzXaKDOls/zJTQrlPdJ8JS
         ewANeX4T3f6FkpFXLOKG/fRT9XlHXU7l9hFmVCg71rBRYjFAV9ZiXzRQPxoovHbYxEg+
         qgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435015; x=1784039815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcqb7hfRKJFzTdqyLnJCwmjybJe2GYIdqRl3AnrXzRc=;
        b=LNEHnxCNyzuPcdmPeA6Ok2elto4CuWIVQvKCc34BoWIbrN3t/6iB5YQsAPKS8fyEFP
         qrnFDtq6hKqoWLqsFyaLblY3pCq4oEzHMkexEq5nbJ5oMMyCRiGHMBoIyXOlyJ98R1lf
         8Q8oHnCtzmrju17tJlluB5625DGqOxjPkskqgGAyrc8Arb0ZiUwVqvQk6bJ537EPLul6
         rlqlElQJWSGe6H95wcYUZcCPowaMnkuXFJNe9zZMw4qeHJdJdMv/F9zMPKZYNUigxqsH
         p1iDZA8iWscqyitR6NVeZMKnzBQezxfRH0HXCRf+Ki21bYlj3P4ZkH1GbQW4lz7Ivtx/
         K7Sg==
X-Forwarded-Encrypted: i=1; AHgh+RoqjhaBYDx5AICDL3h5czUb1ba3w06vt5uhU6KWnEFIbLYhlDgDWHVvN4Sc8186tPJUWOwXE5IsH/go+5TfCuuCxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6pwM0+leZqKqGCBG6Xu+3z7XpQj3RelWKYlGMXbsrZYP8Pqil
	trS0g/mE7xM5I/M7UNivUiGv4ZVvpgxn2sdkdLhO0PyNEmKN2NrP7/5r
X-Gm-Gg: AfdE7ckMBTmxJ86+7dZevIjduEe0pIKRVNAA3YOeVAOL+Lt1DrWELnn7keKF0Ge44U1
	BqFHtaV7yqaR1d9sbelPPFFCxh8SZ7qEPFaDv1L8GZOXcTFtItTyspPhyPWOF/lTFpW0TptjYMZ
	aS8qlm2jEw21sb8bESIVvjQ3BBWsiC/V71Oa7c3J2BdRnHPf5gNIu55FD2zg7n1YFm9Dfa0k2/a
	Iu+FUPWoK6TTpbxbTh6ukZgLVGmQZ6RPco3IghNah0ayu5kjCf29Fwq3g4nI0rdCfTmPNTz4cIM
	6pFO7QPMBfJT2VEIHWwmuzBv3SV2uABagGdqsALXkZ7vG4yvBylJ8zihV76Ts8uxDtF63GZ9yqR
	jyI34khte0NMnBAGm6e/4f5RPFOIjJEqmGmH/xu2KLKKAEZsRIdbMxhqT8NK2WIvcfCpgS/aney
	nLzAHt/cxyGqDmdEnseVt4LuDwvCwAWvhntUCz6g==
X-Received: by 2002:a5d:688d:0:b0:475:f100:3600 with SMTP id ffacd0b85a97d-47de67039d9mr4666299f8f.61.1783435015080;
        Tue, 07 Jul 2026 07:36:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:54 -0700 (PDT)
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
Subject: [PATCH v3 7/9] phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
Date: Tue,  7 Jul 2026 15:36:39 +0100
Message-ID: <20260707143646.245177-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34818-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73F3B71CDE8

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
v2->v3:
 * No change.
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


