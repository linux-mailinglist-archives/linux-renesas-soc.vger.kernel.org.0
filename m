Return-Path: <linux-renesas-soc+bounces-22884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD1DBCC9C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 12:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A48433C6E0A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7642C3769;
	Fri, 10 Oct 2025 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JX6E7Xws"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690E2868A7;
	Fri, 10 Oct 2025 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760093519; cv=none; b=CdsHOS9CyBTN4VEunVTI4P+VfLfqO7hC+aRfdf6Dd0H0QgRVv5UpcdTNGvnY8sO/GF9k4Lk9MP40ykNdt5sEORsF/7jneo8Hz1j2i6cfXlI9I2685y+8NtT3Zcok4VmiBJkoYFHEANLJqdORKLn3tSJlt431tG2iLlYSZoyDcWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760093519; c=relaxed/simple;
	bh=rNeq8WME61dmM/tDYIyIvFPvfRtv3Dy8OkeIfCMfirI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWUdZDodkkndpB5VjKdfbmexocSsyCubtrmamRno+VSKSgzLrgB1aBiWndGyLEZP7EncN1Hv+RCYXXGnX7iPVUl+TRWKyZ2L/lyzFSrAZYdyltQD9kUkt/l7cA27YM1Ml3RUZFAz8PQySOvBx0oF43mdhcF1r0HxwqgIagIO/1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JX6E7Xws; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFBA45B3;
	Fri, 10 Oct 2025 12:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760093418;
	bh=rNeq8WME61dmM/tDYIyIvFPvfRtv3Dy8OkeIfCMfirI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JX6E7XwsXNG1pSIHPxkW8Of0jkSJGJGDtzuHLw2ZInF8byBHlErNAzjNvs1R0bz4T
	 RwEZbQSyNl5T1XhizETnLmTqV29a/AsYScRca++vA1kMPDIEznidd+76JwOAshnBvD
	 aobNkXECw2POd6X2fwOzcV31oYUAJuIkVq7Yf7jI=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 10 Oct 2025 11:51:31 +0100
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g057h48-kakip: Add ISP and
 IVC nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-kakip_dts-v1-2-64f798ad43c9@ideasonboard.com>
References: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com>
In-Reply-To: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=783;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=rNeq8WME61dmM/tDYIyIvFPvfRtv3Dy8OkeIfCMfirI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo6OVHF9CLa+PoDiK8eJ1DH+nXnHlHUJqcNicD7
 M6g7EZrYFGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaOjlRwAKCRDISVd6bEV1
 MtRuEACum3500SSuh5MTTG9WZxN/InIpXbRlL3FED8Pbo7ymB60po4XHXZm+9uK/wwXCUsr5DHX
 4s1FZ5d5eLEn1tXRqWlwWkUl8HJlO4mE0ZS7uqUhk/BZ1D3rgxjWJBNlvNRIJ1AE2tFLCtJljSt
 Gd8b2WwLVGuLrC7RWA9rkzobk5866K3WnanIihIdSKCcNICqJaaWhjr3yDcbEjoPwsha/+y4ctL
 5ppudGWGSfCQyHqmeB9NZ/WwtNpMQOWyX+NH+84ny6GmBQpgGlnx9JJwpeCjSytlWJSZrgznNL0
 GGw47B1nvobTe8yJSCnJ6JaGjDH1DG4fTrRWU9vZyH7x2Z1nQkl39hBCuidKsBCevsf6cEdcU1Z
 bZqOebCaxBNKiZIhrkLlE+MfIpI5UsZa/4jSNDPflQ0fxbH4gtvFNb+KXbAyQgRXf4OAz3Z+dMy
 Rpa+jI+kyX7DPsqOivhFfI2p1BZhG4oQq+xWCImHBvOA7KN2Yg3cvdWLrmyb4syM91PaN42bITp
 tHcQll1wUzdy3UJMunTrwZ2Iao9y5p23KLhrtvxj9SvRYc9sVdoCexfVqpmKNlg7fuCYDePz6WZ
 rMaOnGLDu66vpuAwiPK0CF2TRgvSJi4LATYck9dDfUHHIl0SbYhnAxdRLC0lCE5ht2GwTyCmBnM
 t7VrFS8zQpgd9cQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add nodes to devicetree enabling the ISP and IVC that are found on
the RZ/V2H(P) SoC.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
index adf3ab8aef2b559f0b26e7f299d3b31e68d911a5..88a1beb731f57870a7d09cdbff1b58373f7119f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -50,6 +50,14 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
 	};
 };
 
+&ivc {
+	status = "okay";
+};
+
+&isp {
+	status = "okay";
+};
+
 &ostm0 {
 	status = "okay";
 };

-- 
2.43.0


