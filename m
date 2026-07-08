Return-Path: <linux-renesas-soc+bounces-34901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h4fPCC2GTmoyOgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:17:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689072918E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:17:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ngkZF6Lb;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F31530056CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 17:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6723F3E7BBC;
	Wed,  8 Jul 2026 17:08:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AA6364EB6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 17:08:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530537; cv=none; b=SDe5hSZbnGMiSeQBVuUW5REu7Aitu7Mmda+iDXnWfeZfdl7fIbMs1XP71QvTwkog/mnx8v+ZuHEn9ht16bcTBrpqmOVyG6WMWVogtVojS+pJmpc8klb19vMqQ567IVrExBg11vmNa0FKpu2h5/HIV0OeeYlb5KRkj3NFCzvSH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530537; c=relaxed/simple;
	bh=EM7/zjZ1vYPWTmoE2am+DsWmjZMuw17awqS7UFK3Ydg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bjZ6ULrjfek0x99DPABhXX7iTkynGJi3hBnker+KMP3MTajI02OhgF9IJxlX4+MzqYVwv+w0WK/zE4KEFJXG7SNPNSdwP7s6xX+/D//RhLZAFxlcYvPdWqVyiVYm1pDsndRRM5a2AIC1FoDdSPHs7V4d+P3svnWpMiYWKB7G/BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngkZF6Lb; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caf4496889so664835ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 10:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530533; x=1784135333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZAEPe4mQszZgyNJtC3nsbPxwnT67lL3aUmXfl+TtbE=;
        b=ngkZF6LbauVYE61wHhr+RV9sZk+dg5I2WYfzXlxh6yH/c6PW/tGB9+rzdbwM0a0sc+
         YsERBY2/gHDLyGzrW1ad3/TnuME1aSnOpf2GbqB4eaAXS9uo1ERLErB+zbNA2Sttukvy
         fLT2I21/pf6mbPgZXFNsAiPyHHq6OwR68sIZdiRVAd+wwQ4SV98R/EmZ6HQ0GziIBeKA
         lKEsSxdg4LFrGmPsc9cylQaaLyJkdKpZge9W7mBa0fAZrUhEfn5BggJeh2j0+IJLnOJl
         FpcK3S/Q9wlR92jQadf06WnLmBmf+4JXpUA8rNLa+liidfPU3Z8uqdxo57lM89/0Faor
         tdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530533; x=1784135333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZAEPe4mQszZgyNJtC3nsbPxwnT67lL3aUmXfl+TtbE=;
        b=KOPyjdCoeOpzDFibEqDeNxmuUMW06pJGxqCKRhJ+Z8NVdCTCnHnX8qc6ff4o2/Ya2k
         5u5VMMmEJ5Klip3hXyP9oRZLyK7hojt5148OULlHAztlMl3U5bU89Z2m7df+JgCBmySK
         ZunbzGfeVsBl9VyaJiyUC7UVBDpTvQvVb5h3RnWiK08CY+t/fpoXL/ntqEb2RXCNG/Wg
         9n9GM7W+A22fQVvu3zVQJuA5yTELRJ5fxyo8jqy/JxE7LMDs2xa+TzdX2Q0HEhqIu8If
         P+gz0jzVRluMLgO5OKDKgnCtiyWaWqOJrnNNYsnpklmbwLuBPRoEPJ4s9mR37YKi+k7Y
         6Xnw==
X-Forwarded-Encrypted: i=1; AHgh+RoNH980oWLDETtNk+Re4fgUrBu0ryYQko4PwiVNZG50o9zmNatQHcB2yw95fovJ2YQaDCq9AiO5Nf02H8AaoOuAhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZviqaRbws8PxiKeWeN6hdluj6XfLFPzRpWRo/0mN4oSRHwK3L
	iR6AS5htmBL6eIT4E8weAxbTGWWUAvYxOBsFN7UkIfbRXioPKojzh/x2
X-Gm-Gg: AfdE7clcilRc8uykzAEMpRsLwejs3crkcAleMAxf5WXgo/6btwIthWUhyPm316q4I0v
	GFb4WqQeuVC2otcfFnidw6nxQFYjbZHvc+NRbbVtAjx5/CdccgCMtDTr7FSf4IJFtSZe7jXTOFw
	GpKBgwS95xKHbE4Q9QS07VsUXDmPajwWoQxEXlbu1Fh4M2U+tATZCJ3uMWT3t0HkUr/bcnA7DUI
	F4Fyzz5EVWcmBS8oST1V+11NaVMVWZ7hjwd3NLRIm8iGWFUEbWJQ+DowDQ/NRyq2mlejQcR0Cum
	Bb1vuNQZRq4eqOI+OPXsHQVnprxGSY8KCMcBJyd/cSIGk3z0O9lCi0dHallDeqAe5mfRLlbkdE3
	FVxcMWrp1xs9F0bgAurYuFLsWHXfkmFwswIBjUagtiqisGK/pCPTD8Vu9XBp0ShW8Txx7FwF6pQ
	qySTyzjtmN2diRGwEMzkVDgH7cf8TADaLvvGUOtPGB8Mc=
X-Received: by 2002:a17:902:ce82:b0:2ca:9a9f:bb10 with SMTP id d9443c01a7336-2cccadc6e24mr73473085ad.22.1783530533340;
        Wed, 08 Jul 2026 10:08:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm26602154c88.7.2026.07.08.10.08.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:08:52 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v5 0/4] media: renesas: Add missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 22:38:44 +0530
Message-ID: <20260708170843.55076-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34901-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7689072918E

This patch series addresses missing media_entity_cleanup() calls across
multiple Renesas platform drivers (rcar-csi2, csisp, rcar-vin, and
rzg2l-cru).

While media_entity_cleanup() is currently a no-op when
CONFIG_MEDIA_CONTROLLER is disabled (and even when enabled in modern
kernels, as pads are rarely dynamically allocated anymore), the media
subsystem guidelines strictly require drivers to call it to prevent future
leaks if the core framework behavior changes.

Changes in v5:
- Removed "in most cases" from all commit messages per Jacopo's review.
- Fixed missing empty line before Signed-off-by across the series.
- Patched the error path in rzg2l_cru_media_init() to properly cleanup
  resources on failure per Jacopo's suggestion.
- Collected Reviewed-by tags from Jacopo Mondi for patches 1/4, 2/4,
  and 3/4.

Changes in v4:
- Formatted commit messages to strictly adhere to the 75-character limit
  per line to resolve checkpatch warnings on the mailing list.
- Removed unwrapped long lines from the commit descriptions.

Changes in v3:
- Addressed maintainer feedback from Jacopo Mondi to fix an unused-label
  compilation error in rcar-csi2.c. The teardown inversion is now handled
  cleanly inside the existing error path without requiring a new label.

Changes in v2:
- Introduced dedicated error labels in probe paths where shared error labels
  previously caused media_entity_cleanup() to be skipped or improperly
  called.


Biren Pandya (4):
  media: renesas: rcar-csi2: Add missing media_entity_cleanup()
  media: renesas: csisp: Add missing media_entity_cleanup()
  media: renesas: rcar-core: Add missing media_entity_cleanup()
  media: renesas: rzg2l-core: Add missing media_entity_cleanup()

 drivers/media/platform/renesas/rcar-csi2.c            | 2 ++
 drivers/media/platform/renesas/rcar-isp/csisp.c       | 6 +++++-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c   | 5 ++++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 5 +++++
 4 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)


