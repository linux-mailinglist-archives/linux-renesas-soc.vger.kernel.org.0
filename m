Return-Path: <linux-renesas-soc+bounces-10794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2819E1514
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A029F2823C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A4E1E0E05;
	Tue,  3 Dec 2024 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vR7XK6yP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5381E0DCF;
	Tue,  3 Dec 2024 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212971; cv=none; b=lhyiR6LJMxHvYcegiTcHLqGeVO/UqG2A4Gn4DZFt7+FUY67li8Z97MCwTWYCb5j/b4EXAwCXfqW9PGGCB/TlEhTj3RMst+Vp6semU2BS8W3SRhoJeaB5UrXUFO/Qx/Gd2aJDsq3QEniVE0fpq5e5GPn+wgVsUrYhpfxOwjreCY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212971; c=relaxed/simple;
	bh=w8HKVjZehvUbPU5HddVJpFqDx9BrkGtDnv6ZTLZw4KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrRFwpmwQAd/TkO10RKD+lV0lZHGC9BLUp5I6FqDKyBbfxJfbO0EjOVwseHgr+Snbm3n57CVUlp2k2mMWU++Q/liGuLsKIMM0Efl4kByQxzVSc6V7zPnBkhmYJNY7G7A6Clmp3P9Ql/940w85sRRYRtB6qTtK3Jf1PtKvsbVLrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vR7XK6yP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85D03D49;
	Tue,  3 Dec 2024 09:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733212938;
	bh=w8HKVjZehvUbPU5HddVJpFqDx9BrkGtDnv6ZTLZw4KA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vR7XK6yPe4XQKpue+g2B2WV1SvZaC41na97ek/DyXb/7iFPwXa6Ljfvh6BTot2NXg
	 Km/aPzNJc7krhQum8aTbKwONheEXayXoTjr55SEacQ2mLeb82V87rsLxHsjntmizP3
	 H8YvdSjAg0zzcm13M66biyh81LkwdCmqot8rc5Kk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:36 +0200
Subject: [PATCH 2/9] dt-bindings: display: renesas,du: Add r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-2-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=868;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mmvnBmfnZpcyFaoVtTr/3fiY6NmCQCljN1ySkTzp71s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrscAMUY0bAcmXrldnAhWXO/DSeOjQxdNvo+m
 4nZCj5Qj6yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HAAKCRD6PaqMvJYe
 9dJ9EACdrb9AceYgubLmjYIho0wOtTFn5GyyEChx3dcjsBMLKusvUVPycUIBevKSpmtPoID1eYa
 QqusDTCt/yE+cDy2ZGtZHuqOmMm4vBgiyxDx2X2Lu9iJJvBFCEApsDRuiD63EhQMXgk30Hzurm+
 5m7ZMMoiVO8+kOfl3/w0DJ4Q14u3rL6rvMotCo9GFrVRY8MtrSFV/UdxFh51Q8q1uKyhzJ6K+H9
 kqD7Jz8shdo1AKkXga1iy1sOQyhF5752CVNQNA15fY44sByQ2zWMVO+ri65vYwn4NyyEQDrYkx8
 QIjWRPGq3djxmsBj9a8GgkKvuO2fAoJs6osTSIpIjdMazmQkc+M0LPaUn12XUtCF+SOQapMXq3G
 cUIKOrk/RTdp3hYmG01UAk9G0U6wpJ19urJ/02/p72Ok02LHn/BQ5+8+Q3oosg8UQ9Pl7ETy6VA
 8xE7ga6kRw6nE7iYs/KflNTwFN2Zdd6lkOFYa8cuCfhZa+SNapFKVCeiSm+LhGjpU7aN9zhmH34
 1TFfwXQPUdJ4yzVRYbM76QNci3PmPrR8VwRcupJ6xDrISV49+RCUW0k1uactL+8fk8geKL7fnLb
 wgxASkD1GUd0Z5+3NOdAXu37QEv1u7DoU0SlObzEmEA24P12U1AaZ3q8vTOyWDNW6VWPXyjum/+
 sUrcAvzjjOazkkg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Extend the Renesas DU display bindings to support the r8a779h0 V4M.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index c5b9e6812bce..d369953f16f7 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -41,6 +41,7 @@ properties:
       - renesas,du-r8a77995 # for R-Car D3 compatible DU
       - renesas,du-r8a779a0 # for R-Car V3U compatible DU
       - renesas,du-r8a779g0 # for R-Car V4H compatible DU
+      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
 
   reg:
     maxItems: 1

-- 
2.43.0


