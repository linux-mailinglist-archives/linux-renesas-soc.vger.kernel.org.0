Return-Path: <linux-renesas-soc+bounces-32873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MgvC4izDWo62AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:13:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB058E959
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B928F304A164
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C698D3D3327;
	Wed, 20 May 2026 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bV/4B0IF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4E2C0260;
	Wed, 20 May 2026 13:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282744; cv=none; b=FfIurBNX4BkfkNmkBG/WE+3JLCmlxDeJv9KoIMQxjyP+ejpRlh9gyq7HlgglyEVIRRtHrDbUOi4cfCirV+yIyadzgIWKxeiS/pJJqPG11HubZkTOinCE+4hH5bwRtKuok+MfH4hg/0LxsvCVNSlvPzmnceAt3mXcbxU99zbcviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282744; c=relaxed/simple;
	bh=C25iFTHJSOxu/S/Rd9X1XFvHu9V7TaURzTcRkjd/5Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJlNKl37j4xCKdUWYXR/FKa7BBw5O/C+g5VR1lTaek2khnDRECukj8Ds6OCQFlZ/PqT681Y1ZAnqGykOTlQ6yDyET+84V66ho+ibqlYLqOF1nkg+2OcOrRF0EBR2FSS1qef1bp2Y+LtN3C/6u2omvy7L8cGycmgg3e+pYSrDbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bV/4B0IF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397691F00896;
	Wed, 20 May 2026 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779282737;
	bh=p4ODN11vZpRpNHqc6ddHlo5TM2CWm8EjUV4FANhbJXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bV/4B0IFvEaTUyV4lsHTxhgzDFJxV0rNvTXd2RXFct14kUEFa2ifmzBr6OW9+ivRI
	 6grio1AmKgdWTQiG3aXj1MEmz/nyYCgyt5GmP9kWKwr9iw3HwVrz98x/DLvW+XhnJb
	 ZZUqZFkuRMZDwiEl2lhfDC3xATLqqZkJzuG789QQ8r6D1loCGbWQE5pJqiY/vzoepZ
	 3m3oeHZaAIISrJJJk8B3opsM6MrkLcSuX0Wggg1HL3QmIfoMTWCp0s4kru7O4hJtHM
	 vXwy/cNLb+pf5ymzbS8ewvL+2ZcPmUfedI4p5Xg1aza86IKFH6jv/e8dnQYMmiuMW9
	 dt4C60E3LDM0g==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	wsa@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] i2c: riic: Drop the space in front of the "out" goto label
Date: Wed, 20 May 2026 16:12:05 +0300
Message-ID: <20260520131206.932050-4-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520131206.932050-1-claudiu.beznea@kernel.org>
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-32873-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: E4EB058E959
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the space in front of the "out" goto label from riic_xfer() to follow
the pattern used in tree.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 57b64d82b681..c15f79868031 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -222,7 +222,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		start_bit = ICCR2_RS;
 	}
 
- out:
+out:
 	pm_runtime_put_autosuspend(dev);
 
 	return riic->err ?: num;
-- 
2.43.0


