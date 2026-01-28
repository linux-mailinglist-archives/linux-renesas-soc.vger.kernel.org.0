Return-Path: <linux-renesas-soc+bounces-27523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBSiBCAIemn11wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 13:59:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A118A1B18
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 13:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C48330120EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CE7352955;
	Wed, 28 Jan 2026 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPGeMiCp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695C350A3B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605140; cv=none; b=Ppsl3qN/Rl46VbS8qNl6mVofy/OXJSvlGo0eY627Oo0tj/3WnNoymX8UodIL2wGkCmPN0aAD7fcgKAuvEJFyWMMMDb3gIIiWfFBxv/1S7lTQX3pP7IQYESMYa/qEdBYIaWmmqygGxnTTpQPvgFbrzcBGs9+2SfxQojuk/ZxxCMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605140; c=relaxed/simple;
	bh=S+pGS/X53FfVPE+fl+yFMCW8OMTXCM4Zs5O7qT9dlBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgaoetWtRsPsewUvk6CWod7ceHtsrx3LuoPM5r4ctO/uUmrVuS/+Gw/E6HGGpfPwLoOcOlZB6kyChU2e1UQgygtH3yF4/je2PbXhtl0B87e8VeXTt3w5MMyFt4IO7XR//zzKZsDlxisj3Zo3aqmccclkg11olNOHOo5CrXfFRSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPGeMiCp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b886fc047d5so854596766b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 04:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605137; x=1770209937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8uaattQ84x7k0dHlXaaGs69eppir8vSPiEkCl0d5XE=;
        b=MPGeMiCpCAjcJ3sc4oe/+8JSloIf0rZMoX/00D7G6GR44J6o4BEuCQZj7PLYgdEIEY
         2Fw1dF9NTaljfWlGfu99RRhwxPt5KHA9EQQ5ExCkQTAcWFHxprhi1wH7vXI37WGTybAl
         aH9wu1B8zyI6HsgINAzU3laLMxpoZkhSRVMQTJOjTiXmf3LPo6pSJQBwTdW2Z3dqoLyq
         wyg0nqJTwIRMs15tMPltD4TkAvGJR6hdYVv7kU6Ya1QCprBL0ef0HkezJxfKPNylAlfY
         qtuJ6ShAQNi+76+1XMb0q2jzSsdUTa57Q2OQg6XYc+U8VCf8Tuz2I5xBrFWaUqJxEy55
         KwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605137; x=1770209937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j8uaattQ84x7k0dHlXaaGs69eppir8vSPiEkCl0d5XE=;
        b=AnhSRF43bOallNiOk9K0AGXxJEBR8BZOttS5R1NMKcV8HMEKv2cSKPI5SbSkbybVKo
         1W67/kbtVSUauXGbAnlcx094rLaWPveMSwO2XUS7COQRGQq7n72J7L5waeMYdswjvoiO
         L+LcFUq1k5wlCHNSIrxW5m3mGJtwfeXekhWkxFic+Qrl6XftasjdXXk85NzoxS8A27zh
         8NBoQxPxBlaCppQcqzTcKImPIvXT35oAPNBoQRiIBUEjAxZ/ixrP4hCXZ11iRKIOK1v2
         S7h1R4MOt2Qq/G+Vj7rmpNr+EmVmwz9e96uz7F6DRbms5Aqk67gO7AQ04EG3aby9OX7b
         yE7g==
X-Forwarded-Encrypted: i=1; AJvYcCVbs1VMao45v5NPhnmD2PZ2N+YvSPheDVF8gSSxE3nDuuFpTj3JPEvCThcys/F5LZHFO2eaU+XZhvom1I/5lAjjwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0/cWOPARnrAQ/xjCQ6KyG55LD7axxoKFJdmrzDAJRx1KKex4
	Ovc7P04IDRWVa96NqvALaoHCfMB1Qpq5UZCxiHj/37UcQdwPK4WiI1Cf
X-Gm-Gg: AZuq6aIBKfwxV0gGzw0otgRyuVEAmSUQq44A/jGIohXWALQ4zO1ddFJConh6bsq/Gwa
	WxtjcMVwYsBhimACFbb1QPpEpLrO4A0GoLal4yEnr8hlHsYdi/jCQ93IytTFttnkCZc0E0ieDyG
	tzYrG8dRbsOgU+FVSOVlPCoPG7Wk6Kgqvy12UrL5Hq+iafBfezsj6Wu0osVgqRtYBDc3rtSZiwl
	w6QPdUyBnrfKxpcNGMVsMD8FIpsF0ZHdrzjtZE/cdjKWD5yfltYsYdLW/HY54fbTBic+Or2iTAW
	jSBuq+tPT+nh+PYtpQkUoW5GuA99H3SHIhbt0gFA72hif+wxgPhsQoSkK0VnUaSwiXQtNHCqSo3
	JljWhvce/vVF3k3E7ZSGJcrk5rrkEdwLcId1f7p+zXb2H1/nIBHPdGnBnOzKFB476pPJAgHXIAY
	S2CmxJA7Wn6L8Wl823O4dOa/SxD7hUe4TncPY=
X-Received: by 2002:a17:907:d8e:b0:b76:f090:777b with SMTP id a640c23a62f3a-b8dab2e7d35mr340320966b.22.1769605136436;
        Wed, 28 Jan 2026 04:58:56 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:58:56 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next 2/8] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
Date: Wed, 28 Jan 2026 12:58:39 +0000
Message-ID: <20260128125850.425264-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27523-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A118A1B18
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
GBETH by reusing device data of RZ/V2H and can be extended to add other
functionalities later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index be7f5eb2cdcf..19f34e18bfef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -214,6 +214,7 @@ static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
 };
 
 static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,r9a08g046-gbeth", .data = &renesas_gbeth_of_data },
 	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
-- 
2.43.0


