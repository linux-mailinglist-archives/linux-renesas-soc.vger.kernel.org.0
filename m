Return-Path: <linux-renesas-soc+bounces-32085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAWPJc/p+WmsFAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:59:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F3F4CE13A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB99830463BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50ECD438FF3;
	Tue,  5 May 2026 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvkjwnAk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F744279E7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985970; cv=none; b=tlpum1x1akbSIV2tkVVEmGkAFeeYlfTpA5Vh46oQaiOf904l7eNG7FUkAbxjEQJkAnsdZ719gcj/TbSK5VbMoJ/EtiRFjIxGYSWWF1FCorKiDXFrZTiixMf0fEIHZdZ2YCbWjhfsEMkcTrjMbLlLL104QNjf6o9ytINb2jy/di8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985970; c=relaxed/simple;
	bh=paYmnNnEQoIC5Za9FvreAtakDaY7vbGO93A2aCAcVqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/IIRAxchDLskENtFSJmGzSBleM1nAnFHJ03z+sdYyTz5ct2b22LwVHsgyojWESuQ7MuekGObsk+3dLSd4I0OK7D1dzAwlE5ChNtOCDcNuTs3mpRQnVtrRzx7CD4tnul3UKSDWMkzeu8e0Qai6cyu0TPbVwrYie/DNQff2N+eGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvkjwnAk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso55349885e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777985967; x=1778590767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhJSSysfaSzLRYBW+yvJB/wrLFSyZVcO3hf6VGLmUpo=;
        b=WvkjwnAkOINF68yqpkD11byxnALH4Igu1uv/7sDAVXTVuVYsscjPbm7MvJcGdSV2si
         uPd3jhxfw8Ru3a2UcVAF+OsVWd6eBXkR4mIZw/kf3m2RKBbdVKFkYv+OG+SVzNP5cvJA
         gNwZEUuT67ldkkTkYbKI5MVfseD1HCgIeB/AbcaligiVKTMRq7kAHQibkqZUswMmfwi+
         uX2bCKtbUCQi901nAszihhYg01R9Y1XzN7/CbUd+aMLlQ1N3johUwE4QMCWnS0yCwGHw
         38o3xBT0wfHrHvQyulerbkmUwHAZIKfRFQeQjIng+7WE64FRryHPwwGszvjJ64bddXIW
         91pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985967; x=1778590767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RhJSSysfaSzLRYBW+yvJB/wrLFSyZVcO3hf6VGLmUpo=;
        b=kMpAOv02Mq9ZXEeKKOSIRowCZmLu5aBpGW3mHjZxIPBby0EoDaSF6OYWsediD23lrk
         WVMZZB2qveaM45DfDVKYvD7GfSJ2oOdyLAk/dHDXQKPmqAxBLHcXnsIKi1/uiTg0mfqi
         v7w+z0GaP1O9XOOwRe5C31oFzTgXI+ZylBvirkLCRAz6SI2AmG2iJh/19dz4t3hvOaek
         RFoJ8ApBkFvFBPMPyBDNoByVY6K/pNNubK75KC0BiuyN+EtWLZvm0f2kC0j2Hub+7+cD
         qzaJAjlgxQ9Muw1VomuhGNO0IU87HrpMYiX+CMhgzusemiQUD4fJibm+z1rOTU62FAWS
         3m+w==
X-Forwarded-Encrypted: i=1; AFNElJ/f+DDvTORNw19+wG51WGb+wHXNSIkTf8EfNkt2n2ipmmV0GnwPjvw66Roz5vfKte6+A1deWiWbEMKZGdYOrM5LSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNkvwsxANbxqBLV07nUhanlYpqbHME/aAO9pIKjKCy47uQxy88
	LjcfR6W4bJPgarHXiVtOrymYWoJXpmyI+iM9RdQYbb7h11NI8g8j0WAJ
X-Gm-Gg: AeBDietXNOUmS0n8pUCIhP/n6ns9qh/WoO2vOfGOLgWjheGqFIAVswWT38YP1kNG7mi
	2Fx0M0cRH54vozMB1NLvJWBs443AglHIka09PssI/lb/BhPIYGa4oCwBQXVY8RVFTRqHYUqyBtW
	mo77nRODjtz//M/It1CUGWJAEONU4lwaiQOXb2Rw1wqXeepduvPdrNTVRZIN1oLq25I0LpYjoAm
	HdpHva2mG7g/KJCYLNuiGjgoZ/FSkz2bLf42OieDPMHNd1wV25GSP36SDLS0nSXzDgaieLGbcE1
	gBITHWiNcmswdhA2RysYTzHWnx4sfLNF0d3LoZjzKm0qVnHwkCykWnRj4AKYORwIq7nxyMQDuVD
	6XuWJ+chS6n6UwozoMUJhHOoHHwGi9FL++bnIqipnigl3NzOLuP2YASfIxfYFEnfVD2LgqTh7vA
	D1zd6oFG7NA5q9mRVJ0PkWYulFgcC2jubIuXvYui4LJzKy9/IDYygEHG1Xzwcytr4jFjmKlQ==
X-Received: by 2002:a05:600c:2e56:b0:48d:46a:6e5b with SMTP id 5b1f17b1804b1-48d046a6fd1mr99728485e9.7.1777985966809;
        Tue, 05 May 2026 05:59:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm625634745e9.9.2026.05.05.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:59:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog
Date: Tue,  5 May 2026 13:59:17 +0100
Message-ID: <20260505125921.149682-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
References: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 31F3F4CE13A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32085-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable watchdog timer channel0 on RZ/G3L SoM DTSI

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 0c5b195ec57e..f4ae7b7d7749 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -219,3 +219,8 @@ i2c0_pins: i2c0 {
 			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
 	};
 };
+
+&wdt0 {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.43.0


