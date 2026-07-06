Return-Path: <linux-renesas-soc+bounces-34772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TJVXJF3rS2qIcwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 19:52:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 788AE7141F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 19:52:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="N/TxWyXi";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABBB93028E79
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 17:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B4442A148;
	Mon,  6 Jul 2026 17:51:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1ED3D810F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360314; cv=none; b=D4szD2Sjam2BBnxF7i2HgKe52pL8PagnFjk0b2/rhW9zY2iZXwRIOdRFf6+6Tqc28X+tqF1NXCW/7JnOyHB0XzbhDH2ncQoGPRu6KT8MeHrnwyZZGrcSxO74//6TOf5fDvAnHj59DcjFHnaj1dL7LDblkTVwYY8JZ04uQQjlj+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360314; c=relaxed/simple;
	bh=e5/5sHmL6JjVT+Mei4iKzqoEh5okE89N+VpCFX3rIM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eq/FM8aRfPcza+qVyUd43Dy5KC2ZS/P1V3mbwBTT+4UnjWqIjU8DupkTYFmDw3g2rWfyu3L1coiv420PeOHJN9AKvsQUz0+39jPS1grv3Li+ordTv170EEqJvVpaqpMUWedidJwsaac7pLl/VLqpgLk/1zFLyugFr1+6nC2lxjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/TxWyXi; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b27c7451so828895e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360310; x=1783965110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H05lYk1vPsppXSmFPZIXLWTRe3vdv+ynA12o6Ofyqto=;
        b=N/TxWyXid+AmUF2eG2TsXzuL7eg3ekyouTN+Ud55u/5ROD8YZh6Q9QTdrMenEfs4gg
         cd1uwX06QwicD6HEoKzrd0IIo00OGHMoxzRiqtWlk9xhjTz6a7z/9XJqgfKkyJF4m/Kw
         jJFHs20gtnM/m93VIq9pMOcIxiiGqhEobYy7aLIRPkEgfLkeaX1GjGko7aYPUEN6isa8
         EmkiLuvTGaZY+swnGa2VM3iBhLCM0otASqB5DkCgtyLr2jANlCnmA70sJ7ULdAX6lhf8
         0z9OLiIOgv9oclcMewq/cXGhtAVygnxejZXVJviRH/tvTS+epmrVBOD4dC1y12HMgVYJ
         CSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360310; x=1783965110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H05lYk1vPsppXSmFPZIXLWTRe3vdv+ynA12o6Ofyqto=;
        b=dv8w7oSLCF5v24drnxD8DRPVW3bIt+LT//zoGo8J2RKslGR3YyLmcELW+wlGuBrOS2
         oIIeiI1m/RiJRocsrtDjEPASjIRhYMRsFJyLyArk9OS5VzYyjjCcgkA00KTxUAeIz4tI
         jx02M5AjAFxxSySkSCpZa5i7hhIvBwEBwrPrcn8OLDCP1xNP2KST9l6Kdq36D5DrnJU6
         QJ/WbP2pfFJfEVt2HRtXQDf6emnLfjmR+DAnFMUpSwNeGpZhXV+PUzPVef40Ek5V/DfV
         TMsu+1XCjC4kQh5dwIAUWBC+xNRRfsXZU+BsFsfyDoFYS0YCLYjpe1MRCcpCkxWXGCBO
         QYTg==
X-Forwarded-Encrypted: i=1; AHgh+Rpqp7YSUTdyo+hw3Nq14oLsM8Bhv9ULjHyftNI/36wlfJaXRuXNxPoPgS77UH8xlHrOK/ChFdfosq7JH5aU5vx6wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg79Ednr/Na1vdK2XJ0GnLU2xyehRcU/e2Scf18nHBrL1Vszor
	GX7hZmOVTttIEnVdAExBBLzvVj5ZttrqmAgi40FW7QPKGv0NkXis/vFn7ZX6VWiyI10=
X-Gm-Gg: AfdE7clEuYekFWl/s9TOCjwI7+ybL5ZDieeRqBJlg11qk/NLcBuE7oVCtMzZltrZppI
	pLREB2W65GwLL+Za4z1C2aA8879KeDrVXX5CxLwfkRWw0KArCqWhHprqtvXsPQiJPJfuYx90nBG
	pGlwrXBTDg9JbOcMqXBenX5UpJg27sJx8NhJMwfd39MZfM7mve3zTV066SzqLgakCbrSN2RZQ04
	LyrBTaMkr7GzwJztnIXVGjNkYc9Y9Kf1ieMvpFXKOcehvVCR6T5E9CIZGsaaUJ7tGMJ3CqjFmPL
	hmot2j9fcrCd34qiqwsgtRMsVtC6fJOJk0k+BLlIxHs8sSiWYa/nPZQbx3GXx9a2WSORXkUa1mE
	4A4ENaT1l66YfFbaNc8ZHFJ2mY3S4UOS7W2q8VRST4jfKIlgWFeVBfgjbYZyJekUSeFkBqAUzNq
	4N4XywtVmiJmiQmJxUUpHU4sa8RzDlFhZUsAxQ2GdAm6K5lmZAhRxx6jUZzyZjhPSXw7kaJnbx0
	563DR6yqt9Dt2ftbwnIth8M8Z9+qh7lBpnyfw==
X-Received: by 2002:a7b:ce08:0:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493decf58d8mr14260175e9.17.1783360310505;
        Mon, 06 Jul 2026 10:51:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 04/12] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Mon,  6 Jul 2026 18:51:30 +0100
Message-ID: <20260706175138.12587-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34772-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,bootlin.com:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 788AE7141F1

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
closing angle bracket on the second author entry creates an invalid format.
Correct it to the standard "Name <email>" format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 3c83f95c18c4..2a0f0362dd52 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -517,6 +517,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.54.0


