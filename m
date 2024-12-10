Return-Path: <linux-renesas-soc+bounces-11186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7389EB7BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562401883E62
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BCC232366;
	Tue, 10 Dec 2024 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VqH3JmWO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BD22FAE0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850642; cv=none; b=hWe8y8uc3iMI1HnquQaaIL6DQDxVomIS8ot1ryNrNVjsM29CZkctF69jwEbjxkG+PuJsssCmcM45Nv9AcxnT0bdD8yqTLagGcssc7/of5xlTFgOOcs/I2oORij2I6nM8drT/3XUZ1WC26ntM0EchbAymP1h5su2LvK7rrab4h2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850642; c=relaxed/simple;
	bh=cB+Bpu7l1dV+zM88HO7Ze3t/5fdXwi7jPTuxAvUk+U8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HXKbjlBHTVxjSlovWYk9mM75iokNUTDlQs2nqUkR/R9hgUA1nl9mjyxvb6c8SHkgteWqzHSnZMTUR/QTmj3oAzT+KQLkFqYXaAw4zw/7P/JDoJIkXmADA9CE5vm653vsjW+pQfHKZoGaEO9tfddSIgh3VUrLjsrWdnhmKstv+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VqH3JmWO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so5214313a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850638; x=1734455438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6Hy/pRodMw2d91URONzNaEgR8YWtQs7fLTqCwO7+FQ=;
        b=VqH3JmWO8a/dlBZKwdVROvo/+MKWvN5DXmrbLUo5A39E3UaP444kOfHcntyoanVGjg
         5vyCowgmh/B2NTIEPfRrqdv0rMnEf53eif3FLFzpyLecp4R3kKQg69iHg1sFQCWSBeqM
         HJ8Ui6I6oZMTPq6JmgABmhUfAZP7iJddfzI+mHWvTGonyc819SJ4HtBssjejTKjz7c2z
         m4puIilvI35SmSnQDwsF/8cyKd+rs81QLiYLKWa7XfKVGFrSQW6YweovrzD/7hrFpmNv
         zGHqHUvL/jxvurpIGALUpBWfFaERvJ0HBkM9GM/FX8ruLg8wCe3SfYiquALvGyB7mhqC
         5f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850638; x=1734455438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6Hy/pRodMw2d91URONzNaEgR8YWtQs7fLTqCwO7+FQ=;
        b=ik2HPna7cFFoDf1KcC+VHaKJI1+CCRZpSX4Bhl88r+ZKU6nybktW0L/iJv+kkm5zjp
         IdENpktJboMUyAYh13rcILBkT3/ia/4BsSxwq+Tttbu9BWFx2IvCIKP5kgJ0jpssoxwH
         8IudyR6sXYdxDH5WDRh+o5N6TOD3MHVT+u//IZt4wCJmwZo37dX116/dOMm0CZhukRfx
         CG3vezNzS/jUK6tPa56fl87pmkrVrJgE09mWhOXBsKjbWBX5BOv/9sEw6FPp0Np6WosH
         1lQmEET1ZwYADFmd/hD/t8wsCSkOIgBiWibT88a4sKH7kf0hACsrjbNFGipvTTcyysLr
         fHPg==
X-Forwarded-Encrypted: i=1; AJvYcCVdpNsG0+R6gDwbM+P1MrBD0yXcBD5mswPcheYXZtxD932ecHYbHbwzyja2O53SfgP0ezZVK7bp9XrRi1FAuM6wIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO1+7Ck3l+/WZ3lcuyegB1jebnjKz57pLFqM+ioN2AJKht4/Ec
	o9CUHiFHLWqQxaQRc7q2eBh/uqWyj7NTso530P4SC+ty1FsC/8WmYXFMsyKyh4U=
X-Gm-Gg: ASbGnctvB9WtYMC7DV3/JLDRBtW2mbuT52oRkWQDbzIiAxMJlruxcvwHrmXw/T2tBYQ
	A33u7ZyKcoHJaf8YuuJQMpdLHILbvCJ7gxN1VPJcARjeDNekklT0g4vzdrXmjYQzk6wSVeFu7xp
	546WmX0YbRXE0GCBOZzsGG97tKCmILcrcPsnp7lSVKt/hoQqFY9JhPeJoTyF7wgP8spVZ6iSpU8
	mpfeXiPvc1Zoshb5OgqaCAXJ278Nbfvjxw3MGM/CHRj++tzeQ5QMPvissmIz0mxd7y/o20tnoNZ
	m0WoklO4TWQ=
X-Google-Smtp-Source: AGHT+IGqcJ6bqhwIIKJrt+yeOZgP79f+Ka5SbVUv4mcFJwjMu+9gX00sz7DE8koWILZTW546alVDvg==
X-Received: by 2002:a05:6402:1f10:b0:5d0:b4ea:9743 with SMTP id 4fb4d7f45d1cf-5d3be67e142mr17354125a12.8.1733850638421;
        Tue, 10 Dec 2024 09:10:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:37 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 14/24] ASoC: renesas: rz-ssi: Enable runtime PM autosuspend support
Date: Tue, 10 Dec 2024 19:09:43 +0200
Message-Id: <20241210170953.2936724-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable runtime PM autosuspend support. The chosen autosuspend delay is
zero for immediate autosuspend. In case there are users that need a
different autosuspend delay, it can be adjusted through sysfs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 878158344f88..eebf2d647ef2 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,6 +1140,9 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
+	/* Default 0 for power saving. Can be overridden via sysfs. */
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-- 
2.39.2


