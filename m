Return-Path: <linux-renesas-soc+bounces-34063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0wAJGMpMWrNcwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:45:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F093E68E6CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:45:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=I6Evb4tG;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BC913078AC7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 10:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1C1426EAD;
	Tue, 16 Jun 2026 10:45:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C227242EEDD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606708; cv=none; b=IeMyeQnYgIVZQbBzlVe8sZQNOLNvmlvLASsuxqFqKFgazOaHZJxyU9W0WZF025WOZ0uMtqurInPuvKfBG+o4VZLg2ASFT6wyPUH0nyKBea9ifrs+svPqpjotm4Na7x4M/JPpwDb1lIu7Zlkrc37RWW74ZmMMIOrdAUbtbH26EfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606708; c=relaxed/simple;
	bh=Zmr2qzi2EerCPvI3oUALlEw9kcHkbfep14Aosv7U/bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMuXZmcHi1x9fCebUwTaC3t8DxgsUETr1CAAbx2s95KuPJAX3rxCifFQNQFQq49n1xrvyAV0cRo+f+uohmz2R+mTJfJY2DG2fkTeUabDIKZyLkjRiKd8icYEb7VSiM/uVWkH6skMTlJeqc2NF5NW8Rk4tifXo/5P9CvXNaHqfmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6Evb4tG; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso28643795e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606705; x=1782211505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6p8chjrzw3Gr7UCK+1dQ530SbpBx+ffpOdBQ3GNs2U=;
        b=I6Evb4tG4KQyU58x9Qsb/8BxwZwmMB+tueYIVPBmqs3BObfUWPZnpAed465Vo8ZTeg
         QJyHj2SC9iZ1VheMfffB9dEvUSCi0vhEPc5n2EjRZPLLtaBxbkJ1kIGmHewhSEcHViq1
         0fs0VTwDCFo0UvY635q5Vbqc6+j3eASzG+pXAo+IsY/1dliIp/Oypmqoql4hQG7LIREc
         GboOD0sgKDWehJemicj+g1Ks7XjXJh0doJG2ubXuqzgdRyguypSzqB8aYMzW3z9YR1+B
         lqtaH+lpIxXtr45k9whPF9cMZ3Er2thJlUrgrC5nFiq/dUXtMv5DzICpmcMFeIiIcLi7
         uHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606705; x=1782211505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i6p8chjrzw3Gr7UCK+1dQ530SbpBx+ffpOdBQ3GNs2U=;
        b=h+KM3BtBYTOyhg6Wb+FzLu0etJ3DmCsnqQWrz+2qO7WXvbBb0mWNygWuPqw7pWfV3T
         6wX8FiHpGiYxrkUyKx2HgmhB3++sWmaV43H6wodLWw4cwpDtWooksJbBEpAl3kFe26wc
         oQwDn2gn6EmDYCNyH1sxMeeaJSV0mjyRzoH//olkH6LlRr9K9BKLFE6hiOOdAkpi2Zy7
         phKyy0F+LWXHb0yPEeixXkX2nZN8mn/W5Kzr2hKah8lKCQIgcg+SJDF+IQguUkH4OOS2
         m6wjScw+Ttf1ElVUtm4MYOjeVJEvf/1pWntk/3juYClUnknwwiNsr0EaojibXMHSeEFE
         X5yg==
X-Forwarded-Encrypted: i=1; AFNElJ9mm6MTk0k5obaS59GKl8XOD4lDWdEMvkp3CfF0c7z/tZo6NhX+64kfVkFcH6rk27o6HM8S3XhQLsLiQNuNtctU/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAAXQlx4daN7rm9S8vLqld/Epuy/xYey9qTKULPH2d1Jt3mFa8
	rWKc7d3NcBgygY/m/1ZdlfBh3BjivdIZjdb+oXCpZ7hKWkqBDKKTlev5
X-Gm-Gg: Acq92OE2uDrMIbFzZIZmuaOsP8ZVdH9enETiMUy/tLsoFMAR526ocOIaQ5/NWU7ry8M
	gJMpwLP8cg3awHu9Bw1ERWUm5cqoRUj9qVfawo9ZuCEfjoN0cUYTGt5dHY0LpWMUOoLIpBC6XO9
	FJuFUIIqbCgzFosD5qnFHocrQDJxExXUJybn1RNAam3xJg5EPF1/TgaZ2bxEexqqyJF3rzGPBIA
	rmxrTBdNywYvd87/vAUh3S/fXyjkH+/YJ1vkMTQckGwIaVYvKmK2d/c+ihkzz9IVDgDS+Viuck7
	yB8A5rz0hcM8y+pEPTk8QNWkGI/FA6CK8julCfdVbDmQ8Ekmwj5ASWpAmYFnVpn3sF5xi6d/mba
	ZIrmPxtxpnJjk4icBYcZv1hCbsgsbFR9HrpTdpBvFXX0OAWrwC7Ah9EJPrhs5SkhpSL3zWglE+y
	c4gEDIx+fuYKYOMSbnGEHWBjwYhyDtsierQwQi2YuR06IYZe/F
X-Received: by 2002:a05:600c:8b77:b0:490:bcf6:46bf with SMTP id 5b1f17b1804b1-4922ff98a55mr44962575e9.9.1781606705041;
        Tue, 16 Jun 2026 03:45:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 02/10] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Tue, 16 Jun 2026 11:44:44 +0100
Message-ID: <20260616104459.410743-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34063-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,renesas.com,lists.infradead.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F093E68E6CE

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 9740e5b335f9..d6b9d08ceec6 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - renesas,usb2-phy-r8a77470  # RZ/G1C
               - renesas,usb2-phy-r9a08g045 # RZ/G3S
+              - renesas,usb2-phy-r9a08g046 # RZ/G3L
               - renesas,usb2-phy-r9a09g057 # RZ/V2H(P)
 
       - items:
@@ -132,6 +133,7 @@ allOf:
             enum:
               - renesas,usb2-phy-r9a09g057
               - renesas,usb2-phy-r9a08g045
+              - renesas,usb2-phy-r9a08g046
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0


