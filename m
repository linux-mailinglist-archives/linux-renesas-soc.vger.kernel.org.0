Return-Path: <linux-renesas-soc+bounces-28050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNYxCUC6iWlmBQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:43:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4B10E3BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E73A83004622
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 10:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A589367F52;
	Mon,  9 Feb 2026 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m35nVM2F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D8364053
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633728; cv=none; b=DrdRubzrdd59tV2KBj7pxPRH5hNhDW7XypqNmjMwHkqPjF+KKxok4jGmdrkAEBsT06KGRtDqNnas4LlzPqWYfTSX9TdC1etmFVbf1gKWvKNpvv8qVyPKW/nUJLpNRbSJkaPXqs6mJYxtLu4JRKiAwHH0VogYtGFfMYaSdrW3Dso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633728; c=relaxed/simple;
	bh=uSJN6iVvJBQFbW7Pe4mZ/DD47JVbfUGc4iZBZzn7HHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RA+huYKDfuULduq1QrY9PC/LCWZ8MQU4ZDD+kLYZxFq+cAeBLa6LOpfB9W43hjygcXDM0jJontvP74zNZfDJ/UvUAqhAk+LeVIlNlLfQUyIpp5SqEgXvEvTX/NBhiK5CCgWZZ+kHqqeKBuoiRFO7yarMrAyoNTPya7qbEOc6Kpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m35nVM2F; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4359108fd24so2725813f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 02:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633726; x=1771238526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=307ZdmdawVFooRoMptuS+jFabF/GbJmECp3p112JZAA=;
        b=m35nVM2FacuzyhCgFceTjP3fKqCyEsD+6Jdvoxh+domiHqFTR2Fexkb115bPNg+ee0
         DBuG1Y0ecJi84p58s+ZnYyXrAcb88t1ngTOXPWmQeicXaY7FI2IVv7LLLR1lKxmNqkK2
         s92BJsvs4YoFMkBvMvB8khD6hEMMsjJZ5a4nb5vIyhv55+16/FWFLlZ2MfkXM2oomSXK
         WBxnUKUK+klSBIGqwiwggsSH6szERmq36qHDuCXmImXHi+UxKl7eSJorae4UyIqMzCYg
         dzeGQO3yie9Nq9MyQHm7WWDkAkXPkJ+rk9L8UV7XQ6WwcoHc4502UXMpGE68LPGDVmsM
         Ckrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633726; x=1771238526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=307ZdmdawVFooRoMptuS+jFabF/GbJmECp3p112JZAA=;
        b=Ekt4+QmouBO5IAJ3EX/jQxiqtV5ezHHsBhy61VY3LSbbRGUPisvBZG4d4KLO/Ss6FA
         0DyXuKYv2R5WnUuhPlBTLvZanVb9rEEf6t7cm6FSeEdX2fOrbWayGYXdkEK8BPTfVJVf
         NpKlK0wrzMsk2lC/zqj5R3MjUntGKkXV8SnATnwnXqGtqSB75N0+yIMOpiee5C2/dfg3
         OCTmcD7BufshEHaf3rD2lphXKBZzDECKwbb0AGSQ6re49NeeFuMp8ns5ix13g/esmSAg
         vTY6KoD7nJXzuQwv+6SUVyrvY0TgiqbEOpWFDvCAx512yQQzMd/m4IdolV5DYqiPxKQG
         s2sA==
X-Forwarded-Encrypted: i=1; AJvYcCWO+HcX9OpHQ5zvf1h0nG0tSXcjQnzmO2fnoGJnJsvT4ifkEM1LRRYihuJbNPCS95SPFB3jPdEcVwNl090VV+USLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM4DT5yt3vLpTj/lEaEhzKjaIPDWqMnHcL+g2uP9VLo86G5AVM
	objsjnovrA4tksUEcSmeGbzN8SABvFaVkBE+DoIYrweAJK8JVXsc1aCy
X-Gm-Gg: AZuq6aJb7tfQMV9yPT/C3arbJImIo2qn82Pcf/Z5QP1gw+W9y8Z4AYRgINmn/LQFCGB
	fZq1l/5QNXQOCXGmejeKKErHFZxMSlWFrMg30dRVIEJTdbE0NfGn1z5hAgk44IiOkud5BIyrDsF
	bFjjMfJoVZfe2lhWPsiM1eb2sfYhDDm4n7ieb5uxShlUDx0DbX1KMOOicES4s8b1FcAP2OcZeLC
	z7Y0ZKQ5DVShm7txj2yJq3cGWJZ34sQqHah9+GHKeg17qsj/b2n9MdbNNE60ORyPuMMXvfDK3eT
	stY0POhk3e8yl2k2D/bWe8yyTQQxbBpolh9vjl/boKlAq42A9AMJMHBSoy0GRpHgmRtc5cRKviJ
	DHUoazNAhUTS4OQVsf4Ua+4hKwczksjlx3aPspGNitNQ5QKEp44FYcFtUxrOsMTlwYpfOXe3A9y
	NOD32hrnyZswcwrkRTS61tRrILwVkNuexdEHdjIPu1NL136Y9PNNZ5bYWF1ynpFveW1QkHLTdEE
	+Wh6tKSedv1kWWuJs3XISNd6+iTiP0srxs=
X-Received: by 2002:a05:6000:25c8:b0:436:23a2:5e44 with SMTP id ffacd0b85a97d-4362968a31bmr18375807f8f.45.1770633725937;
        Mon, 09 Feb 2026 02:42:05 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:436e:8b6:a7da:63b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm25962211f8f.6.2026.02.09.02.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:42:05 -0800 (PST)
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
Subject: [PATCH v3 0/6] irqchip/renesas-rzv2h: Add support to handle ICU error IRQ and add SWPE trigger
Date: Mon,  9 Feb 2026 10:41:14 +0000
Message-ID: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28050-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 9BF4B10E3BC
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

Lad Prabhakar (6):
  irqchip/renesas-rzv2h: Use local node pointer
  irqchip/renesas-rzv2h: Use local device pointer in ICU probe
  irqchip/renesas-rzv2h: Switch to using dev_err_probe()
  irqchip/renesas-rzv2h: Make IRQ type handling range-aware
  irqchip/renesas-rzv2h: Add CA55 software interrupt support
  irqchip/renesas-rzv2h: Handle ICU error IRQ and add SWPE trigger

 drivers/irqchip/irq-renesas-rzv2h.c | 337 +++++++++++++++++++++++-----
 1 file changed, 284 insertions(+), 53 deletions(-)

-- 
2.52.0


