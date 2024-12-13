Return-Path: <linux-renesas-soc+bounces-11291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B68B9F0E55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BD78281671
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 14:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33E01E1C3F;
	Fri, 13 Dec 2024 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PAgpesZM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014671E105E;
	Fri, 13 Dec 2024 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098605; cv=none; b=W7JTSQjwdAMlw5v4nUFLHPR609uw6BPR1LPyhJ31vwFqHqzr/XbwOUdkl4uUZfUAFXf3vZTMER+7Zk5Tzx/Ykrg+xA63B26TvftTW6odt4WdD8f82rRITllrbrIn6MoQvyaLW6r+uzXWEXybRgVz1h/+7OcfiiIX9OUfpWdTnHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098605; c=relaxed/simple;
	bh=yMXL7ef74+Rsd5fAmiBKorgMPkSnb9HmF+N5rIwhjCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rnf5tXA4hUqjYcOwmAOBSv4JOBivBlukLJGsgGgzisQWknJGcyo9CBbMSUVqxqNj1kUjrTJCfQttht1X63SuINwbr78kQltZ+isXeZfNo5kHtusFmk/D4jpRpDGBNZq9ss/FKmQfR1M0RYOp4sFQ9kNft8neeoCsKsjMmAtUVLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PAgpesZM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AA11D53;
	Fri, 13 Dec 2024 15:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734098566;
	bh=yMXL7ef74+Rsd5fAmiBKorgMPkSnb9HmF+N5rIwhjCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PAgpesZMmzADJifGEJTC+exrF4k2d/zpa0Wbi/S5nUZgdh3rpKc1vtd+Yu4/35mN1
	 LRRaeSoxzK4ewSd1AY6IvvkF4KL6cEQQDx64SCljxg9GJV8uR6TdZ+aDk8/k2vl10P
	 Rjd0He0P/1qZg7c5bdEuGphfw2dY8AhJViol4DbI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 13 Dec 2024 16:02:59 +0200
Subject: [PATCH v4 3/7] dt-bindings: display: renesas,du: Add missing
 maxItems
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
In-Reply-To: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=v+qXxJbhngvJ+5f8hZKCC2lQ2TNaw5dkcLJWzHn5v0s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6g3MHksETjLkCJlPbHtKr9YP1gT77uZzE1I
 vbgd5SHOh+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+oAAKCRD6PaqMvJYe
 9TSHEACKdkm6C4AH9LRaRdOlO6kqv7vz5TCD9OjUJSZNZbTcz969yDysspKzrWm/Th9P6KnTxeC
 Bgg/v+kDJjDQjjstiUv9WtDXvZ+pICEkehI3CBgBSwCRtovmRtAZ5Q8uEMdXjUlIMBqqFYe3SdU
 Rh11WDSvSYLDe91Nq+Zz+gAA3v+dq0xbVzOMjQa//itxom3LNjFCPxIIbZIPX83xp6gjF18vBL+
 ikpzokPFtBV/CMctcyGZ9wul5ykGn+fIfrGozQ0pE79oy63RUqN5npjgHSJZXmRLlIg6Ovpujwk
 lxtWVNP2fyVuzFZiqQm2sKAnR1h1dqqvWZQz8hznbkhQIDgu+46AXf4+uNNT+w2qQ3A2Y2khZx3
 ftAOyHJnaH98m4nsgcH2ZUjTzOOGi+jbD90BApFkcamY33jGCPK4D38qH5fO6WvYmrvB5/Fo+ox
 djoVWzYuB0DxDA1b14Ayl0PmviVedIzbMouYYxkF+EQ6OCbF47l8PRQNRAV5Ot9R47tEQCz7WrB
 Nn/iYEbRHNMWPyEzXAoDhcudbRJqK2o0Ur11iAdFfbwB9uZgVMdtZp+pAaVPmerf/4C0YZZjXxl
 679TEz6I8uWM9D/XrTvO3AhC+dTldCs6P2MK5YbdCk+pfpzkkFHAcl6StGoa4fU+3FZjGsVx4Xm
 FZs9CFR57k8JMfw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The binding is missing maxItems for all renesas,cmms and renesas,vsps
properties. As the amount of cmms or vsps is always a fixed amount, set
the maxItems to match the minItems.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index c5b9e6812bce..e5fbc4ffe29c 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -489,9 +489,11 @@ allOf:
 
         renesas,cmms:
           minItems: 4
+          maxItems: 4
 
         renesas,vsps:
           minItems: 4
+          maxItems: 4
 
       required:
         - clock-names
@@ -558,9 +560,11 @@ allOf:
 
         renesas,cmms:
           minItems: 3
+          maxItems: 3
 
         renesas,vsps:
           minItems: 3
+          maxItems: 3
 
       required:
         - clock-names
@@ -627,9 +631,11 @@ allOf:
 
         renesas,cmms:
           minItems: 3
+          maxItems: 3
 
         renesas,vsps:
           minItems: 3
+          maxItems: 3
 
       required:
         - clock-names
@@ -684,6 +690,7 @@ allOf:
 
         renesas,vsps:
           minItems: 1
+          maxItems: 1
 
       required:
         - clock-names
@@ -746,9 +753,11 @@ allOf:
 
         renesas,cmms:
           minItems: 2
+          maxItems: 2
 
         renesas,vsps:
           minItems: 2
+          maxItems: 2
 
       required:
         - clock-names
@@ -799,6 +808,7 @@ allOf:
 
         renesas,vsps:
           minItems: 2
+          maxItems: 2
 
       required:
         - clock-names

-- 
2.43.0


