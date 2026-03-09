Return-Path: <linux-renesas-soc+bounces-29041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KenLGkOrmnh/AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 01:03:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D232232D19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 01:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 411CB3006B4E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 00:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0837613D539;
	Mon,  9 Mar 2026 00:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ckpb5uF9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2233134CF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 00:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773014626; cv=none; b=a4nLE+tvSy3w3mkgFOp0rvUkvHDzQGfPyS+CbOzypjAML7KxigVMRNARzp+Fe/XKsXWJgEUAIIOb/ajULg0WWn2L2Bv+SHCGiyeFv4BqoI0CEhLMyxSX9f9Q+ZObE/MBru532uYUo0B0bP6f32EWVq2e4uDXOfB2J7zNB0SsdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773014626; c=relaxed/simple;
	bh=2CuwjY5H2zGtQt9T2CoGhnEcmdwVkk7JW6ZVqUKbW9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBKTr5rJi3HuGyPB8iFiSbSN60Ktz1s0T5myae2WTZ+mzG3ZWDuYDsyJouEpBCAQjvo74ECUKTYngqd6oOJxro9gBU3lRqOZbhKm0kgUS3sFyP464B1dYe9I/WTPlY8Sbcb4w0do7j8VjBrDNSMNmhT1o3c6rBq+9KtO5D6uY0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ckpb5uF9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae82df847bso15602235ad.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Mar 2026 17:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773014624; x=1773619424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SiMQer80U/YZH35WDQO5BKhpPq/Jh1VP3Y5MXqFJrL0=;
        b=Ckpb5uF954obzS7PDTlTqO52w8RYYIsT5quYSIvQGxob0NVgFmHc7LxSXOy31xLV6W
         Vpo2PLajqVcyAA8F7U4VY21goNMKy5cGjKOmQrZXcbX67lr2AikdzukFOcgWDtNaaPXr
         hO7qh2CxoQTZg8GVlmUSE9rBtrjrUO46CIHLQ5j5PwaYrLdvgRjfmqutRsSR/PZjO49e
         bgbDKhhuo/fXK8EjTUqTYankks/CgjP5Tro/mcey2nQzW/2gvqMkS+ZhQOrtLbQh9i+b
         mMKcaPtQ10iIH6nu1k2vRUp35JH5j0WBYyrWougH8cUIbJBH3092Iq+SXLwIv0Y7R0ae
         GteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773014624; x=1773619424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiMQer80U/YZH35WDQO5BKhpPq/Jh1VP3Y5MXqFJrL0=;
        b=QLpXMgBxPehdu0+e/05xQ6+bjw5MgJRoANWBUxPy0Wl/pQDFXA2Def4lA5NCwn0E50
         mdfyRZhszARZe0+DXyjXN0dQSNaN7nr/uAAbGV5pqS+VQjR4r7KHefjNf5BMGRl9v0wP
         yWXhMrGIGjsANDQUyU/bs2YQtsUKTGfsiP0P4IIYj47x7gM6WYae4JmYYo+M6KIjwcKj
         ydSPB0RkcRYFWuND076Vrx0NUooiSki39q4keG/mNJJVz2VOJ2e7d8tW/nASHcEg2jOE
         CE003gEQx+OdojdRhO6b6Rxm1HHGHWWIlOLo+87CjGpbmp7GQdzkQFmM8lfpatw5wfxT
         KL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaGpBpqVO8WmYuVVtzE94I46pJOAFPniWUNnC5KPye8ZCcP2sOgBFijBTcuHLIei3UhQ4rX2lmCRjC8tsso9BSHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9DX00nBs8yzTud+Sj1jWAEHSlqdC5OSeYwCwbjQWbTfO1Dtt
	kgpizx9s6uG9D8X/6BaLT2yQ32eFFXy3rgqhecxbDOfLcTjQwHS9i4CC
X-Gm-Gg: ATEYQzzAz477KheL1UcO1VSMwSLLuMwK2X4JysCR2/uT5t8qOyO/OAOMGTGitM921Oq
	4YsE3V5zVXm5dHBE4Rjee8orIDWPalg29QBsOkfmWvNwXG6hKW9XEdfbZ31DVNqdENgCOJ3BQUN
	SzIXo8UwKX9IYlOkhK03nbR3J8QAUcbziF+v/b44T1Fl7TqAzd3qJNuY3HSKTe6IJSjFAcXOqEG
	ATOkLHIDBwaxDIEIx3NNYSxTRhpopNxd/9nryj7LBUh3XuJnCQSyjmbK7P1vsIikl7fYO+CNaCr
	jF8E1Uc6XY9105R8SFJXQlqodIPRLCrAhpIeM8Xz76YmQgVZILrgRfP5HnZg78kzbRdbLs0EM6F
	A1lrhNH2Kna51VrhzBN7kSsSqlBxLWmMLawhctpwHIvyh1JKPJ4LfYYtyzmT1rsCQEfwcoFZdfx
	gTmw83jvMEL1BPBzeG5B4hw8DoVc5/qoqDOabMFFEmrHggBWt/kTE7BvXwow==
X-Received: by 2002:a17:902:e745:b0:2aa:d60c:d48a with SMTP id d9443c01a7336-2ae8241815emr92567495ad.7.1773014623892;
        Sun, 08 Mar 2026 17:03:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9b9c6sm104845405ad.29.2026.03.08.17.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:03:43 -0700 (PDT)
From: phucduc.bui@gmail.com
To: krzk+dt@kernel.org,
	geert+renesas@glider.be
Cc: krzk@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	hechtb@gmail.com,
	javier.carrasco@wolfvision.net,
	jeff@labundy.com,
	phucduc.bui@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org,
	wsa+renesas@sang-engineering.com
Subject: [PATCH v4 0/2] Input: st1232 - add system wakeup support
Date: Mon,  9 Mar 2026 07:03:17 +0700
Message-ID: <20260309000319.74880-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9D232232D19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,wolfvision.net,labundy.com,sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-29041-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,youtu.be:url]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

This patch series adds support for using the Sitronix ST1232
touchscreen as a wakeup source on the Armadillo800EVA board.

Patch 1 documents the generic wakeup-source property in the
Devicetree binding for the ST1232 touchscreen controller.

Patch 2 enables the wakeup-source property in the ST1232
touchscreen node for the Armadillo800EVA board, allowing touch
events to wake the system from suspend.

Verified functionality

* The "power/wakeup" sysfs attribute is present for the device.
* The system resumes correctly from 'mem' and 'freeze' states when the
  touchscreen is touched.

Additional test information

Demo video showing wakeup from suspend:
https://youtu.be/POJhbguiA7A

Kernel config and boot logs:
https://gist.github.com/BuiDucPhuc/ac7d5d732658ca293af4323ad04accca

Changes in v4:
*Drop patch 3 as the I2C core already performs the initialization, 
 registration, and management of the wakeup interrupt, making the 
 implementation in the driver redundant.
 The original intention of patch 3 was to expose active_count, 
 event_count, and wakeup_count to user space. However, this is not 
 necessary since the R8A7740 SoC has some specific characteristics 
 in its wakeup interrupt handling.
 Moreover, modifying this driver could potentially affect other SoCs 
 sharing the same driver, so the patch is removed.
*Going back to v1 design.
*Update the cover letter

Changes in v3:
* Patch 3: Removed debug dev_info() log messages for a cleaner
  production-ready implementation.
* No changes to Patch 1 and Patch 2.
* Link : 
  https://lore.kernel.org/all/20260306111912.58388-1-phucduc.bui@gmail.com/
  

Changes in v2
* Drop description for wakeup-source property as suggested by
  Krzysztof Kozlowski.
* Updated commit messages for clarity.
* Added driver-side wakeup handling in st1232.c.
* Link : 
  https://lore.kernel.org/all/20260306104025.43970-1-phucduc.bui@gmail.com/

v1 
 *Link: 
  https://lore.kernel.org/all/20260305113512.227269-1-phucduc.bui@gmail.com/

This series depends on the following patch which has been
submitted but not yet merged:

drm: shmobile: Fix blank screen after resume when LCDC is stopped
Link: https://lore.kernel.org/all/20260226054035.30330-1-phucduc.bui@gmail.com/



bui duc phuc (2):
  dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source
  arm: dts: renesas: r8a7740-armadillo800eva: Add wakeup-source to
    st1232

 .../bindings/input/touchscreen/sitronix,st1232.yaml           | 4 ++++
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts         | 1 +
 2 files changed, 5 insertions(+)

-- 
2.43.0


