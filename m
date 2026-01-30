Return-Path: <linux-renesas-soc+bounces-27663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE3SH3aafGmzNwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:48:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02292BA29E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 169F5301CF8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 11:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A3036D4FB;
	Fri, 30 Jan 2026 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcdEaBDy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7301A36C5B7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769773671; cv=none; b=Fn2hcluHEnqCtKgdKOHMe0LwRN6K2uvhllPVQbwFcTDoesIm+AksDheSk7g9oNFpVYszAbMCvGzxBs0BtotXmRgm9hEy21BxGCIR33qURWxMbUfaebdIf8/A3/qWAeguVDhRztApy83zJHdWyY+pQuX7Lqgswx6G71Z9I77JGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769773671; c=relaxed/simple;
	bh=xHsscL/S9sNPH/BVUVEofZMZpcKVEo4gOfIgKcOUPec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F91HuBph5uTHMCOh7OBAt8qenqz/peC/XDX/rOgAgLJMPqmGYsI/ztgjyu+/hiWLblLN+v0iIkqTKIEWtM46nZ8Xw7hPQg51eAsxocwVNL9vdp9QL9Pyjrx7Cypi5z9qUK0Bc5JVm54kjnEBfSXoh8HEShj83FyD2yWil/+vyMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcdEaBDy; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8837152db5so321319766b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 03:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769773669; x=1770378469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiAdJAOATpphPKKt4Msqi/O3DHV/llCZQK8v55LcCMs=;
        b=bcdEaBDy8wrYyPw3jBEiiO6rA35EWsJ98KQvsC5slJ5Fg8zZliktHQSOt2C6DcjEqW
         imSjym9FnAY21ieDUlTt1G0kTJMPk1jfAk+WqFs98ra07UrPVe8dCwT5S118e2xJrWsJ
         /Bi4mnjylJLtfGRrR1HHicYJy5ORKh09rEjtbjJA0/UBQVfuV6qL14jJFOLJi9WjIHXQ
         pm5Xq3z2tAlIRWIEKU0rtkprL4yP+HkqD36WHgyVEKSci5/J/rdl1CT7tOh7JBffF8D8
         Pg1Qe+LYFxVvUkLlTacdSS883bM8pR02vM3CzJswBBT3hQ6gYeTqlB5+CHo67SRflADk
         0kXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769773669; x=1770378469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HiAdJAOATpphPKKt4Msqi/O3DHV/llCZQK8v55LcCMs=;
        b=wtrd/TV0FCquwxuBqWNTDNhLa+N2usTqvO0BEWEa1Xma99llrkfFWTM7p3AXGoIDaA
         LIiTkcSsn6GJf+AvQ83E0lRf2Mw1sjiz2qgjSapsRbTg5r1I42Fv3Z54kM7fcA3SWJcs
         QfQ6p1YNQLavWGRJxOL5y0EdtPcXSclzHP33OoAWA5hf1S0N7saudd5HxLWzA9R3e6+k
         rTnvNKvv7JW1dRWaM7++fH12yimL0XknT8UqLn2fL/T75Bt2qfxKo1ynHufQQpeE0pOr
         8IRFL46OWy1SJsrQdFoSmv9Alv/piHnm9RuqkY5eZCLfsgGU6lQ7S0U3pDnNPym85DpI
         FGPA==
X-Forwarded-Encrypted: i=1; AJvYcCW4ONF239YbiUzdWqJn/GuPn+IRLbFUs0QRegj4e89jTW8hEu2FmoLRLiYlazb5o7qEaIGPA9OvQoS4wxEB8cO/dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7juWJJoLRhkSstKtoSEsSCv1aabNmltq7pbWWob4rXJfE7iUD
	PjJ8DhJMxwIBYy2N3Xu/C+oPrmCYhNu4fYbLvLoAj04B/Y5ftBoC3blz
X-Gm-Gg: AZuq6aKWf75b/VUqLx/ISK1XPteJ2RovCBYIWhUMdGZgE0/+AQ3vD5R59STrrr7gXwB
	dQhZVnbH+vVNiPRUOOmYtXBC93s+lyBbzlXg5o4jiq9DsJMrZ4Q00fdQ4Lu9RGwxnKYPgla+1sR
	uqc3Z7jUOxdISwwUjalEPrj7UAYjBe1jKPUAfq5KbHZ4KdiQyCeXM/yQ86YV+I2rIkFA9iwsbcG
	bvcseQpLYFShmqVqwDbWFOlhGbtnfr9TegalQHkY31eAVTD+p1EArIdQm/2aeA7SU0dNGxSrBpW
	8WL/V6uff3OPi7pVOYwiUpnYw+YJo5bCfhqvQw4JMYbYH0FoH5lSe9sFCZOoSEPqmUK/jdYt2rf
	/Jrktkyq5Q5Z+VzC4ytctVEyDa4q+8OKOw45nKaZYqoUR3yvFI+mSfrxQzMPESYGIMw/0lHPtso
	vDvqb7SrJ2St+ySMXhO4Es53XNSQYR+N6e34M=
X-Received: by 2002:a17:907:7212:b0:b73:9280:2e7 with SMTP id a640c23a62f3a-b8dff71f572mr144266166b.34.1769773668637;
        Fri, 30 Jan 2026 03:47:48 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de3046abasm243751266b.2.2026.01.30.03.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:47:48 -0800 (PST)
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
Subject: [PATCH net-next v2 2/2] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
Date: Fri, 30 Jan 2026 11:47:40 +0000
Message-ID: <20260130114744.252533-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
References: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27663-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 02292BA29E
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
GBETH by reusing device data of RZ/V2H and can be extended to add other
functionalities later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
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


