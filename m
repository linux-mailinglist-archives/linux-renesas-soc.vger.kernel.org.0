Return-Path: <linux-renesas-soc+bounces-2754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB28549DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B50F6285843
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCF052F75;
	Wed, 14 Feb 2024 13:00:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1B052F6E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707915612; cv=none; b=azi4npaHZBNkZlvF0ua5pg7O4OwoSrVXevSzfxLJdnuSyR0jmNokExjbqdDyeQBs+677suT1secVwl+9wTkigupgS3Pg5B4DFjhvgQRlcfFteEieRe+mx0j5AKSqGQelEzPWC9Y5oK9hrqV/VFElETTQQcNY50tRL1lzr7tKCu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707915612; c=relaxed/simple;
	bh=MX9wy0cQjMkxldJr9nwe1wJabPI0qxGXaDS7doiphr0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=btXJUC9V61yZAC/qYc7ddar+EOqa7p6Csk19k0edPiPokJnNM1VG07yof5OKm9nHmhnHEZKr4zlHQAkHwrs+P+D/Wt+2X5dF65TaWtxheSlmMzsq9zcMvXyQ6HldrlAcN2Fqp2wDKtucIysYJqdjtGVpsrHYNCLA/6g7TLH4vns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
	by albert.telenet-ops.be with bizsmtp
	id n1012B00B0LVNSS06101bK; Wed, 14 Feb 2024 14:00:01 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raEri-000d4N-AL;
	Wed, 14 Feb 2024 14:00:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raEro-00GpW3-UL;
	Wed, 14 Feb 2024 14:00:00 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car V4M support
Date: Wed, 14 Feb 2024 13:59:57 +0100
Message-Id: <fffc5a0a73c4cc8e8d7c5d93679531cc24e006ca.1707915511.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the SD Card/MMC Interface in the Renesas R-Car V4M
(R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index f7a4c6bc70f6cade..29f2400247ebc674 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -67,6 +67,7 @@ properties:
               - renesas,sdhi-r8a779a0  # R-Car V3U
               - renesas,sdhi-r8a779f0  # R-Car S4-8
               - renesas,sdhi-r8a779g0  # R-Car V4H
+              - renesas,sdhi-r8a779h0  # R-Car V4M
           - const: renesas,rcar-gen4-sdhi # R-Car Gen4
 
   reg:
-- 
2.34.1


