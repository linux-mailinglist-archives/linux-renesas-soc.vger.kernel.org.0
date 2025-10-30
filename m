Return-Path: <linux-renesas-soc+bounces-23914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66470C21957
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32ADD4EEA30
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B68836CE12;
	Thu, 30 Oct 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XR9NB8fi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E99E36C257
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846936; cv=none; b=ZNB24XiCZnBPnRlKfQsGlCWlUczdxiQsQMyZzUsYfH0+PI10eQYiUUsO6/u3UB44dy5cpAIbR0m+4/FRBla9YHS4TH5Ap0eDC3r7ojkgpK7T79M6uaYms1nS6fUJeIgvg0rZo0NzdF20sdAiFUQ03ETZ6WwMloklO60a9eLYcwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846936; c=relaxed/simple;
	bh=h/WB+hR/anHyT+SzoBQFwmDv8A8kpm7m3RVwaDTL2qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KD5xUk8niLrfvQ3AZa8AAJx1h4zXVlNEz8nHxupsRr7sH9Fno4PiBfTqKWZt8JwR0oXpZKumlVpElQkiO2MFrO1ZiR806NxvLNLuZtHCbQVi0X7tKfuMMqsN2k1YE7xuf2np/RR0tzS5pWra7U7EtJcQTCVaneB6ZQf+pqy26xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XR9NB8fi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so844727f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846932; x=1762451732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpqM7R8t1LjT1e31UVuLTSZ7tEVjNoHsGLOYlh8Q1Lk=;
        b=XR9NB8fi7Ziaui3V5/Wqg92z4H6KHvGsDgot4efrfCicu4b6E9JG1GunqqicPpbytQ
         DBUDXRK58bzGbLWo+u51FfhthD7497PQP7KznEHsxfpeQZ2/iSdQAjkqQNScZpjrX6wa
         oUcmFGGNxhQeu3w2n5Zh1wrpcDl8OR0Hz17wmo0jdxG5br8CMWU21e1CyVaxTE/RYnIb
         b+SJnM0aO9D1LGztZ4TcBlGmagL5Z5suBfCQIOu2Jk+90Mwr4ZJ6zdH8u++q9rE18OIH
         T73s4BmFauPBN5nf5kczm7A+DG33vS32inm9lKDZnD1jgWvKIADflChcN0NJqZL4VduA
         nJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846932; x=1762451732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpqM7R8t1LjT1e31UVuLTSZ7tEVjNoHsGLOYlh8Q1Lk=;
        b=ObUF0s1GSOKbTne5YSPkORV5tRrRNnQ3rj2OUe3OqTcj0aiN5trqKSpAX8PQo5naF6
         uB7cFWfXfgh54bZ0dgR6m0c4ga8p55/g4NnsDYDs80mqqgsPRdKkjsmmyM5mwRzXoMOo
         6n0hIqZAR589q+22eiasSh+fjJEdXl/Kbj38OQOgMdyk4LB9vM95CWJKRj2XtlZpH1Vf
         O/o4IC1d5ovpnJCkfCWWsZTl77adwB+/L/AOJKA4wYkYSKJvM76YZ/DLrvrB/Wp3qsyG
         etMLWcZW4WxP8i+lkozroacsTBFy6mnDOg1GeF3p63JfNTOvHVHmdiZqtLzJ0OxxESh9
         yx5w==
X-Forwarded-Encrypted: i=1; AJvYcCVskzRmIKDW+fftd2p4jVSrfMO31UHIW1xxHBd6oH8r3sWhVLRP3ZECW5qhsHW/5/53iI8bIufUu1Iuyn9Okuw+sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9P023FVjrfXaVk0AcHW0MYhi65XrPQaE5EGdZMOxFmaoJ8cGX
	u0qSTRwnsa7V+nlntiiw3zq9BCo7tn3O0GvP9J+rJN/mooOUahtiLIw+1HqqNfWH
X-Gm-Gg: ASbGncsSCfsZeZQfpZD0nn5clyYgDt+qqepdymLYDlTzRG7PqoUoHKcv2h6i74x9KjQ
	TXSWFL0LuOkx4Q6LMjsTHFkWYyd/K/Cvb8r2wJpV9zXZkYbDOKgD9xVy4hugCCGOcAq2TnoSfXg
	xrAA2uqtufh+l2aNCbveK8dluXnV/Y0DclViOKQHKpdPqs6RXz0E9Nu4zZbSz+QC36xfSEvC56h
	rLVOgqAFMqDiyTqNcH68glui70d/dpuUxpssfONU1QDafy9jmMkErWACyzYbBBCzTwGKnL8/a6+
	XBKNtXT6uivfSqMGXpLFj1MKuaYS/xINkUuKy7ca1HT2wjcBMnCB95HngDX45Yr4ou/nWK5519b
	JjwugPwosHIqnXvJYG3lSuZP0HlFxKUZOnkDYDeQ5wwCbsDauG2vBESZmNyw0yf5J5iqfXE95KM
	eKhzPOmJOob6hZ29aPaxFcXFmLU6zXfBbhYAUzG7qSFUOwWxfTEJr+HWjLdAd4LovFiTKIFLE=
X-Google-Smtp-Source: AGHT+IFB4CtW/QHwxBewuQQ+kfNYXHph8zhhcP0AJhTDvVbB8Po9WDTizjGc7lFwCMRyRyZ8mFCw8Q==
X-Received: by 2002:a05:6000:24c3:b0:3e8:ee5d:f31e with SMTP id ffacd0b85a97d-429bd68376cmr479687f8f.25.1761846931811;
        Thu, 30 Oct 2025 10:55:31 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:31 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/13] serial: sh-sci: Use devm_reset_control_array_get_exclusive()
Date: Thu, 30 Oct 2025 17:55:10 +0000
Message-ID: <20251030175526.607006-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e9345f898224..d07424caeeab 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3533,7 +3533,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 
 	data = of_device_get_match_data(&pdev->dev);
 
-	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	rstc = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
 	if (IS_ERR(rstc))
 		return ERR_PTR(dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 					     "failed to get reset ctrl\n"));
-- 
2.43.0


