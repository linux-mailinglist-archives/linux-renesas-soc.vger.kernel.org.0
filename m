Return-Path: <linux-renesas-soc+bounces-31286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJPOLoN532nFTgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 13:41:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB4403F38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 13:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AB93300D6A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 11:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2A22BD11;
	Wed, 15 Apr 2026 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3gydOCi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10333EAED
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776253200; cv=none; b=jYQmyrj1BDpY//c9F1PPAhUxh+byBO+H97C9FWQDmMv0uam1TDillkaRCH8WOePyWBvfK+Ne3vWUFE9zPLeHSm63TIMCPZcoXq+i8HhBJ7XYmoeelYu5+SZwGjlABUJkMvA1TovlMTqa4vSBFpUol/ftBuZ9K+6sGldoQFNyrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776253200; c=relaxed/simple;
	bh=be7bIoI4ZsQlYGybHdn1GeOzOhO/AbTYv1qhdoE2bWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3C5DlU+5CzAdENKCAD4OeQuvCptW5crk+vHN5EuS3JZHrx+xQV21Dd7OquSKMjfUVKJcTK4eeXShgWCXSbFQCV1DTcgUQMwgxga+3g0puJybeYSNV8YawwI/PaalhingdCfzf8BQ6uPTJ3VSmgooab/rN/+2Jex7B7LlfMqeH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3gydOCi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so89028785e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 04:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776253198; x=1776857998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSepOr97f4KGd6yzx67mHmWZD0NUs9mIs5ATwxGH8F4=;
        b=f3gydOCi60B+Fz0QY+B0M1AujlzlYFKej1BWq35zOPjkOqOGZjJkbhgW1J7JSOYOpQ
         r63yM+Z33oo5rsB4O7G2y7rfVot8h2QUC3xBtRoXrvIEDhp4sO22NwZ7tuDGAhPi7hiW
         wlB6Pa16EVJCIR/tNLdPrxTvtbgKKDKSxAA4jygK4usQN2hmyeveRPDMszk8JwbZz4kx
         QDeNkfZKVWRuqucshg6eogikrgwVoHUFqOoluPoXEbKmcbRkCNevx/4sd285snZRDSbw
         jTFvm3c9Wq3hFuLw90L6heit2wsoT5M+VBodOHF+J9jP5hU8KS9EdYez37HRUCY0cTLv
         aphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776253198; x=1776857998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSepOr97f4KGd6yzx67mHmWZD0NUs9mIs5ATwxGH8F4=;
        b=ofuTgAxs8AdCNpvS022bHKjfc/mDGfTqkk75tUwdEhXHgRcAdhMPKFVKzJp6lF9HeS
         oVH9ZtWtnMtLWRJ5MGNTn7t47+ieZVh3n0PMucVFVT87UPwM6pl0YFePZkKltWDRInCM
         ZUaDT1jGjsVDO9OhjCiK4UN4DY9UMWuHo4u0jiXD2AdtTuIfpcIu6qRVdqNhEI6TOh9C
         MB96yODsRei/xIrC+Nk73Y1WsARvVqP7wRrq/Ot7rKRyR8Zm0eKkKDh7AT3soFEzbrBR
         /0WmJ9QL6fZUxS0s30gc8xcCR/iW2EXGkprdlz1QORAPXnYrILT8w9+syH/rOMNaNEfU
         wplA==
X-Forwarded-Encrypted: i=1; AFNElJ/zE8/kXhftK0Gmx5OWUQCLqhp9NxbfxitmV5hjvuhVjgEuwkBhkoIvR2sD3rsuVsuEQxXNE7BCmjZ+QQh639xWzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/5K43fBuKOsHxlH35412j38ZUi6iQBcOSgL4C/1B98nJS6Xqv
	qrDaa3XeSWqJaR5iEauPuH1H03S5jhLshfDzDnyW9vNIrNjyZe8wySlu
X-Gm-Gg: AeBDietxmxj8Xw9sVUNv1cBtedMlWhXHlpi/CEvEt7tWk+LFSBERcMmc38Qmsza6xBW
	zUf+h8gtbkcw4bS+PslOLyiniLc/WUhc12NBYVFuikRHJ5dy9tmUg3bKp0Ck+uBXMA1gs5MEISM
	gtbYgWCPomtFeQQ8F7YF51yAnZWlOZPUG16XiFtRucueJMVteCwf5zZ3mZHu/Pz6po+f7rux/iH
	goXxcGIco6cVCfP+uGa0GOyKtOAiwQs6SjITv96Mef0lJ7usU1CRT+rYn6XWGkqwrPgPq7AphoO
	j4AeeVo8aRwqRiXHoYzvQ7gA6Qti6ISMZvcc9KFCpZjUcdSVb5eus6makiHyyxOHZ3cZUWx4yDn
	G5yzHrK1ini5YUoGNVlWUCwQQfSbN5fQE0QzL60UsRO0+spibj0+JABG1hnLlQaV0eTMrmg1VwO
	VYP8FYobF0RVTMR9hdNwWox0+pyqtkFr1bs/W1AaKA/iWHx5hH7Qzd7wFnfy0=
X-Received: by 2002:a05:600c:a010:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-488d68af201mr299898965e9.31.1776253197457;
        Wed, 15 Apr 2026 04:39:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:2bdf:4b8c:9773:211a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e050sm209976145e9.5.2026.04.15.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:39:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: ite-it6263: Add basic resume support
Date: Wed, 15 Apr 2026 12:39:52 +0100
Message-ID: <20260415113954.179006-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31286-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3AFB4403F38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SMARC EVK has a single-link LVDS connected to an ITE IT6263 chip.
On the RZ/G3L SMARC EVK using PSCI, s2ram powers down the ITE IT6263 chip.
Add a minimal system resume callback to restore the bridge after s2ram.
The it6263_resume() callback re-establishes the LVDS I2C address and
reconfigures the LVDS output. Wire it into a dev_pm_ops struct using
SET_SYSTEM_SLEEP_PM_OPS with no suspend handler, and attach it to the
driver via pm_sleep_ptr().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 4f3ebb7af4d4..9727ebef48e8 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -906,6 +906,24 @@ static int it6263_probe(struct i2c_client *client)
 	return devm_drm_bridge_add(dev, &it->bridge);
 }
 
+static int it6263_resume(struct device *dev)
+{
+	struct it6263 *it = dev_get_drvdata(dev);
+	int ret;
+
+	ret = it6263_lvds_set_i2c_addr(it);
+	if (ret)
+		return ret;
+
+	it6263_lvds_config(it);
+
+	return 0;
+}
+
+static const struct dev_pm_ops it6263_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, it6263_resume)
+};
+
 static const struct of_device_id it6263_of_match[] = {
 	{ .compatible = "ite,it6263", },
 	{ }
@@ -922,6 +940,7 @@ static struct i2c_driver it6263_driver = {
 	.probe = it6263_probe,
 	.driver = {
 		.name = "it6263",
+		.pm = pm_sleep_ptr(&it6263_pm_ops),
 		.of_match_table = it6263_of_match,
 	},
 	.id_table = it6263_i2c_ids,
-- 
2.43.0


