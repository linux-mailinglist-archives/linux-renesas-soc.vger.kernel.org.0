Return-Path: <linux-renesas-soc+bounces-32106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNW1OXWQ+mk4PwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 02:51:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A84D509F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 02:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49445301F3EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 00:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B5425F7B9;
	Wed,  6 May 2026 00:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NH8mmSpJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FkFENyYp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDF424A076
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 00:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028657; cv=none; b=V+mwgvei1OUBLj2HMQC78enodNZSa6MpP4DBJeyRq9eyBT4ewql0/dwNq2CJyl19fHqkMrhdPcy5YAfG1vZdlYH/PFr8Ml5LuuT4Zm4NKHfty7mOvxAyeKXp2Xe4anFVvstP24M7fWkINvXj6SrK1JYfP1I4v+3KNUpPre66v3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028657; c=relaxed/simple;
	bh=cl/5xHkKUUmtWgmboo2jHQA31hfrNhEgPO90jwcHUzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnzB/Zef9WlELweQIu4b6+Sdpg3bpcSpMVn2Cgyw/uFVhci9t2MULeOnUOZV3mv/kCtaLEJjMtcLDHCSJoieNp0p4T04qar6kA8y+Q3YqWMR2/wfHZ1kpXVAiq09mTStlBukTXNE8SfYhCpy6rWsk5gNhBV1CiODDiDWqFW6cW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NH8mmSpJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FkFENyYp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fVozEQpTA46Z4ygyC26TpyTSMlFWlTRg+ghgCPQsNOQ=;
	b=NH8mmSpJPtgBHI6R2w0TZDZyYbwVRsEEYYZ+vnVN9aD9TiKhs6FPh3///pNG4qH/ViBbRs
	DUJ7ruAE+pWXUkpemk7OG/q+yRP7U4E8hEWMxi8h/eerKilEXgP6FmRnPbHWqngz7GZlml
	7GS+suApYmg4audcIy2YSxi4er2ok/I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-i6vC3MdRPf-x1789sgI6zQ-1; Tue, 05 May 2026 20:50:47 -0400
X-MC-Unique: i6vC3MdRPf-x1789sgI6zQ-1
X-Mimecast-MFC-AGG-ID: i6vC3MdRPf-x1789sgI6zQ_1778028647
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ead5ab474bso1168718885a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 17:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028647; x=1778633447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVozEQpTA46Z4ygyC26TpyTSMlFWlTRg+ghgCPQsNOQ=;
        b=FkFENyYpgQYZz7osvK2TplnHXpQsoShMUtI/36HLAQ81E2yxqtHxuWnCFNQj2PqGjz
         iu2Y+Fvufk99X/B9DviPPTs1aL5g7KuIPKGKvD0tFtsNbJFeL6IJoLZaE54dYthZrgDL
         Y0WBBZRhxebDfeTxQg4kD5TkjSIeKb3YYO82/9AlI3NIAA5qVBESp7hoLpuhXvhgv8EK
         tyMtbQfOnfFnpEXjREAJ3+Dy+LBafANH89LAH5AdbIXu49+ZmSfhJJfNBuodTJbWCBeF
         rRLxscpJj86FkvDsKOcTr/i+jrm3SIIz/xrReWASF3QZYPrFYxCbzSxsdwqT36fNTp9S
         XfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028647; x=1778633447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fVozEQpTA46Z4ygyC26TpyTSMlFWlTRg+ghgCPQsNOQ=;
        b=MJ/G8epw/HGHdiv8SE+tlIAYtmuov3bLI4/2WjDZOt//RkpTE9Lfh9wcT44KZYOjf9
         GEot1LU4aNqis+dTbMtxHSf9BrStI3eQ5ttA4IX+Hq35kXzhoe/r1s4KqXi5J2upgsBQ
         XXFF5V+aHjDOQ9EsBUEjzE5D0shT3+Gdl9AkHbkEDTZ8lDYPClB4h4cms9m/ROcwVTRQ
         4A8vvzR1+4UZX+DSP50mffjJCMC6Egnsrmof1F3i7UV++w29zNat1+/5BUo4yGZJ0Fjo
         iLiUbYQ9x24vZRWvCwsMP1+bMe+ZCeHFiTfn/M6+B6dtAsyUKyAkY97/kW8Zy9wzBM4F
         37PA==
X-Forwarded-Encrypted: i=1; AFNElJ9MGeupVx1BU1Bfvo4/D/b1QhdaZ+MCM+JZlIeS1WLr4szQSZi/wE56LMj95ThkiEqKSUlTOMGqPgYBBX6fjoZ1pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZeI2HYdENQBD6DaOqncK3MHQoVsuvw12GCf1TvFWtjxI1bmE1
	7Jb+aikoyRozV7IC/vBTbIgzvsaPKmqRZ2gT6x36MJxgDizYcnL9nvtTmxuRxJlVY8SVl+9MaOU
	mt410D5ikGz5AokwY3n/2gb49Ewta3QRKmOo2ZGx8adEvMFAoC8df1HpuQaAJngesqio0Z8LU
X-Gm-Gg: AeBDievnI5I/6HNrV8cC1MF4TxaAKH2nPQy6bEPAYztPvTZB8wAWgxvXWZPFOOw5Uwb
	QBhrXmbVDpv+0Kfhn5gnW/EwW1JtwhjKIAUZZNLjU3tgXZJaSuHIYa1+O1N8W3oOlEyjESvyTLX
	oPuV8bSq0LMzFQMj5IkuiPtcOg6Qyynrzqf/k8XW6nCJHoMAwFy5/uGLgdSo5NXmJa7Y7333tQF
	TvwHEf+Iz2kY9wGLmROuvPiSCou9uLVYP+O1R7J3Q73gJ6vPhasRsFDqavDOUUOsKHZTkkKV1VY
	pk+3AJ/NcrOwB3+d85HBwIpdQoDm/UruaxE4exVNC1SGRtw0hRUQXoOR0suG3NBw9BtobbOxMia
	R96mvxgDLWa8co5SzkOAwjIFssp2FYE8G6eUa/KrHxto9JByafzBHvuHym0jY/kxCHcyEbcnA
X-Received: by 2002:a05:620a:318f:b0:8da:e62d:888f with SMTP id af79cd13be357-904d6cd680dmr233112785a.53.1778028647213;
        Tue, 05 May 2026 17:50:47 -0700 (PDT)
X-Received: by 2002:a05:620a:318f:b0:8da:e62d:888f with SMTP id af79cd13be357-904d6cd680dmr233110185a.53.1778028646771;
        Tue, 05 May 2026 17:50:46 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:04 -0400
Subject: [PATCH v3 08/15] clk: renesas: rzg2l-cpg: use
 clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-8-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cl/5xHkKUUmtWgmboo2jHQA31hfrNhEgPO90jwcHUzs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfDauTy2kvU926EAy6tGlz1+GJamsa6+0Cbq/8zma
 GB9++/MjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaiZs3I8FjejFO3eFFvq21z
 5nK9i32h01KWRW58oZnKKRW2ebHza0aGi6rW/7mndf62OL7yvMwknZyTXz82S4RavGix7NeLqEr
 hAwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: 972A84D509F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-32106-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/renesas/rzg2l-cpg.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f98b6eb4f501..2d2d792859be 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -945,12 +945,6 @@ static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
 	return pll5_rate;
 }
 
-static int rzg2l_cpg_sipll5_determine_rate(struct clk_hw *hw,
-					   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 				     unsigned long rate,
 				     unsigned long parent_rate)
@@ -1022,7 +1016,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops rzg2l_cpg_sipll5_ops = {
 	.recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
-	.determine_rate = rzg2l_cpg_sipll5_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = rzg2l_cpg_sipll5_set_rate,
 };
 

-- 
2.54.0


