Return-Path: <linux-renesas-soc+bounces-31579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBioKFkk6mnRvAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 15:53:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A0D4534DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 15:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3F2E30233C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 13:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEF92FC893;
	Thu, 23 Apr 2026 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duh+HJaK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C329D260
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952259; cv=none; b=beQ2EdeYUwTkKcMGLgFWylyvNHghLmTcboVlgldudgbsElIxxgeGnRvPBU6uxI4weMAHtlZIuYe9nbXs7Aqtp5A0GJ4yzQhX9rpXgQAzovwFzG4tSSCOZ0XxCdyt497Z/uAXf0+oMp+jZmSkeWwrd1tap8jMCVSagXmqIohl7RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952259; c=relaxed/simple;
	bh=LVv6C3wWXaLkV4DdI3hN/QdZVOBTFV5yN0je6Bf6Cjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=su2W8KSktHoTMHyR1cMlu7llIrVJwLqYbF534oYKXoYvtwQ/+qFd5JAhI1LBWH/a0JSH541WxQDqSbQtdHFDllIzt9/Qrwu9WpXwuQxzajDM4USeZTGw7IHwW/ChY/DiHI20djXmlel4u+b/P5eonir8uZAWpEHXD450q+UkiEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duh+HJaK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso61755645e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776952255; x=1777557055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fbtbCkYzI4GEfR3Ru2SUnpymypehkZuVfFRi6unx5xg=;
        b=duh+HJaKEfodB7+DybIEYQvR72WqJ+RAQXSirMIT1r0L1TasP5RxU1RtQyJvxs0g+c
         DYILagZ/1i8BGsMArC7737FgxIytAIhakq/wa9WlvNyTntW8+7qYgQ0fOe/pdFlUv8Ok
         vSMuUMNru0SZ1Czs+aQ3L0j1PU2rF4hpXfe+QQAufkH6rXOVAkjMc3GU5a45WXRf2/27
         kwmb52t+uYTa9YwCirfIQN9GdqWlceS1VQS3Y2cN2D1RrPOuhXGvmt0MDLxcK+CXaqjx
         seV4JgosHAK63yfPRxjOyWKaCLSZHeXg3SwwOKKsoPwX0fmmwXSxh93duZWK1M3+LDdq
         U2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952255; x=1777557055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbtbCkYzI4GEfR3Ru2SUnpymypehkZuVfFRi6unx5xg=;
        b=Pl3xUW7VW4Yo8fXeRFR2EUqmNbJy1ripyLJQXYD5ZYr+cTYD01FI1MUvDKxKnz8/YP
         uWLS3C0HzMj0xV+1V0K43zNQIcHLi+fOxSOKa3UVduk1MnlFJjoJdan7Ztz2MzUeskPs
         bMOu9had2nVm/h1Qfosy6GU5d5MIkMsGklfzPA3hfbxNtr8mhrUFqnRXCEUuxxPCedtc
         jez4fUw+HksVyWzvnt/Vgwv3aaktlbJhV9j/DjDRdrYBSIFqspvl/FikddY8aYQTCcM4
         t5dtRrbMnR8UBgYLxG/19ng0bWSP+fa9knKW2GAVl5r4M0VrAxbVWenBjs6pb99iH+sF
         ljtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Az3vK0mnHMKUaIE6JRXHY2qSUAvJR170CvwdQBM/K8Pv+Lf6pB8VVgUca2W/tKIAu9zod1ab5ZVrHOPOdlbKrwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvGBRAQgBZ7H6QOzY222KQA5FTbQ6gcGSeGKgp+YB+G/VCmdss
	W4NHlK7XiLFCP18EBz5CrVR1sAsg2+m6Yfn3ut/OVZsrJGyO8gqu2z+a
X-Gm-Gg: AeBDies1GhPi6nHzIS1G6EC5znLodVV+stgfx3SUw4aSP4FZIWFt/FtPmxxDM06xHIg
	AJnFo1YcKR52qCU0NEowczN8eq3PUbHziMJB+2wn79eU4bX68XmTIAoHcGcHFFAQWc9DGWUspxW
	005p3Nrwk6mNd8XYSrRCS+cp0sqfFRH2SD+RxmdgSyAyMQb1p9DBkXFXuzmxIJGbuaRUC40PfMW
	bZccOvIRjE4Ng1FdXGLjmuvB4+j6fBswLY/qA7jqk+tQrZS8oLbk8t03/aWHOLi7rsSS2em1hGE
	Smr/Y5jrM9YDjb4lCMO68aSW58U7lXJlO2F0LUoyporey3DKjhgFdYE8qs8k2rAxuJk0mahQIHB
	0bfpao921BUO38cWOwqyN5nQ+f63r8LCrB+TAfk+wv6kfHqV8wpd4LlbTaz1y+bnRgVX2gmosf4
	eLrnn9oHK6oCDPYyVqx7GiP+98yJW7WWrGm+CE9vCdY9vunuS0cg0boHqHI5A=
X-Received: by 2002:a05:600c:444a:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-488fb793580mr362776015e9.31.1776952254428;
        Thu, 23 Apr 2026 06:50:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c2c5:eec8:9509:382e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm228134335e9.13.2026.04.23.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:50:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 0/3] Add support for Renesas RZ/G3L GBETH clocks
Date: Thu, 23 Apr 2026 14:50:44 +0100
Message-ID: <20260423135050.238400-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31579-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62A0D4534DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L GBETH clocks and  reset signals.

v5->v6:
 * Dropped patch#1 from series as it is accepted for 7.2.
 * Fixed the typo in comment stanby->standby.
 * Updated parent of ETHRM{0,1} clocks to CLK_SEL_ETH{0,1}_RM
 * Fixed various DEF_COUPLED macro alignment issues by splitting it into 3
   lines.
 * Collected the tags.
v4->v5:
 * Rebased to boot series [2]
v3->v4:
 * Updated commit description
 * Fixed mstop bit for eth1_clk_chi and eth0_{tx,rx}_i_rmii clocks
 * Added r9a08g046_no_pm_mod_clks to avoid PM framework enabling both
   rgmii and rmii clocks together as they are mutually exclusive.
 * Fixed checkpatch warning for more than 100 columns
v2->v3:
 * Added eth{0,1}_{tx,rx}_i_rmii clocks.
 * Collected tag for patch#1
v1->v2:
 * Separated ethernet patches from series [1]

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  clk: renesas: rzg2l: Add support for enabling PLLs
  clk: renesas: r8a08g046: Add support for PLL6 clk
  clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs

 drivers/clk/renesas/r9a08g046-cpg.c | 157 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  67 ++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  10 ++
 3 files changed, 234 insertions(+)

-- 
2.43.0


