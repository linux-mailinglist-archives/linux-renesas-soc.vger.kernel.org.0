Return-Path: <linux-renesas-soc+bounces-32912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCm4DaAjD2rPGAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 17:24:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E241C5A83DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 17:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92C4431F7C75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 14:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B556629ACDD;
	Thu, 21 May 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEGTSSJV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE527AC31
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374881; cv=none; b=loWUwty0cZsjGFECgIUd5eMbutzoTRRksVB3he/e27mdD2xaMEij7ms1/OC6f/ylaLCJEwNX3RR9OaOqtUhl1dBQvpUHCGgf7NV1GnAZDOWrSuJO7er3Gr29KKuwlMY+WG29dtS2rEMPftOZ+Z5+dYIuBmuKE2k0RkwD/Oelv+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374881; c=relaxed/simple;
	bh=WLhHq04fBXG0DNoal9+1yxqpgRYusFLymvrxnQKKfK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WH/PYEY9L4tF/l4viCWzp67p11GdGP+paVj1nHDOTbb/1ofR+y2ZYoEjjrh5AtH/xq8Gvjhv5V+2QlNaPAwMqT1VGuLHjF9Cy55ns0A4ITfJkgkhaXpT3F1VosuVtLlw0nUW4OtMKvPdBwpAp3fXYV8/mdmkT+qx0aLbqXmjSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEGTSSJV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36a3dd2e66eso703657a91.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374880; x=1779979680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nO5Guq8P5pYUyNX9rihjVTq3LCCfxDcguL6lLRydU30=;
        b=BEGTSSJV4c3sQc1QF87dxrc+5R3Kf2zaAiVFkNpx6A8jikBnaMaKgAG64v+qH0bmpf
         +FrFo1j2GlPGtrfYBXFXsi/NwGv9zMVE2G6aS6D/w3pjgq6rvoDgOyeuprEtg9jK1I9h
         sh5TbXbBT0fZfJ73BGDUCuw6v04RS8f6nrkO1ke+BUxUWF+Fd8S0beJ0u3B/M01Dpqvc
         xBwMqIvSPp97ci4U8R3ejrCmBie4/uxbD3pznKIzZYSKnv0zwbbuX7z5+ojxhYhtQvsq
         BJ6Q4MFzB/bDHteMAamTY8+Wn11xBOzCndHbQ55+a1RHFd4sQavmGNx+ulqjpKanMoWt
         AC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374880; x=1779979680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nO5Guq8P5pYUyNX9rihjVTq3LCCfxDcguL6lLRydU30=;
        b=eTRQ/NmaeOCTLF9EL6wCxUeYpqD0N8RgFLnfdWrcefwSqHynUsHbc3VEwQtgKvsFxP
         dxkoKwSY8bePNZjlMuxEjhCPmxF0Aix0d8vG1NbXJt3Wk8OayxEbAUCbYQgTl00Rq4kd
         6e7Lkw3B3zIZ8ykkG07efOLcy0gjeon5sU6EvGTCTs3tyzHPxPd1T5KRts7LmEo75+uu
         +oUFsVgxQrPyEQSCxHo0YgDy3KTWt6x2EOVnG8GSXzvaXkTCa4SUeyX3QmR1kYjCe0HY
         FKmK8KOL7/MF+LjZO0SrvZE+mkMaOWKQ0nBYTQHanXOhTLywxM3Ht2f+D/SkgiFWkpg7
         4Z0g==
X-Forwarded-Encrypted: i=1; AFNElJ83IUlYchEwgNvfYIYIuEU4re9RfyARrnWX8V3Mxzn9cUAqxrF/q9ENeL+Op/kU7UYsBsF2F+AvTLJSUXcRdMp20Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl0KB2u6B5yYXy7MBkUeH2KE/LKMzf8+9V2UATARzaoAVa6To4
	X+2Dg3ogvqjxH562BZ5pGgjF1gemw58Ahzml2qU3ar/kcC/8OJx7e4Jt
X-Gm-Gg: Acq92OEv3bAUEbFZOaPV0KblaHkdo7ai/q8kPkzkMFZZVCh0eSfjrW7Pz3reGcQWusm
	QcgtMfC8FogpC+Q3FI5tE+N8DHIIF3T1CO/TB0B2w9Xy2R3Z6lH7ANqUlUbdp2H0sE1d421R6/q
	CDDh9DrCWCPTSqYZwvqMXm3AoVkyp1jRPf8/pLvrZ87QDQLPH46facMQnodWzqymSQ3e6aasHKl
	2dwE+t8XYpVlaQPW5AX3/IKxQL3/H2hYtlyRz/AYHxO4mwcBCo/XaKI/rQX+O6LejgwkYpQ10ua
	3Pi54D2Z43zW3LtwuCJy9aNMpPwVJlBTSYl7cj7/qQTw6ts69J+Va/iLkGzLN6+QqJKLoVNXMg7
	p3N5FjsrD4VK/3rlR4ePQZBjkl2A4DhWT9+8BRK0bCOaqvXCTJ2YJGXKkNfdlp8P0ZyR4fsH+oy
	1DZltJ4S4hvJPH3EFpvg9aLbaJiHz1Q+2MrD8+c2vOzoEt6cYl
X-Received: by 2002:a17:90b:2c8d:b0:366:4782:1375 with SMTP id 98e67ed59e1d1-36a45658e79mr3220163a91.22.1779374879710;
        Thu, 21 May 2026 07:47:59 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cc5643dsm3773472a91.7.2026.05.21.07.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:47:59 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	dmaengine@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dmaengine: fix dead empty checks in mpc512x and rz-dmac
Date: Thu, 21 May 2026 22:47:53 +0800
Message-Id: <20260521144755.3476353-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32912-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E241C5A83DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Two dmaengine drivers use list_first_entry() and then test the
returned pointer against NULL. list_first_entry() never returns
NULL, so the NULL check is dead code. The author intent at both
sites was clear from the existing recovery path. Switch to
list_first_entry_or_null() so the existing NULL path runs.

The two sites were raised in an inquiry on 2026-05-20. Frank Li
confirmed and asked for a patch.

Maoyi Xie (2):
  dmaengine: mpc512x: fix dead empty check in mpc_dma_prep_slave_sg()
  dmaengine: rz-dmac: fix dead empty check in rz_dmac_chan_get_residue()

 drivers/dma/mpc512x_dma.c | 4 ++--
 drivers/dma/sh/rz-dmac.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--
2.34.1

