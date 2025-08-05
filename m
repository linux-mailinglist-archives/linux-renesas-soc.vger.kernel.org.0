Return-Path: <linux-renesas-soc+bounces-20006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14077B1B358
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 14:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3C0E3BFF81
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 12:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E46E2749DC;
	Tue,  5 Aug 2025 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuAYuYFZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF72741D6;
	Tue,  5 Aug 2025 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396745; cv=none; b=NkvFt77XEuVtHQ8A1y6O5saXO+4CRuxHk0kHXsyh+F2fngW+G1j+b5G3Iyq6femXOcp2F7rmwzR5Zg2h+qtg5kdy1NLFm8aIfmh4lrikjh7lCMENvTVEzGH16XrXzxwjvaixVLTxejWaHeMKy+wekvibCBb2I8SkKel/H0YQKdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396745; c=relaxed/simple;
	bh=/1UVdeIxiArBDaXt113w0qdj6KH4xU6g1TwRI2I2qB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNNpx+4HVbj15QUXex4o+Wqs+LL9PsW0nNiWKgfI6fpTRo5C6nQ/RfDpEy+jurhsltOlVPrk3fgFSIN7LjVD6lTyp0OkoiSIa0kmkGsFX1SaU3OQpSJgLY5r2q49484/MMO5BhVY7xpeCjQXdxZkMPEqGyNpSggyHVFi4w7xkts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuAYuYFZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so29766455e9.2;
        Tue, 05 Aug 2025 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754396741; x=1755001541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSDq+Hn2dE0wUvavZKQ03gFbBr/qOvzFs7wRJoGmD5I=;
        b=BuAYuYFZmAFuaBlOPNClltz78va2tWelDI82XE5oBVJT6Q3lZ3M62qxediPNwLO7Qy
         Guw9nkNd5MLSeH5t9hl4MkknVW3x54vXWdde7k8tbDKoxHWuDSGqIUcAALHSKfqGd55u
         T+7JkWLk4W66O9ImsW7YNlJIF/HfFY/vDZvj9P5eJ+sK4bZtflSIfIP+F+FKCTj3LHdE
         FlO3ChMrI9WOMSS/szsqpJpk9dToRsdvW42CM9W5Xscmc6tOfjrGn3aeuc8EVwATzxc2
         vwdungVa9N7/iNNvlEmkr3UlgU+kJf74KfgufaeSEhSJ36xwcYUyh8BbfmmF5uWZO2RB
         cIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396741; x=1755001541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSDq+Hn2dE0wUvavZKQ03gFbBr/qOvzFs7wRJoGmD5I=;
        b=qY/Mphq9yhZ5fFeml71ked9XdoHBsgEqyGaC2ZCLRxrK9GxOD93z+I5uY7z6MK4B8A
         OfauTqzVsg6wY1L33xOwKClHBZx4UpLK00BAIRAmWWCyOLOqMgKyRhUtZo60/J0PD0cU
         Ey2pmh5YbiFTUhcW24unyjKJkPSNv9X2voAwvxfZ4GtoPS55EDDxGVE+K+7uJ4T0Dyte
         sUIg1cbBUDZfrSLmM5EbN7dlmc7UVjkUGMYbarckGI9zYxQEQJSK3uzu8rEpY8GsYAiB
         5KBBLMHoeEUK7UdgX2SYr3HlVJsZ2T/LCcZj605GQ9vcGi33ffKs73VLUv5gbIo31kzx
         btAg==
X-Forwarded-Encrypted: i=1; AJvYcCUv4uOZYde+k5B7P+K/eXFWaE3f2gk88Gg0xiyg72S6dsaZ4snlCB03jGYIWex7NA+STIpQWLxgooiV@vger.kernel.org, AJvYcCXTjg6QigCC6/4SLeH9djvZmjQuakEBohXUggh00wfA35AwHyCqwi63oLwd6LBHGnxp/Um2zw4IXXu/c9HFydO6OxE=@vger.kernel.org, AJvYcCXXU/kj6wYwHEYLifuAMr/nIiPWD+xJNsVe0TsKClGnNDZlOWdN7NA6sOayj7ctFRs7IehFsWk2x6Z73TcH@vger.kernel.org
X-Gm-Message-State: AOJu0YzYLZaqLhrONOrlYv3L6hvtY0lzOA5idNgy4theA3OiJITdl/Ct
	WOr1ismzDsmN7hXZt/WlmZmhT4ShKgmZqNIatUDH+gUAXV3gXr6WOJtOH89adxHg
X-Gm-Gg: ASbGncvecm6KNbj3J1QKQ8hKuwEqroJtktAAm/Eqc2oBZ8HSAh6O+5TuLUQnRWzp2dn
	eXawOxboVcBot/kaCh05iNA+setgBO5n+fM0BiBNDpZqg3mmAau9b91xdn56g/i7HYCYieKNUGd
	uYbUSEjd5srWSOPsQyYApSnSRYPZiwci6iHvXxpJGL4M3r+rKP6uUyafz3BUIM8d3AY/fwE7DhR
	1WI9Grzf/pGOw/46u0i+RruFUuC4zX8MY86K/6Bw65LDwdQT1fYeGYQg/H/rvFupSPqn9NA4k/P
	1IZgsmkmFrzRTh7UNw3e00GBAWOsA7CdTL7rQYBdJbpRd8QfQ9sr0jIR5ii2oy1yhuiVBWHzgfh
	uw/mfwUuhzaniEA+H4YprNQoI5HGJfvrelbulTKVYXw/t0n96vpXDRwz9qla3Yc71lJiYETo7pw
	==
X-Google-Smtp-Source: AGHT+IEy0zA+ghxMfTtdoc1SPyYprPnGLBo5MjQWsC90kxL/dA+l2LKxoz8yb8Dy7AGzGDkZvD9z2Q==
X-Received: by 2002:a05:6000:24c8:b0:3b7:99cb:16f6 with SMTP id ffacd0b85a97d-3b8d94ce483mr9806106f8f.53.1754396741365;
        Tue, 05 Aug 2025 05:25:41 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48a05bsm19153986f8f.69.2025.08.05.05.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 05:25:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] phy: renesas: rcar-gen3-usb2: Move debug print after register value is updated
Date: Tue,  5 Aug 2025 13:25:29 +0100
Message-ID: <20250805122529.2566580-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Relocate the debug print in rcar_gen3_enable_vbus_ctrl() to appear after
the `val` variable is assigned and updated based on the VBUS state. This
ensures that the debug log reflects the actual register value being
written, improving debugging accuracy.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index bc841982a19a..86689d0cf74a 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -209,7 +209,6 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 	u32 vbus_ctrl_val = USB2_ADPCTRL_DRVVBUS;
 	u32 val;
 
-	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
 	if (ch->drvdata->no_adp_ctrl || ch->drvdata->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
@@ -223,6 +222,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 		val |= vbus_ctrl_val;
 	else
 		val &= ~vbus_ctrl_val;
+	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
 	writel(val, usb2_base + vbus_ctrl_reg);
 }
 
-- 
2.50.1


