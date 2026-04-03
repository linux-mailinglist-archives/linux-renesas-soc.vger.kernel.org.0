Return-Path: <linux-renesas-soc+bounces-30839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICUfN1ePz2mmxAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:58:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470D393140
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A97E13123E9D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3693B52E3;
	Fri,  3 Apr 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYu7qNVn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608D2F8BC3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209820; cv=none; b=JDKZMRG24kvIgEEKaZx7Z1bpzUzPc4gz8qouBhIMW3sf75eTBTaGHRAL5yT/FcRzmXCq2z65AER5pkiUWD140970tVwO6ikZgDVUQEoXLN7i40B9639UTloKFjVIvL+fjIDwvvb2UOqE3qzarhcrMJhDEvXJJxd9Z4NbVnHq+U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209820; c=relaxed/simple;
	bh=MmUaG8Tpdj86GsYS5kfMIG6th0XHXmlH2xRgSRofHmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQXFwI1zH7U5nsWth6Oubb8XkZKLJV2Osvi9OfT7G8wGC7wB2PDMTjGtIwbVEDmOTVzcbW81j3TBMmS1oyHMrzO885Uym/s0sxFV7viCxkad98uaDOVJriTbau+Vk0DBTZCQnYqkNDTSieGL7paa2hyK6NjUCc9KeJPOQXphj6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYu7qNVn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fb14227cso23559775e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775209812; x=1775814612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOzNDs1gxrF0+eT+GD1BoehPlyrAM/scv18YsO5VzWg=;
        b=kYu7qNVnvSq30if478Btd2i/Q6VsQmAADymWHVSSVasgrCQS12aMwtN5UR0hyHKZXE
         sEG071LKDRasEJ+L+2Rd7k4Dc/0IldeDud0ei32skbx5N/RahMWY2qsMNw9dl9nVl0qV
         8BHg9cV5o3x2gwnGZAcV8aMaiPS/uW3DaQ7PxpesShcyjcJ3fpjqD4dFhxJFuVQ/5kT+
         zJf7THM3VDukI/GMWhfEL9IGD6XhkNkGdVofnCZnQ4t0HtNmUNUYsW2ztvsrLnycO3Yk
         9lg3awgO+K9GIMyvJRrv0eJRrk4dvxNQQdT2OGqmtDO2Rj+NhUBg2vu5aRYM7uEy1czE
         XEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209812; x=1775814612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOzNDs1gxrF0+eT+GD1BoehPlyrAM/scv18YsO5VzWg=;
        b=buWXY4SZC324uDJ4W3MHWejtslRWeqHIWTjBQORlM7P4eVYnRE53Hb1lshQHZJXNny
         S7YzLHRLtrFSWF0wllV04aDofaYTLknXSvjcGizC+szK3Ks/eHT80QIbZo4dDDP5jeim
         uzvgxAwfI6NmCm6vAm+xGzdSAUmtlGcGSw2FOjFV3hpfFdaY7J5AThSfHmAARBjzLRI7
         sgXkqb11TwYs3cjJV5OmjVlV9onip3k4PXEubQ8ZCWI7rLhd2qxPMQ/XJelAn4ISc5Ar
         lBaC0mAhkwvIzYH3U/MZSmBzTYvD1fj4SjfrVQRJrpO+jpLLfykJxjUtmLCoWRS/JhLX
         UQNg==
X-Forwarded-Encrypted: i=1; AJvYcCVOE+3fwDb5+JlQ7YBKToR4BmQwusG5GjCHvTKtA+4Av+mDR6oMWSgDAfiHfHULIRDi735WmWSPuthTCuH7et7ljg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww+bikzzBlw/fXNdYMYz62h61DQn6lWhqXZXRT8COClmGCHxLn
	t8UgnbYc1I+L4xOqlDEsQGowDad1iVGE82XktIY5In5wsx0LgdyJ5vkt
X-Gm-Gg: ATEYQzxvYHD0tREPEOD5GEDJGLyckRHRFo7+GHK6VTmPk+v+dqrlT8HLSrq9zikNrH3
	A2dbrYWRvLRbh150DOkyq+Exz1z3GL4BOUfGcYWwfTG6iOO9OKB0EJRIM1jlwduekwGIFtV8PGh
	TnMDilqJQkwHqAL7LtiGF1f82K/+11WZuP2HQzWRly6J4CPDwjgpI8WlTRPQYa0kSkQ1CVUHGwe
	TWOCYzuvj3kpPx1oGoCHcyjx73ikkwSxDqPA3Xl5Rk+KB65r5sYVWXeLlm4iWWZ3sXFNE2RM6BJ
	eTuerhTni5NsLcuzPI3G//mfl029SWVfRwBxYHp4YN6xF8QW/v7JtlezAWr2xvJ7jseCsWEh2YY
	Y/YFjXaT0ZCtU0S9EKMGwglPpbg1mM2T1Pm4DnmbUOiPUoqPNYqI5RQ1gTuqTyYDR5moRnjXrKW
	oevfmlfcjRvV9Di+d5+uvb1vo9EZhXoDUpWTAP0uxDvtcYGT2Y
X-Received: by 2002:a05:600c:64cd:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-488998f8b3dmr30471025e9.31.1775209811489;
        Fri, 03 Apr 2026 02:50:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:58b8:b4b6:c8e1:8690])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fc89c0sm25965355e9.1.2026.04.03.02.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:50:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/3] can: rcar_canfd: Handle Bus-Off recovery interrupt
Date: Fri,  3 Apr 2026 10:50:00 +0100
Message-ID: <20260403095003.104542-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403095003.104542-1-biju.das.jz@bp.renesas.com>
References: <20260403095003.104542-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30839-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 8470D393140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add handling for the Bus-Off recovery interrupt in the error handler.
When the channel bus-off recovery interrupt is received, transition the
CAN state back to CAN_STATE_ERROR_ACTIVE to reflect that the controller
has successfully recovered from a bus-off event.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/can/rcar/rcar_canfd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 1d6d667b8816..427472d0fd98 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -1186,6 +1186,10 @@ static void rcar_canfd_error(struct net_device *ndev, u32 cerfl,
 		can_bus_off(ndev);
 		cf->can_id |= CAN_ERR_BUSOFF;
 	}
+	if (cerfl & RCANFD_CERFL_BORF) {
+		netdev_dbg(ndev, "Bus-Off recovery interrupt\n");
+		priv->can.state = CAN_STATE_ERROR_ACTIVE;
+	}
 	if (cerfl & RCANFD_CERFL_OVLF) {
 		netdev_dbg(ndev,
 			   "Overload Frame Transmission error interrupt\n");
-- 
2.43.0


