Return-Path: <linux-renesas-soc+bounces-11480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB59F5584
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 19:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A89DF174F74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 17:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFFA1F8F10;
	Tue, 17 Dec 2024 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uGzB6Hfc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3DE1F8AE2;
	Tue, 17 Dec 2024 17:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734458035; cv=none; b=CYHiCXt6Tb0ZTf2szVn0Hy1C7mcVK11EQt5Te8m7dk3G5lFeL2f/eLgHwvsYbzsAF3zuxlCleoanhjB0UbzFLv3JGi8HofioKGeAT8uXfnRl6w8EnaHtHJyyR2RwLaznNHSZfAbuRmmvcNA0f8lfLqyJEhkszajl1tmGtUCja/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734458035; c=relaxed/simple;
	bh=ZRQdhu9Uvb5+CPkrAEN7VMpgQj5MoXeR2uIlG+nUASI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Oh9W27oG5kvlZD9kw81jyznRJM/rpFi3R+7cVGASIJQpwriC3B61Kau6gwsQjVhRDZjL2dqD5zd0GxwTKU7jM+ugA8npcexWzaRid0q5ms6SsIEn6RqRPv5vaEFzDfsHD86HLKJzZsDGYbgGvgesLBBhk8bajIb0nk3vV51jYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uGzB6Hfc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 741DC4C7;
	Tue, 17 Dec 2024 18:53:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734457994;
	bh=ZRQdhu9Uvb5+CPkrAEN7VMpgQj5MoXeR2uIlG+nUASI=;
	h=From:Subject:Date:To:Cc:From;
	b=uGzB6HfcX3Sd4249FPHrFLhYI+sgFsedjFLHs66biy22Hzm8qJuvERlzTaXrviLLc
	 AaS7yd5R9N4iVRfHX1haByBH0IXlKtLRMj4VntPjVX8JT1Irk8DkpPiLhR5ShH+EVS
	 hAiabM1B8OuBIpZjvoX03IgMTQH6xPAJ5ulGZJd0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/4] renesas: r8a779g0: Enable VSPX on R-Car V4H
Date: Tue, 17 Dec 2024 18:53:13 +0100
Message-Id: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIq6YWcC/x3MQQqAIBBA0avIrBtQKayuEi3MppxNxQgihHdPW
 r7F/y8kEqYEs3pBKHPi+2ownYIQ/XUS8t4MVtveWONQghfMfcScnoJuH/W0OW2CG6A1j9DB5f8
 ta60fWSiQHV8AAAA=
X-Change-ID: 20241217-rcar-v4h-vspx-7d809b701c75
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=ZRQdhu9Uvb5+CPkrAEN7VMpgQj5MoXeR2uIlG+nUASI=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYbqtmdz5yxWiDiiys7tyVDGNQMTpGk3gwHccA
 gyqTa5u7WyJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2G6rQAKCRByNAaPFqFW
 PDOKD/9T92wiVxvc7qq1gEGj3pmmi12t3Y0r+5b9ARXH+hBfbGi+v5c4PqN42UvHUSrmmw5fSS6
 6zuZd+RHwzMaAng5irXm4yupnm2dK4oXeO92PFSG68g0XNZzcq2/6RytVzi7jJwMthLp2xyQLq1
 LEJpTwhCQvvaQ4F6rKhsK9I/IiCDJGR19NCHomIgPN7MzHE8eIryA5OLewNCT7Q5NW8G/Qxx35b
 RTLgqcmlsWqnvoOV2VzL7ROnw+3csYbYgLvZt9fKBrHTZy4PhO8EOTKrQ3fMv8fsS3o8DwuNL2B
 9ZiPYCzi4i4aXj5+urM+qggo46xjjj+b/mbUwfsGyZLUUWaOgbyeYyQh4hNglT57SmE4kK/3DuQ
 4/iMyReVF+ePVfFmlXp4SQmi1xTiRGO4keClDn+Tjn9CuvZI3PobFdFd7m8Z6/8kO7WeEBqzQnY
 LdqmzQoyB8also5UhecIyijVcZKnyIakXnlsX7y0GxQlS6w9tNTs95iVRtM7dIj4z1nF1UKwLHK
 OjfRsQs4OomalvQ4e8ZJWSdDPx1Z+ZzTOIIZQrG9ma45hLsgy7j6fHpujfRV0hFr/g794N2QAkK
 oV8KfccyFzWGWcDjpx8NNVwoXDOoVxqD3tAy7JLy+Zb+WJyOeUqK4IcRLzYfScOM3phu5XIQ6lL
 qrnsVe0HOgyJD+w==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The series enables the two VSPX instances connected to the R-Car ISP
on Renesas R-Car V4H. Define clock identifiers based on the MSTPCR id
for the VSPX instances and defined device nodes in the V4H .dts file.

The VSPX modules interface with extenal memory through dedicated FCP
instances named FCPVX. Before defining VSPDX, define and enable the
FXPVX instances as well.

Compile-tested only series.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Jacopo Mondi (4):
      clk: renesas: r8a779g0: Add FCPVX clocks
      arm64: dts: renesas: r8a779g0: Add FCPVX instances
      clk: renesas: r8a779g0: Add VSPX clocks
      arm64: dts: renesas: r8a779g0: Add VSPX instances

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 40 +++++++++++++++++++++++++++++++
 drivers/clk/renesas/r8a779g0-cpg-mssr.c   |  4 ++++
 2 files changed, 44 insertions(+)
---
base-commit: 50d451b19cc58cf374160e30cbf72a5ed5b1b129
change-id: 20241217-rcar-v4h-vspx-7d809b701c75

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


