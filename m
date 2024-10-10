Return-Path: <linux-renesas-soc+bounces-9654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29615998865
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 15:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4EEA1F22D9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 13:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3211CB32F;
	Thu, 10 Oct 2024 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOUwmI50"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18861C9EAB;
	Thu, 10 Oct 2024 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568426; cv=none; b=LqpqRV74fpu8gLsbofzVXq+V+f8Gk6fqNo4YkA+dD+18/0xs8IYv9yqepB2AzrAbDTgS/EfLpOqFGN24Fm9GEJ3q0EwKbqDUvPoAb/lxcXiTwHlf3V+2O7oPdgPVE1pxFZtV6uE+Mussx/sCD7v3FbRiQvfH02wqjsnwXiD2+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568426; c=relaxed/simple;
	bh=T/5t8hBCN+kbP1xmX6TflOLUQWr+6ksElkcEkj2PULE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ATG5dl/6EGuh1oA+BUhqqa+a6/JNlQsFZcDuJ5J3912G8L37/HTcgfDxtI4Y26AsCM7ypvPy0oyxFO0EpLaMYEpsywxQjs1YMiNDCn+bVCaNG213w3F9slqTbwqT0lAJkg7bvqhgXHbMGwE6H5gpWZqlM9u58NQa2XcMinblOE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOUwmI50; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-430558cddbeso6280845e9.1;
        Thu, 10 Oct 2024 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728568423; x=1729173223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dyVEAPwiztGCdAVpy5ynGsWwnXvN7fGIDxTQOw77Xg4=;
        b=KOUwmI50/YeATqKboziDridbFrown9XnVcj8akYXD+DkN1u/7fpy0JfHNG2T0XQ9rK
         +vFaJR9+/YIouwlMYP3IFHPQPKsj8v5cqJJnyvWcuA4Ugr+KmE+5so0dFRVkXyaNsHSb
         FjxWVsdIvKlNe12sgk0qjRKrKnCVKabCGcHWMu5x4a4YPmLEC0/Py6wdneAy+uw9bQf6
         sq6B3mlB7gQq6apn/lDOTFpPf8d4VDUosy/HudeVr+T4j5Zn80k8HIfaEwTjzisecTRf
         9qJe6MH9/RJ8XspEBn2U9IxiGRgnLOxhIlWBfLpVl4q5DiQAKXK95ilW+iK7k6oowDyv
         6j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568423; x=1729173223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyVEAPwiztGCdAVpy5ynGsWwnXvN7fGIDxTQOw77Xg4=;
        b=L8zBiIq2uhKjmsUdQZxAhbBVh00PXHZjyRxLIr4VmL6IsQqCr6L+UHmxT46rb8MSEr
         +s4/Vgkm3kWiXd3s0VSxGLqOAAneRjg4+LXYMp2Fil8RRupa0WDNKJMaVKx6OwfqG7Ta
         TBVNDy7ERW7y2wo3Ab1docncZrC2JHEvesx00Sx+/vX5BugFJp0v3PnxVxActzmQH/x/
         6sEjG59OgSK3Hkx9lJXabi8nkv3wvNfAkGsPx+IxVycqciz7XABI9XNFM+i6BjkSPzMs
         gTx6p4Lz5w+74wMb0r0XfLj7pluMxl7GQtM4sF1KVof0oT+EXms69JWYYyNJ5rZ74C6m
         mInA==
X-Forwarded-Encrypted: i=1; AJvYcCUobzhedjjOy7CjlfCagGd5bIA7Yg4YXTFd+Gh1b9vIBWjZ+FEUXOwz8Wm51a8K7ZxPSCRlKS1FFUE9DIvfpOgI3Vs=@vger.kernel.org, AJvYcCW5SOwgX/OGEPCfJHl3Q1SXRZmcwy/RjwbHGZ7yNkcepHXYTAnWQGleG2YDMOtXoohWv5+oB4RlpfjzsNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg9h0zPFL5/ylZwoIBd+rJFDSdfaMJWZDcAqp4uR6tLuA2Zlbn
	Sp6Lp1laxKhikz4d47UPktPTiM6AdjGWzaDrje0SHC0SBx4CTNcZ
X-Google-Smtp-Source: AGHT+IEkVSPBLL7SPvwfYIpvWsZzDeDp7OuQWsS3OCdaYdP+PX1OOb+a+xHp+7xn4Ba50HR2zlRG3w==
X-Received: by 2002:a05:600c:4710:b0:42c:ae1d:ea4b with SMTP id 5b1f17b1804b1-43115ae99bemr28298215e9.13.1728568423004;
        Thu, 10 Oct 2024 06:53:43 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ffc51sm17193825e9.15.2024.10.10.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:53:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: hihope: Drop #sound-dai-cells
Date: Thu, 10 Oct 2024 14:53:31 +0100
Message-ID: <20241010135332.710648-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

`#sound-dai-cells` is required if board is using "simple-card", and on
the hihope board we are using "audio-graph" thus remove the unneeded
`#sound-dai-cells`.

Commit 9e72606cd2db ("arm64: dts: renesas: #sound-dai-cells is used when
simple-card") updated the comment regarding usage of `#sound-dai-cells`
in SoC DTSI but missed to remove the `#sound-dai-cells` from board DTS
files.

Fixes: 9e72606cd2db ("arm64: dts: renesas: #sound-dai-cells is used when simple-card")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi | 3 ---
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
index 8e2db1d6ca81..25c55b32aafe 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
@@ -69,9 +69,6 @@ &rcar_sound {
 
 	status = "okay";
 
-	/* Single DAI */
-	#sound-dai-cells = <0>;
-
 	rsnd_port: port {
 		rsnd_endpoint: endpoint {
 			remote-endpoint = <&dw_hdmi0_snd_in>;
diff --git a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
index 66f3affe0469..deb69c272775 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
@@ -84,9 +84,6 @@ &rcar_sound {
 	pinctrl-names = "default";
 	status = "okay";
 
-	/* Single DAI */
-	#sound-dai-cells = <0>;
-
 	/* audio_clkout0/1/2/3 */
 	#clock-cells = <1>;
 	clock-frequency = <12288000 11289600>;
-- 
2.43.0


