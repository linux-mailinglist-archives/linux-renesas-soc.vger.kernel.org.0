Return-Path: <linux-renesas-soc+bounces-34617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HO1KO0UnRWqr7woAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 16:42:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB456EEE40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 16:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VFzYmXzl;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F83B31A3F83
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 14:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6914333F8DC;
	Wed,  1 Jul 2026 14:30:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F200351C2E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916218; cv=none; b=LrlwHCF30UIzIWSWyAcOfGQ1z7fZq5hKav2WTiJLSqGbzBZ7ahHTgRADRD2jK48xvWqvZt1KUlYGOUU+gmHRDpX9OS3tulPlM7xdeIKmGvi5HPA46YASN/ykjL8/Fi3Moo4l4vAZBFcToIj0fEnL4oW2YMq1XfMMInSuGssWQKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916218; c=relaxed/simple;
	bh=TPEjDOtOvs78CIkohl1xvcmHiYoAAprmMIWg3FBDWms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoIFawxKzDYZkA0yk5cwhCu8H/bIbTgm1nXcfHw3OFhcjTFs1dHnjiA1Rbr54uqm0OG7WjCI/DVsJOc/MJ9VnUUITBwGcVtyHFP0UIISTuJD9XbZxBkMJQk02P7g2yJTiSSZfkd3BQhgTCQj1D2vdPXs2PN/URrNKTRzTL5RalE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFzYmXzl; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso3282285e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916215; x=1783521015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VcSlzYOxPLTW5jLVJLClqvrOJsBnz819IiqK2l4msU=;
        b=VFzYmXzl9kge2OuATamtFgxAQmrZmWXxNGdnwQsRaxqf6Mp+E0+cs4OIIv3tszDrVZ
         mfiMSRLGDhiKyliaGS+M5G8ItDX2bNALH9Wno3bJw+6bVIFZUlIs5NL3lXBQ/A2zSmJW
         ATDjD88ISmHDo//KfFYHa+OkQQdoTCMp3fczptBkUFu0YAvkXVYtcf1NTzQh5S4UwD89
         yfUlV5jy7FoLuFE7tJBQFFm3vx0Rvp9nAo5RYMr2DS5IPXWtd8Rf9cEOChgpcmDSNpc2
         XhKirRYyHb91ngRU32P/3inDSMRk5h40nStI/2JUKYZ+prhz6gHMud1UMvlk/KyUmfEi
         bTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916215; x=1783521015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VcSlzYOxPLTW5jLVJLClqvrOJsBnz819IiqK2l4msU=;
        b=KUZ8l6Gdsl4duBNChPWp/K8JeAbQZpbwqqSguB06XJviKCqW9cuB7pDY2HJrMCayAC
         KaTUbKje3J6dEmzbFBN23DX+gS3UoMPB6k+q6Q2pv8gAgJGo1W5dIatjDa9VO5igYYqK
         rpcRWeTHcul/NKRay7jJ0NogxzKdwK/Dab3U7jsT0vWESIyNpHyKvLrYw8uR9Qjn8eGv
         uzTs8fv+DcyKi5IVrUj++Ok9BA8mB6INRDKM0jMGgteLZ6FhOzMbvU9ak+PuHXLBPOeK
         L3XGMCaW5IJkpK+UjDdFbVw+X1rmS+kA/TG4MhH/dOZxYMv3fqqksxSbYcfbWdB6hEW3
         Hipg==
X-Forwarded-Encrypted: i=1; AFNElJ8IQlPiwgsq8/LbW0YlrZ2/9Nb7/11D1haT+r5Mr1VQdFzT3C3SjrUk0V3GSgfBMFt5FNqEFFNkdF6jKboXv3nQSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfQGWCZyeta5PsYLpLqyUEhN+74WA9yr2qSCGmeA3h6cyfcXZT
	VlJhLTd3HiWKXRQGdyXGB/qIqxsalxLJsvzVDN08rQCSxCiG1FkUHqUc
X-Gm-Gg: AfdE7cki8cbAB7nl8eofsKPcShGNyZQaLIJu/n/AdV5R4TtTg+CjYCZUkduQQiGola4
	/TCTii5WbSUwVVvj2FnDAErjPB5P83feQmNKbvctbRlbAlYOyvfCjHhaO7HFtO36QsDza9jJADW
	hmte/k0b1reL4yX/X95yDydDUV6f/xx/HlGcqSIN+6Cek3gwSGWGPyMG8JIjlgmAHp0jBl+8Skw
	QGiBsRBFNmy0VD8zmdlN+Ke87CXRrlSxbqOSPZXd1fxZGJ75LyOzrYtcKDOcu0CaAmaFimO8AcB
	CZxgaOo9Lkg2zpDP+UnsUGjiy64jHGSuLGhvn8TrMQgz9OsWPoD/XF9UtCgSEBSwQms97bY68px
	RRLgLmjnpJiV2OYmVT75xK4jJISAc/Y8CY7ULR8QLSWTicWE4QHHFBk4pQQpriCtzxb7DM60Exc
	tXQW/ORwIj1EVo5zvOEgDT/ssDhpgtzF8vdYbVuBcoYoF3pltOiNarHBZWMMdY90WdbIfWt2Rz7
	y3tzVpMuA8+M63uHVY/deNqGGo=
X-Received: by 2002:a05:600c:8590:b0:493:b646:e90d with SMTP id 5b1f17b1804b1-493c2ba5537mr24039865e9.36.1782916214873;
        Wed, 01 Jul 2026 07:30:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:14 -0700 (PDT)
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
Subject: [PATCH v2 10/10] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Wed,  1 Jul 2026 15:29:53 +0100
Message-ID: <20260701142953.2014895-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34617-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BB456EEE40

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs by matching the new
"renesas,r9a09g077-rtc" compatible string.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP.
Unlike the RZ/N1 implementation, the RZ/T2H and RZ/N2H variants lack
the RTCA0SUBU register. However, this register is not accessed when
operating in SCMP mode using the existing rzn1_rtc_ops_scmp
configuration, allowing the current driver infrastructure to be reused
without modification.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 2afd8251c868..9469160129df 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -517,6 +517,7 @@ static void rzn1_rtc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc" },
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
 };
-- 
2.54.0


