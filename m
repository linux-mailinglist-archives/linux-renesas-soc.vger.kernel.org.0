Return-Path: <linux-renesas-soc+bounces-24079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5038C31562
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 14:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEFF0188481C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 13:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C17329E63;
	Tue,  4 Nov 2025 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QzxvE5Dg";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XuAIPL/p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E0732A3DA;
	Tue,  4 Nov 2025 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762264656; cv=none; b=lzY+sjpxU2gnxQfkD4CPIjEx0SYHx8kltZ1K0X5S2OyMf3B/3W+FW46eHIEwotQn4A9JqzxVvnIDuhW2E02ap+TRsY5nTSDQDrsJUjbVXPp732iR3b73vLKSEIDa5Burqa13FjecHEwHtmKc77UAiw9DggJeTgHFZSNpF3DwLyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762264656; c=relaxed/simple;
	bh=O2d9ym8Ua9z99q3MVg/qI+btTg4AUP5jS+sUwD29eYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IXAH1dfEhgQT1bZ06vMYqPMj0QM3fQX4h7TryEa2j+6QueKiQZJcNWXWTtdl24Zlj5v9tA9vsgk/F+splkzMB3bwZJzh+kSyQxG3z5TzF2D8aK80WMJDJWdhBP9qKwxvWlGp5udz/WZxJ0mnxXbq6YRN3pEXfT02aC0XjDYxD40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QzxvE5Dg; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XuAIPL/p; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d194p6Zggz9t27;
	Tue,  4 Nov 2025 14:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=00WHQBbuvCy+Iu0TttyHrGysG8aWQEbRKIjNtnlItpM=;
	b=QzxvE5Dgn/3P5I0WBMJ9uQNOBPBqSn1WLcQafm+LAnDIvmgOkrmb1K4cbqlga0capxFzVq
	DjbrBq69NA1dXkVSWOiFVST1mXqOvKDU40KP11BFw27k7z0yW/CnvDEs6dxmUh07CqXm5s
	xTML1mbReyQ6AkFfi4qNB34myiTj/9saIH2rnAWcV4lAbQoS2rvDuW+Vcupi7tLFIaLnkQ
	MucwQ/1eg10jsk3QWZdniW+PyStnqRj7DxgV6CV323w8AAY/Zn0GTW4fDoREaJ5EQ/vBPB
	MY/Q7I1ViIJ2BGzkrWS6kzRtLHxZBdbLPs6RTGHQHn/GusZEC0tK1Xxpq1N37w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=00WHQBbuvCy+Iu0TttyHrGysG8aWQEbRKIjNtnlItpM=;
	b=XuAIPL/pleVpOMtiG6KAUnTel2TS5JNoTv+cH+IVL1Lr3ENIh0Z2CX1snYXl3NomULKf8P
	NcGwc5KB/xt0cg4wFoOvqCgMo7Fe0xpdLXItPPVFmw/SSsuego4ZG9x1Jbe8+bg51JOxjF
	TpS/sr12qj9ml8IvziGdYJGlceXkHGN4gFEt+Pn5p1Wi1qJQ5IaGzsUMbZFAfDAgB3v6Uy
	YxCB/1dJLuS4jX+aQGVxRJjL/nMExk7x+gVfmZcq5gQCqOxNP33YPDdJ51OZvNcPn6e4uj
	MWMFX94gGE2Tf4j02Mxyqxzy6ekO3Rf/C8aUecDmLFqrA0q1c/3FRia+E0luwQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists sorted alphabetically
Date: Tue,  4 Nov 2025 14:56:05 +0100
Message-ID: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wg8q95iupj6tko68886b5ooww1sxemjx
X-MBO-RS-ID: 0190ce7413311b3881e

Sort the enum: list alphabetically. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: New patch
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a7ca6d3fdf10..550da008629c 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -134,8 +134,8 @@ allOf:
         compatible:
           contains:
             enum:
-              - img,img-gx6250
               - img,img-bxs-4-64
+              - img,img-gx6250
     then:
       properties:
         power-domains:
-- 
2.51.0


