Return-Path: <linux-renesas-soc+bounces-29270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L57AYqgsmkOOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:16:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EB4270BF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFC3E30ABD7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 11:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6953B38A1;
	Thu, 12 Mar 2026 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1oBGjqD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2CA3B4EAF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314133; cv=none; b=CAfF6ta/fgVxP55SNge/JrpkENmyJ0FG3zeGE5eqJzRCZ6wQ6KRHMbfjOU/lkSoZngOMOfyL0O5wyX577sThJSfNiuaULpcOGpXYFBTAHcmo3iT1e7kiJNEo2r6/Xs1aS+CcBcE8Y9hW3IJktWQQPBdbI5W+tI3L1VN8lq45yFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314133; c=relaxed/simple;
	bh=aTkPxw+J7/3gRB4+9UctDG1XFql7JDHR21f3DKrFIJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z1b8JqCa3G4mzkro/N6rvOZQvN0a6M8/8Bz1qSaFex8xULOwkaf5BMg6HaL443SQeVoBXRjWabCpGoYpcALPGEoAOsXU9oXP3aRTWk+Yh8l4rkMs2qHzB83JObeqvkpGZgIKKoujHMelBQ9OK3/L9mm2s4SgHHQKvyMN+f6eVEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1oBGjqD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48374014a77so9815735e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314128; x=1773918928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PBB3mUhKGZhPxp8Diu7McKVo3HGBpoZ0FDv0/vNJNvY=;
        b=c1oBGjqDzegFrluAH43TRq89cG83Ronok4NtOswl47fe+jxtawaityWCKX9B8cnfu/
         ZQIZ/w+fsAzB+x1TAqUE+mAPYK2mtr45DQqiJ2aDZBGAZICOPsU5YJ2tGASnT9iCGAq2
         s1JTFLPDaVKB8aEFoJkFB8hal8oMGhr3MNpl3bDJfafqDZwpwQMR2MJuRVUkkc29j1RZ
         PNnGPRg3eiW57OvtwLN0b9GZ/QdlsLOlU9egv215GeRG8Ie35gtGTWs0WmPA5iQSSNkX
         t3pg4XrAJKtaXkUoAm3qd46ym+I+twL8Wb4LiV5Mug6i3WjOiKEpg/s/OOKdVnWz2zDt
         YrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314128; x=1773918928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBB3mUhKGZhPxp8Diu7McKVo3HGBpoZ0FDv0/vNJNvY=;
        b=XeHyQjNLtcjlwKcnn4xMZEMQCrUY26pt/NrHCnIi0pyiS49eZZmAqzsBpJ2sOULTDO
         8gMthdyyhhzP1cu91g1oo9aPVpicK0xn2bOn5UwQrCJ5pBQEWPefIv3921KIt0aK/00m
         IJIpXjf2BaQpi8Z/ROvYXt5wuQbnrgdxFCNO01w5yTyojGedWjEOLGbL6abaLFHZqShh
         hqRGcb2scdJ+cJ6NBYldqdp9O7UJbLDqT4EM1lV9TO6prkoaogXb1bMK2nMd7n5FXzci
         QrwXvjbuGElFM/pEkA8GYdBDXtchgsil/36xq62ZJC+C2fE6zzTuO2uN8gsWoC2a9kC5
         4Xaw==
X-Gm-Message-State: AOJu0YyWAuFpRH19ytwaGjifJDdtyHSAkbP2CokjF6MLt4aYfU39x+BR
	969bRnFZCeknKYEkw802yQdY8jYyYUCTYpiI1+q0BdcIeqnUNHYZZwZ/
X-Gm-Gg: ATEYQzzeQDMmm0kI6c6aDKh+CU6DO4KXMt9WjuZS9xl0axNeTxhmOfv41mDtZaRNSNq
	sdZkhlSlA8ic/e8mIcU9j35D5Uo0wsQnCGYJpguzd5Y2dpKOF+2Omh/7B9bHnNLJTjMbfYQEELJ
	kzAOWbREz7fg7camx61BfsQcpMEf7FOTihrdFc0+Y1Oe4XsDqV3QDu+waRWTD7H9osci3LngmmX
	7bKgp8IZHk6a9EKyrGFN9K7hyDQbqOa0Fr8kZtLNeTsO1+fBq98N5lzFQnIknnBN2LfGRibX54v
	glNW9t0bml0y+lnTwOSzYT5iCEVsudJ4QCF8CzQZrT3de0R7g6HXSutGHO1CHxB1pCAkAPMd856
	MJv7aUMo9UEMHYGgcuYsXVicflxibDWIFmstXIgsg1mLDBtQJ/RqO/0ypg44EHVCeQXbHovVXI+
	t2GYzSEAd07aIOa8mnuU7V42W+aeLMIbtzhjFlR7Q4cbsNyeqlU9ah8/qPxJ7kmSr/5J/IZQwAV
	YJPL23kubPfPhAZZ+6UWWwEgzI7v5wgOZOwJQ==
X-Received: by 2002:a05:600c:1d12:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-4854b12ce3amr109216865e9.17.1773314127930;
        Thu, 12 Mar 2026 04:15:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:fc52:7d64:32f4:e21e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f708sm311458385e9.11.2026.03.12.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:15:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add PCIe clocks and reset for R9A09G056 and R9A09G057 SoCs
Date: Thu, 12 Mar 2026 11:15:19 +0000
Message-ID: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29270-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A1EB4270BF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds the necessary PCIe clocks and reset for the
R9A09G056 and R9A09G057 SoCs. This is essential for enabling PCIe
functionality on these platforms.

Note, there are checkpatch warnings about `Alignment should match
open parenthesis` in the `DEF_MOD` and `DEF_RST` macros. These are
intentional to maintain readability and consistency with existing
code style in the driver.

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g056: Add PCIe clocks and reset
  clk: renesas: r9a09g057: Add PCIe clocks and reset

 drivers/clk/renesas/r9a09g056-cpg.c | 5 +++++
 drivers/clk/renesas/r9a09g057-cpg.c | 5 +++++
 2 files changed, 10 insertions(+)

-- 
2.53.0


