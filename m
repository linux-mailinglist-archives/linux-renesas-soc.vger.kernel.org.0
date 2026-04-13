Return-Path: <linux-renesas-soc+bounces-31227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MhiDmfA3Gn5VwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:07:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56D3EA38F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B5003006081
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70733B2FD1;
	Mon, 13 Apr 2026 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4Ol3YWw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61C35E944
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074849; cv=none; b=c9yQbtOx0w5Jb5sgHFvzZHggJqpWTcXgkfR6M0RpJ/mzhBkph23Be70F/08up+Mzs0Z9GKyHj6ZugcltJ2wCvflnFw07NbGaHFrrABMwT2Hki5DciJUav6Tl6tOEFc1401G4W0la4eCgzKtWiV7kfMvdQtmqzMyPrM9EdMaLSZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074849; c=relaxed/simple;
	bh=Tp7bU0NE3+YX8R0YS0oLWp9a65H5IctfRXy2H2MEw8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcHMgoIYh2I7LocMweJVa5cM4Z55/ISL4Em/2L4lZVlncJMrS8IPVdthmY1F/8uD5aAPtzvQ7K9bF0H7GuZI19887VgaOb2a1xJWSqae0OS8kl8D/J+g6gsuFxxKUg3MBIIE2QKvKpZp07XuVN+/meapPetwVkuZBI/fxH0BM2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4Ol3YWw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8296dabef74so4337986b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074848; x=1776679648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKAxSP/4ix5smOiePDg7BRwPz1GOM3xb3FVW1Uy+aNY=;
        b=h4Ol3YWwLPMAljplto6B4F3jkTn7zWRREKm8ad0BSpHL4tpR6PZB/qXPNCfymzjgtP
         phAzHx16B28N76lHr0B2j2BWP6IieXzQqlEeSVDbR88qyrAwEkeoMsXsTRt50h0aZmQO
         N8qTpq4gjzD0UHQPlQ4v4+aXmVNDNHNW/lzBf8fPDE4quaediO0kfo1SKBQnAkjX8nRk
         wtEJr6Psm88GiQt/r3Tka601hnp/iax48zgd1J/vnC5u93ueRCut0ncy0kbvyW5FCTR5
         5YpR7hz2Tf3HVDDuHaOZEGQM00mDPVWfQwNg+tp327knrXekwJY6JNU7XwYeuPOQdX3v
         ZdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074848; x=1776679648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKAxSP/4ix5smOiePDg7BRwPz1GOM3xb3FVW1Uy+aNY=;
        b=UD/hUKuZnAB+Z8M+nAcMrXnPSAaBRdOYpe8PyHpFiOAIB9I7vNe2vREZCQe8Fnpq+B
         mA1UQDXlXGhMmTaFx8tEjuXQnvFHD8YCCIFmo7GwkNN6RtX6WKBDU8/0zbv8Vjrw8DYv
         iqYfqXYWA0KYbMPp/lw3UJX97UCGCHRiUOeske+rrifvNaBNy69unys1rAlZEMZ9seFE
         84OzNY+m+CmyIepy4qdTxLKAkCp7VZUhYwevnbGGxI4F13U1giBr9ccucuRra9aDeUD+
         kdTnKgY2kB7zSMW9anbFYW8ynLvaNGmtmrAisiBdCJalJaH/7QmgGq0fGsRq+iTNEGnw
         XA5g==
X-Forwarded-Encrypted: i=1; AFNElJ+3krPUHd39shR4KUINg1Q5upDGvShR4+cKbz4CdpDfrHU/plViU/U27HG6L80nTO3Z0QnxU4uAZKxYa6MYLPHghQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XxL3FIUr4cfILaZNe83KKUjR4iGhngkmUoojvoS7gqEr779z
	Ff1MCcajKdPqF96TMjip8flOQLOErRXQvVZo1fNNLbyo2P05QXhz3yC2
X-Gm-Gg: AeBDiet2PDz9zH+qfGGp0eAtRHHL1aVUJzRNrfKeyTYSKd7H6F4gwSFDNx3VgVHps4Z
	9ZGutDvWZ9636SzWw6TDanwfX86X2yfX2HURZlbkKiCUhjHu7PQcO0BT8g4W4Ek09SEOWnbi9SB
	QHfJ+tckL0iyy2HjV7JsNUfAIs6+4zo7m6Ny6E599+67M/PiC6KPhFlDHEHZ1MAekfG3hIklCpT
	ADHHt+a29+cLoyhNwzZDZQ5Y48W9E9B/E5vI5gpSVfibrcrjwdY1naTTBHVKiZS+/2Z88L+GIkN
	BSWVeXJO+0kMu5iovEiFQcXL57ehzpr8/Mh/tC7dsUTGJ1wzgYQ8q7sTS6RAINoYdjGwQzXHZCy
	RxVzzTbCK6tJZQMnYfOEYvfe0DVm3NUXu5UC5BcIKxk5DurEautOyJNi2r/2r1IfQAKkU9qUVBG
	fOx4+hLHH8l7wjR+uOr/TI5tljmIGCgzeKcst0pP+7MvHVXT6mRhKw/yfqBA==
X-Received: by 2002:a05:6a00:4218:b0:824:374a:1407 with SMTP id d2e1a72fcca58-82f0c210956mr12547467b3a.16.1776074848063;
        Mon, 13 Apr 2026 03:07:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/6] ASoC: renesas: fsi: Add shared SPU clock support
Date: Mon, 13 Apr 2026 17:06:55 +0700
Message-ID: <20260413100700.30995-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31227-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B56D3EA38F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

Add SPU clock pointer, reference counter, and locking in fsi_master for
shared FSIA/FSIB usage, and initialize them in fsi_probe().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add spu_count to track active users of the SPU clock.
 - Add clk_lock mutex to prevent race conditions during SPU clock
   enable/disable operations.
 - Initialize spu_count and clk_lock during driver probe.

 sound/soc/renesas/fsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1491c2f2cc96..196ec7bac33d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -292,8 +292,11 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
+	int spu_count;
 	spinlock_t lock;
+	struct mutex clk_lock;
 };
 
 static inline int fsi_stream_is_play(struct fsi_priv *fsi,
@@ -1961,7 +1964,9 @@ static int fsi_probe(struct platform_device *pdev)
 
 	/* master setting */
 	master->core		= core;
+	master->spu_count	= 0;
 	spin_lock_init(&master->lock);
+	mutex_init(&master->clk_lock);
 
 	/* FSI A setting */
 	fsi		= &master->fsia;
-- 
2.43.0


