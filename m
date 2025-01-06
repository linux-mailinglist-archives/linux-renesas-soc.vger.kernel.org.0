Return-Path: <linux-renesas-soc+bounces-11874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F64A02355
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 11:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CF51884E7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339AB1DC982;
	Mon,  6 Jan 2025 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jq8zucr8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jC9pr6W5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A7C1DB929
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160321; cv=none; b=XbJ94TW008EXYfA0xnQptkJJPw5CZWSCgrik7vUXeTCQPsYeHKbtFeVm4CqklFGYiRI5mK6Knuahs3Mciqr5ZIxYXP2JswMQ9DaSotW/NRAtTp6ER+YAWzBIfrYXUf060NmtTASN4kRny8W1DF9Whfg55PbuFFAKu9XylDjy7z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160321; c=relaxed/simple;
	bh=36rDFQYxPM4kiXPIE7Mo0Se0uT9y1ZAwHhgQZHm84c8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gmyAM2q9pFuxkswGvX/CyrXCaBgNP9LcvDT16JbD8Sh4YURDJtI6SmhjdctZlWBw6RVew56sh7KOIHihdwErtLM1WD4dsWvUggURVgZsW0DRA9qaZhPpPAtN0HUqHR7ckvGVLskK3BG0iNS2yR3ZQzt9psjL+T2+XlRgoo8LwAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jq8zucr8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jC9pr6W5; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id E11831140121;
	Mon,  6 Jan 2025 05:45:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 06 Jan 2025 05:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1736160316; x=1736246716; bh=Ov
	F+kJ8uB1PYAgJTulNxmRsd/2E1RA+04sUMdGaLzmk=; b=jq8zucr80RRmR8gell
	0E1QcKhq+qT9LXlrTlzwRKTLZVLggoIZZXDnqyhiB6J7Lt+SiphB4bqOHGQl9doq
	slcVO/BK6YZa4pcjGQHfv2o2NWwm214Bt+e1Z5zVroVkj04Qs7VVvRtcPmClMbhm
	LY4GzkYlYUcM8qCrmXaQAojGHz2psN4yVe9VoZlCxplm36wdUIYSRLPkutqeGDPu
	mD1HgVtv5SnepaDHpI+cmH+0ldOfXpVItTEyjhA3sVh4jRyvLt1yGkh7xMw3/C+V
	rDoe0+P71Wjkg/BhBQiYH8YfFJwbqjKqXY0kVpdcUgRGe8xtM3sF/bnavcxYuvzJ
	ZHAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736160316; x=1736246716; bh=OvF+kJ8uB1PYAgJTulNxmRsd/2E1
	RA+04sUMdGaLzmk=; b=jC9pr6W5ICGYEf1JPne8F8n/bZTFKOISQg0eM7HvYCgi
	TmGskmt/IyRmwUIe0WCTjd8mTG5Zq3BFp7hLwHhwk54vzjYO2mEHP6YUp7wKmn5/
	H0SDdGb/RZXKKtwfJC/McKi4hpRIt3G4bNprFI9LC2RbhLSR2iOPIuHueVENbQSG
	Ln5kjF4so/je4BLhArAelpa7mTT+jh4PlXRHKWeJwfjpj68XiTYUjfDP9tWW0Oln
	PdjFCz17FonpSUTZyrWXjZxlnhabfbDHZW9ysLf4aVZFPwisJHGzw//Bu+eB46cH
	3Wg0uVao8kLKu8owemBasYdNvw1tGSpS4BVgDNuR1Q==
X-ME-Sender: <xms:PLR7Z3AG_t2nWULp_f8RY0vvefIIktIOMZh5vYQ3DLJrl0TGHB6G0w>
    <xme:PLR7Z9h5JxZy-_mf56beWS2hx1A06B4fmd7e0BYK6A2Poy1DCrCwL-YpNPxrHQlFQ
    FUCjZ2rVoGS__tjfR0>
X-ME-Received: <xmr:PLR7ZylJx4AobY6KYGdWXNHokuscK1zL0esik0BPB8nx3ekGct16lrIvqvKdj8sOKhNRJjc4X8v0RDHdJOFsavc7og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegtddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhu
    nhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedufeeuvdejiedv
    kefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthho
    pehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghg
    nhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:PLR7Z5xoRCWbTYkH5SExZG-xAUpQHu7Xjd6dpemXcvABSwrOnRbxVA>
    <xmx:PLR7Z8R2MEj2c1IbxyLY9Rp5F2sUXdQMreRdWvgOGhutZnBgxzZC6w>
    <xmx:PLR7Z8ZF7Tw9h9_q6bG_xIJKbEHuQfRkd_RLCs1lbl4hNDA9T9PhdA>
    <xmx:PLR7Z9Qq3JajT4TtFG1-AWDZf3pKhksfzzLu6X4Q34T5YSXQSkqmMg>
    <xmx:PLR7ZydeMi7XSNEXDVzlKETgxyjp5ak0hP9VCQw7zwfvES3CGyg_9XAK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jan 2025 05:45:16 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: white-hawk-csi-dsi: Define numerical CSI-2 data line orders
Date: Mon,  6 Jan 2025 11:44:58 +0100
Message-ID: <20250106104458.3596109-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The second CSI-2 C-PHY data-lane have a different line order (BCA) then
the two other data-lanes (ABC) for both connected CSI-2 receivers,
describe this in the device tree.

This have worked in the past as the R-Car CSI-2 driver did not have
documentation for the line order configuration and a magic value was
written to the register for this specific setup. Now the registers
involved are documented and the hardware description as well as the
driver needs to be corrected.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
In this change the numerical values for the line-orders are used as the
changes video-interfaces.h are not yet in the renesas tree and it's a
good idea to get this DTS change in the same release as the driver
change.
---
 arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
index 3006b0a64f41..9017c4475a7c 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
@@ -21,6 +21,7 @@ csi40_in: endpoint {
 				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
 				clock-lanes = <0>;
 				data-lanes = <1 2 3>;
+				line-orders = <0 3 0>;
 				remote-endpoint = <&max96712_out0>;
 			};
 		};
@@ -41,6 +42,7 @@ csi41_in: endpoint {
 				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
 				clock-lanes = <0>;
 				data-lanes = <1 2 3>;
+				line-orders = <0 3 0>;
 				remote-endpoint = <&max96712_out1>;
 			};
 		};
-- 
2.47.1


