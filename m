Return-Path: <linux-renesas-soc+bounces-28771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAFdN2w5qGkTqgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:53:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C259200C1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FA2330EFABE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 13:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F2F313558;
	Wed,  4 Mar 2026 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jo4m8XvQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EAC3A2555
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632133; cv=none; b=nowN/MDx5IGGhT2KKJSn3MIPDxwwFSMFakA2tfh7GEfoQlrjgTX+C3Xlf6L7/9q+0lUbFF8addTFu+eCtCQQFQopY+avvnXVTc4Cj1Gqdt1dOYDCH1624IPIko6EendRQxlTAmuTcqr1LzaJLrRJ2eggRaAE6rwLqrFH9jbh9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632133; c=relaxed/simple;
	bh=+gYSa2vXli0bwdfzoreCrACjI0p0LOlL7+DUKRLUFH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCVD+mKW/YX0Nycl0sJrYc5etgqoNg6/alTx3qDuVZABurxwYQxg611C2OxEBGZhAuuqFhvBKaCBtwhm3IJRo5GJu5pQAz2WOSD9F3zrwg4RVWJk/WjF0EZ6d6iQVYNYZ/nmidrWeLsiWBs9555upxum2JdruuXF3LRp0Os+204=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jo4m8XvQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b7c2788dso2273922f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 05:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772632131; x=1773236931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RenxENmarQZKEVcw1SxstoXvfw684s9sp4AM5Ud4YLI=;
        b=Jo4m8XvQede3R56MkxtgVkfOQ9UeMshp8nLI385/h4upJYxvnTYX3RNpGsvy9CyLmF
         yeTgKzI/k/55y5enOBXPnCGm2ayAoDAEjxssDRXdrXRfw0fWoucezZ9UchIE6LKeldHW
         3heMUqvmCJkoYwvSfVnf1wXeyI0wlxwTr9/A4z/eVofeWvV2pCB1TV3GfiSec2UppcTZ
         L3gsF2uN73I+kSoKGKmwyC9zMK67kz8k/J5pKib2LInveHkXfTd74WGBUs1QjM9FP3MV
         x2m3hHgyLY//xpqSxUKsIVIDct/auOz9UBaJ3R7S98Drvwgjg8moS+V+9K46vjSlbKds
         LSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772632131; x=1773236931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RenxENmarQZKEVcw1SxstoXvfw684s9sp4AM5Ud4YLI=;
        b=rFiW8ZAiTdW057uVykc7l4MCll0u9vh8famCg4wsd6vCcrBMAGGZm1kJ7CKvADskrx
         fxDysoQsNgAtbUwbZJAXFxe1oaU7TP3EgpC464pZSTfyWyCJzeWXO+5P1CzETk3ZxxoP
         GDzKOttjNrrAdXZa2xkwb3F2iWwoalyMJUjnDDs6dLnSiRVNc3s5sn+dcWEpRxaaNYjY
         XriElBAhMxJ98bFpmDijKERyaTaiYpAV8X9dz/2lFKZKgxbsIJ9C/QfadMR80Mdhau+c
         FrlL6mSWKltV7IxdmBZXr4h6Cn4FUjExQxUKzgF5Fm34FMM5lgfBlE2tV9VHlBJFosNx
         HaOw==
X-Forwarded-Encrypted: i=1; AJvYcCUhTNbuPUhukQaEcEVbl0sNXhgP00/bFpZwqLVVBzeirZctl17O47MLZwShWPTv6RO5rZDaWoNgAyQXy3FfZCKGKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRJCfugcBT1TbSScFo2BniPhsYiGoRbezezAeIDUQ9Swsxufsa
	+XPuLcnl6UeSTscfliluaOcMQJosSV5biWZP0jBXZOqQTwSST4/uV2Sd
X-Gm-Gg: ATEYQzzYYiTlXrve2YUbc9AANXtJonqFqYbf0r50GMZr1c/JBAUZ95yDIlDGzTDUHtR
	ZwfAS7P3s6vC9tbZepsPOhJaIxe7y6Z2vOYRAs5Mc+QZlrB7RWcM8SRrkD1jHKSe/fl5sW4fi+7
	ZTLXbUPeuHiOG+1VieoFjbMoCrQQqMk/OU9bLYDDSqBW4+mOVbFMePrG6nOweW7AHsxWgVs4c8G
	uaiKzV91WFgQyb6wFMiZMfjnxYVpBWfGcLBV6P2vQg3PINIcm587+NJAZYNwWCDpFp1zsJTYYZg
	VQLEBVTaU73CtwajOxzR8E2st7+vkLpq1euNTI2P0l0lxE2faoQeuf3fhoVmHw0XUB6ahbkOR1U
	wXaN2dKZU86B4VaBBEWgYrPo0Ic0qbfyGMJYDhxj9PZgmesFNNyzHGpJ689l3OHdbH++PmA2EJP
	9WTa6oCBEpWv67A5lANni0Adbkd/yL24I=
X-Received: by 2002:a5d:5f91:0:b0:439:b1be:81a8 with SMTP id ffacd0b85a97d-439c80205bbmr3739474f8f.55.1772632130542;
        Wed, 04 Mar 2026 05:48:50 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:48:49 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/4] drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC
Date: Wed,  4 Mar 2026 13:48:39 +0000
Message-ID: <20260304134845.267030-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C259200C1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28771-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SoC is embedded with Mali-G31 GPU system. Add GPU_PM_RT support as
it needs to be assert/deassert the reset during suspend/resume.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 711f5101aa04..3d0bdba2a474 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1156,6 +1156,7 @@ static const struct of_device_id dt_match[] = {
 	  .data = &amlogic_data, },
 	{ .compatible = "amlogic,meson-g12a-mali",
 	  .data = &amlogic_data, },
+	{ .compatible = "renesas,r9a08g046-mali", .data = &default_pm_rt_data },
 	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
-- 
2.43.0


