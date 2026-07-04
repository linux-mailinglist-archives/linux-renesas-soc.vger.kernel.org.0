Return-Path: <linux-renesas-soc+bounces-34711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rQZvMt5pSWpO1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:15:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662870866F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:15:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DbC+kVuX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E10C301E6D1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 20:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7993769F0;
	Sat,  4 Jul 2026 20:15:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB1288C30
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 20:15:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196119; cv=none; b=sVxKAY3rtGEUt51Gink/+eviVIsWy5X4Y83sx/TbonQbXxT693zV2ZfJubWHbtGRV17a0X+/7Dn8tMgQg/bZqI3u/H8dKSDlyumDB4IUjVT9hgBOKIeo1rY/TJgt7KxCp3wPWiiQUSPZKOD0jGmZ7kiVYLNZCk4muiXrGRzrZww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196119; c=relaxed/simple;
	bh=iXAs9EKdnWKF2vZOdOTnpwBugTbbJ5jocueYaQ13av4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uU9efNdD60P5vDFGzgomz6vPE16n8Vldv9eu2HuAwslzDhhi0cd4U60zE5UryMaqHjABlJQzbprTfu8ijipv9O0dC7mTEI438BEQd0ZbZGP0tJUe3jp0QSFk1nmVFp2SOY5gS4pkx4/tdXMJDUwKk4ZlltOd7AD0QMnkThJpG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbC+kVuX; arc=none smtp.client-ip=209.85.215.170
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1491661a12.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783196116; x=1783800916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=po7/9ym21PytpIlOIcXoT0sadxo3i41zJVz0WiwkGb8=;
        b=DbC+kVuX+uwiCHa06z/arIHlxZ80urXi3jflZCj3pLa6x3HeRA0ivlx5HX6Xu122Rj
         TZxwkTUnPXEtVxdSuGLezrdmjNpGMP6npAl3Ia6YNKYEibN8s/xXIeZNHhddoFpcHtho
         fs44F9MsImBAUvSrOtYbR2EPAJBE4md5zucOYeUr/QbTl6OHL1nHl0xHMT4etkU2F6Wj
         YZfm4I830lcT8x76znnu7h+8BOU5O65AdAG6l3AXVkYTl1IDZlF3kaFcx+ldHFwuiA2L
         msj3CAMQARP+22m1sjcwcMmVA4MVQyRoYu0Q+/uCMyjX5ThCCfJ0m+XJTTvBEGWY2+U9
         9n2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783196116; x=1783800916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=po7/9ym21PytpIlOIcXoT0sadxo3i41zJVz0WiwkGb8=;
        b=FEeg8gxSzf5TxfD5eOhLN5pO/N4t3bBhnjn7gjwTXl600CfmjU/dbLdO47FUqgeC9s
         wx1YCGJc7AQ2771SIo+xdP38yHquSerNSuzIf18v47VSu+drIG7Y6MUq68le23DBNIif
         RjndVLgCDWBLBV9Yx6uI5lm0RQScTe37Vken07H7q2OWVainYkoqNo8aRtuKDM6UwD7E
         IYQWNsDcoKGrmlJgTKAmGm6Pyj79CsPgewnjRzOM5wnp7K8RHcc/0nMp9b/3PxdcblE/
         wIgDd61ZizFoBrCBAMUHUG8pPimdhrcKwgyim9VGqrMUBXudVlRPidJLc8AJhnd7Fs74
         uFAA==
X-Forwarded-Encrypted: i=1; AFNElJ/YX0NsFg3E6IHDg2UbS7Ivojelg1fuby1OSpjB43A/e1JFGH8NGgHEkRp6mbzFH5fy8yAKgylcdpVE94TO2jLaWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb3iEyLoOBX9Hml0zFv5DL5Zx+u7CdA0+LshfWkUs/elBrLpAf
	3f0znXRLqpf6kH3Wa2KnYFme0JdyaUb5l1ykizCElyECiBBB52kKMsiL
X-Gm-Gg: AfdE7cnn9gESNwfsfvv2zcAIpHaVcxuh/A4AAaagcgihhukWiagR03x3Ac8XDPI/0+r
	KfZb4aYdYt5u3cKTdVdH86xxcQgG9PEEfTPEZ2v4SaY6htQeGIPfaLHFtizM/VuiAbmj0Cfw21F
	wTIXuz2E1EppA5/cTkBEr3qUF9UvUcHCs0rXbbqv/cG2Mki1+/MliG9Dh8I4Ab7YuFR9VIXDLn5
	QJBYuObq4n5jrdouq5+WlzoXn+esLrYeZtMLiqq6ZlDxW0vTY49YOI0dJxK7cM+e8kn1soPoIkq
	uAtfNckypcxbdI1DNgk6rZ8ouTaRgWbr6/yMsfq8Jt/hMIwrHWQ2g+pkYQPPiWiJwtvogs4m3Jz
	fqz8vx0PvChusU6h23u/otRjDtR1OXU6YSviiCgFX6uXQmDL2AaNRKRKhs3naQIbTvsMhrg3vWw
	UHMETMIkx/wTwDxhBRIqF9hd3C+UN3/LIPibesyKjHy9w=
X-Received: by 2002:a05:6a21:4903:b0:3bf:6edd:4dfb with SMTP id adf61e73a8af0-3c03e1a8a4fmr4603147637.5.1783196115551;
        Sat, 04 Jul 2026 13:15:15 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ffdd292b0sm6341930eec.2.2026.07.04.13.15.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 13:15:15 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v4 0/4] media: renesas: Add missing media_entity_cleanup() calls
Date: Sun,  5 Jul 2026 01:45:07 +0530
Message-ID: <20260704201506.82524-6-birenpandya@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,jmondi.org,ragnatech.se,linux.intel.com,bp.renesas.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34711-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:jacopo+renesas@jmondi.org,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:biju.das.jz@bp.renesas.com,m:hverkuil+cisco@kernel.org,m:tommaso.merciai.xr@bp.renesas.com,m:birenpandya@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo@jmondi.org,m:niklas.soderlund@ragnatech.se,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3662870866F

This patch series addresses missing media_entity_cleanup() calls across
multiple Renesas platform drivers (rcar-csi2, csisp, rcar-vin, and
rzg2l-cru).

While media_entity_cleanup() is currently a no-op when
CONFIG_MEDIA_CONTROLLER is disabled (and even when enabled in modern
kernels, as pads are rarely dynamically allocated anymore), the media
subsystem guidelines strictly require drivers to call it to prevent future
leaks if the core framework behavior changes.

Changes in v4:
- Formatted commit messages to strictly adhere to the 75-character limit
  per line to resolve checkpatch warnings on the mailing list.
- Removed unwrapped long lines from the commit descriptions.

Changes in v3:
- Addressed maintainer feedback from Jacopo Mondi to fix an unused-label
  compilation error in rcar-csi2.c. The teardown inversion is now handled
  cleanly inside the existing error path without requiring a new label.

Changes in v2:
- Introduced dedicated error labels in probe paths where shared error
  labels previously caused media_entity_cleanup() to be skipped or improperly
  called.

Biren Pandya (4):
  media: renesas: rcar-csi2: Add missing media_entity_cleanup()
  media: renesas: csisp: Add missing media_entity_cleanup()
  media: renesas: rcar-core: Add missing media_entity_cleanup()
  media: renesas: rzg2l-core: Add missing media_entity_cleanup()

 drivers/media/platform/renesas/rcar-csi2.c            | 2 ++
 drivers/media/platform/renesas/rcar-isp/csisp.c       | 5 ++++-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c   | 5 ++++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)


