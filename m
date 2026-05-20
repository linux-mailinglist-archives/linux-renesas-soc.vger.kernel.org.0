Return-Path: <linux-renesas-soc+bounces-32870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEb7LHCzDWo62AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:13:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F09958E92D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 084F53032511
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BCD3E1D17;
	Wed, 20 May 2026 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CO85eqRx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154F36DA18;
	Wed, 20 May 2026 13:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282740; cv=none; b=ScMece5EvdwdrEqI8pFfh6nPAbDETsvzjnMqjo0LJPdJjZnuh3ndXMtkGOLgOQFPwnssTlUWKNLVE9QKdqGikMwTypgzLIx5YnojQHxdqC3yhCVrRnlYS8fvBW9xs/T2/asi4nBnmuChu82eGwNqo0l2KGkTkjJV7Lu52TRFx1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282740; c=relaxed/simple;
	bh=hP6+afbmeA9Dkz2R4kVhoYZge7pz5bXrHSigVIlNRvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1vldBxmOAUPr4S6MoIgIJWmAS60MRCchxeMaXGiuhKt1Ht5BbP2oPHK+4Z2UJx0qf1Dud/YeEBS+ARD25APRcsU9PjZRzRDMCUnT2KQW5CBChxEkrFhvei9HtHcEm1hk5dT/hfzeL7fPhDWD/TH3KwriFJP/m5R4vlwy01bB+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CO85eqRx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DC71F000E9;
	Wed, 20 May 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779282729;
	bh=9QPcLxK+odyIogWs54Syoz/XMsSnhC9cw0O3XSTps4w=;
	h=From:To:Cc:Subject:Date;
	b=CO85eqRxRBYKxHb2DiRjAvyYgKJfRAwmWdF3lCZzzuogEB+GS43+u6/MwFTZbLaDi
	 X0CNJaqJ80bYSDy4sC77frAimcW/OWryntHVjsbpvA+KBpPNSWQt4Hs+M5Vor+vR5P
	 47yrM4JHu7p1zXji0Uxl9YVi3JIZcY+faR0Wqh/u4UU5v0I1PWeeESC7k1xpQcV4u1
	 Gxbm0SljfmJOk1zX+1tttdyXRB79BsSf4cv0FKR9RcJrdbaevD01iYHeIccMBwcD7U
	 lK1Jvfr9xNBaB+pSJkWodrqxQuTL3iv4WbR2tYp+d9bbVQ0uJToNjtjRgCc2wuzUfb
	 kEF4QoMJ+PIuA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	wsa@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] i2c: riic: Fixes and cleanups
Date: Wed, 20 May 2026 16:12:02 +0300
Message-ID: <20260520131206.932050-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32870-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5F09958E92D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds one fix and few cleanups for the Renesas RIIC I2C driver.

Thank you,
Claudiu

Claudiu Beznea (4):
  i2c: riic: Abort the transfer on completion timeout
  i2c: riic: Use the "dev_name:irq_name" format for the interrupt name
  i2c: riic: Drop the space in front of the "out" goto label
  i2c: riic: Drop empty line

 drivers/i2c/busses/i2c-riic.c | 41 ++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 8 deletions(-)

-- 
2.43.0


