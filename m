Return-Path: <linux-renesas-soc+bounces-32322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNYFNWRGAGqgFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:48:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D076503309
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B84130566FC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC8E36C0DC;
	Sun, 10 May 2026 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZLJjTuF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2636A033
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402667; cv=none; b=Yx+PIbP0sUXJNlFUHazBEEV5ca42vQ06lvzcQ1+ZFUWzAtt7Vx3dWlr6HpM70+TYpH9m+vBRkI+BsDjfst8G3egxuU3jEVc5AkUYSotXScfMwoc3kfThampAWjgXnRCDAOBRgytQo1IMt69RjoMIkQuq1eyU+xf6/UjxM2Q6/dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402667; c=relaxed/simple;
	bh=QvovCQmJ+gNwOKXmFubp1pSBgHFF8PAaDYbodfMiqpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBdDdsQ0lTXT6E26kxf1QlUwCWr/eIvHJK5fNoKDGKTyyEcyD3rAsizIMRB3FKgId3CuVDGoGvTAqLpAOUQZ3pFnx2XgwEKq7eWk3SMQ18y5g43ybK8umWQ66qd5MfH/+15kLyqpARkdsKNOeDwPKnel/NLFxHuSzLZ2TaJMOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZLJjTuF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab077e3f32so15734905ad.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402665; x=1779007465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZTpCoLEIdwznMLuQjUiCorab+JEwmfq0roatC9e14g=;
        b=CZLJjTuFWFe0/9JkJ77ScGRPDSqFksBX6HeLmJ3JFiJ3owlDrgBZW3rvEN+4M3k1cN
         6MVZM9CFNBiDhx6fKhgPPvS+4U7Y+Bsvy084fmWV0j/64zG7xdQs69vzsLeEa1JXZtNd
         zakQvtf11NsFX/wcGNzSNPZUYYcDv8BtgDN9MtG7ZXFms8100BfHiTrMw01qlY47MIsF
         XhMWeB6evIgRk3KzSF9+tK1nliL2jIyJfeTm5NcTnnxDPWhz2CiMdUSjMHf7A/dMn2Zb
         TEpnNaFxic3CAjmKkCJTzM7oB0i1/SGVsLJcwsWJfBQyL7S+HnwUTMUSwGDZzNzkRPd3
         qUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402665; x=1779007465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CZTpCoLEIdwznMLuQjUiCorab+JEwmfq0roatC9e14g=;
        b=n1tWRjJWuRdjlE3A8AUwCjCVlFmhiuiS1Lw7NU+7wE+wix7st1n1HuYmRWsxvypEoM
         4xYZEQyVR2CYKhsZXErF07Kv4tbcPtlChGSzNc2NddfyRJXIvj2axuYLGBVYlIIXHKcF
         +Wx4ls1YYeoforVhNDv4uXLI06oPUK/zzVscwlsDxAWmFP1AgYEJ9R/TxLeMC7cOh17s
         grn8VUgTc86yf2kc/Tzxm//ixBblR3O8l0QCrcEKXvOASIusX01vDmyQKxodakeQrKaA
         lWT1nK5NtlwiWDC8enBAp2U2UF1xokjsRSd4VC/JJ76bZgpcbp67r1baE4/I4RIpIcvm
         quRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wQOSGilvPowt2mnhmG07AcIfIbtJHrTJDCU7HhLPBLBLfxFX0zNMnPdQ8FotWZGzXp2UOEeHX1xfNPeON77bHeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTo0g2cg9eM0I14Zw9H5YRWebtAQmSjhaxdxkLJEeroIM3z7G
	hhAdep4sJ2XD2Gjw1A2f9RP7IL+8AWYZzQQBJIEWEVRFa/7sidZb00bV
X-Gm-Gg: Acq92OHj8keb2jfDRitDVJyy/K9LO8LBG/2S574JOQQSN/GtZZuYcXsWGqzUuh2yoTw
	WsDFv0fVRLT6XaGgl38Q68/QVFFaPoO4d2tcZV6Sw8M4oor1beshzUsf3u1LAMys3GP/BPJ4cIK
	He5q8JsEQVcStB58OVEAz5HF2OHYAC3SrllQgb1mikSeGBBKkPpLdyebmf9Pt9jKWAxZAyWUb8p
	tH4YsOwx4spka+g1gJunPqr0taTVWRcGt/PQ4KCjMW1QQOeTx+00L093ETvTDlgX53uH4jkAXAE
	FHzuaFczaLLpHUiLe+BKDVdV2xBsYpign4e2ipvWjuEO5q2JFW3uWizQKGoQW8FouMcxgCSYpGz
	+J8RhQYjcSBUAutua2xxtupKyqAgEl8/mJL8tmboSQURfohTaSPG81hTwdUCfqCeL5f9A0Qpk/s
	ch8culzzuzAND+A2ErlHhJRSudDHkm4JBXpidC0ToP+IHpCrVZCykBs2At6g==
X-Received: by 2002:a17:902:ea0e:b0:2b4:5743:2395 with SMTP id d9443c01a7336-2ba79287ac5mr216845705ad.19.1778402665317;
        Sun, 10 May 2026 01:44:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:25 -0700 (PDT)
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
Subject: [PATCH v3 09/10] ASoC: renesas: fsi: Use clock prepare handling in startup/shutdown
Date: Sun, 10 May 2026 15:43:02 +0700
Message-ID: <20260510084303.122426-10-phucduc.bui@gmail.com>
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
X-Rspamd-Queue-Id: 3D076503309
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32322-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Use fsi_clk_prepare() and fsi_clk_unprepare() in dai_startup()
and dai_shutdown().

Prepare clocks only during active audio streams to reduce
unnecessary power usage, and ensure clk_prepare() and
related operations run in non-atomic contexts.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index b93809b5da15..c3ac8b30f342 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1644,9 +1644,16 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
+	int ret;
 
 	fsi_clk_invalid(fsi);
 
+	if (fsi->clock.count == 0) {
+		ret = fsi_clk_prepare(fsi);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -1655,6 +1662,8 @@ static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 
+	if (fsi->clock.count == 0)
+		fsi_clk_unprepare(fsi);
 	fsi_clk_invalid(fsi);
 }
 
-- 
2.43.0


