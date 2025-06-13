Return-Path: <linux-renesas-soc+bounces-18291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DD3AD8EA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 16:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 163883BEB92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EBD2E889D;
	Fri, 13 Jun 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMwpPjni"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C82E7F33;
	Fri, 13 Jun 2025 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823005; cv=none; b=piHcX2srACU3BgOWIbsO4z1w73aL6qmAjafpfYhQ48sWbwysgHdAc6JIUYVX6SmzcQbpaMMCTR7Kd5u56ohwlfKSgbJW/JPSDyxJqIUkG7uteJkOq1K+wdH0EUtNluIFTCqSWyHLJalN7ia1qp/eItdJLOQ2uhZcZbVck3+vV3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823005; c=relaxed/simple;
	bh=6dMN0mVYhF9JYsEcRbG07jzA5OyW13gEQsSt7KUis4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwMOK+VzPfjEMY3u8sh7am7La39ff35TQGkXY/bgvoaCgjg4MEb9w/4MM45yMWRdpfCtrkZ0UT/a5A29OJhfcaqiKGk2nazCOX76Jg0hmr+CoOnq5UDsCkRwGhiF0Fe5ZIxdQ9cGQkuOijHcUdOo1sbeb6IFCRFwVGfmNuFJnnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMwpPjni; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1446831f8f.2;
        Fri, 13 Jun 2025 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749823002; x=1750427802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjoRiXcqazuNJxobWUnXbDFN6fsdEQuE2rSsR5u3Okw=;
        b=MMwpPjnibYnPegw9Djr9ae80DUzeAF362Fw4u7hrwZ9eS7gmsEX7LAnbUlrCmYRgJA
         4xo6yt95C/e6KMVdR4+eloMLSHtbBQc+b4G8m+qe7Q+NmZlXmHE+He97EB0hgaGzjRm0
         kJeCaiIHUhN+2+kcRDL7WKlanhI9pEhfvuQ+LYrtB0C5o3JmF3bQCeLQu283Lxg4WFTJ
         KlFPnqktwd0Xtiy24fB9SPD0QbeZ3rjQFaQg5kI/AOEtcF7yIiNbXyB4xqhb+gKvScy6
         hkNs0u7U5wH0f4bvFhHgEtdEnowNPcC1h6PujRIPMXViYvi8RYkN0n2eq7lZKLGmin0q
         UNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823002; x=1750427802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjoRiXcqazuNJxobWUnXbDFN6fsdEQuE2rSsR5u3Okw=;
        b=IR958BdPSBVN4eqlSErEt8HPE0xoazw8XpWZxHve7rdvKjSOAI3BjldFMt8ZT7ORZy
         CDYuuZNKpkUWKAQKd038vCZR8+9OIMNLHF1bFRWuptfWmo5+7Sxlwf2+FE9m6G55tyAn
         Lcch5MX1BY7VNKEP3Gyj1Wx0DWIEtsDo1Y/JqJVpgV6jDkDWTMMTGESBM0++zgzDH7bU
         DNx//2RjIpx9nFbWkX58P4sahgu1uIbal9i/FMmgpgFy+/7B/fMfzQoY1hL09gRPNtjF
         csT73rZc9gchohpLGWb8uhTMWf3siy2a+Cwxo/LNJvLm4FhNKD8Ok/NqfZWXTSGsrtvz
         myaA==
X-Forwarded-Encrypted: i=1; AJvYcCVKqUtFC5CGE/5TpVE8MSqoj2YdIazH05abntPbtS0FdB1uoq+OdL+k9IBwB39/7hCPEA47HU7ls8pl@vger.kernel.org, AJvYcCWKbHTyWJmbE0Gv5jCuh5Pj+1qIEiVHDXiZsDfuwYzP1wV5gACEuez3v+rR/djdszKuziNMAsmrekhZk6YI@vger.kernel.org
X-Gm-Message-State: AOJu0YzFyJ5TC/UaHVIHXv8Q0SspV3XceMCjJKXFwHvBRrsrxThxxbwg
	NGVuFmlWQZ113qqqkB6dZYbpFHG6ue9qCdlLoFYhWZtRbPZrJg+bDbeN
X-Gm-Gg: ASbGncv5xY3z4pT8Aogy+39hACd/QfmLN6xrYnr7wBj26DVn2X/OMdkZj+XYEmsyd8P
	+95r7i3BmRP8qUR4wl/Kd/tizeVUCw03fRyotMtbRChP4yQoEehv06m/uREkkAwbBOviYBDSUeq
	VPwi43B71CFrPZQtUAzw/TeVniyh6Vr9q9iPxy4xiBFo79qosPkxkiBuEXiFPskoUAWsB3IjENr
	7PtJEwI2xhjHCvd3hFim2yr9vhe+unU6YGM7ef6R5a4yq6teQQHlyMuoFq2Tu62RmtOoUkGQ53U
	4yhk/RW4Y6sXeoxPMJy4bGtCvz+l1i6XEgHu3hewVUEKIf01zVRDaA8wKxKWTG+dExzlVs/DrZ7
	9DqsAZjddQQ==
X-Google-Smtp-Source: AGHT+IEpknnKNrnt2rCa+mtA64qaL5qh+3qHHH/2okL3t6mva0rwpMNmHL5VILF5fK0P/C5E4v1qkA==
X-Received: by 2002:a05:6000:2089:b0:3a5:2cb5:6402 with SMTP id ffacd0b85a97d-3a56864f576mr3053975f8f.12.1749823001636;
        Fri, 13 Jun 2025 06:56:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089a7sm2404489f8f.49.2025.06.13.06.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:56:40 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g077: Add missing hypervisor virtual timer IRQ
Date: Fri, 13 Jun 2025 14:56:13 +0100
Message-ID: <20250613135614.154100-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the missing fifth interrupt to the device node that represents the
ARM architected timer.  While at it, add an interrupt-names property for
clarity.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index c756a7c3cda2..7a79db19aac6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -277,6 +277,8 @@ timer {
 		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
-- 
2.49.0


