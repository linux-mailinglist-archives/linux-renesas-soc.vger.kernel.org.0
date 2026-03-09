Return-Path: <linux-renesas-soc+bounces-29062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBvrOIX9rmkxLQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:04:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 661FA23D4E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82B003038AD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 17:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446383B52E6;
	Mon,  9 Mar 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnZJ9K08"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43E43A9D99
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075601; cv=none; b=oUsEtyWJokQ+/fSmVoPOLh9koYo0Q8inTiJHCusJjOlYlHqDWlbvppvIAbvVElIMoveG6zprS1FWdfU0MDC2GH2wY1yo4NJQXgvrAO/3LDoglEp/Jf9eJqaogKL36ZZZnHIk8h1q//FtnmJKe90UQPyi0KawKzJZ1e/dA0Mds8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075601; c=relaxed/simple;
	bh=58Fl7Pki2MjH1aCtwknvIpgro7STs432g0UAZyoe5uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQ7FxtgUbrLaNvryFlNOFU+M+9IbNnswbcJ3wCKgU/2c0MvghG0sn1LHKI2tx2E+yENGyRaCXhbXISEyyDKcvzFuXWbW+fkaauHgBlHDK8YYbn4Vxr2BLyDqK8JpiL+pXhE85YDAZbJTVCitA/aoUmFR3VCXH/ryucJ0YxxV74A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnZJ9K08; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4327790c4e9so9250918f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 09:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075598; x=1773680398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13rtgiBktwt+6U3/9dzWhpRDGU++GPyhPsaqwLLPjhI=;
        b=KnZJ9K08ztoVinqCVyyjjPla3EC1G753ApyljnxLCAwWAIRDaC3qMX7KGEVjwc0E3w
         e1DKW5cPN5bZBBDMDnQRKpUX+9LH1QfQCeWmRIHpkf4XdzMHPgjUMGEHwBGTgojfq274
         wi9BvydDOa5KACXPPn9UAGihvIcaNgQboV714aUPGUgOSPp32Wco0L4i4OrtBksP7Ivx
         gG0rofiP1lzaizNvv7pRX+tx06RFGG80e9Bvn4m/wkueXvk7KLOftbyMV4RrTs53VEaL
         eeCgyUSlDpAlQk6FnynuOgVSlYwF4HY64teC37ngxwcNhKsHsVqIL+qMmY9YHw6bDDQY
         cyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075598; x=1773680398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=13rtgiBktwt+6U3/9dzWhpRDGU++GPyhPsaqwLLPjhI=;
        b=Qcq/GAzfJAb01eckrtNSNW+k3vT7mA6jmPS25bh+lvbE7nbuQ6UpILngi7GaD1dutt
         kk/Buqcg5wRCt/hecQxWOzSaEOaP0aG0J7m9AfnknnPDRzqkeUE3ff7Vh7679mXEepTE
         m47rFHpPA+zZNxfCeGO3ucX+zyKqSqqdBnHFcY4J4tRSQqw08JmR4elZAoVmSNG1djj9
         zUbYOpiXIA1OVn2nK0eusGGW8Qo/ZEdwri0G5kphzwLzStcGkErmI//IaNCr5upQdEE9
         v6yroFBOfadkYjRTqJKKDF0mvCrXN1K2yfomJcXa8BGdwh4jW6xn1v+vgfG530MDu/ro
         VG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUU5H1U/nyIn7AIzpJfh85OMKw9wHx83Vh+ogGYCAnqgHR67LkWEFGmz+xfJTXaHhKaNIMDmcKINbYA43PDi/FNdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0WK/Wrvo6AMi9evsgr3vKPMUt8iGsWPGgFvBPxSWM7SDIj5tu
	fP5W1rerayedhOhF8SYmCOQVNEiBuy3WGcuZnXCpcY2jlZXwZFL1ueqf
X-Gm-Gg: ATEYQzxYqfH9kDzik6fKg8Cvp/F0kgx1/pFA9J3PyfMh54OJ0Yv2yFXhDbSXo3HmduM
	jgKg5JZYAV5nsR04i2dLVBpbEBtlxvRcLVHgiuq5K+Ye/ElejE35T4MHg7PGJc1J2Nsb/CUdurv
	y01N6EhIEY508JbxijwG7oy0yzMWhtHXkEQpC0Jj9dsE6hAvXOHc3iVPGkr5xDdEbSNOJVhzm7M
	zzriaYJyXrNbWaXGHDdRVtGz3EmGMYVX0PAMXiL4ZPotzZEVBkaqB10FsW0/RRvfVYDi/8oO7Ol
	hhvetkfCxuoegQJZi+kHtxTLd8UiXraDsR3K6vuhk9eT/XxZ3oZ7caO9tImTsWMDqw0teIeyyHE
	HAIZm8w9Xisq2JVNyFJxBmTMBBTB/UsWhpZiwFPGYCpddJ2YFEUJh0CcBJqYaHNT/Weqz0eoAOe
	kfbcjwE0gjFi4Wf9wUp/F6bhrARjijWmWT7ZmOGgyKlw/ORJ8XeMYOREwlBHTZd/KJw0+c7GGpd
	Ckn+L5D9uK2YLEzfetNT+RAkWrFBfc7+RjvKLfUFYQnBUQ=
X-Received: by 2002:a05:6000:381:b0:439:beee:43b5 with SMTP id ffacd0b85a97d-439da64f629mr21782443f8f.3.1773075598183;
        Mon, 09 Mar 2026 09:59:58 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a11b:83ee:a423:4205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm25596307f8f.10.2026.03.09.09.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:59:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] soc: renesas: r9a09g057-sys: Mark rzv2h_sys_init_data as __initconst
Date: Mon,  9 Mar 2026 16:59:44 +0000
Message-ID: <20260309165946.3003731-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 661FA23D4E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29062-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.980];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Annotate rzv2h_sys_init_data with __initconst as it is only used during
initialization.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g057-sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 827c718ac7c5..f3e054206acb 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -161,7 +161,7 @@ static bool rzv2h_regmap_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-const struct rz_sysc_init_data rzv2h_sys_init_data = {
+const struct rz_sysc_init_data rzv2h_sys_init_data __initconst = {
 	.soc_id_init_data = &rzv2h_sys_soc_id_init_data,
 	.readable_reg = rzv2h_regmap_readable_reg,
 	.writeable_reg = rzv2h_regmap_writeable_reg,
-- 
2.53.0


