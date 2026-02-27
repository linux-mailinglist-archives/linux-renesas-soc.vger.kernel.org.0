Return-Path: <linux-renesas-soc+bounces-28529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP80AyKnoWmivQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:16:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F121B89A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03A12308386A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54213421F15;
	Fri, 27 Feb 2026 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWjn3I1K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32A041C2E0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201002; cv=none; b=Q93SA4OPS7xVR5ehpoVoqOwuUIG/6jxGS4YXm9HvMkD4A/eN94OIVFB771JgZt7uKDjtw2JWWr92/+kfnzkOYgIac4kctWeqvaSzhkdz+k4G6hen90xNJIdHnp7ndED8n/fI1GLvNt51lp7jHi4y9nnx3urFnisqntNv90n0FB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201002; c=relaxed/simple;
	bh=GLuWJBZIfTyPDt4eKY3lc6oc+3st5AfC7Cn+6PwQK8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L83+q6e/EqEiRtDrsmPpD7/haHJD5A92aNVD/ewfTzaATGylLPu0E3Q4z/EADYPm1gvIwW5CSKHEQoTlQv1c9u/HGtD3Y6OrLldUISw8grbV46S+v5/7KCgA9wkFT3WBOEZwjgUcfoXYnVN9UgDlsaLV1+dQ7+K4PMLBmnSjkEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWjn3I1K; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43988056dc3so2085813f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772200999; x=1772805799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Au8biWRTrHCmQOyeqm6Jv8HSuRq7I3Ee1UncZvSCKsU=;
        b=hWjn3I1KspAETVFlAYZl/mwyPVWgLt6uVo5dg1kK+QZzW2svxGZFjvAoSDXvAcpdrJ
         xbZk1jrAbAZUKCg/cHUtLiqGw4Hahwfp+kC6V7s3OABet5XzQYOsC4iBiq5laBUkoctR
         GRUa6RGxkni+U4Dcu65JeFLO1qntP3/th0GHVNVFXPwLakgJpF1bM3BZwbj//vCxoa7W
         UOO0tisNKsuOojQJNy0E1gaUbatiGOSogwQWI8+OsZgxR9W3cm2hPjAREsb7fv3RnncW
         qju5M2/sA0oAHZaBsvwYRcHMreCXWbm7qa0oGT5qPaQuhCO0x/RMsRq1awuPXH35gO4A
         xpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772200999; x=1772805799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au8biWRTrHCmQOyeqm6Jv8HSuRq7I3Ee1UncZvSCKsU=;
        b=PTWRqNLH+zbl2AMWztVYWsZkDiy1Bh9xdySK7G/yIs6NmOYWkTtjOGVAK7t65AbXFv
         Hd7tPAM9FCCj9wc9PZiwG2YRM37gUqUrWalVl8G8zApvw4bcQchK42cXJCOtrfSjGe0O
         PEcpc/xzV2wL0QLYZF5EWhGD1FCBLlEMEseooLNuO+Sp1yY7gKaJAJmtjpFMv3oM0BbO
         9Zq/fAUNpgzotKbjO+H1fRW4zfDr8fJCAKK//8EP19eu7V54+EZhtUvlTuWqpMDTLzjh
         micFtt0k9DaZBNH0JseczeqvI8J5PVMfuKkUn8YUP6s+92FSMfL2eLjF8KYL0E4LVA6E
         f4yg==
X-Forwarded-Encrypted: i=1; AJvYcCUI0NeOT6YCsImzkcnH16pNLC6y1VdkRTIIV7jeSn313Ga9WFNlt9yKUahizUc5jcf/8cD/C05q5AmftsP3hbIy4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbqDbdQgADVhLqPt1+HELW3VZbMQczKj5XNVLIHOFTsDnn9TW0
	bnHyUe56XSkMDdmWDkNSOFxHGOBtIpt/DeAlhWUFmEW4aZc7O/zg0hoR
X-Gm-Gg: ATEYQzyKWdEgGV+Y12H4EkB+CxTCgHNCVCPUa9tEgehGuApUEjwyMrVDPanMs/cqSvr
	h41YFHFVQj/GsPPMFaAGBr//OhGm8G6ud0pgNM4YgHd6RnbKUvld868gmJHCi/scSMw7OSIly1C
	gcxpstOsJaACCBgJEfMe3bke2sLtncu5YaIKBHnGE32/PHSfkEJ3imCyqNtfX6Z0vnWTXdcw2i7
	E9ZFmJwhda4gTWHGou1W0KG7XffcySjO35TWpbDw3yA7OebGrBWmU0Py4zpkzDPeAQlKwdQ6ofu
	LaKGyzKxity0Xx0xEuySnvVp2BgMCJJCerYo3kVmfNQsdyeX19lkdG5Ft/WWO0wD1qMpsI1IRQt
	bpCOOHbB4/+Y++BhjDdJrggUuHp7WVkCgjbeAN1YIC2Loctppn7Nazt4yYJr/AxgQL0Y4YfnRCP
	SO1lfIIHww7eJnAaFXOhCHAIsrZiz8aPnS3cVyGeDXTg==
X-Received: by 2002:a05:6000:186a:b0:430:f742:fbb8 with SMTP id ffacd0b85a97d-4399de15107mr5226960f8f.21.1772200998792;
        Fri, 27 Feb 2026 06:03:18 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:4d8b:fefb:26cf:1906])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60feeesm7658811f8f.1.2026.02.27.06.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:18 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/9] Add RZ/G3L IRQC support
Date: Fri, 27 Feb 2026 14:03:00 +0000
Message-ID: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28529-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: A6F121B89A9
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC block on RZ/G3L SoC is almost identical to one found on the
RZ/G3S SoC with the difference like it support more external interrupts,
GPT error Interrupts and also has additional registers for GPT/MTU
interrupt selection, shared interrupt selection between external interrupt
and TINT.

It has 16 external interrupts of which 8 interrupts are shared with
TINT[24:31] and are mutually exclusive. The external IRQ/TINT interrupt
selection is based on a register in the ICU block.

Ref:
  v3: https://lore.kernel.org/all/20260206111658.231934-1-biju.das.jz@bp.renesas.com/
  v2: https://lore.kernel.org/all/20260204180632.249139-1-biju.das.jz@bp.renesas.com/
  v1: https://lore.kernel.org/all/20260204142320.103184-1-biju.das.jz@bp.renesas.com/
v3->v4:
 * Collected tag from Rob for binding patch#1
 * Updated commit description for binding patch#{1,2}.
 * Updated commit header for patch#3
 * Replaced IRQs->interrupts in commit description
 * Fixed the typo Dynamicaly->Dynamically
 * Updated commit description IRQs->interrupts in patch#4
 * Replaced the variable type for num_irq in struct rzg2l_hw_info from
   u8->unsigned int
 * Replaced the pointer variable info from irqc_priv and instead embed a
   struct hwinfo into irqc_priv and copy the data into it at probe time.
 * Replaced the check 'hwirq > (priv->info->num_irq - 1)' with
   hwirq >= priv->info.num_irq
 * Updated commit description 'this differences->this difference' in
   patch#5.
 * Updated tint_start variable type from u8-> unsigned int.
 * Updated commit description IRQs->interrupts in patch#6.
 * Updated variable type of irq_count from u8->unsigned int.
 * Updated commit description IRQs->interrupts in patch#7.
 * Updated rzg2l_disable_tint_and_set_tint_source() for making
   tint assignment very clear in the code.
 * Formatted rzg3l_tssel_lut as table format.
 * Updated commit header irq->interrupt in patch#8.
 * Updated commit description IRQs->interrupts.
 * Updated shared_irq_cnt variable type from u8->unsigned int.
v2->v3:
 * Dropped items and instead used enum for single compatible values
 * Add minItems for interrupts and interrupt-names properties of 
   the RZ/{G2L,G2UL,Five,V2L} SoCs
 * Replaced maxItems->minItems for interrupts and interrupt-names
   properties of the RZ/G3L SoC.
v1->v2:
 * Simplified the binding by using pattern for intterrupt-names
 * Fixed the binding warnings reported by bot.

Biju Das (9):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Use pattern for
    interrupt-names
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L
    SoC
  irqchip/renesas-rzg2l: Dynamically allocate fwspec array
  irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
  irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
  irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
  irqchip/renesas-rzg2l: Add RZ/G3L support
  irqchip/renesas-rzg2l: Add shared interrupt support
  arm64: dts: renesas: r9a08g046: Add ICU node

 .../renesas,rzg2l-irqc.yaml                   | 157 +++++--------
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  91 ++++++++
 drivers/irqchip/irq-renesas-rzg2l.c           | 216 +++++++++++++++---
 3 files changed, 335 insertions(+), 129 deletions(-)

-- 
2.43.0


