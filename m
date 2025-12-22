Return-Path: <linux-renesas-soc+bounces-26017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7299CCD6B1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 17:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48735300BD85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 16:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB3D3321CE;
	Mon, 22 Dec 2025 16:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdTSbghG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3CC2FFDF8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421770; cv=none; b=MLsfjbvT2Eki2wyjsjnanYuYU5zTsR2NmF41lJ9qJrflCSKPpxZNgQpIfGIGWT6VyU5ygNs4sqBD6B91FrC2SId2XdyivaikgQmxtuALMjjHyqEFGalmpj1VLAsn3cdLAY60zcPv6dpKd+UJA7DCAgSTrRHILmi1lnR7Gqseujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421770; c=relaxed/simple;
	bh=57rFTCtfuJw9ju02SPF9jGH7Xl4r8Jffz7gQR0qoPk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0wd/6StYrhkdpKmadjqfNS6cJildIeMrhIR8xFMYvL/xl5wY9uhgbGvE1oEDhTnY51KuaYsJJS/TuBSffAcmori7fI6VRjw15MNylJg+Ai4xtPiXuXzVjwhvxaQMlZhSuIJN0gAqL1SfVbWUMeSoLd/ykH1CgN2AbQavpNemjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdTSbghG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso14637855e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421767; x=1767026567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWU9b4cl+bTjkGu9CzorOVlOPzGS8LMiKF7bvNbgohM=;
        b=SdTSbghGzusqGOOuRHt6IDRjRmdcilGhlqQ5wzcPF1F/gIFS1qa0I/8lv9hN97LOof
         veOCoyl9h5BMI5YXJfK7ZyaZ9TVccYnbiuJvbQy1gnpgMCtGBPDk9bhKYJTeIvKUvLKD
         PlM4MKihFouKfADt/2iNwwzmQu8xUyToqXBmZPl99hxDGX4w9ls+ZYJEBBnWkxOu9K1n
         dr4fHYm4F41ca19feKFBEdH2v1o8XOV6L9rLsgGh/mE/OZZ2vS2Ee3G+SURD1WsU+51U
         DU/JGu456pVAZmEpR8GLQnjqT03xWYoAMY06ayppKyD7zupTfMGCii5Y1S4ySfMsTG72
         hvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421767; x=1767026567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWU9b4cl+bTjkGu9CzorOVlOPzGS8LMiKF7bvNbgohM=;
        b=fgO3FbG+OQNGkv4eJtQfDqau5a0yztfydm1ohhTNOgKkALOirBAjlxtZuIavQ30lRe
         /F1DMNGSeToH29VHqqw6py4OjryUlHVL9gAyUXMI+h0HueA06yrXYi8SiFSScFL3WVxE
         5Ncs09PVfCIcFH0XVT+zw/uPdpcKHwtP+FudNA4lqTAqVptR+/VFrYUlGYfy/hpiAbUP
         rYxKq+dHO9bunzCTHhKWiHQ942bpJL+DHijNohLelj8iba/uV5JFDVt3LpRBepl50LL9
         Lhs7dgS7C1U6/SMVeLX8tV3AsIxawsHfFVpRdRRi7cBVnjVfDrKrj9cEgy1tuF68n6Bn
         YApQ==
X-Gm-Message-State: AOJu0YwdMWDgZXmI4Ny16I8gojS/1ujkXQxmVxyqs7EV7Wzi1knQnhcN
	hkhW7IEVmO13T/+u56JXz1hKAQuRrn2cL0ZFoNCI/dCYyT/bqjl5Au4L
X-Gm-Gg: AY/fxX4UFIme7QWRdkUXWROhNuAXd04led8Y/IhMf6/vxEbZbpivSKsZxUTipMER4mU
	vQqRUqPlHEJSMQSoaRDA0JCRzmxiwgEQ7S82u0Uai31J6fgylq1D0ymusiNY06O2+ksvcc4RRqw
	nI7bcXvMisG+kz1VLcDyzwdWAawE/F+/vVcrV7wADeI9HSJMTjcOWd0LJecRLkfYZH9NQcewGQv
	cQ3RBZdp+biZxt1J96adDwcrT3K2+aKQAgzg4efmxt4zuacd4o3ze4PYlnSL5qqWLxHtPw2pX/i
	O+MsspcNYaOdWWEkrB/q/NQ6R+EIU/P0E8jP/BnkUEYeHo79pVv6RRhjx2tY+2ZfTgCOTBiMMs1
	/+YCR15Uc339b2pEbqiISHnEycH+/OrFEUw3KCMrPJQ1ye4/6oow29hSMyjVJmA2Q98MsRFcaQr
	sXyU+8HW3snR5O0OiMInZ2ln7/RNGzgm0Ycg6QvhR9PwT/Sld+o+lzbjA65+DjDiH1x7jl2SUvb
	vWrtrsDLn7k+zA35WAhECLbKoXx1Tw8qw==
X-Google-Smtp-Source: AGHT+IGFozSbWtCCoVRmM8bBkRMivIGGsGz8g5O1cbgIz1vQhukJ5y6oS6qp8J9Cnou9xPLo174mHg==
X-Received: by 2002:a05:600c:1550:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47d1958af3dmr114176215e9.24.1766421766688;
        Mon, 22 Dec 2025 08:42:46 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:4dd:df38:7864:a996])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193621c8sm196896685e9.7.2025.12.22.08.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:42:46 -0800 (PST)
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
Subject: [PATCH 0/2] Add RSCI nodes to RZ/V2N and RZ/V2H(P) SoC DTSIs
Date: Mon, 22 Dec 2025 16:42:36 +0000
Message-ID: <20251222164238.156985-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds RSCI nodes to RZ/V2N ("R9A09G056") and RZ/V2H(P)
("R9A09G057") SoC DTSIs. Each SoC has ten RSCI channels. RSCI0 can be
tested on the RZ/V2N and RZ/V2H(P) EVK boards on CN3 PMOD connector.

P52 -> SCI0_CTS
P50 -> SCI0_TXD
P51 -> SCI0_RXD
P53 -> SCI0_RTS

Note, binding patch has been sent separately for review [0].
https://lore.kernel.org/all/20251222162909.155279-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g056: Add RSCI nodes
  arm64: dts: renesas: r9a09g057: Add RSCI nodes

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 220 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 220 +++++++++++++++++++++
 2 files changed, 440 insertions(+)

-- 
2.52.0


