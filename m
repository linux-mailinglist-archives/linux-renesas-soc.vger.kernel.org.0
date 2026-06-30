Return-Path: <linux-renesas-soc+bounces-34565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qIIYOk3KQ2o0iAoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 15:53:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C36E5145
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 15:53:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nHp358nL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE1B430CDA37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 13:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814C5392838;
	Tue, 30 Jun 2026 13:51:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96443ED5C5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 13:51:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827488; cv=none; b=dvNrkACZJAIuGwoGh35mi5EzBcq006UijnpmDGBJEUkqhhFqkjF7r7E+/5zqmSNAk9ysP5pEdgPzddaJkPSeoZYPtePVY1V6IkB69IdIHxPoPrv6a3pwIJOKCx9UOBoCpCPJ9mk7YGWKFtCq09CNGZYDO4gLjnrHN21gpCd6gIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827488; c=relaxed/simple;
	bh=l0XTIMkKqN1zTE6zpDaySzAYwNEEjSWW841rF1IHlzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RaVy35BGKnAi47oA1erJfmJmOmkcYgNrwgWhc1lG6UtakxKydgyo8030GxdGrCZANqyrceKvA9pwPUvDYLW0CvfSyfa1knLagdnrgBC2mbNfvKyeEN/XRj0SK0D/XC1EuxAnnkz7pl5ZUImk5vALvdw3YMk1czZPhxlRx5DsWCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHp358nL; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47248615e4dso2868042f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827485; x=1783432285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmtMFmdutnbR/Vf/MchNEdAZUmVTy7ZFFM6Crcn12+g=;
        b=nHp358nLX8xU9/n2gs/I9pZR0TS8AVR1Vlo2+bUmmgMjHCLe5G3Scr8nR+lDIf3K8H
         xMebfEiSJF727vSrUSlBEwNEBiAUvBn3m/zoJGeHlmx/bRObiwZf5G+gGuhSSOyw1mNr
         UTFgypV3diKgFSvwmMQvk26Td3iSdQ8crTQwJF2CCWL/KusQpgJEUPDtTlKC+zsEIMll
         rmd9WfYpzpFC7UQQ6iM8m24Jr2ndSmgUeEVlXLTYmvlvQf4RXetEPrKyLzQ6ZnmkyWn+
         4sHrD1b6UnyTVM3FZ6AO+51Xay/lW74cg7Hswf52X2Gbh0Yz9KZuBEEJ4MvWcDUtuOGo
         herw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827485; x=1783432285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmtMFmdutnbR/Vf/MchNEdAZUmVTy7ZFFM6Crcn12+g=;
        b=P1pII5C0eOC0UopYHYqiGyUwhDuotD2Pf4+q4zwKdMH6dbNOfpOUj1k2i2UkcNEKR8
         hB1yWunbawa/Mn1KNPvCfuFGqIYXsaQKN/qh8npExMn3hGodcTrV4KRbt+a5B5hTCLbJ
         6iMnFSMO47xlX8HVzd3uVBNBTI9TmGihAi5+QRxcpnh2Z6wn0ecGON8/Zv9V8ao1WmST
         WLZMZV8XbPiHyfjhr9oVnUnB9BP6xzILQVdeSaXZnWPSWcVxmE/dccwM+y7jeHBtVPgO
         hZZ+JTqg/VRfFLkdK2wROq9AxIIybXdU5/3Ns+pXR00JvKNAMZ0hhXRE7msPDQVlc90u
         F0Rw==
X-Forwarded-Encrypted: i=1; AHgh+RobpYorih0n+RXcA+HZflweo+X/uvAhV0XYnHyMJP0HI8o/37TbeAuZ5CfS2LtizFd94B7rshN0MAtUhsyp7UL3Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhHuPtgyH7nrZ188cbYegiPS1OMtUWWWY035fvBuhW0T8ylekT
	762zX/Fm/WwZh3JV2l0a7wzMKovUigQDFwQBYtlzJ1vtogk9W3fC6XqO
X-Gm-Gg: AfdE7ckRgnNF0fS09CWrfcqlv+jTG3+Smvs23QcH7mDTov+38I0Dmf57TK31NmlLwrv
	5Q+m8VOlogZ7iHUWJW++6AJRWElaDNkIVKBZvZ00XL6KQWR1si5BD2vv8F/aEKb0qrr/86hk0Rq
	GEzb9Sr/FBMGNvx2MRXEdeyPg4QzFiJsyY+pDIOThnk/Xxocdbl9dj0OXOsk+SdrwYr9NypJKWf
	0f9NpuiKuAcp3U7j89zR9OCF7q/HgroEfI/kkoSyFeUgcLaDB3mzptnmUnwtYw7AwILRxE3xIZW
	lam6abDErT4vdWssMl9zX48xXIDFnvYzJKTbSBzC/V2Aw8GNAPawoarf1aATPFQIVKzlHWl24pJ
	urNm6APJdaSbkKswmdkPFTBVufhpwqLuVgpp6nW94gxnr9WYTZg7XbYYT58gvP2A8Cv0YJvE03C
	E7yTRnUf1dM7MklX400kChCkVXUhCqcODlvxd/wQ==
X-Received: by 2002:a05:6000:e4f:b0:475:69ce:ac4a with SMTP id ffacd0b85a97d-47659ee671amr755903f8f.33.1782827485050;
        Tue, 30 Jun 2026 06:51:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:3f6d:4f26:2d9c:ab4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm7216964f8f.19.2026.06.30.06.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:51:23 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tu Nguyen <tu.nguyen.xg@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/3] can: rcar_canfd: Fix double-cleanup and unclocked register access on init failure
Date: Tue, 30 Jun 2026 14:51:15 +0100
Message-ID: <20260630135119.104774-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630135119.104774-1-biju.das.jz@bp.renesas.com>
References: <20260630135119.104774-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34565-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mkl@pengutronix.de,m:mailhol@kernel.org,m:wsa+renesas@sang-engineering.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:tu.nguyen.xg@renesas.com,m:robh@kernel.org,m:ulrich.hecht+renesas@gmail.com,m:linux-can@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:ulrichhecht@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,sang-engineering.com,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,renesas.com,kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 618C36E5145

From: Biju Das <biju.das.jz@bp.renesas.com>

In rcar_canfd_probe(), if rcar_canfd_global_init() encounters an
error, it disables the clocks and asserts the resets before
returning. However, the probe function then jumps to the fail_mode
label and unconditionally calls rcar_canfd_global_deinit().

The deinit function calls rcar_canfd_disable_global_interrupts(),
which writes to the hardware registers. Since the peripheral clock
has already been disabled by the failed init, this leads to a
synchronous external abort.

Make the rcar_canfd_global_init() failure path jump directly to
fail_dev, skipping the redundant global_deinit() call, since
global_init() has already unwound its own clock/reset state on
error.

Fixes: fa5f4ec8fff8 ("can: rcar_canfd: Extract rcar_canfd_global_{,de}init()")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/can/rcar/rcar_canfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 57f1710caa89..e88554388553 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2257,7 +2257,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 
 	err = rcar_canfd_global_init(gpriv);
 	if (err)
-		goto fail_mode;
+		goto fail_dev;
 
 	for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
 		err = rcar_canfd_channel_probe(gpriv, ch, fcan_freq,
@@ -2275,7 +2275,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 fail_channel:
 	for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels)
 		rcar_canfd_channel_remove(gpriv, ch);
-fail_mode:
+
 	rcar_canfd_global_deinit(gpriv, false);
 fail_dev:
 	return err;
-- 
2.43.0


