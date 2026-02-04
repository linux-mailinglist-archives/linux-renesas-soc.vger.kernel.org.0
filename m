Return-Path: <linux-renesas-soc+bounces-27883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MDRDL5Wg2mJlQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:25:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFDDE70B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36A173007C85
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 14:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EC140FDA5;
	Wed,  4 Feb 2026 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSfr7hu5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE698283FD6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215005; cv=none; b=PxqG0G+B174wG9XMPSP94XticghXU9O0qRa8lYufKPNGvGG7qug1i1/asSsJgWf+t6G4OmH4QTHOiR2yIpAYUNGJiNSZ/piaGIpGheWOBDPbEE3JiYE1mV3BNva4WfbwZ6n0bV0tm26dDFtBHbbf8GTWAiDetYVZjGHwrZ7jamc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215005; c=relaxed/simple;
	bh=csoDZpmYyjeCMvKV7endx7NY3EpOJ+eAV8UdMpj9mwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdUilDuKJSaM7hG8UxMqDXe/G36u5D5ccPquSNVpFDcKYmdcBJgai6DRC8rxTYQ73mi+MhPwPkWckHcWUHB+Lq/YTER7UiiyNQQy9GJrXGKHd+qDn8Zui76NMe37Dsr4SAHmGY9goyYKv6SBky23QWWQ3O8yr/PihopWt+STPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSfr7hu5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b88593aa4dcso955835766b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 06:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770215003; x=1770819803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lU7ESjXCTwJh2bpXkAkJ/rnLoQ5/T4bIZw6hjLMuYEc=;
        b=GSfr7hu5K8cb5wkgQbUGt8qhE0rRXbHnIlDjn4fq+tYzYTlCrAiUsKz9troy5nCgKl
         qDyfkIDk/ECeH7CUHNQaJhye+5zuetrYAGQuGD4k/Vhv16IE8rhFwhjSW8J1cniIiBQq
         +DYXCcAT9mcu7/nzb6Q+k8TsncAWq75smIBR1N+/yg3mhOPh5/ZtuqgvjjYB95rsyHES
         hRaPMWyUT+LBOOMTAXZhluKSiIDVMsbPfXh6O68Oh8ma6kddoTORynQd4SqXJpWO+WmW
         yyGLErK/S8Ee0Zw3B53EJdCGVy4V40HEfokDgMG80JC8Z1TkUwhnnMWQN1Lp01FCHBDp
         Zukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215003; x=1770819803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lU7ESjXCTwJh2bpXkAkJ/rnLoQ5/T4bIZw6hjLMuYEc=;
        b=WN0VnhCeISfoUspNstcqV+MuSm3UR2jxUCEfa36+JYc42j2962iyvpXJHDHt7DO+RI
         fvpK6/pC8lPw1pEkWs1Dsf8Z+0dinM1+h0BZLRnihbSv/ptcNGNI81lECAnoQx1+3gUT
         idQPKJ0RCfyO3EoELnY0s0b1mX8oDl48WJ2BWcu4Q5d9ct4IyC66d7cTC85K4tnyQcKd
         12pjljo1DUrufL/7nfU2T0ew/v9nZjKppMuZfoZFaMvbG+nlaKFt3l1ifoMUWB3UMMf3
         9z+VkCX+HTzxMjKGd/xyNByD93vlKn1db1w73xY9vofSvJ+3mJk5faBWIGgH/IjlB67v
         rJBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwEZofhDup6q9xlPbRkweBidZbvcrucHhz8jEuPlyuD/IAgyEwOmnUY+4SFo6W02felT4cKEzwx8wZtGmr/KORBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJf/sN39I3p7S4T+cWzTanz/fsHb8+knzVpSKdb/lSgalmklfX
	/EjkNzTSNAOM17g0DxS5coNdwxuWjgQtVQi2IRFs3vvugLn7LAqTFEmk
X-Gm-Gg: AZuq6aIKdbSTYEU2g+iXHQXABxQqzWRcpRLlDPuMUCmVdkYHxPYLtfjT9S220ZGqNyZ
	jhY3shk4IM6bKWRi/cDfUb+VD6XS/CFyvHSHdrUx0BBCymwg3kdiQ87OfmnCrYr4C1x/hpWOTqM
	+jDBrvwuYybZqyjY4+6ydIgR5/0QOqMgjl3/Rc0n3Lpg17yoHT04jdSBv7fjrj8ItTIRBGdaGhs
	vbEBSK64U6W1roTa6b8AQHWOSSLxHiRsuuLSYp23KWy+4MsFf4/7B4mTa2dp8Zij/5oEOQV5cC6
	/Xsilo3ZRwaTxYsG6B50rEoBRo2S/FXrp7fpQDx24maAH9l9sWC2kjM8opeL5IprfvjgiNNdRdN
	QSCKKip7oxRerlP1TkHhK1quZ8ch2fx7FEJLtYZBHBbtRfQLbOW9u+huuOklwuyd7/BwQEsz6sI
	WDNkdoVESnyNOnc+0R70en0MXbl3WfrqYBSic=
X-Received: by 2002:a17:907:3fa4:b0:b87:2780:1b36 with SMTP id a640c23a62f3a-b8e9ef30624mr255363466b.13.1770215002965;
        Wed, 04 Feb 2026 06:23:22 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea001ea7dsm129038366b.47.2026.02.04.06.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:23:22 -0800 (PST)
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
Subject: [PATCH 0/8] Add RZ/G3L IRQC support
Date: Wed,  4 Feb 2026 14:23:08 +0000
Message-ID: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27883-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BEFDDE70B3
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC block on RZ/G3L SoC is almost identical to one found on the
RZ/G3S SoC with the difference like it support more External IRQs, GPT
Error Interrupts and also has additional registers for GPT/MTU IRQ
selection, shared IRQ selection between external IRQ and TINT.

It has 16 external interrupts of which 8 interrupts are shared with
TINT[24:31] and are mutually exclusive. The external IRQ/TINT IRQ
selection is based on a register in the ICU block.

Biju Das (8):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L
    SoC
  irqchip/renesas-rzg2l: Make fwspec variable as pointer in struct
    rzg2l_irqc_priv
  irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
  irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
  irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
  irqchip/renesas-rzg2l: Add RZ/G3L support
  irqchip/renesas-rzg2l: Add shared irq support
  arm64: dts: renesas: r9a08g046: Add ICU node

 .../renesas,rzg2l-irqc.yaml                   |  66 +++++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  91 ++++++++
 drivers/irqchip/irq-renesas-rzg2l.c           | 218 +++++++++++++++---
 3 files changed, 343 insertions(+), 32 deletions(-)

-- 
2.43.0


