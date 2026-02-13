Return-Path: <linux-renesas-soc+bounces-28181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCv/Jpgkj2m6KAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 14:18:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D55913645B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 14:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 120133058B9B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 13:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8824360731;
	Fri, 13 Feb 2026 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByILpjFy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7959035E556
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988681; cv=none; b=Dba87zarGezn6WSf/YCejeRArR3D/hhxMHYtSumE9qvY5OvJF0aH4XnBnWzghvnkzx+Ootu6sIgzKRwkhQpJ9ELRNxiEIOzrkHLeCgwRjEuARA8hKfSeO9kfZwdHFtqRFnMupN1lpubehB1wP4TjqYHG0koQjalU5WhiPCJzMuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988681; c=relaxed/simple;
	bh=zUaEi9qf1U/CWgI+hG7dHrznatDAa0OB9UZjdffR4yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jH9LgSdIln1W3StY4YskU3cwPIJfhpf17+OdWA0S8xswRY8K19qndQaWc4potsmwT7YVQcXCGLrSD4vYPPVZ2O401UtB4hQigGQUl0zPMNcLItwRQRbXpO6Y6+8+bVwqzACHqiy2ld9fYiazGYdz3w6kvQ0vdSfQGOy6m05r0zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByILpjFy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so7776475e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 05:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770988679; x=1771593479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrPmuJfgQMK1Q50aFaUvu6q8a4C0V7DOxqJ8gmVb+ks=;
        b=ByILpjFyzSaCLwciYHeRee185kmtzyzgd6o62OYctRi3LK49MWAZcKUCf7RzWN12sF
         nwSS27ERFWXrg/MkPHgGW3Tpe9TkDCzdqsOtEEWeSTuD67dMGAQi5S1Qp5YRjgMlwRJX
         wXsMB5WFzssCs18xCTF7w/PEhmB9h6nAzXE4gVGGNaJbHtEHGEIQOSDhVccvykQx/dDh
         ezxUZXAgpvs5Hlb2hC9j/nHPpKR1JvmlhS4ckOtgcZGHH6HbjlQiDg2Z3xIRua+EpS4N
         lqClQ1kJbnSDY4nSXXbWbhOfp20eoPrNU1AbTdOwnugggRpVOP/kJJQQpvM+sve2GuIT
         rh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770988679; x=1771593479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QrPmuJfgQMK1Q50aFaUvu6q8a4C0V7DOxqJ8gmVb+ks=;
        b=jHDgB3luiQDAZBPonCQfa/txpmyeNJrG9smzQfi3SsT3FRZdByj63SJJpxa9TJc+kn
         0c5aPcN9aP3HWg7cmJQQOYA/aUVvu42cxWvVVzBPJDosOcrRay3uvvR0U6NH65kef9Cp
         7fwZxrhCwsQ4KzQ03su2o3QXmIPtCN8bfXdQZF1hRqQoFzHdqr3kA3zVUJYZkuptI7kO
         57a5n1VkLE0Y8WDaMW8xOJ8pgwAEkvqHWA9NeC78hKkDrlZDm4lkZiTry8GRdvhotWWR
         DcbJcymlBxEV84SFkQJWu0mBq7ZSK31m9HqXnOfSyFUF0cP9rss8H6w8JdWostacnkVT
         /2yA==
X-Forwarded-Encrypted: i=1; AJvYcCWNmsMOeEgW6VGTR3xAUjcJaNaMP8H3LTb+7wCc/yMCre8k65LpaZsGSTiPQh4gB/ini9bvIqvE4Zs5oCnd4EY/0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZoO9UjM3dihenN3sIf5s6HgFJ9qrMWieuBpjHoaA8BC+XDYL
	pR0JXev4gfTnBOjHkejBO7zyiZfC5QaZ1/f6AtaxekS0V8OMLoco5Um8
X-Gm-Gg: AZuq6aI8psBwTvLPJp6uwGm1mV8xLBeQ5IZqrgs97J5wguLJty2Nr4uOfIaeJFyR8dh
	EVxm95Jbn/JVp9x518WhXeofaYjv8G/zu/GUP3ExiAh135kUzp89c4SaUkWhmuZ/95cmN9TV4fU
	WTo0pW1UBdldXWquQG6k3BKOCSDsnFezyXZgx8rQzumseKHyfBqvKZv6SFotTeooXCULtwAA/4b
	U1IuxgXesd5HZNb7we7JpKbWw4zMS073Ot3L3YbRdR04yG25J5PJa8y7tYazSBE/MYc8reUw2rv
	pHhyQ5IvShQMyEkGOt+RC62cKmfquah+ii9uYt3v9ysWCqPf6IO4UIc73EvV0IxG9meeVFC4CNV
	wLyuRj2axHh4qoQrh5aoAEWkxCChavtGKeAOrHXkr32JxrhRVgyJIklSQhDSDaT4gKFweVyP+Ip
	+Dfl35iF0B96ntCUYL9pJjsjJP1dEFbdRxoqynH7RMSiP1a/qRd1sdQDxiNdOFxZegFJfr9yDn4
	bn4TD3dGD+ecolty10WGBM+8yVqhOmGI3PrdA==
X-Received: by 2002:a05:600c:1991:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483710858bcmr47724815e9.24.1770988678905;
        Fri, 13 Feb 2026 05:17:58 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:ed1d:fb0d:baf6:e4d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836ff00332sm60942925e9.2.2026.02.13.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:17:58 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g087: Fix CPG register region sizes
Date: Fri, 13 Feb 2026 13:17:42 +0000
Message-ID: <20260213131742.3606334-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213131742.3606334-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260213131742.3606334-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-28181-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_PROHIBIT(0.00)[4.200.249.192:email];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,801c1000:email]
X-Rspamd-Queue-Id: 1D55913645B
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CPG register regions were incorrectly sized. Update them to match
the actual hardware specification:
- First region (0x80280000): 0x1000 -> 0x10000 (64KB)
- Second region (0x81280000): 0x9000 -> 0x10000 (64KB)

Fixes: 4b3d31f0b81fe ("arm64: dts: renesas: Add initial SoC DTSI for the RZ/N2H SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 7d1719812360..b5be0c4d34d6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1092,8 +1092,8 @@ xspi1: spi@801c1000 {
 
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g087-cpg-mssr";
-			reg = <0 0x80280000 0 0x1000>,
-			      <0 0x81280000 0 0x9000>;
+			reg = <0 0x80280000 0 0x10000>,
+			      <0 0x81280000 0 0x10000>;
 			clocks = <&extal_clk>;
 			clock-names = "extal";
 			#clock-cells = <2>;
-- 
2.53.0


