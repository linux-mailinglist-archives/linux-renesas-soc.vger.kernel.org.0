Return-Path: <linux-renesas-soc+bounces-33752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id th47KhT9J2rN6gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:46:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E165F9D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:46:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a4KzTUZl;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00A7C3163F37
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F1E400DEF;
	Tue,  9 Jun 2026 11:39:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E403FF1D0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:39:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005155; cv=none; b=Z0PLBqxbhGidhlS3sYCSt+zTLmrFSZgZMfDpzNoqB4rxEnT8QXOVQYBaBy4fQMVMHSap9iaJ80afTucFZpAMWCG8ZOq8SgAR3eP3wiWr7kDNmAXbJAlTQj0duBcNlO+v6HAauf73LJW/z2iCgr1TZQ8ktAHlZjVfwqhI1uJXPtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005155; c=relaxed/simple;
	bh=+xrzJMsTkYG93fo+90IGUX9wUe4dn+/Qn2o113vfxno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dC85LipT0TSPzAnaASW6ykjEOOZklMGBFscqWgRspLqAEUdCjsi6jzmHikfwt41wPCVz3B658iYBxS0ckGgK3Ei2PrjYNiweXnvqWtAO1qxKAYksarDYilykxSZfElAqmS4O/+8jlC4KiWT43N0StiAldX4FOoZh63gh6az5WgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4KzTUZl; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c35980fdso54641845ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005153; x=1781609953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSIuBNvqBaODcdv8iM12D2GiUh6JRLaoNHjKcJ+PWwc=;
        b=a4KzTUZlCQ+UAFKRAoD6QnjKWTpMRF/+MRjfgojPwaIA1d+1Nk6p7jqgSnTGCzkANI
         Lw+Lt9JN+zjNe5Wj0hKBNL9HO3MT0zRM1sZd2Nvss/4y6HJp71frTFoT0EyKI1L3CwHr
         mu2gE6VuVmgq0l+JjrHERyEEaykeDaUgRi2IilDfvhk5Qf7QxrkT/HKEgJEwXiH6Vy0C
         kx7H4H3ZD8Ae4wWrSwcS7nL0QlQiG+3YsSYakLFRg9uCbToD77Upltw4Ryt+5VIdrbf3
         ue0n9sG6H02dVvzrJZSOaXh3nNlztaa+Sv5roisfH682kTxEw/HEaQ+ZsCCbjVfNrt1i
         odGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005153; x=1781609953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSIuBNvqBaODcdv8iM12D2GiUh6JRLaoNHjKcJ+PWwc=;
        b=B66uWyQbZqLkdWKeez/tFF+xlhGXfTcVy+YrdF+/G34qkUTSmsv23qE2jseM2yk1p5
         sObdqIMFZ6R4m5un3CH0T7npMEA3JqyCu3IIB44G6UPO4NZL9GQGScJOfRW11KXIULLu
         8S1POta1fh2g3Tcw+TmE6vT4bvH72x+HbMH3/iGKzhh/jQ61Xlx0FWA3NaQEjm/2bvrj
         C3NvgpDR5KnLG+UTRqEcIn2LQPD2xgl2ZCNeqTDRtHO4Cx2y7to1BPOXEMi4nOTVOSOV
         sQpnPIWdQcoo3DPdznIPR9nuuYY2NmxiejY/nDLxgPVhtV5rIlVdFie8M1pbvjsNcvUl
         qX0A==
X-Forwarded-Encrypted: i=1; AFNElJ8aXVGBfhBwqWwMydj7v6iPEHoUMlYFclyWFJ3d24pBAqGIwTAokAZY1jp0LbO/M3L8/JcTHna/yBXSBzOfz5OFVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhXanCLGLxdht5ZMc2V/rQXgUqaQOFGppnM71m4LTkyVOWNpQt
	libjASL4GNdvyDLtvJ8UUbR3D2nTv353pkGh3qaxF1Cgt7u8KboRuUyM
X-Gm-Gg: Acq92OGtXL6wFdeU7s7Sy+U2tj7SBYPBKVgqNo023h/FBgO848zYA+6jGDHp6PDNYWS
	V3U7XdAaJVqKDlonFk30j6ltY3iBArnCNanRQfBiukjaOSCuFtpxNYi4tbOmNUKv4TezgCImnWw
	NXgHtF1T9mJyhBlZ9v25Q/Gf0ENLpiMHgbCVpVS66ewkdwx4pSY+FiYKVPXEFFXPSenmJmYnKXT
	k3LGl4qqqtu4L5T4obBqyW5/RSzSaJsUYbznc/5a2+wTSHQJg7YRs8ojuMpYhszrEQ6nUg2p2t7
	T0eDgSg1qm+7LgapWZnJ1x8oldSbXTYnmoR+iH97eq025PDhCjUhE4yW4GFEK4xifP8tn4iFfhv
	fA0BPdsGiDHw6lnt56f/82fhDi1bpcdZkXuehhIT533NwaN6gMPAUGHY1dLHbEyEgVHM9g/rrc2
	a31fEkyDaWxrFU8vZlQBSZhuUzYMo0YMpZFXxbAXcWJlOpw5olQ93jUbEG0vkSMgb4ETpjzPmPk
	otHN8k=
X-Received: by 2002:a17:903:1b44:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2c1e85aef51mr248401615ad.29.1781005153477;
        Tue, 09 Jun 2026 04:39:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v6 03/11] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Tue,  9 Jun 2026 18:38:28 +0700
Message-ID: <20260609113836.45079-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33752-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 138E165F9D7

From: bui duc phuc <phucduc.bui@gmail.com>

Call fsi_stream_stop() before fsi_hw_shutdown(). This matches the existing
order in the suspend path.
This change ensures all register accesses during stream shutdown are fully
completed before disabling the clocks.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
Changes in v5:
 - Move fsi_hw_shutdown() after fsi_stream_quit() to prepare for
   subsequent patches that use fsi_stream_is_working() to handle
   in-flight IRQ handlers.
Changes in v4:
 - update commit messages 

 sound/soc/renesas/fsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..800ac40f9680 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1586,10 +1586,10 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		if (!ret)
-			ret = fsi_hw_shutdown(fsi, dai->dev);
 		fsi_stream_stop(fsi, io);
 		fsi_stream_quit(fsi, io);
+		if (!ret)
+			ret = fsi_hw_shutdown(fsi, dai->dev);
 		break;
 	}
 
-- 
2.43.0


