Return-Path: <linux-renesas-soc+bounces-33614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id doo8ORrBImrfdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:29:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F046F648224
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:29:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a01nWBZf;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5025030241BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 12:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA93536A35E;
	Fri,  5 Jun 2026 12:20:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7644DB56C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 12:20:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662035; cv=none; b=DMAMiilKG2sRNOTbZyGpU5MIsyvAKz1Kohc+Y0JiYO7dX0SKm5Bn9q+C/qFLf6km1lz/PRCXVZNi+BZavnIEizKxU7P3R2sMLcvcU94DXNTwTeaVJEaGpslSwolYAu9ichMRYUxASez24Uj8IRohCv/CLYFv6b5CEPA2Z0ZpmGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662035; c=relaxed/simple;
	bh=TMiHEe92SuAh6fgG6WujL79mYk0H4L6Yn425oPvB8uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwGe4OHIUC8etQmCDB4GUndredKhFqSXO3s+ZXGlvddXx3ikMHAw76Tr/or6Y7iRCJCSKJMkS4Nm88vyoRhS5kXj7OLmvHvZhmLORSPGdjLckuXFW6Nnnc3PzVbHklPvGQ9w1KxXeKxXiRVA1okOGRFdH6pRrQ+7ouv/r+RWVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a01nWBZf; arc=none smtp.client-ip=209.85.210.174
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423f869421so1344712b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 05:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662034; x=1781266834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsRhVTKGsiM8JmWvqFHRoyOy+2lKAlrjAXLVyytCHCs=;
        b=a01nWBZf9sF1KHEwdo7dfm/S8kiyMa/XTflm+byQ84TeWOK6N0cgwr1tx1521QuTPI
         icP1n8pRwfmaFMMZu7I3tdjKay01nMHQyOvkxjSOrUTALW2GYv64PyukucF8NK7E2LDN
         gy+FGcTbxCScV5HMvz+8cQ556v7JS4iukL1AwRjN/sB6pHD/W3zSFOMfjt5mrf7nT33Y
         Ic49vG9yBMiRdHDOR1hM/L7Zn4LKEMmHfkhDi/V3HNFDAzrghFpUr7RfGDf5v+rLllLa
         gvi05EpOx6YkTpdle16eb5WxqscvSxsnEN0W9kXMSO6/t81ZAUiiO5/Hf+IF8Pd0cuQd
         AkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662034; x=1781266834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KsRhVTKGsiM8JmWvqFHRoyOy+2lKAlrjAXLVyytCHCs=;
        b=DfDaa15ZWksO3G4qkwstyf48BbndlRIUUlUCo+Kv+c/X1K5sRNmcEfeCnpsMvi182W
         2UB7T9Ov3JPT/g7pobIx3bj4DJC8IIqs6UivsZae5AhmF6VNrWsXNeE7KuwzDFslJTBm
         P6SHzbKqthYVc04Ojttgo0ZH+7/vJDtoH/0WUv5VKjczX38V+dmHS/v+GeEdyYCy/C+W
         XZ7BUz4S1NmoMAvumejBOZwF17lDOSqVuXE1fuIXRgif3xyxfz4D8iHHS3JNFdxnFheh
         ATbXYqHQ0OLiFMq6XszAyGmWZ9zJBjCEv+ta8wMYbXWp5t5F5lcEC8H47hKVUhKDNEk5
         ho5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8dJ6dUt8HEHNqCF4OwHf+YXk2kpQ8+BQasKg8+pWKHAlzcVkAysbLhPrKam1rZp2AdyqRhhfaxbI+KYn0QJbfjEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEeP5meDwaR4tIyvwmuW3hCpaDw/8+i1XwWNazrA1wGYpOzTf/
	PcrBx8D96u6pL8/DoLUtYOunkLkaQR/gG0lqLhvCuLxYi5FOmJ5bqHYo
X-Gm-Gg: Acq92OHbT18pNBSOh2LG8krVIR/KdfHshSVrM2B4QUybmBoz3uc+z95W5OAGxDhN1N4
	s1fyBg4zOjP5KmnS8jHw1xDx9bEmkVyOO8DXpp5N7+BxlTiufMnoxxsiLSeojCHDMo/2oPv5XAB
	imKNJCWA9oJ4wyq4uBwUe3oes0sAFCrrCa0yCHXlnaV8RMjaImB+2tW/MqmKumQaYfN08/T/joY
	9W9q3al7DbbhDMtshwpSBm4lExJhmglstsrTrrLZ7NSNc/LLddF7MPtnAUwC2xm4bjccKKKdZnX
	hDhdob+5ue/t1E8wW9hYzblADJLYsb1KIK47Yc0jibEID0eG4CL8a/0NyO5wCIk3xrpdUYtzz0a
	qLMi+NY8XEy6DONsIJ9byRUoXPRdqAEvcpczhO3yqpasGJqCCX/YTDmSswbd9bmYWYgXdOA29LI
	Jf3p+jItzPio3yYaNsxbIzFhiORnlmtrjBcOHjASSzUrQK9XutpQEUCvtEcfaUOjqV9sIT
X-Received: by 2002:a05:6a00:ab83:b0:842:2280:538f with SMTP id d2e1a72fcca58-842b0e74b30mr3311643b3a.16.1780662033809;
        Fri, 05 Jun 2026 05:20:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:33 -0700 (PDT)
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
Subject: [PATCH v4 04/10] ASoC: renesas: fsi: Move fsi_stream_is_working()
Date: Fri,  5 Jun 2026 19:19:48 +0700
Message-ID: <20260605121955.105661-5-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33614-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F046F648224

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_stream_is_working() before fsi_count_fifo_err().
This prepares for a subsequent patch that needs to check stream status
when handling in-flight IRQ handlers. No functional changwqes intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 94ab2e490810..429c3c9b6ede 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -442,6 +442,16 @@ static int fsi_sample2frame(struct fsi_priv *fsi, int samples)
 	return samples / fsi->chan_num;
 }
 
+static int fsi_stream_is_working(struct fsi_priv *fsi,
+				 struct fsi_stream *io)
+{
+	struct fsi_master *master = fsi_get_master(fsi);
+
+	guard(spinlock_irqsave)(&master->lock);
+
+	return !!(io->substream && io->substream->runtime);
+}
+
 static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 					struct fsi_stream *io)
 {
@@ -488,16 +498,6 @@ static inline struct fsi_stream *fsi_stream_get(struct fsi_priv *fsi,
 	return fsi_is_play(substream) ? &fsi->playback : &fsi->capture;
 }
 
-static int fsi_stream_is_working(struct fsi_priv *fsi,
-				 struct fsi_stream *io)
-{
-	struct fsi_master *master = fsi_get_master(fsi);
-
-	guard(spinlock_irqsave)(&master->lock);
-
-	return !!(io->substream && io->substream->runtime);
-}
-
 static struct fsi_priv *fsi_stream_to_priv(struct fsi_stream *io)
 {
 	return io->priv;
-- 
2.43.0


