Return-Path: <linux-renesas-soc+bounces-20595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539A0B293A2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 16:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0C413AF5EA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 14:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8131B423C;
	Sun, 17 Aug 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMQMQd42"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A637713AD26;
	Sun, 17 Aug 2025 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755442301; cv=none; b=hfch5jC1wBOa0oDFdoR49YeJUMrGFo3YyjZm3T+QyXwkhV0MiQNJV45tDYBSd7QVX6ABROM9NbKM4aXzoP+6Fgq3sA25pGqj1vfoXmy8Q3Nvt66YgWvPEwA9pPAOzoeDZx1DwyJSfoRPUYEK8TrKreAgteoJ1cL1AlTidIib6Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755442301; c=relaxed/simple;
	bh=awK/M2dhN/9SUXl7AiD4jrIJERqZs2ku+Xu5c2T7a/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYr/crQUw3lBcdue2AEaQwkVsdrAQeK8mDK1mm42Er95v/RPDQGbusSl7bT9coimfie1qXTbIJd08rLpp3PURzWcoD7GoPrPFuABgoTAU+z9Zg4rSp6IQkmVVWaEi2UCSHW0ZH+0fCEoTq9s83ZlokS5Yh+cXE1LmLhdzR4weEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMQMQd42; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so17750175e9.0;
        Sun, 17 Aug 2025 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755442298; x=1756047098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIH6VHVWkPH8Lp7DYNNft6vh64yO0lgWZEuMmVXdlRw=;
        b=aMQMQd42aQc2/onYW+PbZdLxBJ/v255b8WogsuuLVr7E5wpQ7JUIzA41PtId+R4tPB
         92ZN2hVXB4WtppGNqkmpwZusDXQVW7A3GdD0UUHVHEfNgVYgM3LQktJ6Uv9yXV7vegKI
         mT9H3A6h8VKUgPLDrA+mz9TF+Tg1xBtVkmCH3Rq3axyrGNPDcAdbVnGqNOkP0KNwQOPY
         g6pR/bj8ECrFhOA/6G+6fEUmmYrHD1TlmOvg62YDYCRHzzftBSa2A4xj6PtYZGPUp/m/
         mjoa24KRVjCVfTnN49DKPJTmc0L32bknZmz/SJkcrX6paoqcBBTMfubXJGXBkhcrkFCb
         vCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755442298; x=1756047098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIH6VHVWkPH8Lp7DYNNft6vh64yO0lgWZEuMmVXdlRw=;
        b=hEFCq9qN63DmI4yjMxFEZvudUYkUOEt56llpPoOH0L5RDVKWOnJBAci2EYhT+geoD8
         5t61yEXPUYvgmewBQyt3ial5nhZt0i56GwExBuwCClTYOKheMWfETmYNMt59lamBCPpq
         9lZ4rRLliMpIgNCZXjcvReK9FTJrOjV/HrrPB3tNOoVkzX2491LpwJ92y9t7TyIKTOeS
         w2zc51t5DmP570qt311e8no9AGXPx/TcaI7wstAtzLZaniLv7W/pJtOz/zC6ttLai6J7
         Xl0iBrbCUeCGVfsO4Ehl8Dzuiufv4Jr+aP6fU0O0q4nYlCOPdzmiuWcrOrrNJbmvI//I
         1bsA==
X-Forwarded-Encrypted: i=1; AJvYcCUn07A1GnZo6haSMR6oS23f13IHCQu5mWU4UvB8luR/Icv3UUo+ciTohhVES0HFqH+rggV4NqRswRx9@vger.kernel.org, AJvYcCV6PSiTrURDxU6gdb8QGMCytDftz4x6xjMwdJ/3XGbtjxm/F7KOzxy/X9pWV2FuxfGLjxL/bjK0h16aEsz1@vger.kernel.org, AJvYcCW2s3SUf/Y9Nqxf0rxHxD9biMsiOanJ4g9luqrlsxIgYFLHG4r5A/77IsdWS89G9lXuYuGpDdmfEq9jsP5caZj/hr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzvUSDm5kzzkcayH8H1AP6wmklTO2LO4AAJQnBqKA0tc+uNRUH
	U9YmR+cV/XBz/dbDgiM6FQQd7yQFqDMzo7pyO6XI8sNlLr026Q6JgFRQ
X-Gm-Gg: ASbGncvRpLYT0MQZzPZHtxy6+D9TEbVFk29Tu3J5LaujAuy/VvVnoZbjzD2bwrQtB57
	y+/uVuYkeUWK57GiyvF55p925hPt25g7B/dEOpuACLftikP6KrD2rX82y3uPOyuilnNYGc4KemE
	k15m1yuCq9oesxJX2Im0eeGRiU+ut4E/Nhcr3R0Cfro+AQj3Pj73Js/wwcMKrZLltHIZ3HpLikG
	698dh1Z7N/1H9mTTbQvylKx9AosFH1iD+5Erfa7e567K3JXnaCQ7keLpNikIUqXjOxPu3+wwMAX
	+a824umy1fbC/O6svIrUlxPP2SVKrWD0aK1pYrMLUMt/BNpzRJQrKUIc0IoeNRpBZp57Cc4o0N/
	Elm1cA3sX+HfczbSqJmExRK0l3YXU1I73So6xLNE1L5hK0Fi/VstEBCu7i2TLi2NuVXRi9X9UGA
	==
X-Google-Smtp-Source: AGHT+IFbLWK3N8MnH+t01Z2k2Kppk2001ZopH0j+SbrCMPU6qQ97+xUd5EDU8kq3F0uwcUCO5Js5Eg==
X-Received: by 2002:a05:600c:35d3:b0:458:bf15:689c with SMTP id 5b1f17b1804b1-45a1b65c6c6mr98837995e9.2.1755442297764;
        Sun, 17 Aug 2025 07:51:37 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c99dbsm9917352f8f.36.2025.08.17.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:51:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g047e57-smarc: Fix gpio key's pin control node
Date: Sun, 17 Aug 2025 15:51:30 +0100
Message-ID: <20250817145135.166591-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817145135.166591-1-biju.das.jz@bp.renesas.com>
References: <20250817145135.166591-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Adding pin control node to the child won't parse the pins during driver
bind. Fix the issue by moving it to parent node.

This issue is observed while adding Schmitt input enable for PS0 pin on
later patch. Currently the reset value of the PIN is set to NMI function
and hence there is no breakage.

Fixes: 9e95446b0cf9 ("arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 1e67f0a2a945..9f6716fa1086 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -90,10 +90,10 @@ &i2c0 {
 };
 
 &keys {
-	key-sleep {
-		pinctrl-0 = <&nmi_pins>;
-		pinctrl-names = "default";
+	pinctrl-0 = <&nmi_pins>;
+	pinctrl-names = "default";
 
+	key-sleep {
 		interrupts-extended = <&icu 0 IRQ_TYPE_EDGE_FALLING>;
 		linux,code = <KEY_SLEEP>;
 		label = "SLEEP";
-- 
2.43.0


