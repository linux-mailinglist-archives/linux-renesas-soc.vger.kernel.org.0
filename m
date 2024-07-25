Return-Path: <linux-renesas-soc+bounces-7533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05493C8CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 21:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8428A1F22A37
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 19:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1ED558BB;
	Thu, 25 Jul 2024 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XhkQSnDo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184AF5588F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 19:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936312; cv=none; b=hAx/iZqgUxas01fkjuf+n9LOcIUh3LDjrojf+yrMfZY/hxO3aNaPdgzbGesXhJWQJanWOXdqng/IcLUg9YNOQqERLSvdPqP42EZwNKiddV5cVEhnaU5lUeB73HhIEIXB8dabzT6z1NERX2kHBn29wXQrWl7ZNIJUBHK09jBkPe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936312; c=relaxed/simple;
	bh=iZDrPg+CXyY9fqxcW/wsDBsQ9YoVYk5jMoM543C5ips=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORl/x72bYgjDohJGOhwLnlujhM6l7KX9Fbbpile61vfQ+BfmJZxHCN+FC+J7Hff7VMBvfKhwcuAAcSWxF//K5cwAQjE4dnXGcHEd6x0M9uSIZs+toArPvMl9rWntBEgXRHa3lOHHP8T5OlqbWPqwiWy22mH1LQ3uPy9loCRGa3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XhkQSnDo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=DT5h3oFizEgEe8a32cS3JZd9hwSm/bnmsT6MyoxeeTk=; b=XhkQSn
	Dos8gcuFqk9Zo5K4Km5YXImNnq0mAlQU+/nLm4XxEe5UQy28YLd+g1COgqUR7z+T
	irl7+E5CipyhKQd9VTe5TMYS9Bi/4VB3GD4L1y4R2MFkk9Ur99hGmE/wrHFYKcDK
	F326+jum5y7sftSD4XIsaFZuBzgOWWGqjx8DZLMH3EYldgdKahWj2gbz9xHXiIJE
	rJBKtuBaXy1z58KoDUfN+ZRC/eEex4OasssFpGD2MUSxaW4oKCZlSNrj80+hy/Au
	ZZpKRNsgaHVSi/3fMz8sxa+l7oGw6XSzp86F1E0j1n24+YoxSOfnY/H8GxLgIT1s
	S0L/WXgvgHdjADbQ==
Received: (qmail 3086315 invoked from network); 25 Jul 2024 21:38:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2024 21:38:28 +0200
X-UD-Smtp-Session: l3s3148p1@dKLyiRceetUujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: pwm: renesas,tpu: Add r8a779h0 support
Date: Thu, 25 Jul 2024 21:38:05 +0200
Message-ID: <20240725193803.14130-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725193803.14130-4-wsa+renesas@sang-engineering.com>
References: <20240725193803.14130-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the 16-Bit Timer Pulse Unit (TPU) in the Renesas
R-Car V4M (R8A779H0) SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
index a3e52b22dd18..a4dfa09344dd 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
@@ -41,6 +41,7 @@ properties:
           - renesas,tpu-r8a77980  # R-Car V3H
           - renesas,tpu-r8a779a0  # R-Car V3U
           - renesas,tpu-r8a779g0  # R-Car V4H
+          - renesas,tpu-r8a779h0  # R-Car V4M
       - const: renesas,tpu
 
   reg:
-- 
2.43.0


