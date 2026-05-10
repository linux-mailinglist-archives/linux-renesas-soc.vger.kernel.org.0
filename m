Return-Path: <linux-renesas-soc+bounces-32316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMBpGVFFAGqgFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0605D503235
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BB4E30022ED
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E3636A033;
	Sun, 10 May 2026 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFwAYRoe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C036AB7B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402639; cv=none; b=rLO1XgskNwMhwwjZAUA7JmX3tct+wDUWM6zxwrfE4vxaLtu5Ab3eyhSUwYhRTET3aQEaywJu8ll4Jc5Q6BWPSSp5bCnsgH/pejc570AM3nArGG73g73QgDlqwTOkbf4Lwe9DWyTXLgaIDtUWtHjbAc3p2v0DzpLNMfGtMiX4lrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402639; c=relaxed/simple;
	bh=fM4gHt0e//5BUtCsC2xSRMm5hE/9shv/vWhIrjQ3IWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uh1GT0sfmYWTUmOWJfye4RpeWCI6cPe2VJzUygQfItC2eDYKKzCBJX/e5d54pRc3uMgpg1TlLT0vqQfjxLCq2l1jDrS/S0sPQSOkRrRwi6CpLVHt9/DGKBO65+dQOoT+rMMuxQYsCL4BdtNqMw8PwizWuwdNgYJAzcJVjBQr7Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFwAYRoe; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-366070f71adso3027507a91.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402637; x=1779007437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvQv6doqVvGzDq3D82vRr7BaPX4RYdGSl0w44lqU1ck=;
        b=ZFwAYRoeLj7qabzGcUau0T2T8W69A13/ziG/DyygxFzo/ZzomyEU1kc3vHHmqv07Xj
         XRifRfchk2TMzSoP9g4ZwT47lpoZD5dpkexXxKXeJodklN9zn47KAlPd/BKvsCkAR/qN
         a40jk76ckwYc3vzDyKytNOFOAZ44/WNTn/b2IAE5H1gKrzX1gEBYwGM1ieqyNJcEPMH3
         YO1CnGx6LLqS6JzXV8kgFSndSqWZ/NnAj2m6SoNT1ZFOMcIENyscaZV2kz52jvttyplp
         46hvOh4FPzKJG8Gznb++32MUiGL2GY2ExAeS0xk2sAfxdgqf4zHnbFB27Oxk9iq9W//C
         OQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402637; x=1779007437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvQv6doqVvGzDq3D82vRr7BaPX4RYdGSl0w44lqU1ck=;
        b=HtUaKZXBIM7DgzB771MymCV5lGqZAPhEKivuiJCnswe8yap8hDqdCB7f17pzKbmM/c
         KWhOz49bNajaG43If5Wa3ZeYDurQlodPb07Esipioi+J6E5A/ozgGTnoIlmH6gdDVqJ9
         CmZddW/QHGRarkwbI9mAEVdD95aktCyJBH9TxeB0oaCH25WuMgpEYnRiO6ZiR1K7WmUd
         4qB4y6HbPEDmPqdxh/BrA26prUX96TSroGeJeHDfcr12M+CS0qHWilr4ppE4sl3PSc3m
         bEanBaZiJkyfxw0SaMK2dZlDff5kVuYStPEX69gh9RuyIUnOiXbUCHXVLaaVX+5zsSUF
         fmBg==
X-Forwarded-Encrypted: i=1; AFNElJ92iys9iioCaWxfIMMz13KAV5oUD++jQwWg+dnvGrLo3/bn7oPHxphpqfv3LAEDE0R0Q4k24pmzl2cyvye2YIDkDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2ourxZ4LEYoTUNKq5Je1BpISh/yhq4ExDsLplJERtcmsclMN
	3hXOxh+X3EhH77azo9dUDao+obZsPN3fENVo+M6Qyb/kPV+C4EYEFsI1
X-Gm-Gg: Acq92OG04MbPx8jTthGaxqY3bN1gDxI+pDLtzojZjG5QrGQoq49hhlPC48c3qWx9zTQ
	oVdnK7bZ7hfPnZ3aVnJybK7CFJbEVjqUkfogGtGnUFFSrQqbKHkipCyCymKXnbQhEPPwBG+6wmH
	SVRlFeLUv2ENhx4J/tdidtFILu9b6gKWCcXxf+KOPXMVIm6bqgLU1UUQzKSJdRvjZMWr6FwSqJM
	8KzfMhg7viIzDKujYQ4qIM7n0xS79jOSAdQ/Ifcn7dNtHbgNkguP0AXb3LdAIdwBrVhIaIvr43B
	8CYOgUWOEKMIOZPokLJKO5MO9hHGiMQRV28Azt/Uk9l964MzWYebKYip8vsxPVi0/KT6idi0OuX
	3d/EyYnkyUZfAdsZmF4/SwpM9JuvRdzbNZfTfUNBqhBqfw47VoqamI9cagRsxFF7yfZowuQKF9f
	4TXkKXJIRBywXUqlq9cxSCe5Gv2OGsQeKcLmEcu3hqkC9uJLd+OoUmkxCWRQ==
X-Received: by 2002:a17:90a:1c88:b0:365:d9e2:7511 with SMTP id 98e67ed59e1d1-365d9e27b9emr11473695a91.25.1778402637211;
        Sun, 10 May 2026 01:43:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 03/10] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Sun, 10 May 2026 15:42:56 +0700
Message-ID: <20260510084303.122426-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0605D503235
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32316-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Reorder calls to execute fsi_stream_stop() before fsi_hw_shutdown().
This ensures that all register accesses are completed before the clock is
disabled, preventing the system hang observed on r8a7740.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..94ab2e490810 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1586,9 +1586,9 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
+		fsi_stream_stop(fsi, io);
 		if (!ret)
 			ret = fsi_hw_shutdown(fsi, dai->dev);
-		fsi_stream_stop(fsi, io);
 		fsi_stream_quit(fsi, io);
 		break;
 	}
-- 
2.43.0


