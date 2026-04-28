Return-Path: <linux-renesas-soc+bounces-31702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJJiM3qy8GnsXQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:13:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B44859C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02A3B31017F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 13:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F6943901B;
	Tue, 28 Apr 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErnTEDRi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB92B42B744
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381040; cv=none; b=Q6e3mq5x63ZaOTH25pibcvKwJ2W/pQBPO1f84jbGaDOAPBOn0HnPqgucYG54TGaNoYFgzh7GdthEuMEdf+E1OcP+ijl3TZnm6gexzemLZ9jcLueb76SaWGZ+bOdodKt+QggAV0V1eskxuvCiThWlrH9eXeTA4cZZ1y4coQWlEc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381040; c=relaxed/simple;
	bh=VqeLDQRLMKU7s+EZS+ig8a/zapOpnhK489qRigdsGcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lTymDogwL5eoUuIXiGBgO0HiJNcZn3rmIhmjEAJFzCqMIFRfM4QQ+0WsDkF9JhY2rcnyr4mA4X8hcAP+Qhx7ST8hMacigy6ovcN/VVyK75lvUdyFt5DJFU+DlTPL4CjY2RxypZi5E4k3iU4lLt748ndkYpgsl6e+zxoquBmhzZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErnTEDRi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b4583f0a1aso71813035ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777381036; x=1777985836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZBVJ20UhMxUS07PwK3D+4nyCgSd/sgxQDWyRFPlgUE=;
        b=ErnTEDRiERA4qEU89zuDMOY8E+K0ICn72917+vcp5no0B2eiRCBOOcDQWNZpPrRJKe
         aB3fjwkxkxUYhXiiHax7hjK1wnoDGnuee/sq2ui5NRJekBjqCKBQkqkXGjKgEIC8PRLf
         Q58DDXHVBfwBBkqVO0fKW7iW6X31Bkv7YE82fPur4t08dYIqynf0iBZaNZqpSlJqZ9DI
         5Lcbehv2RVY1C5A9RwDZGF0w/8nsSf/x9GdgxtYcuZhfwFBmnLmu7b0/tG2o8yY980RN
         gUSKt1Wg8XYhnk8iEZbZvQXA/0/kiDPiFugnwZHvCu5Ok9Edbhg/a+tZya3OnNDs5iF0
         1Qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381036; x=1777985836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZBVJ20UhMxUS07PwK3D+4nyCgSd/sgxQDWyRFPlgUE=;
        b=MAsJ0nVW6/D91rUxHLYdYz/eD1wZmXwkF/YbZQi/oqbQ8WAGS1hhhtDo4zt/RhHLum
         uBZF1Cy7vfBiraWbJmRuQxPEU8tsUSE993HQPR/wTxACuq6VmwjyWsSg2nknzol/7sA6
         tkJwBLeOUojMyC3+IbSIDftfgbJsoCIPNrMS5oWNbDu4KcPYZLgfvs4/ratY80i6O0xe
         A41tOjQISj43NE8e6xmx2pG3lUs3yPxQfYPXdyyrmHd203raQJZLYw+ksyjlTbRjdHZ+
         H265+oTkrQrNY2kMWIFFApAgGKLzJ09HaM7fnDgAluIziMKrBRC+qjaoxGIOVAUhHUZm
         v/5A==
X-Forwarded-Encrypted: i=1; AFNElJ9nx5tVW47Jw9bXKVy+bpyRyQJ9rWdwCLKdxwBUHFwj5Tqt/FLxucvwAd7KGzgBnuDcyjTYIKnFepsaEv2bIoymuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+yh6cb+VSFc7TwGnT5mnzT7E/DVIskpHSQqEE/9aPzD0dDKQM
	2f6teQSw6LPCe7L4PtZUv1sPPLy7ZJ8/XpeHjve98f/hDl2OM6pC0KI=
X-Gm-Gg: AeBDievkUg35k83WkRXHUIAsJWfl/nkahJrw5JH82xaHXyiTw6MQEX/pgpDlrmq7ZLr
	oR3YWC6HywSL3eVlSy1USfb9sQRbBKE0nj3ia3AxjFrfI11lka8QSmudE3aawG3zF1QRAbvGCAz
	Cjs80Rs6/jR/yBbVPyM1jWtBCNJiQnbwg/4YCzCYo6mpd5P9FpzcK0L5B12qffjIVDbwX+/uoeN
	CaPgUWsdNNdEQtCVqLfB15w7VAU8YOkEjmyIgb63z749reXkyIrbyVpVqSMrjHYq1iDLZfyhQgj
	LQ9TmMtAhiFXqprNi8SGaw2paLmC5m9eqi8Z/Xh3PNFF1rxOuG9yjwSTI8bJi3t9++Y4X/6Jhe0
	N+jAv3EtuXgEdH+i+kXwmVgdBeHEH8oPianUwb76ExFbTynn8AtkeWeTqdaLCdlfoMR3cwVmr1O
	9qCZQK0gmlyY/NBiuvTVKR6jqpoK4YL73GC2pMpCwT/TJJUju6m2feJ3fdx3RZChDvMEAZW1vQx
	CgC2utnDvcWIkA=
X-Received: by 2002:a17:903:1b2c:b0:2b2:a267:784a with SMTP id d9443c01a7336-2b97c47b88fmr29441165ad.24.1777381035694;
        Tue, 28 Apr 2026 05:57:15 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8b4esm26483825ad.73.2026.04.28.05.57.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Apr 2026 05:57:15 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: rcar-vin: Clean up notifier on probe failure
Date: Tue, 28 Apr 2026 21:57:04 +0900
Message-ID: <20260428125708.93102-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 341B44859C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31702-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

rvin_group_notifier_init() initializes the group notifier before
parsing the graph and adding async connections. If parsing fails
after that point, the function returns without cleaning up the
notifier, leaving the async connections and their fwnode references
behind.

The Gen2/default probe path also fails to drop the group reference
when rvin_group_notifier_init() returns an error after
rvin_group_get() succeeded. Unlike a successful probe, .remove() is
not called for this path, so the probe error path must unwind it
directly.

Route notifier-init failures through a common cleanup path, clear
the cached async connection pointers after cleanup, and make the
default probe path mirror the CSI-2/ISP group unwind.

Fixes: 856b49c71ae5 ("media: rcar-vin: Merge all notifiers")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../media/platform/renesas/rcar-vin/rcar-core.c    | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1e..8ba8d49c3e 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -318,6 +318,20 @@ static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
 	.complete = rvin_group_notify_complete,
 };
 
+static void rvin_group_notifier_cleanup(struct rvin_group *group)
+{
+	v4l2_async_nf_cleanup(&group->notifier);
+
+	guard(mutex)(&group->lock);
+
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++)
+		if (group->vin[i])
+			group->vin[i]->parallel.asc = NULL;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(group->remotes); i++)
+		group->remotes[i].asc = NULL;
+}
+
 static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 			       unsigned int id)
 {
@@ -440,7 +454,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 		/* Parse local subdevice. */
 		ret = rvin_parallel_parse_of(vin->group->vin[i]);
 		if (ret)
-			return ret;
+			goto err_cleanup;
 
 		/* Parse shared subdevices. */
 		for (id = 0; id < max_id; id++) {
@@ -449,7 +463,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 
 			ret = rvin_group_parse_of(vin->group->vin[i], port, id);
 			if (ret)
-				return ret;
+				goto err_cleanup;
 		}
 	}
 
@@ -460,11 +474,14 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 	ret = v4l2_async_nf_register(&vin->group->notifier);
 	if (ret < 0) {
 		vin_err(vin, "Notifier registration failed\n");
-		v4l2_async_nf_cleanup(&vin->group->notifier);
-		return ret;
+		goto err_cleanup;
 	}
 
 	return 0;
+
+err_cleanup:
+	rvin_group_notifier_cleanup(vin->group);
+	return ret;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1228,8 +1245,11 @@ static int rcar_vin_probe(struct platform_device *pdev)
 		break;
 	default:
 		ret = rvin_group_get(vin, rvin_parallel_setup_links, NULL);
-		if (!ret)
+		if (!ret) {
 			ret = rvin_group_notifier_init(vin, 0, 0);
+			if (ret)
+				rvin_group_put(vin);
+		}
 
 		if (vin->info->scaler)
 			vin->scaler = vin->info->scaler;
@@ -1264,7 +1284,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 
 	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
 		v4l2_async_nf_unregister(&vin->group->notifier);
-		v4l2_async_nf_cleanup(&vin->group->notifier);
+		rvin_group_notifier_cleanup(vin->group);
 	}
 
 	rvin_group_put(vin);
-- 
2.49.0

