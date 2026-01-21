Return-Path: <linux-renesas-soc+bounces-27208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OETvAhj4cGmgbAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:00:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C458059972
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 00AD0789229
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E0E4A5AEA;
	Wed, 21 Jan 2026 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwuTGK5h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56384A1387
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007714; cv=none; b=RU7SfiS8zXhr0t8rWVMm0L/jBht/jXatshCfJ8kFyn9DsYebOHnbdEnjH6DGAjw9DFWuGuF+C/zgy1FlF3cKnmlqbrLi3qIqo33EHKeLV86j2haCBtNWZeRwQ1dH3nJ0kwG+Lm0qYMzCpJcBzcrms5TZp+3TUmBp56zbszbuy0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007714; c=relaxed/simple;
	bh=qNBLxy/sMor/XGxPuPIp1HWCrl2gW1VavURVeYhTYFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d6ibvlgldBa4LWxnmQtaxm85l1U5luteE3oeQD093F0cBBi1PaHeloXW6AkWWLhSCWVoaM8R3WbSOCwq+dAC7nRinRsihqIoryi5LG6En5mlyeAsKMdBaC9JeJ8+kfHccnjuAwZmw9yJxodWgkVtSqIh/njohnVUzgOKEKIweFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwuTGK5h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee0291921so48165395e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 07:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769007711; x=1769612511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIFdhbTYMw1U+dvdLp6pmK62JBc5NKF7Jw/IKHC/NCU=;
        b=UwuTGK5hFvo91GHvr2883Nlkkv1ZgiJgr0Vx+I/5/zsNSA5tAa9R9pLbgaZDsN2eIs
         gr1Utt3ZahVH2IwnKIwCJvScE9CMM/iZkYOVrJsuBLDB58/M1X9wdspsCubI0SQDHE5I
         +G+Cq8Jz6CJE8m6a12WgVRXtSmS093X4HQWqqyYyBj3SEQ+/u6NBejO75NlZO5WBpPBL
         z9P+sSA3Q+BDhSF3hdy1TUJf90bIWaME2ll2HRYFwDW25haJ9lsT1M8LILf0bGIhn0dJ
         ByBDfTY+U+reesCBkZIRMr/VioOl+R4wVYFjs8XeY4pXjh2wl87UYYaPD4ofDn0s6KdK
         PLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007711; x=1769612511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIFdhbTYMw1U+dvdLp6pmK62JBc5NKF7Jw/IKHC/NCU=;
        b=gbbm3oUyfb8LZc1YBKhHMDDAylyNORMnrkOJY6J9btCd8P9JPgwY796Wxm9z/V6Jxz
         JgZO/O5Zye2aC4aROyFsfKJUbf/jiSIxBwu2pWu5WQ2zmTby/u0puk82IdOrEQYkc45K
         TU436x/RGJ7cBlDRFbeEuMEDE+v6vNZt5y8TD7esaMf5zTwJUK9hiy4P/1z0lSEV3FcS
         M22h8ZfPBCMt3svinYB3h7dFCdouJmeBn4DJtATgsMLOPXVep34LJ/T+zf5qWeOFkgzh
         luWCfQ+uZV+ACoT3D/emkPOlcyjZC/sUPxXUf5reoRtKQfJQeHZC+/PYiIqqMkQj3cLo
         a7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWJFBN6n8O1juJ+dHNE2g0yC9rej9u2qS2+hIegREmj0xFdRNftR/vGdyGxBY7qpPl+kftZSVDY2zUoeaca7Cpx4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhf7rG2SxL7B6XkB4bc+cQo9J1i/S73zVxkQR16zDB9ZMURC+E
	THyVClEKuhiGmVcQw1GGftowg5CNg6yR4/+EnhehS8PnczNFxXzK2jVq
X-Gm-Gg: AZuq6aLLlpWjZ0Ov3bcOZYD370b1/+J63fil7xVEcvr3N3zshLxdjIzMRvVxmlDjEQ4
	BtSGuTVbgOCoi/FnzWxG5YFIwBXohAHPrwlS8eCRFkQHphUGcrLoPo41xmpssSEuMPJeg0Y+VnC
	6Yuwax0VSGe9shDdpAKl/tScJEmv68DzH3zTd71Non3i+CupGu/kqbwjQ2cRMDeWkGz+OeWbrnl
	ZV9smhkMlPUfwy3E+8W9H9K4ZRe4XE38JuGi1rutLwviL8XNZADMisZGXBuZHiVMS8DLdyB68PK
	ohiVL7z568WvRlekfgq/GSgJyGJhDWS+sUCGjOp2gpsHS6TbEJOiXp4PHEF5EnsUZLmRY4GgagO
	MO70vZQRV2mW3ZdjSnZ0I7FyJZ3s3scUHhkgQ84MIG49lVeZjt/D01Kh2YWq/283XNuvTZtTGyB
	ULHVcVmJu+pCthDcyZW+nquTlz0aZHXeI3EFqTfR7Luh37M2ypJnyWhEdkI7/3SlSzyWveo78Xw
	Pki70DBUlTJSroMoNGQ3rpuZc/ZFzT3
X-Received: by 2002:a05:600c:138c:b0:47e:e949:37e8 with SMTP id 5b1f17b1804b1-48039d19076mr124301215e9.30.1769007709950;
        Wed, 21 Jan 2026 07:01:49 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:3190:c653:bb13:4ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042b6a3e2sm24787585e9.1.2026.01.21.07.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:01:49 -0800 (PST)
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
Subject: [PATCH 0/6] irqchip/renesas-rzv2h: Add support to handle ICU error IRQ and add SWPE trigger
Date: Wed, 21 Jan 2026 15:01:31 +0000
Message-ID: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27208-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: C458059972
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to enhance the Renesas RZ/V2H ICU irqchip driver by
adding support to handle ICU error IRQs and introducing a
software-generated interrupt (SWPE) trigger. The series includes the
following changes:
- Use local pointers for device tree nodes and devices
- Switch to using dev_err_probe()
- Add software-triggered interrupt support
- Add handling for ICU error IRQs and SWPE trigger
- Document the new debugfs triggers

Cheers,
Prabhakar

Lad Prabhakar (6):
  irqchip/renesas-rzv2h: Use local node pointer
  irqchip/renesas-rzv2h: Use local device pointer in ICU probe
  irqchip/renesas-rzv2h: Switch to using dev_err_probe()
  irqchip/renesas-rzv2h: Add CA55 software interrupt support
  irqchip/renesas-rzv2h: Handle ICU error IRQ and add SWPE trigger
  Documentation: ABI: Document rzv2h_icu debugfs triggers

 .../ABI/testing/debugfs-renesas-rzv2h-icu     |  24 ++
 drivers/irqchip/irq-renesas-rzv2h.c           | 303 ++++++++++++++++--
 2 files changed, 296 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-renesas-rzv2h-icu

-- 
2.52.0


