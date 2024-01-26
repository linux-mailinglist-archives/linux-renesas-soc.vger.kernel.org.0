Return-Path: <linux-renesas-soc+bounces-1864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7068F83D899
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 11:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1075B1F28D37
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 10:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818471429E;
	Fri, 26 Jan 2024 10:56:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7942014016
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jan 2024 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266614; cv=none; b=Kjw/jKEx9NtJiS/w0Y8y3nlVeJpRLsWzn0d+V5+a5B7tqYaB3/0JAdBcqm1huK5tk7VxK1rxbj8DKnNlRMwmkuIaFqhpDk/HQZVwUttFmKONP3vklOy/RTXfnig3CGN+q3bzaK0xvUUzS/mjs42EpaWrmvvKWrFR+JV5bTClt1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266614; c=relaxed/simple;
	bh=RgM4Pk4rDKsoRZbE2w+J9FD6Blm3prA8Rhw0dPsz7mI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TuIKGMNiw2oOnZfU7PhWED+rhbVaFhAX928xquM5N/9Tjl9ou0WcKL7jG9v2/3ZaAx+y7wMCHhCL0UC1V0X8qTqL5QBKmud4zmDARTn76BoIUtbgIwjMV9Qbj1t2K5wS1G/MeGdd7SlImDDRsNCp9FEne3L9FES3yryXRS2QOfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by xavier.telenet-ops.be with bizsmtp
	id fNwo2B00N1AdMdB01NwoTW; Fri, 26 Jan 2024 11:56:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsM-00GWjv-3u;
	Fri, 26 Jan 2024 11:56:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJh0-00G5Sn-10;
	Fri, 26 Jan 2024 11:44:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/14] dt-bindings: pinctrl: renesas,pfc: Document R-Car V4M support
Date: Fri, 26 Jan 2024 11:43:59 +0100
Message-Id: <56685dc04af3cee7cb3751e855ed5b3679b14122.1706264667.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706264667.git.geert+renesas@glider.be>
References: <cover.1706264667.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the Pin Function Controller (PFC) in the Renesas
R-Car V4M (R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index 181cd1676c0a2a36..5d84364d13589c5e 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -46,6 +46,7 @@ properties:
       - renesas,pfc-r8a779a0    # R-Car V3U
       - renesas,pfc-r8a779f0    # R-Car S4-8
       - renesas,pfc-r8a779g0    # R-Car V4H
+      - renesas,pfc-r8a779h0    # R-Car V4M
       - renesas,pfc-sh73a0      # SH-Mobile AG5
 
   reg:
-- 
2.34.1


