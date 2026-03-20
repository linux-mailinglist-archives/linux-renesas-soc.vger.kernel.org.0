Return-Path: <linux-renesas-soc+bounces-30029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLu7DRl7vWmt9wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:51:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC56D2DE039
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FFD230DAF13
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 16:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3DD3D1CCD;
	Fri, 20 Mar 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fODMX3aD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F83D1CD0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024925; cv=none; b=DdCW2xYoXEI+D6UceaitHe0EVa9z5G5ZqIpCSYqFwezPHa4f+WafGr9GUISB9ekQuAy8SUqY9+t7xjkr7yypb7KysN7d2qCMezPfbBKhMeo+ZW7faR8fmIJZop4GtBQR+EXk0dj58J1Kuq1rH2i7Bjj/zcM9OsRwJtiMtNT5d3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024925; c=relaxed/simple;
	bh=Hi/TIoOUSM841qakUTbu3JycSYmvOXP03h79Q6RySHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WeI0Ya2xdGvgK2ff7xW+lx8wtqlBGY3B/JyqgtgDpU3e+6UHKGgGDQPKCZlrmnLTBebgBLDpXVMmW6H8K9JGL9dZgWWfIRQLq2FUIRti7MG5yySUdGa74O5sedrNDwr8y6zKymDfOTYvonmp2nlilPCgIPzniwiGB9a7pZ4TFuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fODMX3aD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6795455e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774024922; x=1774629722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3By9JWUmg9qQ/pqhNEezgrYY//+LwMSXyyt4mTlVhH0=;
        b=fODMX3aDChTLmxSRB/oocQIORSjHtOZY4j+OHuZs273z6lKDMHPeTxZ+zzcVYvjmNg
         NhgMTRqff+mwUg4qGP8/qadWU5oute8FhmI/vTyY5yFFNDW/nIGEAcZsqBKqr5cZqEBR
         qloCrl7DslBfB/MK2tTaq1dLCrjr/NMJdE5IPuHgays5+Hj7Q7Ji6j0t3jv0OTz9QXB0
         BxyPbpT6PSlzRYCeGANZ6vsXvBwJolCbtiT/XWa9WRZ4SYkIX8K+0+N2sHPQmqzgbPhv
         pGdR7HOPhPnfjVWyApnGvmPOuRYHHgY4tlivUPHB1aDSA3efcUhhDc/tKwd4m7fWGqH2
         HMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774024922; x=1774629722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3By9JWUmg9qQ/pqhNEezgrYY//+LwMSXyyt4mTlVhH0=;
        b=ih8GYTmk4DkyfdBmYVqc7673n0SSy2c7WibBLdVMhjcdlXvZ7Pu/pl2RFPLb4Eswbi
         qk9wWzc1/tAryn0c3IVU1Gb3b2Z3gq6u0w269Chz74XhsZWCT9rAKz3qziTpj6kkRd1S
         kMiwG1kDrDrSsrQ0sZ6z6I0QRBMx4ZYTyn4E6w8bXIbWe/lJEVBYjz/bnrnxYa6XOS1k
         TDhX3pJsuGQAbmQS26GyemAApEkIzxzMWhjBu/OXHGyxMlT0fhh0+/MCV8C1UhryVcwO
         C1uy2q7zA1EPTIKz7hT6c6EqWM4TAvH+aQhzgq2vct5bT5ELMIM5Ft2Beh+0zgmDkDj7
         b2og==
X-Forwarded-Encrypted: i=1; AJvYcCVTs12MsX2pxzo4k2PS1b5mXDW4xL89Lmp31mbqmB3wBcUrfK9gmzLpsVcZcFvH5wj8vIbd7zl8t0ulCFtxn5IjqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsd4wUcQ/p+kesbyBEL7Qiu6JNQcA/+RD8ScysLuJocsRnCt3
	Sw0C8BrbhPtII5fbBQHnASoTHmX+fUpoZ/vRED/QpxfuL1cioaoUnWWT
X-Gm-Gg: ATEYQzySnVPzwPCHGgun0s7571Vw2jrseLvrPQNwzw1EL0iRPXKKibRxfp3umFTnd1b
	hs/5Z22miPuOsrkjqS0nO0nOy/dG+jiE1pU/S0MGN7HrSSinbMHCLivrBRtHm/3+kfBoYDuJcuJ
	sDWbDzk1Ei/mhIKFcFACjDVfGcfTStr/xa0x2/6W9IauOothn/69qQTTBrLNheYMP9urv2Yo3bO
	ewQbAe1dE+htS3GpeSMl8PDLouTZVuB2IdZYd8KCrw5Fc96c3Dg0mbpJ/PHVE/TWMFDsbpTiaG3
	idBvk2vasdFkXxMGHhqb9aJ4IcFj5OZ+Xaiv89ObQ2YNF7jbpLN4sXU+ZYmv2GZo/8hQbRKsaBQ
	dAiQCFCbCLZM+T+hwpzt48bz4SDtSO7ik+ZiQTdsenQozoZlQOvxXF9yYU1oeF6B/2BaYHrD9cg
	nztBk2Tm1ZLfnknAhtDvAODHlRmm0aaYc=
X-Received: by 2002:a05:600c:c09c:b0:486:fcdf:c065 with SMTP id 5b1f17b1804b1-486ff01caa3mr43316465e9.27.1774024921602;
        Fri, 20 Mar 2026 09:42:01 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm7016575f8f.20.2026.03.20.09.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:42:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/4] Add RZ/G3L GFX support
Date: Fri, 20 Mar 2026 16:41:46 +0000
Message-ID: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30029-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.847];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC56D2DE039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L SoC includes the Arm Mali-G31 GPU as a 3D Graphics
Engine (GE3D). The Arm Mali-G31 GPU is a graphics acceleration platform
that is based on open standards. It supports 2D graphics, 3D graphics, and
General Purpose computing on GPU (GPGPU). Add the binding and driver
support for suspend/resume functionality along with some improvements in
panfrost driver.

v1->v2:
 * Dropped duplicate err assignment
 * Changed the format string of dev_err to "%d" and simplify the dev_err()
   line by using err rather than the same PTR_ERR().
 * Collected tags

Biju Das (4):
  dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3L SoC
  drm/panfrost: Drop redundant optional clock checks in runtime PM
  drm/panfrost: Add bus_ace optional clock support for RZ/G2L
  drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC

 .../bindings/gpu/arm,mali-bifrost.yaml        |  2 ++
 drivers/gpu/drm/panfrost/panfrost_device.c    | 34 ++++++++++++++-----
 drivers/gpu/drm/panfrost/panfrost_device.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  1 +
 4 files changed, 30 insertions(+), 8 deletions(-)

-- 
2.43.0


