Return-Path: <linux-renesas-soc+bounces-11519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3DA9F60F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 10:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5C61886D5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C31D195980;
	Wed, 18 Dec 2024 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fWcofTcU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD1F17625C;
	Wed, 18 Dec 2024 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512761; cv=none; b=hk/toU3Oy/iWvfEp7TvvXx7H1wpq+ceNspj73GxTDwt/LHh/i5mNhhLSzBL/O7wBJa5lD/tQVNHVKZoDu0HCQpy71zAVvCRqLxPvz7Manq0rLC+y6AuOvtLhv2rxw2E00sAyPZGAradvDmh9xWn1vY/qp9LfNNehQECJrecODa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512761; c=relaxed/simple;
	bh=Ahhl6VWrWzSj9R4IM/NC8NU3E/qqKDUV0yr78Z+8qWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dZ+9gvTAGz+n2f/Rhyy+n9tlAoopVvAGB5wuHkePb+F/4u89ZL73/fuB6Hax24RYscsEAnPITXs1aMqL9+ceSTRnWfHUDDLBmSGlEJHEaWFvoqbKJdEBMaMXurZH2p7ucY19vsfrDV3Q2MhVkiwE6faJWBMW285qbxttcm9DIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fWcofTcU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12821735;
	Wed, 18 Dec 2024 10:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734512719;
	bh=Ahhl6VWrWzSj9R4IM/NC8NU3E/qqKDUV0yr78Z+8qWA=;
	h=From:Subject:Date:To:Cc:From;
	b=fWcofTcUoRZnQDNyxm0ESTBDthMsI0mW2RbNNjzA3fIBBjfzd/BWbvVV+qzcUuUzI
	 QOB6ZaNjBcku+6tkpP969qAsRAUZCbyE/NdDqrScx4LMty3+FNRgpoVua3fDb7t264
	 XZyWeQYDNp+yO+CGJRqoGQiIvVAwK0qQSIweMMRA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 0/4] renesas: r8a779g0: Enable VSPX on R-Car V4H
Date: Wed, 18 Dec 2024 10:05:33 +0100
Message-Id: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2QYmcC/3XMQQ7CIBCF4as0s3YMEAzqynuYLiiMMgtLMxhS0
 3B3sXuX/0vet0EhYSpwHTYQqlw4zz3MYYCQ/Pwk5NgbjDJWG+1QghesNmEty4ountVlckoHd4L
 +WYQevO7efeyduLyzfHa+6t/6T6oaFUZSlryylqK9cSRf8jxlL/EY8gvG1toXhzqgz7EAAAA=
X-Change-ID: 20241217-rcar-v4h-vspx-7d809b701c75
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Ahhl6VWrWzSj9R4IM/NC8NU3E/qqKDUV0yr78Z+8qWA=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYpBzPOMlPJMRhuKabTSu50e9NI5Erw7hJksAA
 kfEj+7y5LuJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2KQcwAKCRByNAaPFqFW
 POC5D/wODHrUfhN8UUpJ0pApxsWNjkZQ9Hj9ijAEFfotF9DzLnY9U/tFPsowzIg6q18+7VeXsfJ
 qyqjpxOiUiKlpojJ6IKf3FIQ8yUk9LhB0jrGEGMnBhSLbXS7+mNN5lbDSMw7yVJghEaydzwORY8
 NdoLu6N1TAFrq7ZvidY/6aPqFXHw5kBrz+McioNI+nqMeyfCNKgOzWnSIFB4R1Eew9l4NabjCmd
 GIY+rgKqIfmCinJALqjkKjEFFoTpjS3NkISh9CNk93pVYD9k8WPwi7IA/ghPv6fXxWSXdanHV76
 JlrOVpqRCBIdky8YPUIit77E4pp81BfUDw69DHpiX/KK8JoGRfv6QyBPz1QR3jkZVfrMiAYNIA5
 K4H6X5PQkvPa1V7ZtjpRxoBlWadkckAfMHBT/NGXN/SN70VUA7mhY2DBF+a1ZkGaUd/zZyG4tWm
 QGNOI1MAB7+mNZNpu7wu3zz92MJuuNG0lcPdLOjvIKN1HrV0ErbCtRgLpiRxjEqcx7V2H2DMqjP
 rsoljZ6B0fkEs1cRns2anN47CvfRtm6E5QVvBdVETs9A9LlGhVvYlN/tGrn6HXQaorppcA00Bq8
 J+ivm7AmC1bgZ4QLyfV/7VggZIUb2BIfNniJVvVTHh5PCL/looXUplS6XnCEpwu0hphSQV2MoeS
 OU7f9izTpyE4R5w==
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
Changes in v2:
- Collect tags
- Re-sort nodes by unit address
- Link to v1: https://lore.kernel.org/r/20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com

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


