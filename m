Return-Path: <linux-renesas-soc+bounces-23706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A85C11818
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 22:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 193BC4246E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 21:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E953532B981;
	Mon, 27 Oct 2025 21:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KoyI8nhL";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X9XlR2gx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B8232AAB3;
	Mon, 27 Oct 2025 21:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599592; cv=none; b=CAaLnF8a2TV9WUut3FW7CkPvJY77HkiAM0UitGD5M2saoVPUAp+FzViW2w7Lql7+ZxHkmOJrCBtUz7LuRCcKFbfwGJeoFC1ZKPQuOWxyBgUbf9az18cyyViF2JA1Ck9U7QtJ7teCzMYzrBVuVu3o7rzkicPqBwqv8b5O3HTqin4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599592; c=relaxed/simple;
	bh=s0NVaYXZXlJmTbflirVMQ+yffqB/139INPCT5koBX4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AAIA7qW0V/Ie7KclaqVg2NjnztxJ9NSTjfJXCPo5DG0ZdmDbM27f2nt50VrUbAHsvVZjKc28nIH3OSwpn66KmxifVtJCvd5hwL9mJuFvScg73GK3RrMgwn1H6pYJ0/bfxYwKnYz/nqUCHTDayPMmy7ZMxqjDWYjM3CGbaptlSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KoyI8nhL; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X9XlR2gx; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwR793JwLz9smr;
	Mon, 27 Oct 2025 22:13:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfs9jmHOBI4D2ryFn/N/wC0tPkQkTDK0eCurhXH2cRA=;
	b=KoyI8nhLcZjKzTsbLpqRj/IMzECGd7ZoOWJtIApZv2tBqhcp3/3u9lrmCZMmkO03q3FrmI
	1LTjr+ry7aNZkJEBsZliLK98Tl7mtgZr6gRzlsGWxpUEpUayjQ+PWdoCf7dQMkVGQuDd99
	6/s9VG1AFzJtVygXH0BiPfvABn0WOiH2TP6lqMFkPTrhuJoAqEhyGdEAbNrhJmNGdUsXZl
	T63SlT2cqhlJm/sW8bwkWYbePjMVDTXHSC8/f+UKygjpa6ofVcUnmWyWQii77d4TMChFMS
	zWS3ujTfNRoJh+nA57QdhHI0K3aAcs5DvPjiGfoTyoeSP21rFe7sLQutUKqjiw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfs9jmHOBI4D2ryFn/N/wC0tPkQkTDK0eCurhXH2cRA=;
	b=X9XlR2gxul/gdxyr4smvSR0k7O7rr5DvGcRZcd/9NJ36IB942CrCcYTk0uP9V+VhVIJ36Y
	l+E73WHaO4GXpQBnmIOjiotaG+FbA0v13GzZLMYYObi/wOXqmEkzzZZk31oRVVXcD7NfgW
	NKsVzKsmsvwIshDxQoxNdS3WSzqdTCGdIQbuEXMQQ9h6Vp4fqodSeHGgf3zY0YqS/8xPDK
	q4WhM0PilRfrTyKU4gUaroYe9NN2j+4xs2WBQQ028wN10fcZ8FtIOhzie5O5SrlVWze0LN
	UG1PIUqAbkZIaX7RlK80Y3p/BSOsaIhuwF7zxCZu4Ebk0DevfEiJ9lR1cRH/eQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: renesas: r8a77961-salvator-xs: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:21 +0100
Message-ID: <20251027211249.95826-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3mu5xmrb6e5rnq3onu33i3h9ouk8aci9
X-MBO-RS-ID: 0860381f30184d42054

Enable GPU on Salvator-X 2nd version with R-Car M3-W+.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
index c7f14177f7b95..b35de49406a01 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
@@ -40,3 +40,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.51.0


