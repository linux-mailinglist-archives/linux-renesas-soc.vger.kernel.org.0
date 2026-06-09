Return-Path: <linux-renesas-soc+bounces-33764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LolpNdINKGqa9AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 14:57:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD356604C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 14:57:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NVulrFFe;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6881D303FDE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 12:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B2F41B370;
	Tue,  9 Jun 2026 12:54:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9DC41931B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 12:54:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009689; cv=none; b=F3lTVCPoIXdpVFoKFYgDYoUfonDRnranoNcV9Lyif2P/tCS1kJveXeEJr1SINlHomF+sePxC5y/DfhVojeY5DBlEVF7c2iYvyr3tveOdlB71B+LDwCxeWAZhZuwbGYqhqgw0LNjH+v4Iofb9gtU7ELp9C6gbWIR0jTV/tsb8e7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009689; c=relaxed/simple;
	bh=QWHKMECdkDgTHMEhYoueuEWaT+qT7FqBN2oGC03gpKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PynAaZLMKnCRqWqaQmV06CT0lspuXDt8UpjujATCi1Bqo4FXCmdSdt3SEKS61je3yHEaPJl6OtcMf/d2oaGUn5WvUXhTl+nKejDqcKWXXVusc1sDpaHwfhxZkWqdOi66Ij3GWKlqgrX5YPd5WjUEU6+7dckhugUl+muy8KHjGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVulrFFe; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso38885015e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009685; x=1781614485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qu7loVp/RhhbK5pFGzQisJHK7vzMUicuCCUYX824N9E=;
        b=NVulrFFeZuaYN0nM9hekFSYfJTPreCaWPvuMFH8X+Hv4l0LNUbrnIlu6/7ybM49Neh
         IRTvPhm/s6l/9EKuGn6TBarmeeSwtQTHM3OdezqCnHI3o30QoMzWC/iHWeKf1hbdqpxE
         HMIzkEaOnWSr9Xo1wqgpmK309vnT4HE+fL3ybPVy8l6hYLIW0wBrLTCXInZTuIwgPUt2
         dkl8OuBlD+SW8IRmjUJWKVjmRQwxw1omuyxLoTcN8NsmLUZVf8glzQfUewjlI5XxxuaQ
         l5GxayXhT93/U+coACh5eROyzp2aUGSMleK+S/X3T0/MyhXz9HYhZSpnotVegKa6+fOe
         AKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009685; x=1781614485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qu7loVp/RhhbK5pFGzQisJHK7vzMUicuCCUYX824N9E=;
        b=ZIQtg94hRl9IOpQVuZc4QY6GpNtpJNa8hl5QyGCg5tOD5k1DhOVSkslDBW2uqURKi+
         rBlUFBh9QXOEXfmd+UXjXvx3XQfkoFuI9/XEk40QUaGULd3ZtlFP5Kv4TudF+3JfIqQW
         mRTLxzu1NoLbeFm7mPjk6rv5Jxunrk79BhNOwWEAkni84wAX2dRPg6hGDl3blSeAX0gH
         cq00s3GcCo/W4Sl8FkJo+6Veza3DcG3LqML5DhdlkpQVG4MTbYAD3OVIqsaojrz2Chte
         XK723VaYEib7PFDtdn2bfi+simMnSQWnE3SSNTf1guN7oaqUh0CcBSKRLzwlUiXzG77/
         vloQ==
X-Gm-Message-State: AOJu0Yzh/0kpkp00S7NVGC37cG+spilsl5M7DV4FgJHhWhdxx+07JjOR
	czrnugTRh7nnheFQC4+oitcN8us9sZSPWtnNO2YwT+QsqQwBadZ7yHSL
X-Gm-Gg: Acq92OFbb/oA7nZvyP2Mv/PmmJeAjYgMxAt1lyIiRveWAsGlnNqCW4S8d0CqxJc4tjj
	QeclL7k0tnOxxVqs5UGPgTt5NRntwptO65uWPNic9jFh0nnGd1S9VVUo75awqdzZccZcwvsoVhA
	4TVTQdVqmJVICUKfOou1USyYVVnP1LHRD7RaPC6rr1MziTlM4dAlt13Obt/11GJ1npjK5jUPDPm
	g3MPmdkdiax4ZBnzVe2v7g+gqWFs4rQ7sXJFCGADSaDjtUHx41Epb6+8aD5hxydzH9HBg/ox3nv
	bUzDgquIyJ5FlQLf0Ud1AG4IJ1NidcmYAUx9OWay8/H+i1DlxPluaM2Khb+WNHjK8a/ku/Sh+o9
	cg1CF38dZkgKJ6rC5osnWl8HrptBc42+KIxWPVRGDOr4T1ZWjMb0OcUk7MqZ1IB5Ln8M0lKqViZ
	9rr8KcaUB7Wpq2q1ceQjpSjStPt2AgPXSe3VJZj2uId9VYygBP6I7iwhnZm/sk6FEp4F/EuxIBN
	MhiOOxFICyTh0TCM5JnvDdL84291wAOs1qhAnPmPxcVRPxMV/aOx+KbIw==
X-Received: by 2002:a05:600c:1c20:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-490c259eaccmr310171145e9.10.1781009685453;
        Tue, 09 Jun 2026 05:54:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
Date: Tue,  9 Jun 2026 13:53:51 +0100
Message-ID: <20260609125353.401124-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33764-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AD356604C2

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add VSPD and FCPVD nodes to RZ/N2H SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index e8d4f76949cc..174f683fa68d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1379,6 +1379,28 @@ sdhi1_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		fcpvd: fcp@920d0000 {
+			compatible = "renesas,r9a09g087-fcpvd", "renesas,fcpv";
+			reg = <0 0x920d0000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+		};
+
+		vspd: vsp@920e0000 {
+			compatible = "renesas,r9a09g087-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x920e0000 0 0x8000>;
+			interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.54.0


