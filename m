Return-Path: <linux-renesas-soc+bounces-10337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D859BE0BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2EBF1C2354C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8A71D88AD;
	Wed,  6 Nov 2024 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TIh+w6Ts"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632D1DF733
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881212; cv=none; b=Pd4ARKxs+1hUWmOd9Ht793KifdVsAamy3AUplqCbG9Mrf7kcjfiTQSJbJhM8TY68E5sb6mvOfg2NM7ECXFX3uOAXtFpHuMMIJo5bhD11VoxB+0KiOD56wMwIJ+MOmcpBW0kL5XXeKj4nuD8E1g4aeJysFvBcmUVR+3jVLkjfTM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881212; c=relaxed/simple;
	bh=QhxaHQhEQbSU4HAJMWAlhJ2b4bTmMo3I+DW+bAanSzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=opXQbgOBLTb6ijBdhlZUP7eieCRLNGVELRX9h2pQhW0GjGvS6W5oSNQ0uim26zLHHqa5XkKIxnD6dAm1isSADi+YPSSkVUuKg0d+XDyUwVdVntyfTmV2CnV6jBJ1ix3PIBwZfD+kz5eq2xYVFGQ5QlFgbehlHxMJbTWFSr6DURo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TIh+w6Ts; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9ec86a67feso70995566b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881208; x=1731486008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keyxaK/rf+1WXM1+Qgkj4yMP90XxmUdDhzWy2M4/zFY=;
        b=TIh+w6Ts9/QGIjkZVRMuvcYh6honGGH7AQCc2wHlBks7lL6Q7RUe+GFhDqhJ2Jpout
         CCmB2FJZnP4QPCDDLOowbK3AEWW6Xf5fA60/OYw8ABgcRLRUiRYBjc75T3Trk10EV6pQ
         7hQqtVyXYMyAK0CFfEeiWCTf5O09Ic/eoZ5SbDT75ufJ9Hu0abJuto1p0idx0NFlnehR
         JbrXb3rn53+o4JO2hmCacyad1jPQSs9TBryNbL+mpZroMOx7vmq6Wm02f5Jq4q03deLG
         x6vWjSoyrK6kriK6RgD7/rlhoPjQVJQTZEgu/4GXNlXtzSYZxSKKF35KZtgCMBgxs+lF
         HjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881208; x=1731486008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keyxaK/rf+1WXM1+Qgkj4yMP90XxmUdDhzWy2M4/zFY=;
        b=uL5XO0q1DB7GUfq8rqlu98YalYy0slL1c7PW0JKjSexqi9uvThytbcNQc6qcILXbHJ
         eaT6VjIPsqsyBhmg0miGpqSvUjea+M9Wdiy6TvpTD7bYEXl/swAVcyY0Jfc92f40cnNu
         pTUgxP2g5kVZ8geDauOowI3CjYj/6g1ZkkHlRaaDMvV+SrR9uL5wkFpXYTQ8e9K/XOgX
         l2n7uFoJWox/VXp/iSBFWHpprP3UcCcJ5Ltgst1MNV71gXtCzbAjFWy7VFyyjabmJ+gL
         cNHoV+x6S61JxaIGyes27+oLjHGvrOEz6RUq7sAm9+54wQZHwlOn6U/ApCJquZL8U+Lz
         3U+w==
X-Gm-Message-State: AOJu0YzGxal7zsbn6TO7PtJEEHpjqcfPlMK0JKjwQ+sqK99O+kqp9nxA
	aGRGRcdQXKWr9MuZEnDxCEAUXl5SP+qpZV6vzf1WQUWHdpTCK1oCvpAWLzJqxI4=
X-Google-Smtp-Source: AGHT+IEGdOR7nmhmm5rVDWL/VF0T9Y8wlc2teyYuu+R9m98yrznQ5wa6C0FQenz3Cgm3gZGz4QX/YQ==
X-Received: by 2002:a17:906:f597:b0:a99:ebcc:bfbe with SMTP id a640c23a62f3a-a9de5d992f1mr3807862066b.27.1730881208017;
        Wed, 06 Nov 2024 00:20:08 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:07 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 24/31] ASoC: da7213: Add suspend to RAM support
Date: Wed,  6 Nov 2024 10:18:19 +0200
Message-Id: <20241106081826.1211088-25-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add suspend to RAM support. This uses the already available runtime PM
support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/codecs/da7213.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4298ca77fa30..01c78f8032c4 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2235,6 +2235,7 @@ static int __maybe_unused da7213_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops da7213_pm = {
 	SET_RUNTIME_PM_OPS(da7213_runtime_suspend, da7213_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct i2c_device_id da7213_i2c_id[] = {
-- 
2.39.2


