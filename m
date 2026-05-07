Return-Path: <linux-renesas-soc+bounces-32255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPTJGgu1/Gm0SwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 17:51:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D51954EB690
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 17:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B39B307729B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 15:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0276644CAE0;
	Thu,  7 May 2026 15:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYOmiy3C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4F431E82F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 15:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168853; cv=none; b=MojlC4MipzzcurAj07e6Y5S9TESKox/kRFskFQULPpuPMPQIXJA4dP/j2g8ANJTYPUjJdC1wiFrcu+FCIhO8ORL8xmtguY6XEfci6ywjg0iW2q2m2B+EjOou8Q0cXnQOqPDBz9384auhj3BrExFpvQ7vSxxgLCCnIs9zrXQjhkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168853; c=relaxed/simple;
	bh=BJtO48Hj72vQNbaDCTSAbk02sqQwHV01KSa4UXtsNEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AfllkEyJQzi/AjlMUNFOLB/NWgiDBduwaXIRBLdDTwZyGPjML3UniO2OebVy7s6/DIJweQvLD1hOYeBasZQAuNgln6V9pOzD2G4tfM053/oG0buv3AbQxo56mueGzmQGyxZcX3h/IUXuHbfsJN7yXjJGggVogoqjSVSPQXmsAh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYOmiy3C; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48909558b3aso12206515e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 08:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778168851; x=1778773651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6cqSTWpCUthgu1ZNblGGG6XzTkhft1nj+LJftI18rJI=;
        b=aYOmiy3CuVqfYe70LueV4kB7lu9vM/v1hlM+tWwg6mOw5Z0n6kj3TObA7XJZufYWGa
         RLBJz2vtu7ewwj8uNBASpb/OyyCvjiDvTomReceann/pW5skIrwQ/UM2rcd/+L6W4woG
         KF6xW5VUdKycSXm6xRydVpd3nWTJ5r+E904kgLkLz0FvMySzf5dL1m8wFL8RRdFVIN7g
         SeyClbHr5nTa1Rox9w3RKgIb64KWyCyYHBhBgWAnOB6gVnqBbsSfO8WBUYCGJakIJOr5
         tnjuADWtrv4bqJVXn24VkcEKQsc4N8z2VTJZ/YFi5RBiFjesfCfrkvzijrPPO4BXL97r
         Qmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168851; x=1778773651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cqSTWpCUthgu1ZNblGGG6XzTkhft1nj+LJftI18rJI=;
        b=AGXyP7VmGjZCCX/jxP6JpSoNERHuHjviphNhQnnJcJgMZKOaD9YGiRN4TmvDRbXQYq
         3PlChvCACWUlFNDF/z9xkQsTeOBOmHB2OKc7jIJsxiJJJVrp9A0f6lDXMWtYPGAal2qE
         beAQWJI4hRUOxxJ+7K32T8UAov841Ey8Wa6QtIS0A8gdCvor0qSeMZRSne5doPT0/wFL
         nz/V322mD8aNEIjomfylBNtre1QPonRryTEaL8kdQ+C/wnMCDDKpnQvpZ8a8Es32b2rn
         2+I68TfDlJEyjDEAIb79jabZtCuBqiQmtJRukBEdMVByCA5fUWY4QKIkUP9xOf2sHvWt
         b7Ug==
X-Forwarded-Encrypted: i=1; AFNElJ9ntjR3IXK0G4HnMubqn8Lv2pNHm7chNoKUXS5gRVaHqFzK5IrAZ0mpVc9YJummbCQ2M8ldRiwnsSp8/Vjy99KUbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFTlvw6RAETqup/Q7Dt8MHIblDqGzzO5La29c9g/SXIb05QMu
	rzN8qS1s5tbP9Anwy7laj1Gfsl996/LCi7/Y7hSpq2lY5ax4fYYdca89
X-Gm-Gg: AeBDiesNaOCvZ3U0A2juc0/0Krd4VyCcFK3mUub3ioqJyu6mQpDH8RQ/bfGn7nRR9kd
	wzc4dw+NUzID6IElT1Vz2Mr1JnaeDcKYJ/l5WR54fb2kPICjuza9w1lc5h4QA8Hv4Q7XXlFq1ej
	B4+FLcqtpGcWAbDVGV47WW8Sxpj1Ium/AIJmpft/zxHGSYO3byrT5HStRk5pZ2imxPKiTTceRct
	qwNRXglbWBhgKKcVU/a5zvwdqteqL7ex9TgqSuyxLmytfsxR9r1+qR1uZLRI6agJVIi/LsfnxYL
	oSR7rCsPxxUM18IX7Ai4wvtPDlQcnqJp7ifqDFabYizUrv3erSi0J1YPkAaYNBanmGJUI89J/1X
	y1pxvyzD4NizXUWVVyg9MW+0W+vloqKyS7njprLN9UBQ/D2W97YtRByuOrYSYizITNx1nyusCHD
	73iK9UVuu/2U570F5ci6mkrL8uQ+aiNpUTwAxKyb88bI9B5CnLndy3LgulOdkr621rYIFr0ERMX
	A/9rJHJ185S4JJGCpyXU/ZPDp2B76quOw6VIJZAbUIuSVWw
X-Received: by 2002:a05:600c:3b0f:b0:48a:7965:b943 with SMTP id 5b1f17b1804b1-48e51f4e9admr141189995e9.29.1778168850751;
        Thu, 07 May 2026 08:47:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cc9e:4908:2ae1:f0fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e52f5c1cfsm88389555e9.0.2026.05.07.08.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:47:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH] usb: host: Default CONFIG_USB_XHCI_RCAR to module
Date: Thu,  7 May 2026 16:47:10 +0100
Message-ID: <20260507154710.3903732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D51954EB690
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32255-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On R-Car Gen3 and RZ/G2HMNE SoCs, when CONFIG_USB_XHCI_RCAR is built-in
and the system boots with an NFS root filesystem, the xHCI controller
probes before firmware becomes available. As a result, the firmware
request fails:

  xhci-renesas-hcd ee000000.usb: Direct firmware load for
  r8a779x_usb3_v3.dlmem failed with error -2

Default CONFIG_USB_XHCI_RCAR to module on ARCH_RENESAS so that probing
is deferred until after the root filesystem is mounted, ensuring that
the firmware is accessible.

Configurations explicitly selecting CONFIG_USB_XHCI_RCAR=y are
unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/usb/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 0a277a07cf70..b70e019cc3ac 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -90,7 +90,7 @@ config USB_XHCI_RCAR
 	tristate "xHCI support for Renesas R-Car SoCs"
 	depends on USB_XHCI_PLATFORM
 	depends on ARCH_RENESAS || COMPILE_TEST
-	default ARCH_RENESAS
+	default m if ARCH_RENESAS
 	help
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in Renesas R-Car and RZ/G3E alike ARM SoCs.
-- 
2.54.0


