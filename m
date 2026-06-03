Return-Path: <linux-renesas-soc+bounces-33478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZPfgJ9DRH2qUqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:03:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D07F634F47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:03:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lRXDMqFa;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73D5130FD6A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00203F99F6;
	Wed,  3 Jun 2026 06:57:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFBA3FADFD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469865; cv=none; b=QMfHV5NzFNNdTX3/Ce5njdyCfO5p7NhTG8ZXy2NZ1xMtjWayHiG02FgsuhRAchT6aXaQUzsf9649BfuLIZUDi0OQieadVl5WO0Ooggs1c2AefeSEFKBlIvXRJAQtxj+KvCx5FcSXClg583Iw7x9CaMGaq2qoSMCZlpVauksNYs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469865; c=relaxed/simple;
	bh=XviPFEdL+531yfoxPUGX/RIxGqB870L3MwG4Nt43Qf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJlgmIOTCS62NgmPcEigSMHo9UI5CpnkwecGDyBJoszobwp4A5F6ql0BB+b6HWkLdt0J6eAuBSFMygzWL57BCz5wI2BKZ/AS2J+3uBfc4uLWYnN9kE6fHpKKroDZKIKJQWQKFb6z3blOLph+o2yc55/cfmuAIL2p4C1xqhzBKIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRXDMqFa; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b3e03939so2577475e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469860; x=1781074660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXIHUWLCh3o2xpCNm6vz++jYpXPey1+/k/Oe4Vv3YwI=;
        b=lRXDMqFaZf2DdHSRoWzVkVE4LD1qe0y7GhyWVaYOd5f4IAGzrWFInKWLxsikBtiB8I
         WuQVB1maHWQiZkH/aC9mURMxkv1oY8G2LSDAm0jh39A+jRS4o2/FGl0AwNIMOGxWf4sc
         YKyK+zLnOkYF/qqvalGGyat55yysRXbDRGRpFW3uuS4qPoB2PBnpnD0AYJJ4ssWonaWF
         d5n4KbX4TUNQbzO+wREk3qsRvO7UQL1dn1UQUwP8CRoyGnmT+z1o8ZG2/hV4pDw6QAZ+
         v5V7JcDZi8p8uAwDD3tDfGwUU4IaCTvJrbaK3BqBP7qGjIxnOj71aWGNPpS8kVEHUqcX
         qHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469860; x=1781074660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXIHUWLCh3o2xpCNm6vz++jYpXPey1+/k/Oe4Vv3YwI=;
        b=TJtqymAUnMxTwOAQUpztCZmwINgo9jfRwxv4yD7EGbEI4RKnWsfgj759yuKziOHg+b
         sgCjP4tbi2Ezx1WoSE7byaqzRsZCW2MOe2oDaedU4I51zISNDvN5Vs7svaJN0k6GkyJi
         qgDHriQDdHPPtBfEIRGDvmBzb/tPlkE7TMNAlyMunBjYQSZa3JHcuUTo17VywoPz0EnM
         wZGc/vv8bh5Tnm856YS9FHLLeU8foIvSiOfCKs0Xcmi/A5P9ouGPXOh6eAR2uH4zqraE
         3uIskvPaVJ8weI0lcvqZbG17oQeWYDCxAMl9/oy64ns9myY11W9HENDX0HKf0DiT2DuM
         8OTg==
X-Forwarded-Encrypted: i=1; AFNElJ8M/ockB1vvoqLURAyL+4FqUlBfuuGvzSR9vcut4JtzzMpBWJIUUk79ya37UmJm9C4qNefPUoEmWHyLwQKrPYT2hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOvGzEKAlnYRw0WQybXxQrVRtHpXVo2YqmXfQJiZjQ/+V1RrI0
	Qjjki04XNIniLIa7q8jVx2LGGerx1o0wvE1u2tXFgnWxUwnoVTfuIDVQ
X-Gm-Gg: Acq92OHhoJK7nMscBWaDu8f2PauvFKVYSoxIn7vJskiMbIdyzP2MLwp2jwSmfZiF+98
	HYgrVczCrizwubxD1VKxsTRKhhZxn4Y/dsxDXmZ6blZkfzKx8p5BWAOB0spOVBgXIQUwdHRRo7g
	GJg/D/5HzGVLcmIvr9DSPaE4uC7acpU5UeaGqD6laHOlb/R0XSiBixgVu3dC7nXBli2ULGmbrW9
	S8nH/0mQo8EV3sD01bQIaSf76tz1k0U+fylJitl8N83HevqUAHSsXhp2sIz6Fe4A1HwOvDyEV7/
	uOAgu5KpEsXkngNU/12veTV5pM82CANELqD+NETOoq/LTiTHKjlqv3SnixxuDjMmoBL3YLTTamh
	jgWE125mwjjbX1Xsp88Mx3yM7yO3+t+56SgGiwx0NdWYDXBTrEE1p9t7Qh29aw3pEvITNEUGbz+
	rsNg1qGVnxW9QCx9RAq6wUwOtBOXbeVI+Ofm2dnGFgHlELLbyodBMsdY1uyvW+hgQCXPxMdA==
X-Received: by 2002:a05:600c:8b0f:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-490b6163925mr24119345e9.16.1780469860612;
        Tue, 02 Jun 2026 23:57:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v17 04/17] mmc: renesas_sdhi: Fix whitespace alignment in struct renesas_sdhi_of_data
Date: Wed,  3 Jun 2026 07:57:04 +0100
Message-ID: <20260603065731.93243-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33478-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D07F634F47

From: Biju Das <biju.das.jz@bp.renesas.com>

Remove extra spaces in the renesas_sdhi_of_data struct definition,
replacing the tab/space mix used to align tmio_ocr_mask with a single
space, consistent with kernel coding style.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index afc36a407c2c..09bf9b24a8c3 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -25,7 +25,7 @@ struct renesas_sdhi_scc {
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
-	u32	      tmio_ocr_mask;
+	u32 tmio_ocr_mask;
 	unsigned long capabilities;
 	unsigned long capabilities2;
 	enum dma_slave_buswidth dma_buswidth;
-- 
2.43.0


