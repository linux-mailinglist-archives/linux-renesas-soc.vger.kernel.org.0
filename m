Return-Path: <linux-renesas-soc+bounces-24471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FA0C4F0E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 17:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD2073BC975
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 16:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2059836CE17;
	Tue, 11 Nov 2025 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P+wrjdKK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891EC274B4D;
	Tue, 11 Nov 2025 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762878901; cv=none; b=PFIdBTfxyRY0sWX5qkq940NN1eJO+fEk3jRLii2rx5KKhMbWindPyu7A+gXBeSicPSppjGbD1cr5yj3zYyd2Zh4Vlc/rD7Dol0euApxHkEhnAAj4f1FH2XTJamL5Tv/Ah9KdkdYUBHC32cUottFwXu8TkHNDC7jbJG0ue3lZNcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762878901; c=relaxed/simple;
	bh=VLZESXTdoovGymCxJdbc4iaUf5eYOm89r7LjhmPABNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dGr42/Qmn3LX81ymVTZB2u5gngwsCN85lrLw1XMZW/bhbKDnMjYevS8jUMoH0sLPScmUa6CGSR9SxCiI3GWR2002JodnVLsm3YHj7V1F5gaDBeproTQnRyY0fgbNi7CW9cMJzhWfpHaSrg0M6sN05ktdGi8ycDqzPg5x+R271eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P+wrjdKK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13BD11E28;
	Tue, 11 Nov 2025 17:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762878773;
	bh=VLZESXTdoovGymCxJdbc4iaUf5eYOm89r7LjhmPABNo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P+wrjdKKetfkQgdqW2nfh6oHZhG/ekve5FIgWwWNWgzlrgcrorAkNlu8Be44GdVdD
	 YRX9ZXaBuqB4Yoq6b0y7jXiK35rzSj8f6XQ0xEtY7SJurmlFsiBy8keNK0Y82Y4ly/
	 Trs0COHErXRdIAKckWBv70AidryUgL6YfIMoLABw=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 11 Nov 2025 16:34:26 +0000
Subject: [PATCH v6 3/3] MAINTAINERS: Add entry for rzv2h-ivc driver
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-ivc-v6-3-2a0ad3894478@ideasonboard.com>
References: <20251111-ivc-v6-0-2a0ad3894478@ideasonboard.com>
In-Reply-To: <20251111-ivc-v6-0-2a0ad3894478@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 laurent.pinchart@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=VLZESXTdoovGymCxJdbc4iaUf5eYOm89r7LjhmPABNo=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpE2WpyWO82txkYp/gTP+MOVbfyV0rK+IcZ2sGJ
 YuJlUCjoXyJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaRNlqQAKCRDISVd6bEV1
 MjY/EACes6BuBa1S916vJuyEmLv8wWDHAibD9p6lPzy+d6e2IdTpG54MmrMOO+c4UyJEWbgyK00
 qrwgGWsOBshbyaO4e6pgFkyn5N+QQszasoksCZFnJjmX+22Zc9oY3a8hxwNSAWYVfP0yMMhpVfl
 TtWJA9sCgw+gekWG1kYshy2+jWX2fO6a3KruTga+kJxO0DyF+RAMfhrNgw8Yb7A1jfK+t0iysLK
 AKp/54Jq+2C990h7Q658CWLNOcN2jmYiuWDrXXaWELT2xU0udY2BSZibZ125NUry1m/p5IXv1YX
 oLpkOZdSrqKCISiUz71045XFvXue1iedkGa9YA/n2eB75/3PEp6djC6Iw04DXrdg4LWv5Gzxau8
 /r5vn/PQE1/JsOlh85LVexd9fundoo1KVSuV/qlL4eZPN4Io+NsTbMF6EltNfowrfMeRkLW0JCq
 LyNncx4WtI1A5QX+ITnrvNPQuhN5fIhGH5+Pk9uqsx7QTqVe7cotri9u/eIPJf6HpeCwSYC8Uyu
 dTm50ySE+aFmgOoBBaLtddAgmGlHyW7rnfwiiSugJrp9FyvOKKuB0kDBuAjxqO414H7B31B21OY
 BaRgzpNZNpeLxqU7WoEYW0Ilp9UH5Ylf2qnuQZm9EW8bKn3MVUdp4wk/16DY1r5Ifyp4X2jD5J3
 ynS3MrcrQVi2Tkw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add an entry to the MAINTAINERS file for the rzv2h-ivc driver

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v6:

	- Fixed binding path to match new filename

Changes in v2:

	- None
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 82f175f45de33dd2f139f1f50d04ceb6409fb3ef..25c6e6b30b3441c09a57d204d166ab844c406513 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21538,6 +21538,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
 
+RENESAS RZ/V2H(P) INPUT VIDEO CONTROL BLOCK DRIVER
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
+F:	drivers/media/platform/renesas/rzv2h-ivc/
+
 RENESAS RZ/V2H(P) RSPI DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-spi@vger.kernel.org

-- 
2.43.0


