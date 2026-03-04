Return-Path: <linux-renesas-soc+bounces-28746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOiSGArkp2nqlQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:49:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7761FBD86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17A2D300D6A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 07:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB993388367;
	Wed,  4 Mar 2026 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDwQheJF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D5387355
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610555; cv=none; b=c9CSytvqgZ+m32wrbZwhUun2iuLoNqAq7s1QP8p63aZo4Ot0NDgGrABoX3zIh0UnLmxfhUCj3/HNUGRDiPYWHjVgMUa4e9J1XiuyqT1aEfZ9hxTGX/g4C6ROaDDD9Tdw2KtiXJP3VSvRzoJymw1oylLy6XZUg2tkZsiPXxXGMic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610555; c=relaxed/simple;
	bh=MSzaNuALHMLFQAjDLF5TT6OSC0jpCyqT7K/HEkrOBsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ic1MBMq/jkwT14euBygRC7rrWPNdL0fQy5OfuKUdtXtQK5atXi//Jbapflb5fHtD0ozJmJCLhrnojTuWmiovf8qgvPH05x8Vm3YLY3vX9Q90/ThqtKDUEdKO87Y6D0NaKyffFKW8xjhUnc1+0XbLgsZ8rhL9rn7fyGPxIINYtYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDwQheJF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b2965d4bso2999157f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 23:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772610550; x=1773215350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8h7+v5F+lsgUU3PHsknJQhpHG6M7boIKCxK5QGbGk00=;
        b=HDwQheJF6/36wkOKUHaEFS81N3LrGhAjj9sazJCRLPf2E6W0Aa5f6aDUi752msYH0m
         v/TLti4hTZ6aOkGhi4r6OgtJNZf0edzfsfNJyl6iHmMgaa5SbCHpHdkz3tNwnAg/qB52
         TdN2WqhoPgfqW0QWndyGNa1wRhs5SSZgzDp2ucXqqNB3cON4ztEKQTfz7q/xjyoXq9UB
         emS1/j5jMb827HisCcfOju/7M7Crs+AIg3pWfkxITb4Lday5W9309jfELQYnJ4FEiS3D
         rKKPXthLyAcOXn8ghs58dCGvLSZH/8LztV7i4JfjAEmJgwKaJ6tc95Bzi2HxJwn2j2av
         pWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772610550; x=1773215350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8h7+v5F+lsgUU3PHsknJQhpHG6M7boIKCxK5QGbGk00=;
        b=OaNHF99OFgewZ7JDUBJbzbETkXnS4ymoC/m+ops4Qv3qCDT+3hzajEch2ojB55NeXI
         PZixYCXeFdiREDfcfiSydDzwkFzS95aQUAF+yJr9P/3Dl+DbBD3B8IYVE1ErFyjG7qsw
         9fwVm7vPO3WUEwWmlhaAyPJeYwNFrn6N1PHAyDzFeVeTlbncoA5L3XLZNEouMRl2fAUQ
         9KqSqOpl5kGlM5u6gpR0LUDyh1wUOojLbW/S8t3rOoNqDfp8UDvk0qjwaWLK3tb8+ue7
         mGR+/S0U52KliTDLGoxuA6xIx52vONHWDTRS5Ss8jYWk8e8DWHNhyMSHH6mDEKBuBAA1
         vPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKTjvDXQ3p9rPo7g379kjfT+Vyp2M8Lna9mYG9iW2qXjLgOuh2D1YGytSpyDxv7eqtJDTa1lj1WUcSBvSbWUz3YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgmNmaMUBOkLR2sZFUl3YIi6e1KKqODM9hcQAieSO3/iFvmIn7
	ci2ign0R+gye1I6IZGMdxMfWPPyRajs9A6+p8vPr9WOPHvd60AV1ENax
X-Gm-Gg: ATEYQzwVJ3EPApppq3Zq1029omOsACY8NzQA7PdEWQtshv6Gd7sWz6hk5byNTIvzFb/
	oR4Wf9+hI6bJexILzOujnS8qR+2VLnNY7qajNTpTvYdac/zzB4VVLmuBcYA2Xs34fk2ujbPaA+t
	Zgo6qiSAx1YwqyVUOF4k95mDBUe8EMNo0NnKLLhKMSr0TPuV+1lbgdpkQjk6mUwsoSeitM9hmqE
	HYpBvvw39oWBfqx7eC7gHkWFinWJAOt46r5VHAGHuVU7SYgv/IelGFrtDCgpJfeJThysAWKCDhu
	GrF0dgoObl7KB8EAxKB2HRhTvS6hOW9DxfsZjZ2rj3TVTH1PzBoM0aeEZApgZM9msxX8wpqAs+U
	uQpqePfPaR3kGFBLAAydLe1JY/kAJBVIarsMrgkXS2gpj7gL828/xuxoMX5bXiOKLmSay0AOGQ4
	mRLpc5GH2RaPmL+9zjaEDW6PM9jxx5xiw=
X-Received: by 2002:a5d:6851:0:b0:439:ca85:8848 with SMTP id ffacd0b85a97d-439ca858923mr501859f8f.16.1772610550030;
        Tue, 03 Mar 2026 23:49:10 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm39957572f8f.21.2026.03.03.23.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:49:09 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)
Date: Wed,  4 Mar 2026 07:49:02 +0000
Message-ID: <20260304074907.9697-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DF7761FBD86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28746-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for RZ/G3L RSPI. The RZ/G3L variant requires only
2 clocks (pclk + tclk), unlike the RZ/V2H which needs 3.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/spi/spi-rzv2h-rspi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index 23f0e92ae208..38ee09e389c9 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -811,6 +811,13 @@ static const struct rzv2h_rspi_info rzv2h_info = {
 	.num_clks = 3,
 };
 
+static const struct rzv2h_rspi_info rzg3l_info = {
+	.find_tclk_rate = rzv2h_rspi_find_rate_fixed,
+	.tclk_name = "tclk",
+	.fifo_size = 16,
+	.num_clks = 2,
+};
+
 static const struct rzv2h_rspi_info rzt2h_info = {
 	.find_tclk_rate = rzv2h_rspi_find_rate_variable,
 	.find_pclk_rate = rzv2h_rspi_find_rate_fixed,
@@ -820,6 +827,7 @@ static const struct rzv2h_rspi_info rzt2h_info = {
 };
 
 static const struct of_device_id rzv2h_rspi_match[] = {
+	{ .compatible = "renesas,r9a08g046-rspi", &rzg3l_info },
 	{ .compatible = "renesas,r9a09g057-rspi", &rzv2h_info },
 	{ .compatible = "renesas,r9a09g077-rspi", &rzt2h_info },
 	{ /* sentinel */ }
-- 
2.43.0


