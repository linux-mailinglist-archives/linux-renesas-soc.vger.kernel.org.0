Return-Path: <linux-renesas-soc+bounces-15763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98838A84623
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 16:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7D643A3EC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 14:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7008F28A414;
	Thu, 10 Apr 2025 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MnUstkal"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960D3281369
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294543; cv=none; b=Hha15A/lny5wMy+Lf5YekhW6CAndBT36GcCKPAZryKm5vF5RGfVzgxXyi3MEgpq0VZpvCF7jVb7buX8G4j7EGu6TvTRqaADZegiRDkwqXSRF6ZwSDuimPWrw2kE2XW7FXJHg75VSgbP3MuYMHtAq0lEKR60hx9y7K1Olm7p1Y/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294543; c=relaxed/simple;
	bh=WGrTOkWpO0sHWUslK1P+MDusc9W68dggbixV9wP52ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCmwaUY8bNXGyXqM+xVgv8Q4tJSLlqaIlLc1omIToT0MLnpyPyXYegYCn8KKSzq0249o/a8UoFqVdtOmSlRBJzEJnWR48xYF8JSTDKAeZsaX1OB4cL9HcRhplCawfFTUWwoRA8J+qwenjEtJn1F5vnOnWR+/VfyspoclwfdAtGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MnUstkal; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c2688619bso503999f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744294540; x=1744899340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Q4flrwFmi1xae9xLSDs3kNrmcK2M75jTbQEeJS0lPw=;
        b=MnUstkalufEjVIF4cmtkVy3QVs10e7j6bT8Cpb+fjkfSDiaGRUG37y9ZlATmewOt3F
         R5jOiGf/EQfGgVAKy00/UcXMrc2tIzcX7VAzAK06aHEYtbDtbfJznHgxLlEytyJLmANR
         yWoqDwiUTsdWzDl6UmjKfx34SlfNzH3q/QY7qqdPDb8TOc5jheu9RxbCFLTOGWXX7jQ+
         vwJjx3C7TU04Yg4l9qDQvthS84MvN8/fMdmgEXAQ3N8n5zGgahMK3o9dvuLRsaAkDvGr
         DGce6rV5mHeBo0sKAqSNcq8dg59R5AqGzvkKjzhNiidE0hDtPqRozl4rgv0O5RE4WAMR
         W7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294540; x=1744899340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Q4flrwFmi1xae9xLSDs3kNrmcK2M75jTbQEeJS0lPw=;
        b=ZQ7A2cdalRb5kEaleTmus1IjGybe68TgWy7gBbQQO1JmBSzz7EcrX38jilVTzjAikZ
         zQychfEvdWuj1ocDyaMINDAz8UuI3ysKN4RpDwe8IBW/kl3mCEdeFesW75ROWXlLEh/I
         Le3VqMfaS9dAE/Ngh1n1Pq4cGNlZWAD/9iXoKkTUIuyFBxUYL2/wDTiFGrEYm0Rb/iF0
         PhLHSZX1zAWPIS1OIPEGUFjon3x+JQxvEF3MdQ/bmQ2TIpi8x1O3087J8dtgehMQpyH2
         jV0Xn0Il3oJYNuM0qIYuqg0kcUgaYe6H9hZBYNsVgfxIKf7mgLOZsbR50IMjj4uXRsuG
         EBBw==
X-Forwarded-Encrypted: i=1; AJvYcCXyU1ZtSHr6Ru7X+mN42DuWAVYfYTB2apmfK74uKKtM/EIgmhdGrN703CTz4CRsISMCjR188OENpaYKyqlSEMkwgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziqqT8Z4TC2CVrZleqwcI4gW15p+Updtaac2xQm0ih7/yxpH65
	ifbFFhS78jUz2lFA0HIx85Bvqvm63GDcfMlwhueqDzTW1ez30rvMghXkBQBpXVc=
X-Gm-Gg: ASbGncuTyR/Rdvq+bgv9TC6/LFNSXNGIJYu2AdMIgmFqzAscHVqhkbDWSYDAmkm9yU9
	+wyKOPLn/X2lNf0VYnb65ZibYO7f0V2q5uIbc5454inayLsMKNUt5/3Mcy2/2EKqnF3eQPHje5E
	SvJbJxiqOUc8TGRKGMxJ2glsIA+h+Ns7ev9egNZ2sPwboU9U9ewTImz8IZB5/IE27gDit1fi/L2
	NDtTEo0KucYJDLfhwtGhihsu+REnTygMKMEiezeG4vYrVCDVSDR9x4C5uls15jgNkI+gAptFfFc
	7NCzPcVs+gEoA+oxZMAziZwWo6sdOfXJg8S3BvMnWjTllhVX7xMOtHwBVNTFVxS6gJVPDg==
X-Google-Smtp-Source: AGHT+IGOJrWtQiR/+aif2Q/6zHmp/n0I43XYjAwcFJCsTWbMwppiDvii7C8NCnUY+CCFFVo3ns+03Q==
X-Received: by 2002:a05:6000:4022:b0:390:d796:b946 with SMTP id ffacd0b85a97d-39d8f4dcebfmr2487414f8f.44.1744294539831;
        Thu, 10 Apr 2025 07:15:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5b08sm54864275e9.33.2025.04.10.07.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:15:39 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: renesas: rz-ssi: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
Date: Thu, 10 Apr 2025 17:15:25 +0300
Message-ID: <20250410141525.4126502-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

In the latest kernel versions system crashes were noticed occasionally
during suspend/resume. This occurs because the RZ SSI suspend trigger
(called from snd_soc_suspend()) is executed after rz_ssi_pm_ops->suspend()
and it accesses IP registers. After the rz_ssi_pm_ops->suspend() is
executed the IP clocks are disabled and its reset line is asserted.

Since snd_soc_suspend() is invoked through snd_soc_pm_ops->suspend(),
snd_soc_pm_ops is associated with soc_driver (defined in
sound/soc/soc-core.c), and there is no parent-child relationship between
soc_driver and rz_ssi_driver the power management subsystem does not
enforce a specific suspend/resume order between the RZ SSI platform driver
and soc_driver.

To ensure that the suspend/resume function of rz-ssi is executed after
snd_soc_suspend(), use NOIRQ_SYSTEM_SLEEP_PM_OPS().

Fixes: 1fc778f7c833 ("ASoC: renesas: rz-ssi: Add suspend to RAM support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 3a0af4ca7ab6..0f7458a43901 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1244,7 +1244,7 @@ static int rz_ssi_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops rz_ssi_pm_ops = {
 	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
-	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver rz_ssi_driver = {
-- 
2.43.0


