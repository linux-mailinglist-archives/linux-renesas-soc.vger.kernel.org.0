Return-Path: <linux-renesas-soc+bounces-32382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEG4A93aAWoDlgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 15:34:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED7950F02A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 15:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD44A307B666
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 13:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BF73E92B6;
	Mon, 11 May 2026 13:28:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC43E8C5E;
	Mon, 11 May 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506139; cv=none; b=PUQE/8n9PqsQxmeEZs6YLCAwsrWlrKphhYt8r3eI++j1MzmsSVxtkb4VUJrE4PQ6QsPLPyfmGwKdoiz8BwdRObwcsTJyzR9uw9hckKfgesXQSKRZ1ZWL23p5A0M9JMRGqMYksrEQurljVzWdh5uSPXHiHU+rx/NGfR7LqYCIq4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506139; c=relaxed/simple;
	bh=sofl50rucmSIWOLPekorqJCRllZsYs3EyrvYAcoIpqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/FalRlEsXjoDBkWRueVqQswZJWBKW3gIvScJ4s1K2QqUOzquEaIIo0ALvSY9qsVSJn53Nm857QWbJWtOS9t5QJSOe5lOfWvVcccz9cmiDP9yI4zK48x4tc2WGurrUryIeTyBQITNayyZH+cBRfwrgLidliLgkaSTJc7+QN9HmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA752C2BCB0;
	Mon, 11 May 2026 13:28:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Revert "drm/imagination: Warn or error on unsupported hardware"
Date: Mon, 11 May 2026 15:28:39 +0200
Message-ID: <caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9ED7950F02A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32382-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,mailbox.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.484];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,glider.be:email,glider.be:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Revert commit 1c21f240fbc1e47b94e68abfa2da2c01ed29a74d, as it stopped
the driver from working on various Renesas R-Car SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
DT binding documentation updates were reviewed by the drm/imagination
maintainers[1][2][3], DTS additions were reviewed and/or acked by the
drm/imagination maintainers[4][5][6], and firmware is available[7].
Note that the GPU nodes were not enabled in board DTS files before, as
not having suitable firmware installed under /lib/firmware could trigger
a crash, not directly related to drm/imagination driver support.  This
was fixed only recently in v7.1-rc3[8], so board enablement[9] is now
unblocked.

[1] commit 18ff1dc462ef6dac ("dt-bindings: gpu: img,powervr-rogue:
    Document GX6250 GPU in Renesas R-Car M3-W/M3-W+")
[2] commit 6126a7f27f002408 ("dt-bindings: gpu: img,powervr-rogue:
    Document GE7800 GPU in Renesas R-Car M3-N")
[3] commit 67549b73f10b8517 ("dt-bindings: gpu: img,powervr-rogue:
    Document GE7800 GPU in Renesas R-Car V3U")
[4] commit 73100fa8e4ce21cc ("arm64: dts: renesas: r8a77960: Add GX6250
    GPU node")
[5] commit 6e20a9d94a459b4e ("arm64: dts: renesas: r8a77961: Add GX6250
    GPU node")
[6] commit 303a5185e024ee62 ("arm64: dts: renesas: r8a77965: Add GE7800
    GPU node")
[7] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr/powervr
[8] commit 26735dfdd8930d9e ("pmdomain: core: Fix detach procedure for
virtual devices in genpd")
[9] https://lore.kernel.org/all/20251027211249.95826-1-marek.vasut+renesas@mailbox.org/
---
 drivers/gpu/drm/imagination/pvr_device.c | 73 +-----------------------
 1 file changed, 1 insertion(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index dbb6f5a8ded12a42..b7984563627de753 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -508,77 +508,6 @@ pvr_gpuid_decode_string(const struct pvr_device *pvr_dev,
 }
 EXPORT_SYMBOL_IF_KUNIT(pvr_gpuid_decode_string);
 
-static bool pvr_exp_hw_support;
-module_param_named(exp_hw_support, pvr_exp_hw_support, bool, 0600);
-MODULE_PARM_DESC(exp_hw_support, "Bypass runtime checks for fully supported GPU cores. WARNING: enabling this option may result in a buggy, insecure, or otherwise unusable driver.");
-
-/**
- * enum pvr_gpu_support_level - The level of support for a gpu_id in the current
- * version of the driver.
- *
- * @PVR_GPU_UNKNOWN: Cores that are unknown to the driver. These may not even exist.
- * @PVR_GPU_EXPERIMENTAL: Cores that have experimental support.
- * @PVR_GPU_SUPPORTED: Cores that are supported and maintained.
- */
-enum pvr_gpu_support_level {
-	PVR_GPU_UNKNOWN,
-	PVR_GPU_EXPERIMENTAL,
-	PVR_GPU_SUPPORTED,
-};
-
-static enum pvr_gpu_support_level
-pvr_gpu_support_level(const struct pvr_gpu_id *gpu_id)
-{
-	switch (pvr_gpu_id_to_packed_bvnc(gpu_id)) {
-	case PVR_PACKED_BVNC(33, 15, 11, 3):
-	case PVR_PACKED_BVNC(36, 53, 104, 796):
-		return PVR_GPU_SUPPORTED;
-
-	case PVR_PACKED_BVNC(36, 52, 104, 182):
-		return PVR_GPU_EXPERIMENTAL;
-
-	default:
-		return PVR_GPU_UNKNOWN;
-	}
-}
-
-static int
-pvr_check_gpu_supported(struct pvr_device *pvr_dev,
-			const struct pvr_gpu_id *gpu_id)
-{
-	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
-
-	switch (pvr_gpu_support_level(gpu_id)) {
-	case PVR_GPU_SUPPORTED:
-		if (pvr_exp_hw_support)
-			drm_info(drm_dev, "Module parameter 'exp_hw_support' was set, but this hardware is fully supported by the current driver.");
-
-		break;
-
-	case PVR_GPU_EXPERIMENTAL:
-		if (!pvr_exp_hw_support) {
-			drm_err(drm_dev, "Unsupported GPU! Set 'exp_hw_support' to bypass this check.");
-			return -ENODEV;
-		}
-
-		drm_warn(drm_dev, "Running on unsupported hardware; you may encounter bugs!");
-		break;
-
-	/* NOTE: This code path may indicate misbehaving hardware. */
-	case PVR_GPU_UNKNOWN:
-	default:
-		if (!pvr_exp_hw_support) {
-			drm_err(drm_dev, "Unknown GPU! Set 'exp_hw_support' to bypass this check.");
-			return -ENODEV;
-		}
-
-		drm_warn(drm_dev, "Running on unknown hardware; expect issues.");
-		break;
-	}
-
-	return 0;
-}
-
 static char *pvr_gpuid_override;
 module_param_named(gpuid, pvr_gpuid_override, charp, 0400);
 MODULE_PARM_DESC(gpuid, "GPU ID (BVNC) to be used instead of the value read from hardware.");
@@ -609,7 +538,7 @@ pvr_load_gpu_id(struct pvr_device *pvr_dev)
 			return err;
 	}
 
-	return pvr_check_gpu_supported(pvr_dev, gpu_id);
+	return 0;
 }
 
 /**
-- 
2.43.0


