Return-Path: <linux-renesas-soc+bounces-25292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8FAC8F804
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E71C5349428
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DE2337B9B;
	Thu, 27 Nov 2025 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzCflwam"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55B2C3253
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260696; cv=none; b=AFEeH/wmVpyCqDETelTlTF2RPa428M6Nlqxq1oqkC+1T8qHWDm1woae3X1AzAFjGvbyxS2tR3xDT3GTtNOQnzl6QYVAfwVew3dE1aBsbWNMuDXlPHVDtY+bLionSjbjiw6Cm3rbQmdVzIAmdo91NELm3TbCgHxDmXyJXQ8iDeYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260696; c=relaxed/simple;
	bh=+2ssuR9nID24u9Baq56sMCo+ozo/eEYAKwy09l9gohc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3DR4fwQRNDZtMLgJrph33gwk1/mWAgxv48gm8NHDFR7NRJA3QHsOyeE5dww7cHdrRYRhdJZmTNI4BwbeUJEnEeip/Iqk9MydjWX9oIQldKE0SHbmSbSrOvwAeJdKZ7URq/lLoORoFTZdCx0QQz2omDlcm22b1ReWRA4iM7gGxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzCflwam; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso6752475e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260693; x=1764865493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kugS4T1MGZu845lUHGPLn/vdcl2K5v8Cpxw1K4sscWQ=;
        b=BzCflwamGxIXyIunT3BC68w0U8uXodrkLvmjfCi0er68Ly5MT9dKpgFJCsoA4eRYBs
         3OFjp722nuKnbUt5CisXv7JpGqVd7JA5bltA0qjFNpoBdRFPjxCT6EJhKnh1+D+pHtix
         74fx9XP8QH/5gNaZLEAuwjN3XPEQprP68jsAI9BXyAlMRcp8k4alHo5RvfzR7MIS8jeo
         wn0vAirBIeIihioE0gJjJqNgSZo0D0eoLfia3Y8wfpcZ/HtTPbGeH/AeVhsmPfkqfnGS
         eNlo0tTYlEr3g0TG8y3jglaXrw9jHZD0NMgfLetJhT5RrllgoF+hkNbkGxn7W5oHH8MQ
         DjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260693; x=1764865493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kugS4T1MGZu845lUHGPLn/vdcl2K5v8Cpxw1K4sscWQ=;
        b=Jv3ES0cIsCMezWWp7EgTPh1wJuQ+BsPct1EroivBZaIVvD/E0SJHFVKKqji6gzAzKu
         7d3yGBIJNIvH+UNfeM0rTNATkqnUq+ewFEre4b1IkLspSFCojtVRRy8kkRVumCYFbYEQ
         w6ZmUkdoTEbr969tJSMhXbrtTtA7tgM16JtGtooSv3eLtN7ZWVAVeuZ/ipp8RYmNuzCD
         VVAXdrCfU5bFoMZfmvtYmkx1XiWydbR0+lyT4oMsVASL8JWYWFhZeoQcN1nACcIYRTAY
         sva6HPcUEsseXpTKOAIVRk8FiF11da6PuEwPB9mFUUQWWZHqcudlZ+yJnKsV0Z+GIsl5
         raoA==
X-Forwarded-Encrypted: i=1; AJvYcCVclYbmVCftXKRYs7gUZYjVaQcu6a1CqCeO3zzvtcIPAs4Od6CNCOvt5Cat0UhSaKmN+tebkpqO7zO+6zse2OmYNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ7a00TgOh0osKc8eo4V6xfkmNXFrRGJqDONOrw/Nj8G6iTE0I
	+XHQPvB47C9xYacxq6mPC7OnAynEXkgXNw8+o80+YjRf9z+KI0O5ZXFI
X-Gm-Gg: ASbGnct8+y7ppi6+TwalerSDJUa0UDbOBv+zvUySEWsdx3AVd4Iw/DolnC2NCfjZNpE
	DtYLlU+t8oDVBzNJUE2Eyfz/jHKhJfku3WeY6pD3siAoyPwyKshrUfaDfochYM4Nq/IASXKBIFE
	+F+pyaDW0Y58TlcqnPvbWbwz4R5NlRRRtt326XL3/KOJXjKkUoHqm1r/LnANfScppbP9DX8WXfN
	5dVDaOE/lC3JrAhqRYweie5Y6JREV51hex35EJyN4UW95IvI7AkCsmFEsZas3zACPXeAvQbxCbp
	DMu3dgbbHHQJ/13YXIjV431lEywNtSdkk2sXZchAey0mOPqWvyvXWEWzdmb3qFMLA1yYPH6sDYp
	pT1V8a4llUdsBeIXgS9fVh/oC45oAjnRy7PTYj+TUOaRIgZ0wJ2qlkFKQhmzF2DpqS4auy+Ox2D
	Z08/QFqxE58f1z2qUHDvWiiStetGEX9TKOfWdlltcxzZEs
X-Google-Smtp-Source: AGHT+IFDHJ8vG2Rb/zx0HGh3kpcWkL3GZIZ6o3WFo06Vm62lKG2pchLDnRQGyTs1ndV+4DH/+WjTNA==
X-Received: by 2002:a05:600c:1f8f:b0:477:3e0b:c0e3 with SMTP id 5b1f17b1804b1-477c01eba39mr222983055e9.32.1764260693217;
        Thu, 27 Nov 2025 08:24:53 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:4f24:123b:7b7f:5ea9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111565a1sm39163795e9.5.2025.11.27.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:24:52 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] irqchip: renesas: rzv2h-icu: Add support for RZ/V2N SoC
Date: Thu, 27 Nov 2025 16:24:47 +0000
Message-ID: <20251127162447.320971-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RZ/V2N Interrupt Control Unit (ICU) by introducing a
dedicated compatible string in the irqchip driver. While the RZ/V2N ICU
differs from the RZ/V2H(P) version in its register layout primarily due
to a reduced set of ECCRAM related registers the irqchip driver does not
currently access these registers.

As a result, the RZ/V2N ICU can be safely handled by rzv2h_icu_probe for
now, but it still requires a distinct compatible so that future changes
can differentiate the SoCs when needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/irqchip/irq-renesas-rzv2h.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 899a423b5da8..0c44b6109842 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -616,6 +616,7 @@ static int rzv2h_icu_probe(struct platform_device *pdev, struct device_node *par
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
 IRQCHIP_MATCH("renesas,r9a09g047-icu", rzg3e_icu_probe)
+IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2h_icu_probe)
 IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_probe)
 IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
 MODULE_AUTHOR("Fabrizio Castro <fabrizio.castro.jz@renesas.com>");
-- 
2.52.0


