Return-Path: <linux-renesas-soc+bounces-25142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FD1C8762F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96A33AD77A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188C32F28F2;
	Tue, 25 Nov 2025 22:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8CjuZNY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488F62F0665
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110755; cv=none; b=uQ3Ut1dZWz5uv2Bn7l8owOokjNjkRiKDeGkEl+GMnpOO07g/dGu4gESjTD9o5puZ09QyicRYPaBNKhg8u97llhyCSfgWqSiHPsaXT6d69jvpoQK6v9RgPlcgX57X0WTjgPUC49GMylf5qFiGnxKerFt60iSYGv/+P53kD8uG1r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110755; c=relaxed/simple;
	bh=ZPRzn3gD/aFE6HQ4133fMgEMvbKe3TYcxS8Ff/8Hlh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOj25xC5stHAOgDWyygClbmfoWrFMCfdI+hFdSEYYSt+rcvo4PK7f3OcRr7ZEvoMX6CTLt+NPOIYG+l3h/fAHn/e44IZG0vzc7F9vLHyaIVmGCueGbSbt4bpfIjfInclQ149gqqHAck8ibAZbU6JtdDVq0o0Jjcpo9GHyLIYK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8CjuZNY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47796a837c7so40115755e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764110752; x=1764715552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHK8ddgvZb3H+Bq9jL12FG8XWljfqUPDn97ztaG4RDo=;
        b=j8CjuZNYNh4Kyl/rVaYWTCYTuLHTht3GbkOveCEXJrEKR6FmCCD5Yy9KPbXZWp/nb/
         4cLvx1jrRqJki98DCjpX6vTK+rbZBYl9rdpWXwlXAfkWIBW2TWHxP0AoOzH8HWT4Pipu
         yWYZzPliCFzD6vfm3KaS+PTgPBSoTK63NPZpMh6C5CkTpmpaMN81KCuaPeTjzHLQitpN
         XpEinoZjrEasiBJSK+wVmsOv4Id6QNNhabdl3B16zkq2VVc2gG+739gz8d9QWxMk/+Qh
         1dX1kCgJToNGg17KILY5EXwCJtmquFUVLak9cv2xwkfZUjI9enFTHF7JgvQFmpR5N5hz
         0wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110752; x=1764715552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHK8ddgvZb3H+Bq9jL12FG8XWljfqUPDn97ztaG4RDo=;
        b=T+Rg/Ik5QLJTadiZpPriSA4NAQPrbWZ6Z0XNwfZq22heGiR596vbJWGq+vSENnmh+/
         i/e1y5C9PHSoex2JM+SShGFiMwes5tmDYTjd7NJg8BMxS2wdMLMhLr75v1rLNERkcXIF
         sRP2Y0y/vIfQPQqV4VkAkKw0PFDVTKLkdoRmVkQW/4lzo//wbGNSACm3mECOygic9mas
         Ei0IznxTeb8lVGO7RjJZ0+Th9yLva8NhLGt86jc0ZavOCJvgFrmW3xqplQobbUJAN52I
         oYJL/mvNgkm3i3IJn7gX3J6IjJSKEO0dQ9XE9VEi98NiSP/eSAn+Ml2us3qX7GH5Rgm9
         KGqA==
X-Gm-Message-State: AOJu0YzWDnpbkHf1WLeM00XL4F0SWFib/ulisvuGXgGZxJNkKEpiOx17
	wNng886e++e9+b18IveIDfScaF6kqC2aNvKOv9LXpnsg1IxxOXefHWB2
X-Gm-Gg: ASbGnctpmw9HPORIsDlZqyhw5x6SqLRKwFgh94AXN8QrzRUvakUbPoc7QBpVXtEdJYU
	b17bNckfDcGIpoc1lCtfdlzp2BGY93r9V0gnin+jxXdjR+Z8iOJ9T9vkwtXTsKvNf7XLBqNVHiV
	twnGvv/37/pBtMTMKqt3BSyGSeCazm9Ovy/OQC0zgRUulKV5HGLnhFK88oF/8Verx67fgjay0ar
	Ebq9x3FzkjTuCobxj3ZdyUUxBuHB8eITxVHlF94f6hC6KzuxnCSkESXqk+NBZO8SnQytrasz6XV
	Ts20ddqF1ryzw1Yt7wd5lxpkA9eS0V1hKWGen1hSl5tvwkngRrNGtYXC4IBACGsHw9dUBZoidG5
	90PXoqT+L7n9tIzulP4BMxLe6IrdDufcfDA3y8jGTo1quwSguWpdB1Xh5zd7jL1osi1T5ofYx1I
	EC7yH/vUaYijtRAq0ygB7VV66UGWPev3bzsw==
X-Google-Smtp-Source: AGHT+IEB8fzZElo52pTo77c3JPHBGNRmlQIYKSdjwREiw53TO6TBEvCAe881/WnvYpNLCQfnkaAoSg==
X-Received: by 2002:a05:600c:1913:b0:477:a977:b8c5 with SMTP id 5b1f17b1804b1-477c01e92f0mr195860575e9.31.1764110751676;
        Tue, 25 Nov 2025 14:45:51 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc5ea6sm11683045e9.3.2025.11.25.14.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:45:50 -0800 (PST)
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
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add NMI wakeup button support
Date: Tue, 25 Nov 2025 22:45:33 +0000
Message-ID: <20251125224533.294235-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the NMI connected user pushbutton on the RZ/V2N EVK.
The button is wired to the SoC NMI input and can be used to wake the
system from low-power states.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 62bac7416fd1..e0d8e8d10386 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "r9a09g056.dtsi"
 
 / {
@@ -44,6 +45,18 @@ hdmi_con_out: endpoint {
 		};
 	};
 
+	keys: keys {
+		compatible = "gpio-keys";
+
+		key-wakeup {
+			interrupts-extended = <&icu 0 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_WAKEUP>;
+			label = "NMI_SW";
+			debounce-interval = <20>;
+			wakeup-source;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
-- 
2.52.0


