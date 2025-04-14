Return-Path: <linux-renesas-soc+bounces-15923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 241B4A88635
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6342C16995A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A0525392C;
	Mon, 14 Apr 2025 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrvMUCEu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6EB23D2A9;
	Mon, 14 Apr 2025 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642688; cv=none; b=icPd0tbixe4BcSOj3q94oYxPdMucn3htUsrqn/vOqt8jGiz2R6xeMA92duZ5ZYzlbrw+CRcvcE9OdOC43e6g5ME0AL0X6tKG4kmpnZlUpTszez69ck3TmEZoSy2+pjAWmKdClkqHFx9VwaDp7zX9IBMB3Q6DbBV0dHe4iQtqiBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642688; c=relaxed/simple;
	bh=WpJMrP24Y29R8iyQiFWSEKIjSFDqYx5qk3yQINMuAdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJGKPfXt+uEIpIGoFBnKFW47X8kv2UDXDJkd/E6i0JsTfHlz7S0lamjqZeqeNLE7eBBYdPiCAxrE26wC9XbsqtuzoFxTm4pg1zH4iyDmusv40cSUQzdV7CbVVbaIMWW2GLUgq0WfghPLgXqv2eNbVtSBFFrzW0lCQiaB7jMXBhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrvMUCEu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4159909f8f.2;
        Mon, 14 Apr 2025 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642684; x=1745247484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6LNIjk4+CQR7WYivVqEj1OTKKERr/w582iehRk3oAk=;
        b=YrvMUCEu0Oa0WMRIyyonIme88O2iNCC9IFDrGEe1nNV9JZYFyf4MH4W7wvKy+QVpUd
         x4GbNvz7dqGLc55kfUfTmWJZgotBntMxEazyS6RfMKsLASZt+C4fvnt3+xC69W0d431a
         57a7ljuXdzCzcNS82xMIQK8k38C60u6FyCztjXypiLXoBL4ts2Kz/tkwr6hI7NrKpCGw
         RsShnwB4I3k72wvd+keSFh1YVbfBVCwb1rvzcnYWnTJAiC+VPYJfxVEA8AWT4o9inPPK
         0Pk+IawxcSdmBFgCgCaNMvFKKnU9toUPQUFTDNffHr5bdDOE1ar7ahKeyGuF2qjB8MZT
         IW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642684; x=1745247484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6LNIjk4+CQR7WYivVqEj1OTKKERr/w582iehRk3oAk=;
        b=E62SEFLYrp8MdqIcBjmrEnOlKxI51ySJzInR8SjUPoD/+LCAhBPBwmLWwo5kN0sGYF
         qth8ccc8lTf5wNObikfgEFIX2lT5MISeKvYEI5x2HSm3Z898R3Gc2jK5PajSOXTHTJjv
         jk3Ag2BZSLcCCCFokicllzZQWFxFc6ATt7dKVuYPAUf/EHymfWMzj593R6CUqvPgjOxL
         up8p23fIHVtqdpOh0YiYLDBAtWGp0UqktySmFbfgDTbIwVjFmhEQMs8iBkHuWizMF9fS
         /SHoMGI4hFv0Tkksf88nfFmbfyPzOwBCrlCRRXn0GWY+ad4KQapIpViASh+Ev5eqwB9R
         dclw==
X-Forwarded-Encrypted: i=1; AJvYcCUX/jtV0yVCaOmsQoP4lm/HxZAF1nh0Xyn4f+B3nzpEKwYhMYJt9Gwp4iJ5vqiqLkpoou4bL3laI5mPZKp9TdJH3YE=@vger.kernel.org, AJvYcCW/rk/PVR37BWnCJuZQ9qXD1E97LSHtYw0f6eWjz5oUrrbcwPpXx7TjgFsV30ls6x3ys0TDyKN123hv@vger.kernel.org, AJvYcCW53G4J9YVqKFVvzmLGweRz/qvohylvZ43/mFyfUOWhD/qyAUPQN5NxL0Kej6H13lm8iHlGYVPQRLTg8gsn@vger.kernel.org
X-Gm-Message-State: AOJu0YwkCwCavg2mFNzExQoGiB5OMKvwgHL7yRqfc7Yg4MDExqj4I9qF
	Jy7WTZ6BIaO5Bke/7gEoc1ypD8k0burIzrA5mV5FRjBziQsKR8gN
X-Gm-Gg: ASbGnctv/QlzDZWyv2m4SNFLgQ5rLkmgqWYKEMi1lFPa+UDpgdpIAPxG7wRGgBzb8Ea
	yME89PVuwYEXCcPE6cyKzhaj9a7OBGsBaaVMFieRb1SQCBWmp1AiUCtCKpCC2mp9d18N5zRF+iM
	zjXvZS7khBUCgNu6tkjxSAmInXjNx0yyJ6yFgUDLuy8N/Bw2sAeyJEt49naDOBnCVD0S483GPij
	DeQ3e621cYja4vZhDWEAgFQIEvMTS8pFrdAxEc/XbzgxbCifv3sPiu/pv7YN6+SbXhcwyOjwpXu
	cjCCLKdLraDGe2PqmhVQ1+e1FsExD7kdL3jwQ9e0hWVNX39kwNZZyVzLFPe3Au3B
X-Google-Smtp-Source: AGHT+IEPz5C0J8GbuZJl8OnkFachiw/6N2wZesYOBPtnyjvfbgxyv2oJ2wOoDuHtbMr02fQDOmG88Q==
X-Received: by 2002:a05:6000:18ac:b0:391:2d61:4561 with SMTP id ffacd0b85a97d-39ea51ee713mr9265668f8f.6.1744642684379;
        Mon, 14 Apr 2025 07:58:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bdf9sm11067041f8f.22.2025.04.14.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: phy: renesas,usb2-phy: Add clock constraint for RZ/G2L family
Date: Mon, 14 Apr 2025 15:57:26 +0100
Message-ID: <20250414145729.343133-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2L family requires two clocks for USB2 PHY, which are already
defined in the DTSI files. Add a constraint in the DT binding document
to ensure validation with `dtbs_check`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index af275cea3456..f8d15f239b18 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -107,6 +107,9 @@ allOf:
           contains:
             const: renesas,rzg2l-usb2-phy
     then:
+      properties:
+        clocks:
+          minItems: 2
       required:
         - resets
 
-- 
2.49.0


