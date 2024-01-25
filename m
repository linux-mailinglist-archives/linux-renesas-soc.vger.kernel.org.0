Return-Path: <linux-renesas-soc+bounces-1834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF283C704
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 16:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6772295F7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFE47763E;
	Thu, 25 Jan 2024 15:35:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5780768FB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196910; cv=none; b=sTVSjIEc/rfu7BUYHKD7qfJPYtYtnXg+jAvNXA4Yfp8z3Lv/hQkFH01d9IYTfv4NeHdra96tlqJ2ZUlDmC4Ib4bKECD72SDRPrbXOBBfQ92tpcpgkXjUCyC5GtWW+Z3eES89RDN7CLX3iXeN1Asejzs34z5J3IbTRDUVv7WHKc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196910; c=relaxed/simple;
	bh=wist1hiGvney+TcrXCi9sZgqzVMjXqsTMas7kGzqF0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WWDnifeNl1uxftItZSRwVoLzTGXHnN4MYGkoUY6Ece9VuwtoioFSZDUxjHiNUiV4lZmw/UWY9Slwditl+0mxMUEh+h3i/QGIn+k1Ld1PK8CqyzXrUtY2qkBvEdDpZvTvABZB/LnKgtGM/xfLgmPY+xSUSzN2ZCDxWgUw8YAxIAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4TLPyq6RMMz4x1rL
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 16:34:59 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by albert.telenet-ops.be with bizsmtp
	id f3am2B00558agq2063am9P; Thu, 25 Jan 2024 16:34:59 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1jn-00GUvU-UW;
	Thu, 25 Jan 2024 16:34:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1kb-00Fs2K-TG;
	Thu, 25 Jan 2024 16:34:45 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Cong Dang <cong.dang.xn@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 01/15] dt-bindings: clock: renesas,cpg-mssr: Document R-Car V4M support
Date: Thu, 25 Jan 2024 16:34:29 +0100
Message-Id: <eb3cd02b62f3ca834df079a3f1e551d9414fe42a.1706194617.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706194617.git.geert+renesas@glider.be>
References: <cover.1706194617.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document support for the Clock Pulse Generator (CPG) and Module Standby
Software Reset (MSSR) module on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
  - Add Acked-by, Reviewed-by.
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 9c3dc6c4fa94218c..084259d30232aa68 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -50,6 +50,7 @@ properties:
       - renesas,r8a779a0-cpg-mssr # R-Car V3U
       - renesas,r8a779f0-cpg-mssr # R-Car S4-8
       - renesas,r8a779g0-cpg-mssr # R-Car V4H
+      - renesas,r8a779h0-cpg-mssr # R-Car V4M
 
   reg:
     maxItems: 1
-- 
2.34.1


