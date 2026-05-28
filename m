Return-Path: <linux-renesas-soc+bounces-33267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E2OCZUIGGoaawgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 11:19:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80D5EF759
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 11:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C1A1309AD21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568FC3A16BA;
	Thu, 28 May 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Qxdqc8m6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816439E16B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959189; cv=none; b=Mz70VcNg1Y0BEp1gC4/E8J2IxoUtui3c4zWZvKtn19YmCl2qmzHhRqrCNmWcq8rTgM/gujkqx7+IACXJh3BtLhykRe8rSEwkfcBm0bshIKMEcOS8y5oWrq5RJvE3Hl/RT7ZKJvX7s3gy7hkPXqz5rooJ2QWNtnFKovOYak4kC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959189; c=relaxed/simple;
	bh=6wTjQbjVDCvk58uNEXlUXHLxQZstr5pzAGIyPTiD5O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtcBAAxHPn6pYpj7Kc0nO9mLqPjZA0n4ljfzO7wABsqPungpUVrE7k+ySBd4qvyZRRtCjxnKaUAGrxCR4+RJ/Od8gfrptROwzgycn5mTsJAKhU8kVgI6nO/ZSD3MmARBPh+hQ9UTHjlh4ADPiPnnQABEU/iIg4doo7Mkc4d1tbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Qxdqc8m6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490426d72f7so58550455e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 02:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959186; x=1780563986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3vrOPg4WDeQl7PPR6I/LyzL/tbE48PpNPb7FICK4DM=;
        b=Qxdqc8m6f7rNYouawPb2uAj18SwdaB/F6C6+Zhap/UYNtKEIw2mzhXPy5mfhox7ASc
         ovoIzoySBOxeLnjimClebZiU42ZdDgwqgYrY12jSP0JBYlT+iGDYyoUP+XiTfJ+0riRG
         xEZ2+mFWxgcmcnz+T9tn23MIEISNUk/eOs8X4oamRgYxKpk6UBknfTT1HsV+DDA9Bktm
         xS0KtT8Qnb79s4Uh0KCVhdUCn9Wlm8Nmub2nTqpg7U/h44ouU/r5hnhIWsY0HHcob/5Q
         Tbxomb4cWVG8iOdoK5kpzngr+bhWaFDr19xEoSqitreHA7AL19I+ICLrCvaYFl6s32T/
         wI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959186; x=1780563986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3vrOPg4WDeQl7PPR6I/LyzL/tbE48PpNPb7FICK4DM=;
        b=OHf175pw8uRDKoo5n9RHQwBYuC5Z3MunTs9Vz0RSEhC57EjKkZqBgJzOFsBbL3XeB4
         bIVUoFsKB7s1XOFQulmrXW+WFVntKqTPPgIb8fVCBMG86IkIuT7ly64DvkA6KVTwxDyp
         gX5WtFxVL0ynu/EmiyrUH+1otx62uwSpNLVHIxEzAI+50y88836XoF58d0U8ZU3VRopH
         /Mm2d8H0s8RXICPMKNDL5snccOvc+2LjZEdN4PIs7V6uu9yuAjuDLfqq9baA22NPPkUP
         h4K5f2dHBoLfdHRDp1lgtMrzfq2jvO9ioD+MDRixEUOjfonajDN5eoHFDd3myBQTaiIp
         eYlA==
X-Forwarded-Encrypted: i=1; AFNElJ9B41MHjRM62Kc2S0C5JBgcVBG9TzWz585Ms51C9Iz/D4/513qB/lST+N9+0HpQ/DzYF27WyoTda076toYGpO1B9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdHYDnClQss5u6uxe3VvhLyewDnGQ/6giLWMcnWHreYsXsWk6
	CUDNWCxEqicdW0WLeuBy889/i3IUUDPwg6ewhoaGr6Np2JkbP69W/VvA+59DbBXzpryliUvp+RW
	7DABTFaM=
X-Gm-Gg: Acq92OFgb6BnQ0W7sM+P4vof+MPQdXxumXFs3DN8ad1d5h/y+bpUxlOXik4m8RswtNI
	mBOjo0A9jw9Q8mytR/nDl0RaN1+U2cT4GtPkd/LHpNsyJUJ/IgbDJMsQlaMtAQDYIidNtMgZS82
	NwCL7TW7FvzhjTofCbw+pbKeNu4Zv63gR59iBN3yTMHBIiZW5OQKnlIvJ98IIME/j6CFijGYu4S
	Ltm20ytOVOc9mmDDdUpudJCWpuy9I8VK96aIFNyK0gpmmHhNt8K+pcRA6BB+zPMKPu3H2T28mjz
	3t1C5Rp33MggcJ7x5Lv1PtABfTiTBXg5e2BVTjWrn9M5kH8kO20jI2Fr70NOiRYKEj2LyePrO8E
	EOku0tEsKNwhYq6pdu5WR3MgC/4fMEACZSxQsWhnutpmcVLK/CIYWB91FxbxvU9/5ZQ+ThxbhOY
	1EEW/nzaguxlGCzalauTRtdJt9jpjP2kWs8rmks6+4ln0+Uec09EdXlWWCF+I2vJdqqLbOFFuxk
	heRSLh0ZSgmm4S4RnvCcWlABA==
X-Received: by 2002:a05:600c:6085:b0:490:6869:ef13 with SMTP id 5b1f17b1804b1-4906869f118mr282267505e9.14.1779959185638;
        Thu, 28 May 2026 02:06:25 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909295a467sm25394305e9.13.2026.05.28.02.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] ASoC: renesas: fsi: Simplify driver_data handling
Date: Thu, 28 May 2026 11:06:01 +0200
Message-ID:  <308c08c0fb309c190412f5ceb21b0027842b6294.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6wTjQbjVDCvk58uNEXlUXHLxQZstr5pzAGIyPTiD5O8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGAV8PP1Wn5vyCV4KjL3PAW+7Af8i5oFUNZ4xd vlHnGsVlzOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgFfAAKCRCPgPtYfRL+ Tiz1CACala4BvekGKcG5vDjNOMx8hmRdxJJq3FHD1PRbSreKuvyiSgaa50A5EhGbumLtPk1hEAa l4LBR5T8N02EA07DTot15V45ioH3/Hjg7k+lZ7N6LdiW6uohLhZWH5IAQeSlWljBHn1OAKBiJqy KR5W0jLy9KBe4qRQeZRDBJ3A+nkDEUJy5w4L3EFkx12lU6FaPbpCQE0yaxdDznxKZR8QgmSAMMX nj9eauswmT3ll/KROi7hvrqbuTMbRNxuo87Xn4hDhzcO7P373hgleaC8uAJKpV/kvrpbYTdH3wW /Yjf9TnxtHCZ5Wbr1D4vxxx9Nh808VvWs31CXGS1mOuT1Noc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-33267-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Queue-Id: 2A80D5EF759
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of hiding the fsi_core struct for the only supported (non-of)
device behind an abstraction for multi-device support, hardcode the used
pointer which gets rid of (open-coded) platform_get_device_id() and two
casts.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/renesas/fsi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..efd1447eacb9 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1905,8 +1905,8 @@ static const struct of_device_id fsi_of_match[] = {
 MODULE_DEVICE_TABLE(of, fsi_of_match);
 
 static const struct platform_device_id fsi_id_table[] = {
-	{ "sh_fsi",	(kernel_ulong_t)&fsi1_core },
-	{},
+	{ .name = "sh_fsi" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, fsi_id_table);
 
@@ -1929,9 +1929,7 @@ static int fsi_probe(struct platform_device *pdev)
 		fsi_of_parse("fsia", np, &info.port_a, &pdev->dev);
 		fsi_of_parse("fsib", np, &info.port_b, &pdev->dev);
 	} else {
-		const struct platform_device_id	*id_entry = pdev->id_entry;
-		if (id_entry)
-			core = (struct fsi_core *)id_entry->driver_data;
+		core = &fsi1_core;
 
 		if (pdev->dev.platform_data)
 			memcpy(&info, pdev->dev.platform_data, sizeof(info));
-- 
2.47.3


