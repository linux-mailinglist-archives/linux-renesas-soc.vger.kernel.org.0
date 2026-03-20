Return-Path: <linux-renesas-soc+bounces-30032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGf3KsV5vWmt9wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:45:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C34552DDED7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7DB03025F24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 16:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891CC3D3493;
	Fri, 20 Mar 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRhEeGTK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81903D2FE1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 16:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024927; cv=none; b=GQFa9fiB2THG0HekMf0BeXSCwVAgkswxOMrlZLRWppziH/+0rxL5lHp0jogeh3L85sMp7RBPHmcf4gCk3cEJEcJ5iPBPZ1EoaC4Pm7A6XNc5ci0mR4a4wJ0egEQic0YXXQjW0n3w+IinZ39ttNNNp2cHpzmlp50eJsBBfk7hZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024927; c=relaxed/simple;
	bh=xEu9LJD1BjNp1PBcg8TnYk1Oxe/SU41CU/O72DexVVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8/PriGKj7ldnFwp1tXvDUvLcDYlof98NcnBqnMF5k166pTF9ZI9GwAICTxRy0oj/BnGTWjPCRlwJG0EL03qUAvlPpl5GJglxZPc8e95qeg8t/ZoiGBEhZuPZggXZ0ciMljkGWs8Li2eNtbxPwloo+mn3ppY4Mk4RYGWEeAJL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRhEeGTK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439af7d77f0so1514078f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 09:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774024923; x=1774629723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rtUTy7c+JMXpO6EpoYVOPqOA1jyBKbjjOPg7/yERVQ=;
        b=fRhEeGTKwtzjnITwVYksKLR4BMQ5W0ZEDAkYne14hVlrnaBAcJZyk92KYLfpU4sMBX
         4Pnd0NQl/p6AiI4ZH5SGRjaBHPPxph0q6FtWoVmS7zonHBm2E5FcbzC1+lQZTectlgqc
         9uRhjVXp5N/UlXKBxoFeiH6rUBNyHUkZZ1lfQD3T+u1DEgxR5fT+VK2CCT9KnDj5PxjU
         GcyjwjTdPDVvIWIU25rLyZYUPGIL3ghzAPFbKc/YSYssGJKJo8bCH2ynhVeR+YkTXeL8
         JpGaQt1lsuWV9Rc3OyOEwwlQpAyNa/z5sGqmnBXjTJQeiUrlw0ZsskVrHh+U4PeGoqAy
         Ll1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774024923; x=1774629723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4rtUTy7c+JMXpO6EpoYVOPqOA1jyBKbjjOPg7/yERVQ=;
        b=ZowRtm4rqWjsu/z32fOUHuGK90DldjBbQJ+16gTNzMKgP551QnKSC6Bxfl3t/Cl+5Q
         MLaYkQeEh9lQvK3xnPNWtrlWdjyV1LcI0DHP3c+ammpEEvuYKW6UU9/cEsRV/etd5Cuj
         EglVZUbU32qD6SKf2Z7AVjxxuDUiiD4QK5MLgZUrHWPyy/e6yanIOm7cDeWxJNO64deK
         KYcYZEk1ttXxMm/pcVh6wTVNriHaAxIepney8YiQh8gog+UdrIbcUxYdf34Gq0HvO5n3
         ZCsyMsr2skD8Ztup3Gzv9ICv8JNwhaPdJgCpDpF3V8+SFvuqa1v9iII9M5m4bJ+sij6t
         KHSg==
X-Forwarded-Encrypted: i=1; AJvYcCVPyTj9GAk+KllQKXVNwJHnJsjyY0t79/IxuSmxurpEcRcIYkUdQYHeeP8x7Fkghr3cXpaAwfrIKwjnHOV+ShhXdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxac/p9l8d5/r2o58kUAyaH+pTbVa+I+lkFAUO7LDKHM+GhHG4S
	EhbNHa3S8h7lJDGEafIYb/u79sTiG9Kz7nXUUPWUqlbcNKFD6WJQkay8
X-Gm-Gg: ATEYQzyXLZHpQ0WFV2OiHDTY6zBBNgLm+Z7BWkdSklmg8Igl0JlE0PBnDNO7FcVVWrR
	wtKtaFnW9EEusbUljgC+OTVzsBkyJzkMRz4drwMeASZ+5c4f4n/+88kYom/2QdFOpetctybFVM3
	u0NRNS84yMXoClr6ag7SHpzAIIfthN/QE0x1gGpzJHZiGrt21wPF9m+ZgTIPyaI5lJCNTZSkEdh
	LLWEZx2aYNzX4KUswIF+uQwHSWztuu/6BFECnWk1tkHIdmWsjmKXLMmwpc8HR9kHJxNMSAnxAfr
	opMEvywWXMMs4Sv71TzKEzunRF/eIZbN2VaYkt3fxgPWDfXLGalJyPcQEksZmeqpGNym+xFp18U
	eki3LvjenSxW7OtFWfB/mmD8lchkfQxpjN6WeK62uAyLyfN3aU4dE7QU+jdpMdOLTgXoXwpf/i5
	/SiSkcjdlM2X9uga7U6ErooyQL9ih8Q4c=
X-Received: by 2002:a05:6000:310d:b0:43b:3b80:6776 with SMTP id ffacd0b85a97d-43b64262ebbmr6599087f8f.30.1774024922785;
        Fri, 20 Mar 2026 09:42:02 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm7016575f8f.20.2026.03.20.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:42:02 -0700 (PDT)
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
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] drm/panfrost: Drop redundant optional clock checks in runtime PM
Date: Fri, 20 Mar 2026 16:41:48 +0000
Message-ID: <20260320164158.487406-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30032-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: C34552DDED7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The clk_enable() and clk_disable() APIs already handle NULL clock pointers
gracefully — clk_enable() returns 0 and clk_disable() returns immediately
when passed a NULL or optional clock. The explicit if (pfdev->bus_clock)
guards around these calls in the runtime suspend/resume paths are
therefore unnecessary. Remove them to simplify the code.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index dedc13e56631..01e702a0b2f0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -429,11 +429,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
 		if (ret)
 			goto err_clk;
 
-		if (pfdev->bus_clock) {
-			ret = clk_enable(pfdev->bus_clock);
-			if (ret)
-				goto err_bus_clk;
-		}
+		ret = clk_enable(pfdev->bus_clock);
+		if (ret)
+			goto err_bus_clk;
 	}
 
 	panfrost_device_reset(pfdev, true);
@@ -464,9 +462,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_power_off(pfdev);
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
-		if (pfdev->bus_clock)
-			clk_disable(pfdev->bus_clock);
-
+		clk_disable(pfdev->bus_clock);
 		clk_disable(pfdev->clock);
 		reset_control_assert(pfdev->rstc);
 	}
-- 
2.43.0


