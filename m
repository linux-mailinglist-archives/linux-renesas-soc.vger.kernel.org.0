Return-Path: <linux-renesas-soc+bounces-33615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H/t1MjjBImrsdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:29:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC69F648259
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:29:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Kw7h9mKp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7BE3306586A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 12:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802A1339853;
	Fri,  5 Jun 2026 12:20:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB94DBD88
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 12:20:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662040; cv=none; b=IlsITS/lWYhLD3LwYqDYFEL9l98afyCiWIRuG5wUVkLREerDWM+Sfk30r/GZBoHCun2uv9LE4MYEiiETE+IWeJT7oAYXkHqRfUrN2mS2m2+gDJbE+1xCnL1+y4L2zFVTf7pFyQ3yhXDpMEomVj5ES2hba4NCAUQg7VIKPI6VvUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662040; c=relaxed/simple;
	bh=uUylIx3XFV4TA4RmfYqmD8Wd0T0GOAThqW1V8bTR8aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlygxJTDbvRsmtT69/eLq1UrzWkz8ger7ca36HhF8+ROnZfEGWtdGCKFllV1AqbSTao3ndrBMzg3dcEivQM+CzOJF6c2SAPgDFRv1SKpoAeSHiyqV2PlRvD27Op7yO4YV9dif9/Ws+Ke2s8a7Fn53U3BqaVso4oO18C6F57pL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kw7h9mKp; arc=none smtp.client-ip=209.85.210.178
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so1274822b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662038; x=1781266838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFsk3bK57pNH+uGXIvFwcPQqhl/Aln1/JKtxJWK3Jkw=;
        b=Kw7h9mKpfakWEmCXO/ZHF1BzGFn+G12svbyxI8WaWsvSDbNitxPe4ep9qudctoHudr
         17t6izyotpvUtx3Ss1RcbYSZqld3PXzpOwx9jYz0bdZPogDCEL0jafX6ePsqaDs1QngS
         BeR717OvRAGPDxv6+yJxZSDGIYX3g27JcO0vLnkadjNz+Ow/TO30sDBwz+IAtL8hEl1/
         ix3iTuyacKuUvPNnUlaYEfNybvAg0Og19DiJozLqsLUdFQ/w+szQTtsR6EjGRbBqftBp
         EemHozwCorQ+oA/0Ffbe1loXSOvubpMEg6LxHrPbM1EENe0FKUSTd11C81jkZzST30qW
         1ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662038; x=1781266838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFsk3bK57pNH+uGXIvFwcPQqhl/Aln1/JKtxJWK3Jkw=;
        b=CNtFdHXTF/lBvgPzT/Ek1L6P+WLdQx+YjY82WQeLjoPuhLjRiP05EY5/2ihzmY5lWq
         D/qP7GGLg9UVxQnxtqhRqmB38LU4Nn+ryIrjgRD8pLDGlroAejRRCdlIsLa/HG10wAl8
         cDAmS8FWRSA5clZIEALTEA2ksgkb4whQ/dWHGbqjgYP6Op+vlsPneI81B34fFlt/Jqo3
         s2SYXV0PlQR1j3OKNkJa83RuqqdHm+UEPNMvwR5oC6kFCJr9tEXXFGdBHYnhYfKNPfF9
         wI45ZVwE0Oavzw2F92nkQ7bSU1SAR4xfJYUe4xpMF2kmcbUBB8puTHUcN+4Do0/icucM
         Zg2w==
X-Forwarded-Encrypted: i=1; AFNElJ8a3G9KJ6EwkWWx1zhSszWDn+RIJV8w/FledVMlRsN+praXaa3CYznL2uN7XbEiVvutPQqQeTo95SxLHm2JfUnbhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiA8Nj+dPIokf7fTlbvGqOmnL1olbll+lnCgq1oBkMBF2nXMa
	gMwRtSpDo7Nnzl0e7ed07d4eY+Y9tJBYDcK5BRUK7GTEMEERRe9Q2h9MksHx0A==
X-Gm-Gg: Acq92OF7j0QB5T80APzuQhCA7hsz4asl3hbMPznKAKetVkfQHIHXndNzNDoawMVS71a
	YhdRp0oRzj8aZSq8FGfRmhfBYhiSb/A9PBsggXeeQrhW/HL2cP7JwHEd8ftZLTmFKPhD+J1sIYe
	3aBjXLuetJe4MnLvmZsuV7kcpJPHe42N7xbb7HDXASpJqIpOLu3ceJZnG8KU5m2dzocY1a9a+1G
	TQZ4nkHvTfqztzEzcXI5ZxHkFlFZAI1oeJNBWOOCMi3b93lt6xgP5WP8iLki031OWNsWlqaMjgp
	blx6FTTyqCgID4E6fejFYxVSdpx80w6r+zfyazhBTQ4LvCfoXfW19uslZ+Ota4sb7xzKZhbftAc
	dK/O5YD7h+Dm3UDOxwF0rRraGayBFMo22t4l22bQr6wW29vf1VzlKMR4aQ8R766MG2VRnkH/eGY
	quVGyWSN7RfwAbwsMOphIeFK/dlLzIol/a8IqPBAWtJfShPWdPZM9IWv6u2TtsXJYPpieG
X-Received: by 2002:a05:6a00:1d84:b0:837:db4e:a35d with SMTP id d2e1a72fcca58-842b0e3da27mr3436451b3a.23.1780662038529;
        Fri, 05 Jun 2026 05:20:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 05/10] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
Date: Fri,  5 Jun 2026 19:19:49 +0700
Message-ID: <20260605121955.105661-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33615-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC69F648259

From: bui duc phuc <phucduc.bui@gmail.com>

In-flight IRQs may still be running when the SPU clock is disabled,
leading to register access after shutdown and causing system hangs.

Fix this to use fsi_stream_is_working() when handling in-flight IRQ
handlers. If no streams are active, the handler now returns immediately
to prevent hardware access.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - use fsi_stream_is_working instead of running_streams.

 sound/soc/renesas/fsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 429c3c9b6ede..0f350bddeb1d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -470,6 +470,10 @@ static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 
 static void fsi_count_fifo_err(struct fsi_priv *fsi)
 {
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	u32 ostatus = fsi_reg_read(fsi, DOFF_ST);
 	u32 istatus = fsi_reg_read(fsi, DIFF_ST);
 
@@ -681,6 +685,10 @@ static void fsi_irq_clear_status(struct fsi_priv *fsi)
 	u32 data = 0;
 	struct fsi_master *master = fsi_get_master(fsi);
 
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->playback));
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->capture));
 
-- 
2.43.0


