Return-Path: <linux-renesas-soc+bounces-19621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D3B0E92D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 05:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 134EE1C25EA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 03:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9419F248895;
	Wed, 23 Jul 2025 03:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/z3EXUk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E556248863;
	Wed, 23 Jul 2025 03:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753242181; cv=none; b=GRCPA+G8b/nHluo+D6kP08OXSbASCfkZusM2cKx348qyyyp3ClyfbUkbQ/KBsmOkWIDN/i1iY6h/1LlXMcktm8dUCPkkTk7XjGeoVch29Pcp1GSbtyFITaMdeJaoXIb1wtfC3sxLEKTLjzJr1cemJqE7am8Dr9+0aS+tP7u2vik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753242181; c=relaxed/simple;
	bh=KCpXj6Mz1QhabDV0JOlE1vdS9hXftfEarZKdC+0yOL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKSSQalA7VnXWsjF2Ez/OXyOwUzHMBMfmtU8HOiSMRO4+dDQOlhSViavrDFtr3HCYdibyL9MMWmB1ir+6Jifago/j5axOmxQjCoKn3o2rt7tPpJrSXi9ohDUGlGj9cN1UhHvXlOoWbFTAyzG6Z0CruRIH1oNcwr4Qt+769V7CSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/z3EXUk; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso5009969a12.3;
        Tue, 22 Jul 2025 20:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753242179; x=1753846979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=D/z3EXUk9CnhiADEr7WscDCOEZO8xK3w+pcmbxO8zFbU4RbONtSxv2hGdpJ4ANWMrV
         zQMm30ilTpeVCXw9X190NxhF3eccbxkMKUuQzgIGN4DhEYldqtYskLEPSgX/ifZbZv5O
         Hg57Vk9iI8FePCRA9KfC1MYE92R51KYv7tqF7sAxMqgpy0lMyuFXy/pH7wUlSkExty6e
         UsvPOGzI+38A8mOuzDtVRDpvDXA68eI4S6nYPsc6L/1r/sMR5+DONrjbRhLioRejOmQK
         oJAje2Er1WbPo6JBpE3u4QAU8/gEuLu7NAW/Adeb29GwH0Y52S5ad+Vnga+dXbBdF1nU
         YDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753242179; x=1753846979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=MeN+f+GVl406CPsdWgBBxVPGyDHLsPgsWadC+VbRD8dcSXxXXTSR4UVRHYGpenTqiz
         KTE6/0HNmGTHC4mtteBwO/ay+OEZOPf5IVumbXzEVQdcSz6GvaZW6zMvicluXyHPjEYi
         GgA+uDzkCEXfC2CV1N7y3jU7/BmwBZJG3wVF0mvTvdCj3OG+n7U9DjH47EMOrqk55hLd
         ObDMHGHMHuQBiGl2Jvj96b0+pztM+GkTg+vAb1b/7a9Eet0B48vESe+kwFoeO4AAL/SJ
         BxlRPLidkC6Ee1ulZI9q/1mwi0fUxkc3piJxfuVaE8rNH2lHv5yF45hwf8fCVgXE+nTl
         HZtg==
X-Forwarded-Encrypted: i=1; AJvYcCUgUOp6jScUn1Lj2b1d2XDH+bvl7kYJw1d2vrjvuhHHng08s/DQLxn9NEbpB0aGu6q5AF5o4GiYPExlW3Z6@vger.kernel.org, AJvYcCUkjEz36jZBREcEWDHYLLYD7s/wtF+rc70ALi10bRrhyO+rNlu4oZKG//v/i/KlOR3jcTB4utrK6Ax++XfqLjg=@vger.kernel.org, AJvYcCX/5h73t7WT3/3C/TSxlZP1uUhw9MeDoBHsElP3WiR2sMhcBRf+shmThhl+Jw04PnZZsEs5qDonhVQ+QnM56aFZ2Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx6W6bgfT5SNwSZKAURan6DTaubmkErkdDwqZDYnQztOT60ftl
	28hUxAjNsx8xTnGuYuKJOMrmKeVoj/JgPR1teRtB5yzg7EHuK6tOqV3Q
X-Gm-Gg: ASbGnctayjH5abmYbpWbRxfJc1Baqd8LFbBpsVNBBDMUAD2yDGr3SYGeU7ElnN5eZUQ
	oh/e0upkcekSqSkeMbFl/bzGVLDjH6V2EEdrX1VR+8eRjZ6MpaPD1KvPSFi2UpB8FpA78tt+aFZ
	tJhIX5tKj4rDtzX7HT9pDWqf1NG3t7yMXc4RGbUDEIeCitDdpcx2jrLyU5TWYT2Js4TyurHdJyN
	hRHSRKcGIqaXOCnPdd53VmihAWhEaq1DXqvKUbUU+kiPYRm8heFcxr3iRwikJZoqXw+hlvJm9oz
	pc5frmQcwurZfAo1YyDSpOxkhqbbw2duAODP93YkbzLGd5A0knDLrv8jCoWU3xwTGJXGSoQkBJF
	rgoVHg4CvElU0DbBrYrMoOENH5YzH+vgwgJNypDNTMUTerS263d4lHGj4X1tbhAnM3R0=
X-Google-Smtp-Source: AGHT+IHHjKFVRY0n3ORvJ/3tCcnOK/FTC9oaQ2WPdkygTI1KPwN0ZyYuDsFX8L5lqzEAzGwyYH1SkQ==
X-Received: by 2002:a17:903:1b63:b0:234:986c:66bf with SMTP id d9443c01a7336-23f9814686cmr18960685ad.11.1753242179340;
        Tue, 22 Jul 2025 20:42:59 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4d47sm86197605ad.99.2025.07.22.20.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 20:42:58 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 23 Jul 2025 11:42:40 +0800
Subject: [PATCH v9 1/3] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-add-support-for-meta-clemente-bmc-v9-1-b76e7de4d6c8@fii-foxconn.com>
References: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
In-Reply-To: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753242171; l=933;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=UnfBA/U+nB3GVshcJhQl74M74uA3eyzQykqLq1TeLXk=;
 b=+GgM3+LvWhnm2FqtnNygp4YoEvMVXUlT8wog8dP/1q6l8MnZguge5Wl9WcS72UyfKkcvYZDhm
 2Jre0Fw6cIPC0FdWrh7UNQvuzjCapzC6NV2twAE8FkKulLeqiGmTJI+
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


