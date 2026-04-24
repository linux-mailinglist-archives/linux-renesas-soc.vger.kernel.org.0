Return-Path: <linux-renesas-soc+bounces-31627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAYwMTdb62nkKwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:59:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C304845E1FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AD69300383C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 11:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3659436215C;
	Fri, 24 Apr 2026 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ5ffHop"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E103436F414
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031985; cv=none; b=UA8Edl7T4vHQFWjqlBSDmWmy0MEKekpSDx80f00KaPE6fIqEH018aYnTW+U4HZzxOG1EhD7p7fKP8bFYB9qW3Sw51lPCuL79wlKu7by8ATP5hhIlfKypDpZtora8mGpHhNJamKJwOCxqD5ilLtG+WmcyGbZEv/7daGdAsVSiOZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031985; c=relaxed/simple;
	bh=kJEsAZDlrm3LwLNFR92lqil3GyrPB2PbHA+YBGgXhHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfaXEgz8SPy0uBFvyeGbiIOSU1411Ia6WB0X8PON3rXCcUzovW/29A/dQKqEId3p14Cf8WPwr4JJVA2UqKpeH0viKJa2RlN1xyGqkUTErPdzQPqovu+j7+qB3GCJSXt33bAe9JEI1CKo+PxaV2zqWatwYU1GgUCuJMuUigd0lHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ5ffHop; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b45cb89f7eso50138915ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777031983; x=1777636783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNk5Ee0nueO8NOVwzsWGTQAVezpG2J9JCi8Bol9c8Is=;
        b=kJ5ffHop4o7W9N5X4PnCOS/5mfdJGYFncM43TPqbOHKGA+hYYtjR5PzE4iW30KVHMf
         4cyHXFXbX1gTnm6Hkbxt9ufp0cSXGycpTUfMb2fjs6Eq8qo2EbyNUjiGzHAb8HWPIjgd
         i7QdswwpfuEG8C/zqItplAzwj0NahzBUS5+YziZ5FatQGhqEAEfT9keJD5slh8zymBVI
         FeZK3LFnFZ+Zc2UY4cJsulLQPFeZ9Z4IHV3DU9LvOndKMmLu/JKnbHG377zvrM2Qa1rE
         7yoqljyz6Tk4jbn4nW2PgLwuXTw2bxg3d7OBpwWyV5+5eyBP1cNCgoTcKcyrINToI/Ug
         00LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777031983; x=1777636783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNk5Ee0nueO8NOVwzsWGTQAVezpG2J9JCi8Bol9c8Is=;
        b=CTjbbI4WdRiSXDFpAf1oKGOa7zqbzzEMUyF2lSqQysDBgneA+zHGNI92qojr7tYjIC
         iGsowpFCrdE5ECmCBs3YODxvjF7GTXig10rjs8EfjcWB/WQ91mrG4IklpJpnYR8ZgsP2
         RHqjs0E7qLyR77YTIFnNtECthAzMsM5JCBVmcLqvBcMx8Z59Ne5aeBUu3mXGeBWBn/6Z
         R6JH9x4D2gfC/yZaeHFl90xrpbSha4/myul56tbpuZAUEgGxia4+0FAvaaUeEOyG9st8
         LlJr459quZ6yCzaSxoOvnZG6gWiyrNa8+LjIS5aB1dwFKgSSwI6gRHWyLhf1j/i8glFu
         MxhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5xmkVbqsHNxTxz/zYd5aqDyAoQar5RN1zc65WhHEGrXczwlKV6hlis4x/CQF/MRMuEFtgCgZrPHaYzN7JUjh/lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb5poaLbDRpWuBH25AWZjOn9RfllbB1exqwicLhVVbT++tH0q6
	LzLfhzSQbrnA0TDoFSpUhVnq71QwYbKFkg/I9LjTZFT3N8xV0f9R0xA=
X-Gm-Gg: AeBDiesx943uY0Sk6P5n0gEq/JAyDXgPqmT7Ky8Mtj6snbTHiXdUsXvTZrk65/q2/Y4
	yzPPjEORQ3L1498ck9x1WzFjxv8W4Su4ZP5edQFv6X4PYOkVS+ThyVCrEzQCWz7zkHVcbgJ4f/i
	rjbh+Ge9xEgAcUlb2mBBUVDXib79paN5AJvVi3RWfadXh+mo3xpcotctp9MWFByCuRPRShsv4lz
	lCO5o8ePOhE1CJ3lya/2W3x+u2YDxl7QJM8b+aEs/3h2YTkoeeSa7LUKYhKkwoLWLVylj7zgYnM
	YNK4JEwql13jn82ErXROvgQw58Eu01WYLTjnN9LXTloFfoBXuBFfdQKF7CZDsasoHhDtVC9LiPS
	bpuK/5bg7Y2+uRxWNcysTyr1RybN5FRCaKbDgTEj3qVJllhHrdfnxNUtTY0IKUR8T1DI1fEyshl
	ZOKyVF1LzGtW4z5CQuEaoT2AfM8o++H+10q3i0rxfUhGYTAo27UiE72LZqDrPw/c0/4nyMt+BmT
	fBbKtav7KsOhtojDqI2
X-Received: by 2002:a17:902:6905:b0:2b2:49a7:a5bd with SMTP id d9443c01a7336-2b5f9e770c5mr229435215ad.1.1777031983329;
        Fri, 24 Apr 2026 04:59:43 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff90dsm222858185ad.11.2026.04.24.04.59.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Apr 2026 04:59:42 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] drm/renesas: rz-du: Fix MIPI DSI host leak on probe failure
Date: Fri, 24 Apr 2026 20:59:00 +0900
Message-ID: <20260424115936.7930-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C304845E1FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31627-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

rzg2l_mipi_dsi_probe() registers the MIPI DSI host before allocating the
DCS buffer. If dma_alloc_coherent() fails, probe returns -ENOMEM directly
and leaves the host registered.

The remove callback unregisters the host, but remove is only called after
a successful probe. Add a local unwind path that unregisters the host
before disabling runtime PM on the DCS buffer allocation failure path.

Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 29f2b7d24f..309fae1459 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1476,14 +1476,19 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	dsi->dcs_buf_virt = dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE,
 					       &dsi->dcs_buf_phys, GFP_KERNEL);
-	if (!dsi->dcs_buf_virt)
-		return -ENOMEM;
+	if (!dsi->dcs_buf_virt) {
+		ret = -ENOMEM;
+		goto err_host_unregister;
+	}
 
 	return 0;
 
 err_phy:
 	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
+	goto err_pm_disable;
+err_host_unregister:
+	mipi_dsi_host_unregister(&dsi->host);
 err_pm_disable:
 	pm_runtime_disable(dsi->dev);
 	return ret;
-- 

