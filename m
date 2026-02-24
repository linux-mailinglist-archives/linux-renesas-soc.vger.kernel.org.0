Return-Path: <linux-renesas-soc+bounces-28435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMaxMDXqnWlDSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:13:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663C18B13E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6161130FAF01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 18:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CBC28A1E6;
	Tue, 24 Feb 2026 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnDECl49"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AEE29BDA1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956018; cv=none; b=BftzWe5DIzhxrV0i+aQDdGer8FzOuwIqqCo5eYlaxiBWO/I7XHa0qYxCzoGw8/40gzd1kx76OhudDItYOlOwEIr4VkeXcDiPOkSAPb7OBx2bXIDfrOpksOe1TobHGI6Wd2lyq1xasRosTBcpZX/GxQhVoxLYB8L3E4uKQ736CyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956018; c=relaxed/simple;
	bh=mCpAtEZQfNjBGUaxYGJ0Ps9NlFclpgO25Fd5cvsO6Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PwKFXrWPJ4DZstIqoF9BA03qDlwS+aUmzmH3ijjFaCMv1PUsg7P4EHtbB25eznzZuiDZNUlSZDxHUuZ+sqrTUzAuaEwMdN3HVhqF9wKBsGRa2G0PlHOZuB2d7qmQJiDZDStcijAan/u++RvBxuAFF1R2b7PGeIyzN2WSpJVaaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnDECl49; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso47267985e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 10:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956015; x=1772560815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0ujq6p3OT5Y2D84aPGSFnd6N8adzqohs8kTk8SiDMI=;
        b=cnDECl49YaYaxQi/V15/bQO9If2Hq27d3Zl2s6Gbz4i1mWbStdd00ziw1j8q5BBwr/
         1EzZfeHQSTFlIlEZltjXlrhlUiq0VbUsd8TuYuIu/FqKsudiW4vIvRB3gQWCe5apceuU
         LAkul1eZ2ONr8+V1LOhfWIE3ajXfBb3rUd9SuzqpOed/XHEIiwreVtQavaLN5wXw2/r8
         sk6bWYLbyGbgt27M3ehcmCQwzatkopzw96Se1ghqmeLr56kNPyqQnwFknYXjzfBRxVCN
         j4fkcvKTh2Y8gjh/KuGKNXAT4bFYdlBbuE+2qnzG1yctoJUOGc9QaHcAWBe8ykVqT0Ul
         Yzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956015; x=1772560815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0ujq6p3OT5Y2D84aPGSFnd6N8adzqohs8kTk8SiDMI=;
        b=lTQoaFn5G97NP/fO3GB8+i5NbW9+gg9gcj+plzwMVsKvb3P3YLiAzlryMovzy8PW0j
         TLGVQ5MXNOMa/LN9qgVl6FiFBo5USFX7QsHushJx3sDB4vzhX3gkuQ9DKVEDvCm0jhAs
         jHpTkFBQgXxLJ8ttEx3HjuwmitRMiAkoenlPULdX12LIvSgtZHTCeF/zey5818ccrFm3
         pAA7XfWv92nQRpij+11SxRJDJBZbdVO60tZlCSjMVQ4znVX0FSlJ4/OXa3azNUECmcCG
         +4cf0L4uFPDgyPg93lmXkd09rvMSMB8ZV6ARVrW/8TYzlQsDgyoNT29B8Q42NKcYr7lZ
         eFbw==
X-Forwarded-Encrypted: i=1; AJvYcCUCQzsAd9oJ1Sw7qQopeS3vvaC84QgGlMHN7IP3tYHsC9nVoVJsootGfMu6vc0yztWO0zdMSJMMsP+7xywJDrUipg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4qFF9aMheMVnBOmfhLPyMVD3x+XvTZ2zPHeEfzYK4DdvPUvDX
	5coVz4yj8Y3OmTkHMRnEKzpq6a1rRHMQJUDXUj8pn8afRCYh4tJlPwro
X-Gm-Gg: AZuq6aIjWeoEW8Ya7+MjxMmk7KllU1Ss+EL1CuvMnxqIDsRbsPyxeC+zIdzNIWdUYur
	/e3fAwC3xaVgCIpq7F2diED+wH4q/0oipXZu9F+mTRmeWlXXGMj+mcSKa4GszTRPjx5jGABzgNi
	uHLLLiB3+5MDj0lR3KVZAryrDd0q35EHOJJ2IR43+CSydmTziUxOfML9Aof0LDoWHzU8b2zirUc
	F+7Zc0TNtQw/cNjZMil+23DqO6qwXR/TfyiyzoHwCJLd5OCg6IYeS+pN/LBVIZX7C69znv2lRFM
	KQc/behrZdr9AGNI7KQH+oCfm3bk2qeeRwUdX4vilgGqO/+SrB6cvZwLrcvEmYFuRR3pzFvXOf5
	atpVfODli0ycC3Ow/U8q1Nu5SUTGvAX8chdd1xid1WpLuKZOM8iePlRRjXkBGzH6nzUjJLSPFtN
	lFeo5ekpOw6poQzL18o7Z1ZYNp+fnhskjpueIEVT0Cl/hVMfsSq9ZqwpUc12LB4c7BVPZndvy6J
	HToq9dWSjWkmnIhcArAKsVlT7BxpZghgQoATjee2czgbAw=
X-Received: by 2002:a05:600c:4749:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-483a95e5ab8mr222503645e9.24.1771956015015;
        Tue, 24 Feb 2026 10:00:15 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:87da:e3e9:a9bf:6f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd72bd66sm13064095e9.11.2026.02.24.10.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:00:14 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/7] irqchip/renesas-rzv2h: Add support to handle ICU error IRQ and add SWPE trigger
Date: Tue, 24 Feb 2026 17:56:11 +0000
Message-ID: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28435-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0663C18B13E
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to enhance the Renesas RZ/V2H ICU irqchip driver by
adding support to handle ICU error IRQs and introducing a software
generated interrupts using SWPE and SWINT. The series includes the
following changes:
1. Use local node pointer
2. Use local device pointer in ICU probe
3. Switch to using dev_err_probe()
4. Make IRQ type handling range-aware
5. Add CA55 software interrupt support
6. Handle ICU error IRQ and add SWPE trigger

v3->v4:
- Made a separate irq chip for tint/irq/nmi.
- Added new patch for tint validation in irq allocation.
- Made a separate irq chip for CA55 SWINT.
- Made a separate irq chip for CA55 SWPE.

v2->v3:
- Updated the check in rzv2h_icu_alloc() to ensure hwirq is within the
  TINT range when extracting TINT information in patch 4/6.
- Replaced pr_debug with pr_info in the SWINT handler in patch 5/6
  and 6/6 to ensure  visibility of the message.

v1->v2:
- No changes for patches 1-3.
- Patch 4 is a new patch.
- Patch 5
  - Made CA55 SW interrupt as part of ICU IRQ domain.
  - Implemented rzv2h_icu_irq_set_irqchip_state() to trigger SWINT.
  - Updated commit message accordingly.
- Patch 6
  - Made Error interrupt as part of ICU IRQ domain.
  - Updated rzv2h_icu_irq_set_irqchip_state() to trigger pseudo interrupt.
  - Updated commit message accordingly.

Cheers,
Prabhakar

Lad Prabhakar (7):
  irqchip/renesas-rzv2h: Use local node pointer
  irqchip/renesas-rzv2h: Use local device pointer in ICU probe
  irqchip/renesas-rzv2h: Switch to using dev_err_probe()
  irqchip/renesas-rzv2h: Clarify IRQ range definitions and tighten TINT
    validation
  irqchip/renesas-rzv2h: Replace single irq_chip with per-region
    irq_chip instances
  irqchip/renesas-rzv2h: Add CA55 software interrupt support
  irqchip/renesas-rzv2h: Handle ICU error IRQ and add SWPE trigger

 drivers/irqchip/irq-renesas-rzv2h.c | 439 +++++++++++++++++++++++-----
 1 file changed, 361 insertions(+), 78 deletions(-)

-- 
2.53.0


