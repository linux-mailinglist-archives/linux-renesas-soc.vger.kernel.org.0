Return-Path: <linux-renesas-soc+bounces-33754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TwqiCKn8J2qg6gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:44:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A45D65F977
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:44:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=osmFXvay;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8DF6306B12A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D84402443;
	Tue,  9 Jun 2026 11:39:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC243FE343
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:39:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005165; cv=none; b=mHoRnY0G5jCGAh3hiUzGMvE0ff64cS64fQRSQWvlcrbciWzd5TF+MW09vzOY20JTkLxlAoGNEcnqsgllsH5ofJWPT2sZmVBtPSoK2xlef5+Y0XeomEz2NcsV/S5x3VR7iayz/MUjNIKqrbPxR7TgdOnKgGPnx/hMv/xDtKiKKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005165; c=relaxed/simple;
	bh=KLBeFBd8zRYhdnRHp7jNIs9piYCuaRzWB6QekH1GJ9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCc7UPAIqUA6vYBQZvJ8dM735ihfUk3xHl5TcvuuITGT55XgO0c4+sdfo52rMBIgi1qXolnQq3jb/D21BUqp2GoDK42i8YCW90uPZ0c3cLG4flJ6T6kMll55AI/nzwNiBRFmt+iMh9SOV7sIX2DOXO4+jvyANbnS4k/ElvW/ZBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osmFXvay; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0bd02d97eso61027075ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005163; x=1781609963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E47jwlvDyMcrvrKHDjZ9gREZbPczY+LcNlcn/JdbBhI=;
        b=osmFXvayH0xWIaeQOzBVnU1TOqhOYUrrizKNqnaaSdJ1MtgVdkPg1wnq7X3OAn+sWM
         EuKw/WR87sbLH7miyucJMBuHRT45EWO5WJWiuKC2zQNCB42thvU+JM8n0LDyMlAtE9hV
         WMTeqURnlTw9yvHhVSUOUmh6A7gBQPSWjhogEJc5kxVkVWEt14tosEYbZZMCRSMwhuQW
         ZkZG7ynYnOEUUT6wHjkmFSJAIp0T/oIOx9yvln/tSaCn1lqmYjk5ITa2ja2nJyOTi7FO
         bmiey9INihUfnAQzVdqEkqsFbAOF90mM9vyfBcm6LtIT15mqnAoq8eTMZR69DZ8oJdZP
         eA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005163; x=1781609963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E47jwlvDyMcrvrKHDjZ9gREZbPczY+LcNlcn/JdbBhI=;
        b=TKfJvZ5TiqFzpBPYItoMW0XV+RqHVhlHqqvkmidAKTM9Gl1gu4DpgfaaUS8gzj9d8g
         LpE34EHtUJ9oKE0YJLBrwxZcIjGYwsQGlCSkMZ+XbBJnnGc2Vb4A2jVyhSgMbkw0x3jn
         HQrcWnQaFQ/u+e9teahsDqdV8CfwIyhZTwBSrRxDCMH56+hMIMujYkhZf20wMY+SJM+7
         gjA2/hzQ8vJNdBH3U1WTz780t85CsgGXfDQPsGAjYEwzx3AlDQkgMh0qT2X7PiBnnahY
         0+MtL6+plT3AIMrFnP8nokcPZYKnGqg1GaWgpnVEJoWI8ULmutVfclUeSIHkYrLsRZYO
         B2gQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RrzkifNWKxG8ovPXXj/PBqk1DM7x6J3K4U/OB+LkkQjkPUsQzFBKUejWawxoRn2xAdz3169xYWTBGVTzE6HkomA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgf3sM+ehwrFqx+xcp1bMTo0lh24IgkwUW60kRniCn2pSLhxI
	cortBIv9rYQWFhuUyvDFNHXJMRv4y09ULggdFpg9xKXHVDp1kTy0XfdK
X-Gm-Gg: Acq92OEUnpj8XTX4WtejVFBfJSQDd0EhtIWF49QjVR4TA6BA9ObTZpEZnXwnuyAhO0o
	7YN9rWGEc4xn33lJhbR5JVbsZOOrVH54HX9TiQ2kGu8MzaPWWNi4OWgQ6XfGQAXuu399KiDtl6x
	lnMeIS6J9pLByMuZsfFqD1l/syS0ZPu/q9UoOcmS6NjmAy1HtQH88frcovZ6tB+moBXKSCeIsq9
	TaCu9IGyEd1wTgqOUXJ8pe6gQvWR4zlSLZTueYDRpQWp6e2tESrRxUmQmfy3oCmwKEFz2wcKcOI
	ea3CWs0X3QHHu2JEeiE8LvsqM6WRw89BPZtkDyheAcBDRKs2HxERhvVa5FQGA7W8JL00G0onaqV
	EbOmxG41EcT7VUok6viAGaRN4g5SP67/6k2x7CVIJjOy+xwWeLOD0cPdwh+63KqzZMKtXyQeADM
	/MOtFuQTWDilDkB1J6oB3UISZUxy7Fr8549qwl9QTO3BZZaaDrIhbbxJ2S3fm37qKVxz90
X-Received: by 2002:a17:902:da8b:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c1e85ac571mr241805645ad.31.1781005162565;
        Tue, 09 Jun 2026 04:39:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:22 -0700 (PDT)
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
Subject: [PATCH v6 05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
Date: Tue,  9 Jun 2026 18:38:30 +0700
Message-ID: <20260609113836.45079-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33754-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A45D65F977

From: bui duc phuc <phucduc.bui@gmail.com>

In-flight IRQs may still be running when the SPU clock is disabled,
leading to register access after shutdown and causing system hangs.

Fix this to use fsi_stream_is_working() when handling in-flight IRQ
handlers. If no streams are active, the handler now returns immediately
to prevent hardware access.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
Changes in v4:
 - use fsi_stream_is_working instead of running_streams.

 sound/soc/renesas/fsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 0bd0e0c8c5a3..3e3c6fd7c56b 100644
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


