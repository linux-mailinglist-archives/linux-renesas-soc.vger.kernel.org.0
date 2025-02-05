Return-Path: <linux-renesas-soc+bounces-12858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CBCA28819
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 11:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 444E1162480
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 10:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D24D2288EA;
	Wed,  5 Feb 2025 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HQAr9Qjo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q3hcEMFq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13AE218E81;
	Wed,  5 Feb 2025 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751636; cv=none; b=MpSXek7fl3qH2Pw4w0/eAU+WiPCzNM9AQLjtPl7fQtmBkutWD5a3/tLwWzL6MoVOl5BXaxmKHOivVdZmFwPW49mJ7VIWeEnkh+IBrrtIaS0Smig9K1aIAQbr6WpvYNXaC1bZ6DwjwzZ4TSGatWhTJsW6iC8baYSLNM3MNGKysks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751636; c=relaxed/simple;
	bh=tPkxo0yR3d0KRr4Ehux3plxd7axyga9uLbv5sixVAPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PD5GjnVxPNMk/NomDSITEf0mWm6JLbk/F2QI5SxlhVIUqmQuTpWLsXIIgrLkioFBNnnjdk8+3J2/FUqXAhCJipPEUXij7eq7eYuePVcpJmz5Kx1zVJSk9ojVmWjZ0CFcHYuZFjP8y1fYEj4NjAUqws5m11kla4jwPBW9tpzWknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HQAr9Qjo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q3hcEMFq; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6A45225401A2;
	Wed,  5 Feb 2025 05:33:52 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 05 Feb 2025 05:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1738751632; x=1738838032; bh=tY
	pJvu2GfM0OxYilRWI7namuvojUEnJPjKMYlF3gWwY=; b=HQAr9QjoXzW0+MbSsM
	nuBfKC7/24VgqiS1C5g7NDobE/D6sLPGxsu70ApC+UK5kAmh2ZYDuYtPVsDOXLhS
	0tJqZKJ/WrgVN94xK+oiWpRuTHGUU+SxsH4ZBNNGrH9VFa7p0JeoNPPQw43T9o77
	G5Ehb67V49mQkr7ewONWfJSo19hnxtWN5sHAqAirFMUAfT5tQFsQZacXfx9bEBqL
	n9Dwg93b0mGRBp9Xcuc+KNx+rbPFrFhMHM6ab5jVoMcQ9sv0dIAz8k/wQzvHSvbJ
	UHdUFhZKmZl2uWklPSzXoNAGbnMM7CIQfqW8kski8l/m/gD4KJO9Yy4bvcXe4QsV
	jIUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1738751632; x=1738838032; bh=tYpJvu2GfM0OxYilRWI7namuvojU
	EnJPjKMYlF3gWwY=; b=q3hcEMFqZSqrVDit6Rkv9dyMcfDV+usaILjrS2HlcXvE
	/Tp8TI0pEMdi244K6HruscfixHuoCO/MkHDbenR648WOGpqhwyUSah483PKC8wbU
	Rek5aWw2xeLCCfW5vXy8rvjbZ3uEo61vH/sGLabPT4f0X5aWUIxVxFPwc/u58flr
	T+M5DKFWBQ+VUeYjFm1d0QNge5BSPD6So5ZrUDLlXYIoySTp1AWd026NhRYjjVkl
	WIrYpaHQc6LZnPfcW+DfC+eWjKJYNZju3DDe7iY9xIrga+oEeYrjGmALgsU+6gTk
	teg9m07Wa5AKBEPIgbbLlnF8IPj6Nl4XC8xi3UOikg==
X-ME-Sender: <xms:jz6jZ6GHRokM4TW7oBuX4VGCKHy-6QBVNaHlf-sWUgZ2cD8kFmuumA>
    <xme:jz6jZ7WBRL8pd1vNnChDC2NNQA4rJT9gO3nExCJRoTzAxYMwRgWc2myZNGbRferpy
    8qRVWjFznTz8511mFk>
X-ME-Received: <xmr:jz6jZ0Iw8HwpvGRdXlYlnM4pai5ng7WM3m8FiLmRGBHVg-gm6njxoqButCGq2xrm7ihzXnCM3jGZ5sgbE12-Vo0xcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgv
    shgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    tghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvg
    hnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggv
    vhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikh
    hlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:jz6jZ0FEW_tsqDH869OJmZPs-Iaw4lk8dJMBkqyZACIWefz4jvLWUQ>
    <xmx:jz6jZwU6XovRwNGuHIpj3bYyX9KpIcR02I4AaltIGzLfjLhS-sE6MQ>
    <xmx:jz6jZ3POwVJzrMIxKdEjBPasfHUsLOPE4zZFjp9N56ZfFEr0WTG4UA>
    <xmx:jz6jZ33KodppEJ8yuPgnmceCt9WaONvsn8dYaaU6YfLxi3s2JQPLbQ>
    <xmx:kD6jZzHj1bH_KnCk2Q8UnbGCtZ96sQKjj6QvWIVhKL8F_TmMoG1alUdI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Feb 2025 05:33:51 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: white-hawk-csi-dsi: Use names for CSI-2 data line orders
Date: Wed,  5 Feb 2025 11:33:11 +0100
Message-ID: <20250205103311.668768-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The defines names for the line-orders are now available in
video-interfaces.h, switch to them instead of using their numerical
values.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
index 9017c4475a7c..a5d1c1008e7e 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
@@ -21,7 +21,9 @@ csi40_in: endpoint {
 				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
 				clock-lanes = <0>;
 				data-lanes = <1 2 3>;
-				line-orders = <0 3 0>;
+				line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
 				remote-endpoint = <&max96712_out0>;
 			};
 		};
@@ -42,7 +44,9 @@ csi41_in: endpoint {
 				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
 				clock-lanes = <0>;
 				data-lanes = <1 2 3>;
-				line-orders = <0 3 0>;
+				line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
 				remote-endpoint = <&max96712_out1>;
 			};
 		};
-- 
2.48.1


