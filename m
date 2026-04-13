Return-Path: <linux-renesas-soc+bounces-31228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBYeIXXA3Gn5VwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:07:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A55C53EA39D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BCA5300982D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CECF3B7774;
	Mon, 13 Apr 2026 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nacJeyKy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AB03B2FD1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074856; cv=none; b=QNdcZhNqdD+wkfQ74Vbr8W4dEI50eAB7wPLTD7MjT2i0TtlvtbvYx8KBLAOkDPJnO2TeNdgb/kT/dIdH7wAEqe3fM0EQaNh0EAE30FmIDugY211l7qzkUUUbMwYxFtwONSgWI3hhaJAWwluSoFZpJyp1Sood/nQ0eo+2AvjWNuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074856; c=relaxed/simple;
	bh=Mwmud0ptvuHV+QGGbUoP8Aq9HWXBoreRMpco68h7Q1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UW47AB7MiBKkMaBXYKbJkXVFJM3YjGmb9Ktj2EqIk0fHBjdJdaAGg13PY0uM7LUopUNQkIrbTEQhuctITro2OX6wBeo9P9O4dvrWwDJYOBzDwjEafDNV+/G2cYi7Z9nqySOYijRefjWSr4y5RCkHBGhL7yX7slgsbO9vK0H3NAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nacJeyKy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f351ca23cso413532b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074855; x=1776679655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee0L/AD5HlNBkYL/vdO0qzIztqPcV8bZs1PfoNLBo+U=;
        b=nacJeyKyUF3e0dvnpIk23EmlEC+zDeld6l9s+WMfw6PMURANCex9cS0tF42flYHvwJ
         nBAVbx3UJHUKtnT5FIT26J7rJXuUefpxO0f0OEtN5Of9zNSGjmNXjc7Yhx+5aGSRu9fa
         Q7LFmJ5ggrGCBzJEAKv75CJ1VUdPwSGDl0QozQ4+We/lZLQ//5Y4QJ0Q0JEcUl2rdftS
         q/oCsaJ/oUlta0XfgUREQyi7bXaItqfOGTkP/7WRfShpqUAzcXHyTIZ229cOWgb4w1s9
         6f1296plzbPH1Uve6ysm5M5H6RRmYWydQsYSxav6PS73+6LqQA7wOA8mYjC9U/J/2ZlB
         Goug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074855; x=1776679655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ee0L/AD5HlNBkYL/vdO0qzIztqPcV8bZs1PfoNLBo+U=;
        b=hAWoMTZVc1b+ra+estqDaDFwBRAkKOp+PmtzKYG62gK4/TBPfX6+r68Czrfv56VuiP
         OFU02GtmDqwf8MTecLFbxt9Y9KZTQmgHq5CUm8dXqH9J1u7OPJsI4MFTl5/hIHqprCQy
         j9CmNHRkShVAKZPKXwV5EiV4NZw79QWK15rfyT/mSjaIR+ldjgo6SN5bLDr+2aWaDNFb
         zCoPiyLTI9YL844IT7/+IDVQgTevgi+2F/mPgAD7nDt1+cQfyXm6M3/MrlnVsDYKuTJs
         ZgJFQhILcJcFPq2B5CL7OUEh/ACmRibvXRc2XBP3DxsUFBuQsXbnbbI/UEJTvYx9v4io
         nsxg==
X-Forwarded-Encrypted: i=1; AFNElJ9LkF5/k+AS2oNM7k62Nz12A3B1kQiD9Q77/RjYGsXbPCPqnZcPwttd1LbBnf7Sipun1QTXLDVek09vSFgVTMZdcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9/7dhmH4Y7WSX7FCdmjlvs0AGs7xDx93q1jo4Lem1BM/7mTI
	Mk2kK2W9f5OYjTWurOTYJuC8B0CZZuaD737O9/h0/mcHfuTj0kAdj8cj
X-Gm-Gg: AeBDiet8z8Jz+mo2w2pkW4lN7Ic2o11pES8CXSUSpyuwovNNN9thd3Vj40DEx2iS6dY
	+Bd8KS3wY8R6VGbgb1tOzLJN3xFinavGMX5va4bP+N/tgwXYWBIcvPjTzk/5I9ln1c8LuQbZmd/
	GqBVmMwLiBd2WNlCCwTeNP9r6BfitPOIIU4t7gAWtuxY6lgp4Sp2iFwIGAdeNWvsXGM/ZWzNV//
	L05dmP+3lSi+2FG1vsubts0PehFBHxanried/roaLBQVYuGUYO5iclFmHD8Neg1GjGZpjscoVuy
	6VEH7Y45Q5zZYLZyXVo+9fH6CXUYHR77XC3AoVlZSUuzMrlYajLEOIqIYs94tG24O93OqJqqwDy
	GWUSv0wInMYoj9GaOZiLT64FdN0qcTFwNxe2sqd19WmdIkYDUJAXkzhQ7+HHnnvoWBZhMlrZm8p
	az+vxBhOK53/9i8z3WW44blhXX9j53cWAOaJXTL0CPfAX+K/A5wliRyS1cvg==
X-Received: by 2002:a05:6a00:1785:b0:82f:24e:6a3d with SMTP id d2e1a72fcca58-82f0c26b5e1mr14138598b3a.3.1776074854673;
        Mon, 13 Apr 2026 03:07:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
Date: Mon, 13 Apr 2026 17:06:56 +0700
Message-ID: <20260413100700.30995-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31228-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: A55C53EA39D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

Enable/disable the shared SPU clock in hw startup/shutdown. Without this,
accessing FSI registers may hang the system.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move SPU clock enable/disable handling from fsi_dai_startup/shutdown 
   to fsi_hw_startup/shutdown

 sound/soc/renesas/fsi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 196ec7bac33d..109e06b5f32d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1492,6 +1492,18 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret = 0;
+	/* enable spu clock */
+	mutex_lock(&fsi->master->clk_lock);
+	if (fsi->master->clk_spu && fsi->master->spu_count++ == 0) {
+		ret = clk_prepare_enable(fsi->master->clk_spu);
+		if (ret < 0) {
+			fsi->master->spu_count--;
+			mutex_unlock(&fsi->master->clk_lock);
+			return ret;
+		}
+	}
+	mutex_unlock(&fsi->master->clk_lock);
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1549,6 +1561,11 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
 	/* stop master clock */
 	if (fsi_is_clk_master(fsi))
 		return fsi_clk_disable(dev, fsi);
+	/* stop spu clock */
+	mutex_lock(&fsi->master->clk_lock);
+	if (fsi->master->clk_spu && --fsi->master->spu_count == 0)
+		clk_disable_unprepare(fsi->master->clk_spu);
+	mutex_unlock(&fsi->master->clk_lock);
 
 	return 0;
 }
-- 
2.43.0


