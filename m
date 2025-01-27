Return-Path: <linux-renesas-soc+bounces-12580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B33BA1D615
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B1CC18873E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B02320010A;
	Mon, 27 Jan 2025 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZiqDkC9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039DF1FFC44;
	Mon, 27 Jan 2025 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982007; cv=none; b=q+0kBSvvmiIG7hGfz/0INsitOBSYUdqYX7Hv7a9Dh9yjUfaMT0IhFNMFMGZMY5GznOzCuXwJUGHthgo7mfBDlsEIIllw81fsNLjSvxVQBDUBD42llLlPjtCbjNCBncr+EEZMZMTmK/QZ2FMtQ1WqDpUmJR1ACPkUozuarAvEA/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982007; c=relaxed/simple;
	bh=jtsYpUlRDrqFp7RoesBiE8F7bGnmxPqG1z9eHllOyN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNdSh7gB098cGdZeaVMnR2z9CtVQ47jC77+hIsLvXdOs1yqQj4Bygy7kTE3ysj7WWtYrcvJ0/lRJNIY0W6u/gtzIM66lV/p1uUGLeDS+AAtHZSsC1qtIg8PMtf7CWLBTQfHbNkrVLasQnD9n2tJKhMtFdHaltWc9IRzlOct1OXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZiqDkC9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38637614567so2058308f8f.3;
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982004; x=1738586804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99yQJvw7FpzRgdFhYow/5Nzmw1VclDAyJ3HG8KXeU6I=;
        b=VZiqDkC9sO026l/n65cpjsYFxHI4AtM6TUBvSVilBtIpmhK996fSG/7asNKPcqLT1G
         lStPS5sv9tiuZTOh7B3t74s/E1oM6CeUO981bdiu3NS5uIdMs8QwN6v+fqjvajqKsr01
         klovjzBl/VQDWgEHcfuB9rprK2ZTihPCAaqFnADV4ohl7DRor5nZ6pjOaFcLrum85sk7
         N8YOpb5+0yCIedJXjEqTRDr3fOTpcW4CmIiXD3yZml6GZ7CPoUFXJg2VaxRH4c6Lq9El
         5hLt0Tm40MLxojF/I8nyYrE/n3LV7/TVCA7rr23rCGHEsDeZb08rSy0R9kuD5nU5sxzu
         GbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982004; x=1738586804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99yQJvw7FpzRgdFhYow/5Nzmw1VclDAyJ3HG8KXeU6I=;
        b=a7vHgrnNXebHOjEvF7y7+bYszznB1ayaz/+Bm3XjsTlXaDDoyxIjfcEwrX0EXjx2IU
         1ivbScJwI5bp3b1dZ2KdALBb90WzYe9ZX4zQ0GMMuPyG1z6EEDj+/hh9ukvp8VEvP2Un
         uyECNjeOPB/8/8r9uwvoZOThz293u1YFCCGT9kn2q+tTaOMJAV+SH/2bHzTbUEjbGFTK
         LIwaXIZgzObLpJPpbkpqbMbiR865lqmA1AXIoBtPiTeLMkKweb4WUcs0m+qSoQnU40ML
         mi3n52tUe4lUeB3zGnCxS+zO9r9cRhwtvEXFVCIxgSf5wfVFdVHNArP5I68AKorPJeHM
         qEzA==
X-Forwarded-Encrypted: i=1; AJvYcCUt0pYlbx40TIpBVAmtR/lPtZBQ7fjAIOfW0wSYTQJpFjTaTMUvGJ0CUsGaT/niq/80L+jhdRqKthLtKh5BnnpHpgE=@vger.kernel.org, AJvYcCVPMvUjKkiuHubPnVV083m+URStY0Y9Hu/mWgdB702OBjcLRtMPt5n9mvnigYUg4nyGz3INelD4S/yb0fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlsyZoyziKlHIPTqDiPohx3sDRaDGe5FCP7RSJS66by1EKq7kP
	0vuRMo/Q/ZsjupBYRryIY9J1rFwc7HsgnR5IxuqXc9aMhGEmKVK07byAlQ==
X-Gm-Gg: ASbGncsmuxwougA5LJv8s4mcKSznCKllk4nFJ7w0j38fKDUx/s1JY/Zx/dhiGmIdFEz
	GAc1ZDteIJa6OnNZsWAa/nH0w6FBN1PuyDYKsqbbYVQkmOm6Ml2a4tlc+G42eodK8j51qMMLBeN
	zQKS2zsYvIQ6igMXRfPDqj7suOr6xDw7B6FYvuK0lx0GFhUEsCYsNw521D0WyO0wZnWDESyIHz2
	gUCuPfPZdOKOZrzP0l//UJtxTzdHElCB1lUA6JgF+OOgmsK0dAj3O3zqtvPp9cAjaQLSWh3ngNR
	3Vvf
X-Google-Smtp-Source: AGHT+IEzXfi1CJNqlEJYIv0M8GW1g0R+EoqB1v8834fNOrIJA2KY3Jm1vR64nhkSLO1a4e6G7kWiBw==
X-Received: by 2002:a5d:508d:0:b0:38a:673b:3738 with SMTP id ffacd0b85a97d-38bf5688e01mr32366544f8f.33.1737982004137;
        Mon, 27 Jan 2025 04:46:44 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1764c8sm10813557f8f.3.2025.01.27.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:02 +0100
Subject: [PATCH RFC 07/14] ahci: platform: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-7-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=jtsYpUlRDrqFp7RoesBiE8F7bGnmxPqG1z9eHllOyN0=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArnbhTeHcXctkkP5+YTLsGuNIu3latgSJOo
 K96meEhDp2JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tSKXEACZC2yDU102fcE/qoyz6wlJRCDZkBrZO7Mia21i5SUuNDjLaYr3DTEd5Rl6C5JUr6CWRK4
 AOyqi417PD/PwNi6a4MhVe27GmYTqJ1ZFgG/vUOWhrKzokMjs1PMH0E8jvWjseeqgWw31ngGDcD
 wb+QFUPZs7tJ6IB6f6hVeUox7rUiVvjuyZDtR08VND5UhRXXG57I+ZkkvniQUJLQt9ZzbPNo4x8
 gGglXMk635txYfzMQ+A0s5LF3u4U6hVkmzYZ8+sPQDi2PvmdpdnJkwMX2FTgHwr0XnB72bsHazE
 Qd+BFCSx8dBGTmad30NQCFwTPomf0/SCW67dfkeQDBesTZxl9xumd7bxs8M1put1RHaJMM+G7cO
 WAjaN3Mm3kuJDjWHs+jEaA06rndfPYhgqewwkWucfergWLuo2MD/J8y5xwqmmQ9wfe6aeZ4rxsg
 Zu2TQUs4WpQ17vauPW4myryEl2D4bV0ZCUhldINKLd5e3vJ6kuOhkUVON/uUJu3VgVconknh/kk
 KsoizoWzHcJfOE89+flaHckKCLpzNxUTGXoFOL05g09d9C/oojU8/Epzm+r4MoLRNlpPvkxElGv
 WkvElsJaG2eXzFOeddLVygkSh8gUC0xX2PzdYQMAnBBqW0LKNgkKvm1o3wS3/tpBJNq1p7TaTGs
 0E3puBPEoanayMA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index c18054333f7c968cc4e131545fc3127f03ac27e4..cd5d89c1902fab6c936aa04eefb461c968726185 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -74,8 +74,9 @@ static int ahci_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "generic-ahci", },
@@ -102,7 +103,7 @@ static struct platform_driver ahci_driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_of_match,
 		.acpi_match_table = ahci_acpi_match,
-		.pm = &ahci_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_pm_ops),
 	},
 };
 module_platform_driver(ahci_driver);

-- 
2.48.0


