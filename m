Return-Path: <linux-renesas-soc+bounces-22821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C076BC8B89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 13:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BF823A96F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 11:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589D42DF6FA;
	Thu,  9 Oct 2025 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FkLFTp77"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0AD2DECAA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008509; cv=none; b=kwsqD/7AbaIu2rfReAcDBpk/3Mwg3oaT4VsdN0D1QND9gDbzCY0OOFJ0Y1TrgG2V5cDZwooDSInsCwQNU8h4uBhmStf/JV12awDTLNLZfBqDOYdwvVVFXRVJu5/y2vzEcRtsAt5bPlmMYFEyZukKt/ZMeMm3ZMfQCEO55Pr0P/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008509; c=relaxed/simple;
	bh=17DABAYyRu5ydqaiY/MOa7rfFHJpPs9cc+SvvxAZoNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYzucouqTRRVmxpOkv/G/yNAEM+eOB3xdsFnU+TJXA2M+C0Pk2JdBYncfyFweJZun1mrxwIbbEIYhnsHRIXxIT6Ephe6QJ6KIoZo6obNWn5QtMlvWf9IC557u8ArgDITawLqY98bp+k75Q9+iYsK9Uda7Flwk4rjH7veFDmuR0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FkLFTp77; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=puKIa6gq41MuuF
	Uv7F0TBXGg6p/QotAOOyBKeGipZeI=; b=FkLFTp77mkvSYo4RqC7Mfc129w78VD
	gbvI6LJWwMjwLtBLBa0daDQ6VFe8ywwZpA68njjeqAktFHJunsk9pbcFnWzpaGyv
	qo93t21LVqQaejjdR35U9wD8EsASkA2F/f8nGStV5pv6RnWpLRvbQpzhTJ20sqi8
	FPT0w62R9z1o9R1aOi43hoLJ2EYfonqgz7Lrh9y+gH1fnT+BgbFZh/Uuce+PIaUp
	poCAM1m0TIAXrp35ptlo0+Ko5sZOOIzOT3GfPd3Kf13GKzscC+YMyUTFlvMEik3e
	Vyy3ewmsqZhPaMdx50d4S0ZR/tQZIndaFUVM4z8kj9nofXTwizu2ZAHA==
Received: (qmail 1052996 invoked from network); 9 Oct 2025 13:15:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 13:15:05 +0200
X-UD-Smtp-Session: l3s3148p1@ro286bdA5IggAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] dt-bindings: bus: allwinner,sun50i-a64-de2: don't check node names
Date: Thu,  9 Oct 2025 13:12:59 +0200
Message-ID: <20251009111500.75198-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Node names are already and properly checked by the core schema. No need
to do it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Passes both DT checks. Please let me know if A-F in unit-addresses
should be fixed as well and if this is a seperate change.

 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..52447768e65c 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -44,7 +44,7 @@ properties:
 
 patternProperties:
   # All other properties should be child nodes with unit-address and 'reg'
-  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
+  "^.*@[0-9a-fA-F]+$":
     type: object
     additionalProperties: true
     properties:
-- 
2.47.2


