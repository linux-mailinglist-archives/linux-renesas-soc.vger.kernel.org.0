Return-Path: <linux-renesas-soc+bounces-32323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IqnKKoJGAGrvFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:49:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED42503322
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDD91305EABC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD0736C9C2;
	Sun, 10 May 2026 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3OIGi9i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF6E36C58F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402671; cv=none; b=aAFfyp5xguPAAcsFfgBBazOlpUg4ja4CZJqQlkacpq84W8S1MokFOeQPHEvv1WNSTAQdiK9Xh049olFx18PchH/xRLUStelzWBSH5PKd7mjOdIMoqb5nXaT1TkbD70/sCDQN+7108wfjZycPU5GS+8+vw2LGG6xEoVPLXVJYmwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402671; c=relaxed/simple;
	bh=hWWNXcujvCRjXLBYmvogX9Tx7LSARP+jOFk6z3oIOdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tM8R9Q+B41mndGua2KBqgT5QAXRoamGpucuugaAMXBOBZuGC8yirs6gS1HEffZQSg/oDk8A1tEbd4W9NF6k3QKPEahEUY75w5UN+XmHNiPHS/2EYExd7Cx2h+Vr7aSF4YKYaYAGNguRL6FTHdmtTUY6XecFaj8T12AnplZMdZfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3OIGi9i; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ba6485d219so21189515ad.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402669; x=1779007469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjT6LUaCKBBOaTLM4HecbTdAzAOftGZyuLAMAnfg8dY=;
        b=U3OIGi9iF2g714qjCK+4M4635sGX0DgtTBpM0EEJUpyI9Mcso0o7aULhDlLrZjyCg0
         ieF9qbMHb4yRkpxpEG5DtvlGFbNwt6Ap8Vts5W9Tf7okMzgVkhCE0Kl2h3xPuF+1rJ1p
         TWqy1OGQ77NCxQX7tJnevZkA4Z0eHW0glaC9UDHbceCjiDIii9hMpsvakzrtD+GlI8nc
         KhUXQ+CAkUXscCzAA0fCqzhChZA9qp7z6uN9WbePxEZYu+6qh48VeAHsvBtg81DZk5SN
         zonkxqaq6/wBT+cMZxttBtjiegk+oRT6GtsJacYCtbqoschJY94UPlJIr9JepN9y6Loi
         4/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402669; x=1779007469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjT6LUaCKBBOaTLM4HecbTdAzAOftGZyuLAMAnfg8dY=;
        b=WHXtljWIkQ5H+AZr73A+eR7+sKnrWUCV5+yvJwcFDJYizw+oZ9ynKHqEvhfcJDdwTN
         uHsLpbfZWnzCx00LHFztF3bD0/z9E/9xICrwifaF0OWtCng7dKrkRHY6RZ9FGbmpyC7W
         MV/crmjkzIizABfkLXtVQYF+EqHHrcgaW7wOYzsSyjiSm1z/xRmHVcrBd5jspllu4dQ6
         XMb3eET8FFC4hiYoe6yG9KCFiOrzeuo+8g5LWju0JAUoZ8g56GFKvj7anbGaYbPo/PR3
         fu39xfO1vZj74CKJJmCLRAYEZfiLsziRMbKYbGxKEIR/cEwXciL9l7rxkSwbs2jI7HYS
         0n3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8DDIpSdngD39dckBIVw+UH0hle6TKFX0kj1zxyqRHNmeYmQE8PGeoQAhddsvU+tZcPHEQZk0S9XZQZIvMynUO1jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydYsAsCoVSpek0JkIekUINizHHCSX6gCUc3Rebg2fEJTTr0iKu
	9DCNZ6mJaJNH5V/IpXaShaCZc1X3CKPjl8lo7ylHozLUVTcyUGTJgDy1
X-Gm-Gg: Acq92OFlj4lh6G+CPuxl59veMCvjYMsUXZTEh/fX0vrf6yF9QDenwsaKpp5A3nD2dAN
	NrGKjmytYIlZwc6erTZP3x/7HkafhQzHKmuih7TssGqYb+qdgMLiTPwrcvJdggvi8Lc2przMx7A
	mJvCPOhdKr2W9sNeGhBXmzn69Y/Tcr49U0PfiKg8y3nMmH+J+jL5o4CMk/0fqzRqLHlmsXNuXuw
	hhjD5VL9i2ygdk70w3sG7r1RdpjDZwMAlROmYpz7cDodKpgbym9yTEMoPGjxPyQ2OloabxrW9kW
	yLcroL1AUX1X59Q4kUsDp/iKV3CbhMug4q97aYw0SPzQ1i+essmsQ5iqos6hfKfYMGjmlWgmgEB
	iYoQpU35LC4Dizzr0RnQQFcMSpkUbfbfWbozbe5KtbReNbAPbKRXc9mfp3qs5IkTa1CM4ys4FJv
	PCo3L/+oAlMEBsaujObMkBrVhhZB5p0g/2fL3XxYNELnHaZvQfvaJDTl7VTQ==
X-Received: by 2002:a17:903:1ab0:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2ba798c0a22mr174893865ad.24.1778402669575;
        Sun, 10 May 2026 01:44:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 10/10] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
Date: Sun, 10 May 2026 15:43:03 +0700
Message-ID: <20260510084303.122426-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4ED42503322
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32323-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Enable and disable the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown() to ensure the clock is active while the
driver accesses hardware registers.

Previously, the SPU clock was enabled by the bootloader and
remained active during operation. However, after adding the
SPU clock to the device tree, it is disabled automatically
once the system initialization completes.

As a result, register accesses may occur while the clock is
disabled, which can lead to system hangs. Manage the SPU
clock explicitly in the driver to ensure correct behavior.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index c3ac8b30f342..5307085c0615 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1579,6 +1579,19 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret;
+
+	/* enable spu clock */
+	if (fsi->master->clk_spu) {
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (fsi->master->spu_count == 0) {
+				ret = clk_enable(fsi->master->clk_spu);
+				if (ret < 0)
+					return ret;
+			}
+				fsi->master->spu_count++;
+		}
+	}
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1636,6 +1649,12 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
 	/* stop master clock */
 	if (fsi_is_clk_master(fsi))
 		return fsi_clk_disable(dev, fsi);
+	if (fsi->master->clk_spu) {
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (--fsi->master->spu_count == 0)
+				clk_disable(fsi->master->clk_spu);
+		}
+	}
 
 	return 0;
 }
-- 
2.43.0


