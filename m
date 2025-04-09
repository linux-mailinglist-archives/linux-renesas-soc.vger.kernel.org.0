Return-Path: <linux-renesas-soc+bounces-15616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC3BA81A0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03B3A19E1165
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6952C3595C;
	Wed,  9 Apr 2025 00:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f0XnV15P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF79D26AF5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159714; cv=none; b=PVmy0pazNjZ3Poz5TPttoQUoRR9iAk7wxOx3301hcDEOoLwvGZ/Hgtzm/wc0QrGXlv1fbgcmRxbXCRs0cA5xst4LIC6f4+LIk/p2jz3YF3s3EkQiJFrKz5HLqBGaIRkQ7UpxZKKNoWm3okdXf3Dck4LakiLTnrHsWabL4Ij6iYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159714; c=relaxed/simple;
	bh=Osp7ePEDyWXlzUoHrlUeH6qEhfpofxYFl2poW3nb+YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/qU8Duo3K9/2WR6M6S65nazzCY9ovO9MKsHlwxAcWpdO3SSO7BT7KWJK9MGvO/w10Am8cvXMp/Fqg5W2C4THHzXU06OfMXm0Die5W61tPRktZyEzMuAaRIIHJrfHDg63+w7ClGpLmFrN5DRrlLl6FCdFBuaSgP2sI2x7OvIogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f0XnV15P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9F0D82E;
	Wed,  9 Apr 2025 02:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159591;
	bh=Osp7ePEDyWXlzUoHrlUeH6qEhfpofxYFl2poW3nb+YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0XnV15P7bpmTmzQSofkZ00t9wSj3kQAQ5n/B9UMXeYSRGkFiTvDP47AKfbU5O4rH
	 G6wGLirNnAadbv+EDFcZt0nJQ6H0pWnjOIGpoQybz5VYIK+W2wkjOehMnFkAKcWBjg
	 xWtHdpDv9gOeWd4mEpBUz7yTP++PSnpJavB/yK4U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 04/16] gen-image: Round sub-sampled chroma towards zero
Date: Wed,  9 Apr 2025 03:47:46 +0300
Message-ID: <20250409004758.11014-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
References: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on tests, the VSP1 hardware seems to round averaged chroma values
towards 0 when subsampling YUV formats. Replicate the same calculation
in gen-image.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 src/gen-image.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/src/gen-image.c b/src/gen-image.c
index 170d69490399..d053d7906159 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -618,8 +618,15 @@ static void image_format_yuv_packed(const struct image *input, struct image *out
 				o_c[2*x + u_offset] = idata[3*x + 1];
 				o_c[2*x + v_offset] = idata[3*x + 2];
 			} else {
-				o_c[2*x + u_offset] = (idata[3*x + 1] + idata[3*x + 4]) / 2;
-				o_c[2*x + v_offset] = (idata[3*x + 2] + idata[3*x + 5]) / 2;
+				unsigned int u = idata[3*x + 1] + idata[3*x + 4];
+				unsigned int v = idata[3*x + 2] + idata[3*x + 5];
+
+				/* Round towards the middle value. */
+				u += u < 0x100 ? 1 : 0;
+				v += v < 0x100 ? 1 : 0;
+
+				o_c[2*x + u_offset] = u / 2;
+				o_c[2*x + v_offset] = v / 2;
 			}
 		}
 
@@ -674,8 +681,15 @@ static void image_format_yuv_planar(const struct image *input, struct image *out
 			}
 		} else {
 			for (x = 0; x < output->width; x += xsub) {
-				o_u[x*c_stride/xsub] = (idata[3*x + 1] + idata[3*x + 4]) / 2;
-				o_v[x*c_stride/xsub] = (idata[3*x + 2] + idata[3*x + 5]) / 2;
+				unsigned int u = idata[3*x + 1] + idata[3*x + 4];
+				unsigned int v = idata[3*x + 2] + idata[3*x + 5];
+
+				/* Round towards the middle value. */
+				u += u < 0x100 ? 1 : 0;
+				v += v < 0x100 ? 1 : 0;
+
+				o_u[x*c_stride/xsub] = u / 2;
+				o_v[x*c_stride/xsub] = v / 2;
 			}
 		}
 
-- 
Regards,

Laurent Pinchart


