Return-Path: <linux-renesas-soc+bounces-18582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF40AE1AB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 14:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0FA55A6231
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 12:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737D028BAA8;
	Fri, 20 Jun 2025 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0rcAiaB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970AC28A400;
	Fri, 20 Jun 2025 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421461; cv=none; b=dyPaRh8d/VFfJK818lpTTmZe8JDgyNQsmrpaN+A99xIqvdySevBCaOEQ01a5xPJMCMZ/bGGHt83RBTheKlCSE+v4AfxmyF6yShEc2KT4bDkeezimV2WSVoYnbd7XJPggWFqCNSzhfc2bYo7pWn6CEkKa+8D16DBCJxUMjxg8BQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421461; c=relaxed/simple;
	bh=t5LY8Rk2V9T1SuPJFFqFqeyhfok/EQE+CyfbfekrVmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7SSsCthK3pC9QiIsxI6MHXx7KMTnVUwEahU+UNiQlrtyKFgse4/q5v++xvuRB9tnzwUTUNtgLWm9rxKFKyLZAgsuNu0OFEKToSycR5W2v/MREEFLSa481E6O/S6AOuMtkf8cu/Kafga8FVB2JON2xMYKQGZBhWPW8ZylwDlZHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0rcAiaB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45348bff79fso20445775e9.2;
        Fri, 20 Jun 2025 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750421458; x=1751026258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7Ctr0sAUnlzzIgUBHaJtPIdj3XkekwHUxG2jV9iga8=;
        b=U0rcAiaBIDYojlEQpILTvDvVP938GktKOojjL5bYGcVFqq8Qg5YcRd3is+bLIi0Oe8
         DvUSyu0Ea4xrDBb/ltUs730K+qhMVGzsCrwgeMq/nZaA2zw/E3HMzkOXhjNipwnfrZ96
         UnEn0SeE7etigIPE+LjIAWy7cO6N8uo8UrNgbaCq96pkQy5XW7zbj+UKw5zXz4Zl0esK
         eZvL5Bt8D3DWADwWmUbly3IEL1SIJ9nD2RtsR2ceB7GJx32Dumg04D+ztHqB6jlB0Maj
         aWCKDou1bOPPcOicOcOWCWSwq9Up9y1XIamYTpGEGu2fyZAm90W617BplPcKxYOQ1l/R
         ZA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421458; x=1751026258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7Ctr0sAUnlzzIgUBHaJtPIdj3XkekwHUxG2jV9iga8=;
        b=Wxd5awKVrG95HcT3nGeUGqw+RLpbBCYAELcUENKvJcc+7TBDGHFzmFo5Nnz8CaVovh
         xGw/ZfxhbuBymVYTTT/cskL7S933dedARptRY0PY6xImyTb8lNBlBBryDe4aXK85om42
         zl4uxmHaU25K5J0qvAz7wVKcS6qUfQzWt3VtBpGMOjwmyqAT4MQu5C6yKdHeUNMv4dbY
         SIDIeX7QltWWkX9wlc+5eaLJpWArIRxFyAuIWNPjKI5TkqHQNMfg1eEPeLuhP0Yb3cMf
         98gA7Uv7sJQBKkNR1daoLIIBUabXg6vQyVRyxZ/m+V8gV+kad3jmR8sT1tai8E5Tglcj
         lkGw==
X-Forwarded-Encrypted: i=1; AJvYcCUMlhTrtexVzpcdc/afGyAXBsV39tN9yiPpnCCYxsOGHruG1VFmndzimkY8WJRMug/9YoLhjQbdERPt703K@vger.kernel.org, AJvYcCVoOdOnni9hye0sGqHFIjNXpqT9/Qm5F4cmbkeMWNnf4mk9bQV6dikHBwr51Jl8sHs2/2mrZhEGAaD6@vger.kernel.org
X-Gm-Message-State: AOJu0YyeD+9Fyan0UQjdhqxHq1AUojssSPyCQF+7Y7c1VBCJM3ZjW2Cl
	NEq56lo4pXPJCK1Yqx+B0YW9OjA7PHTD1zMIx7mxUsLPc4d5ZeozVoDP
X-Gm-Gg: ASbGncv40bhaJnm8BDmQSG6LjaDuJjfAJJRpQUtv7QUmzSlFpVypeLFzgwv4PxCGrGd
	WWR+tokPZu4iMYTlO+Upqf+F231MTsN4UKWT6yX2IqoNDykHQ9yPnRAYqsRDFTr19qjdebSTGoD
	Z93V0kU6+lb2K5C+Mcu6EfVSFlUIeLx980pTwFcsLJOZpRjqy+CptS0xFXOwkIHlCvh+bxBuPxw
	R5yRbwqn4IwPbP1+x1ZrsjLlu5bv5i5kQsanJv+W1NkEBf/DcdWnbsASDfiwynSLEL8hxUXtsma
	LAbkoYRkIpk+tw02wuJu0JH1Wy/lryW5Lark/iHbJNO0q0a1RDKWUBLQsTx5CmoC+B59yfosrNY
	VQnhQq26eYQ==
X-Google-Smtp-Source: AGHT+IHaOExDLaVeAObJbB/ZuHQIB9OYyqDeqVnJko81Jz0V+bWTynIkB7t4gq4X48FFhAk4LQls7A==
X-Received: by 2002:a05:600c:b86:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-453659c0bb9mr27538835e9.14.1750421457507;
        Fri, 20 Jun 2025 05:10:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e188:15d5:9cc6:1db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97a915sm58234645e9.7.2025.06.20.05.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:10:56 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Rename fixed regulator node names
Date: Fri, 20 Jun 2025 13:10:44 +0100
Message-ID: <20250620121045.56114-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Rename "regulator0" to "regulator-0p8v" and "regulator1" to
"regulator-3p3v" for consistency as done in the RZ/V2N EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 655a30c63ab1..01b2e0c7c7db 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -45,7 +45,7 @@ memory@240000000 {
 		reg = <0x2 0x40000000 0x2 0x00000000>;
 	};
 
-	reg_0p8v: regulator0 {
+	reg_0p8v: regulator-0p8v {
 		compatible = "regulator-fixed";
 
 		regulator-name = "fixed-0.8V";
@@ -55,7 +55,7 @@ reg_0p8v: regulator0 {
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 
 		regulator-name = "fixed-3.3V";
-- 
2.49.0


