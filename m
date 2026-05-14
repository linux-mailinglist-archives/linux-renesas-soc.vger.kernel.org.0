Return-Path: <linux-renesas-soc+bounces-32643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP8IBq08BmqmggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:20:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED5546FD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 599103018449
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 21:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C8C3C3795;
	Thu, 14 May 2026 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZyKrAM8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346A53C378F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2026 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793632; cv=none; b=hagI3RZWzcv4COTfBV6FxNdhyBYPAjw10XwALcgHiVtwpgWcw9tedj0ZsB0A5/whYyu/fMycuBgCcN6YYFRTToAVT7DC7+L2EpnY7dpaLy+fS9GSAMmnmP4W4WIsdjVStKboG5948R9lUZ9TA9RSIQnhq0usFv+D87uRIf2LOmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793632; c=relaxed/simple;
	bh=F7E1AyUKWuIn/QiVoKTLffZMRrUlmBr7M8fHP7P9SWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qn1gFIQjpliPk0k7qzrH1zxXRUnwGpHmdOEru7nXjB7KAXSUvw26mh1xCYOaXRUzJOnzSrNbj/DKubIMnIJc2P02YBxiq4xM49nSd2MEo5WyWTfH+qGTWs6P2NIHZKZZ0i9fsKIhzDXMmFRm1iXOxooJqJ6MbdVXApXaaIwG20I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZyKrAM8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so161835f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2026 14:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778793630; x=1779398430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fbz4sXtDTlrKke797+KCoVnjqQN3kBHCXXyo4twm8ec=;
        b=CZyKrAM8VK8np9y+JpNnn7bA1Rlw52zbpBy0OdGGM+/IMEzddQsXqdi4gi+tzwxrri
         dIDG9s3txYM1HyMBwS4oOZcm7ZWDxEDmWJ87m6T2eg4clRWfoA3H6PzO7f35oi7Sj/xD
         a2oCjVrvgnzsbyFnXd7CvEGV/+GBYUdGLkef0CD23on+xNwafvx1Bu51tSFXQpj5Zp71
         P0W44Q+tM5CdlOIeAkzDua1CTvI986UpJ1GCKIbMWJwnR5MNh0aw6U15BHd1DPvEMc7i
         PxlMQsWR4Z7VZzTQLgXm6Lse78XZ9w7OXdm42NfwGzTgx9rzEvldHKnLT2a8v66iqDJG
         IMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778793630; x=1779398430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fbz4sXtDTlrKke797+KCoVnjqQN3kBHCXXyo4twm8ec=;
        b=nVvzl6SKkoXBCB0jRehZUX/zZOuJ5c1lpESad8Xz2HVg21zJaepgL9Pzsbt7jFiEVZ
         OG9jFG3dZvE8XKj1JiVXmObJuZ8tnKrrCgE5LB8M7q4v/dwXpUuRmkSEpONR2WvtqwpU
         qazdHGH4F3jts5AI84MfaLplpNw3zEqa/zdKLVHa5A7iTcXcyVBEiz04umwoxYw1/EsH
         xlbo7WNbeIxii4mT2jc9Xyy75VVEbSS2v042on+QFqRXM0WYxcXRD3XOp/TBimuUpWeM
         8HkXybqsDSibhJbVXPiyOBJazqjbJnfGFZriMlCDDyiwJfbWmynE8aRLAsr2pMi7gFH5
         XvUw==
X-Forwarded-Encrypted: i=1; AFNElJ83gAB7DfGeX0YY2uGpNCOLx4QBaNRzd9dbbimC/ntiZOO4GI1ulrUuOJ6Zf1DUU8/hFsYUGx+/IVgWkYVOoVkYfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2GSEGB5i85dG+u5WkH85oZIxTavDsyMJk0zyjHQaLK0SbjfAf
	Eg1jJXNe7a4W+9jTNFnet+4eZCQTPT2ZvX9zVEdhtQZyn+wMerBYvkiJ
X-Gm-Gg: Acq92OE6GHNaacWL8KnvBsA29EjvlD6l84GCeHc16xoncGQsGIqeMEcXCr8frxpZDRZ
	vOhOzMGIKY1ZiqiwOVF18VmvZIP0VB613yjyXhrJYRASxDhMXP8zcDnUZFYuqB/+CET2UqAayiR
	HWYSbTPzDtyQVfrnAanKGerAdbU87hPRPH2NFuyqfDdkRn28Y+HGyx/nJWlAF5LuRlkmfJXBo2A
	8UvVD8L3YRdZBymevBF3rDJo7KenDiwEwkvKPntqqfq6Scm7CwNN3KA57KDLz46OquNehYQ/gp7
	KStImbf3s5kEcTWIIHZX0+UIQ4j2U+xdEG8rbUrvimvuPPKI8+MNGq5xXP1pmSkvv4nQinp2hp/
	iqMygtOvQyu0Iw3jBVRk/eHHuKOYYuYYQw3RxfdPNff585wMDljP/BiFlWWSSKZg8rl7i5bzjTm
	t70UUFvnpQydyVObIvkb1gl0QXPI/ovtMK7HOZCvqwXycztdFCSq5w/9Am5Yg6QDPLWjUi60oqq
	7+LQxE/DbWBxfE2T1RCqw0rVfMHQdXZvUTJSA==
X-Received: by 2002:a05:6000:46cf:b0:445:7f70:70d3 with SMTP id ffacd0b85a97d-45d901e0ff3mr5899089f8f.5.1778793629581;
        Thu, 14 May 2026 14:20:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4d56:d792:6583:2fd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm10216038f8f.29.2026.05.14.14.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 14:20:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] mmc: renesas_sdhi: Add SDHI quirk for RZ/G2E
Date: Thu, 14 May 2026 22:20:24 +0100
Message-ID: <20260514212024.1624517-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1DED5546FD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32643-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2E (R8A774C0) is identical to R-Car E3 (R8A77990), so apply
the same sdhi_quirks_r8a77965 quirk across all revisions, as is already
done for R-Car E3.

Fixes: ca804a5615a7 ("mmc: renesas_sdhi_internal_dmac: Whitelist r8a774c0")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index b915e2e11d04..393d1c2238bd 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -225,6 +225,7 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
 static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a774b1", .data = &sdhi_quirks_r8a77965 },
+	{ .soc_id = "r8a774c0", .data = &sdhi_quirks_r8a77990 },
 	{ .soc_id = "r8a774e1", .data = &sdhi_quirks_bad_taps2367 },
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
 	{ .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400_one_rx },
-- 
2.54.0


