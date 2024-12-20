Return-Path: <linux-renesas-soc+bounces-11613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D849F8EB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81BA41638A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C7A1B043C;
	Fri, 20 Dec 2024 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bKh+1lLQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680751ACE12;
	Fri, 20 Dec 2024 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686108; cv=none; b=lvhn/XY2izlld6dJBpwoZ4U679hoSNvau0ke+yasX0LRmudsQT6YpNd9rgXPgMdndUPfNyFAVKl53Eu1AgUSEwDy2B8EscBLMjlVsPsQ8PnKvgafEQ3W7ATSmos+XWlbgEXPBY5Uk1oIkTuX5gNsc5MTXsZMpNhPoi+XcUmaQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686108; c=relaxed/simple;
	bh=UZTkBLGGvcrsHluZDwLt6YQboZYu8ick8beUtCNpE64=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RxxU2SPE85vD+07dmGCHAUvZFek50wB2vnzYlnlmT4gdnxtnZEeUNw2+ISAUZ1UngxqecHSxLOxmr5FT3bow3fVu2unJuB5tzrFDUV9vs1V+7me23+rhJZsm4KN0jkmWHGqx9j79niDQFHRa+9XJLaS694qBNkXM94O2o+3obog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bKh+1lLQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.105] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3764EABE;
	Fri, 20 Dec 2024 10:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734686063;
	bh=UZTkBLGGvcrsHluZDwLt6YQboZYu8ick8beUtCNpE64=;
	h=From:Subject:Date:To:Cc:From;
	b=bKh+1lLQWtjUgSKNuX6ecIT+5/pwNDAcDReOQ34RZwGMn8/Uwz5HkAYcKNqmKm401
	 5lDWAVzNu8/jaW56DS1jNP99I+sRdURD8H5vgBCMR01gxhx39QR02lM3pOyBwHJROD
	 TTBQ0jAyROqNZexcQ/oQS9ocYPfcfyXTfD6w/5lQ=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v4 0/4] renesas: r8a779g0: Enable VSPX on R-Car V4H
Date: Fri, 20 Dec 2024 10:14:37 +0100
Message-Id: <20241220-rcar-v4h-vspx-v4-0-7dc1812585ad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH01ZWcC/3XMsQ6DIBSF4VdpmEsDSAE79T2aDsi9VoaKgYbYG
 N+96GRMHf+TnG8iCaPHRG6niUTMPvnQl5DnE3Gd7V9IPZQmggnJBdc0Ohtplh3NaRipBsPqRjP
 u9JWUzxCx9ePqPZ6lO58+IX5XPvNlPZIyp4wCMomWSYkg7x7QptA3wUa4uPAmC5jFFjF7RBTEK
 V0pqaFWyA+QaovUe6QqiGnRgLBtI5T5g8zz/ANQDe//OwEAAA==
X-Change-ID: 20241217-rcar-v4h-vspx-7d809b701c75
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=UZTkBLGGvcrsHluZDwLt6YQboZYu8ick8beUtCNpE64=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZTWVv6s3rwOM+zZp5Jm1FNqzz0NocAmWEgds/
 oFZkL9OiaiJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2U1lQAKCRByNAaPFqFW
 PPMnD/9LmfyHMR5nX/oydO2KOC5X3BF3q79i8AvCsgD0+U9YsaL4eHiB6bH6KmbZfjjyD6uw3TJ
 yd/AInMU7p6MeXKJbVmZqOhFuHnPRpHpLE4GSoD7mmkDu1xGv1MQTtlh8o/6L8AYXCxiG8sx8BD
 mldNOt/rmSmtx7+DkEZ+b5q0eSuecqCXVlyrJkIexGMCq56MLMpIacS/6FJTGOBjI6mi3ALGR5m
 8JuPSJgfiqW+ESk/f/CrmZ4KLHPOW87vZLIC0Z6pF+Iv74jOhODtdMjeX/zIWGR4C5A83xS8yRj
 goWHm54RV9A9KECoZ4dnH48r+8/lhxBhqVdJAflSmQ5Uy1cPQtJVRtM/8mzwT6XVj7el1JvxuZo
 /Id1LprmpN0KOLBVyH9SdB6uOvhGtitjebvLsEdrqUIVfju8GRqkq6mHwojO6DsSlBXSmbzLiZ3
 trEfo7WMRL2uuIZwdvJSMiFjtSjNsogNXBAg/lb/QJ8KY+q6Hl6ShAMxOa1Dm6+rMIqpbl4rBVd
 hyx4B6dhuPgiv3u5K02YsXqSTd17JxcIcFgS/ZkSJCQoaU95Mg0I0KbRMoPpue15XIXzXhPy5as
 v+nFh/vC4AdV405xEbgM395hlQd7EtTe322zUZ5ryLuZEtzhPiQmLHkkPM0mK8b9Z1hUh2fKD6U
 986SRmQkV6JGVBA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The series enables the two VSPX instances connected to the R-Car ISP
on Renesas R-Car V4H. Define clock identifiers based on the MSTPCR id
for the VSPX instances and defined device nodes in the V4H .dts file.

The VSPX modules interface with extenal memory through dedicated FCP
instances named FCPVX. Before defining VSPDX, define and enable the
FXPVX instances as well.

Testd on V4H White-Hawk by reading the FCPVX and VSPX version registers
during system boot.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes in v4:
- Changed the patch authorship to my +renesas address
- Link to v3: https://lore.kernel.org/r/20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com

Changes in v3:
- Test on an actual board and fix the VSPX and FCPVX power domains to
  use the ISP power domains
- Re-parent the VSPX and FCPVX clocks to the 800MHz S0D1
- Link to v2: https://lore.kernel.org/r/20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com

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
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


