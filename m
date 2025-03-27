Return-Path: <linux-renesas-soc+bounces-14916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9452A73202
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 13:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0F94163E36
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 12:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0DF213E6E;
	Thu, 27 Mar 2025 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLbKtmpD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894A42135DF;
	Thu, 27 Mar 2025 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077276; cv=none; b=E1bItNL2VQ3Hv7f8799fnTbp1HQ0RbP9EknZDmqfnhizk9WmBlvx1xvOyEhfOf1kQ87f8pdFlAi0k0YHdxecNuuFA2WgwA0JZzMrD42Pk8VrIIKuxiXqEKIWyD726kGxxpFW+mOxZrC1rjFKCyCYjSLTXOJMTbI4yR4ycyc+FOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077276; c=relaxed/simple;
	bh=31cwqsXDboDFu7UB5YRrEwDf2/2tXJWFw9tnZYSw9CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDmktdC4muqrtmKUljA24tfuKKJ5g7LI2EcZVwBjmej4lQ2hrkDTbUhNYI9AoC2YRv+IRu9kZRxk1A/gXOU+hlFh3osYr7HPMDfK9oJ6LgDokuD9xF9fXX98W58s9DaZthatq4MH1PaCwN8KeqXHzIug9ycZwNVOBili0EE+uaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLbKtmpD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so13694355e9.1;
        Thu, 27 Mar 2025 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743077273; x=1743682073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W0vU6rkDc0E72j8boTczW/He9uO3lUlGbaVxalRbzk=;
        b=NLbKtmpDNk2sQ/kh4OqA6+EY/dEXtvxMqE+vxB3bR78P/fLxRuxONueuj5XsODj5xI
         Du0jdJdrJdlKsonn3g6yw8Ff/CDd58avSDrCwkFd1dEtM7th99+Za9wVPdFLdtjYFrKB
         Y4luhYKMyjXCoTTVBxforSIFEbKi7/0nXGNS4nQ+9MO1vVvtp6RhhQ6N8Bppmnlsqa5M
         6/OXK1PaGT59kIVsagROnSRRBAmsZOXOZPZszpLDtmAjXFFiMgbvQTSXSuzsMY6DNrTW
         KpD2DIx5QwrHik1GxZ2WSjhSGNZgsRlmnoRPLTDd/RjeAGW7w6KfebSLR4KBKlMY4olV
         uJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077273; x=1743682073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W0vU6rkDc0E72j8boTczW/He9uO3lUlGbaVxalRbzk=;
        b=ucUgjPZrf54QUHbdI7CcGGsMdLE3133mfRglvkXOUyLcaHWkHtQPSLhOlX/0R6yVyO
         Mij5eED0o9PZO9/sogriNC4vhbnAlKUp14QKwVG+Pw3hB5UQL9qkwT9jhtR1aWnqzyAR
         VwVns0XrgtWEgL0C3l7JabvcKY5fUeBmL+o9vEmhalJ0sgjjaB7xvHLqr3D4fcHFbR9f
         NAma57Dg97SBSWGgxsdNAz8ADJjfj+jBMf+w7SJqp3RUpXXnPbSd1rijHgkSYxjwQzVM
         IDXsw6bPPIc0rW+gZa5OzRF0RBdEYmmU6/DrNGEVnuVbAzA/CMEgqKpebTGtbx/zwe0i
         sTcg==
X-Forwarded-Encrypted: i=1; AJvYcCU+wJQnLrMJ3+nBaygsFs+TbNJOLkPi3gulwcla1jtVwXcodEzQuwFSfV3KLHF4vXnY0qt70Xi6c4WI@vger.kernel.org, AJvYcCXUOqzq5tG5nEQRaHSAhK0RtgGqjph7VRpRtl/JnigiqIAq0a+FpDp3X3oF+lMX8cSW2F/AbzfV2mfHudo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO42VgL1heaRocv5E2H05ocnJuBMOUJxJT2miq1wA1yTqHVRFL
	Tu4yQTNkxPzy3LmvnmLO5hIvCqO8IHG7trjb9UkAA8h7csX4onZV
X-Gm-Gg: ASbGncuIjw1RRdg+wH9IehSf+9/FsiJGE2/JnxJYp/T/p1hKTu3wmyMbeLfQ4xENU3y
	x8VxVtXefkSZItefPFAQJys4VOLTr/ocbwcHC6stiVtIC4iKzlZUCUWFOCAeJVPR/WbaWKYRlrT
	6DDQBCmB5bJw57KLzrwZNoV1CKf2xVNpdWrJWoojadV/P1J9q/WYiGg3AhfNtcMrAXe/m43Y1N8
	djzgeGSmekygdI/JAk6rsGKXb0c9C38uuOGECvwPB8bo99q0Y9ihYxQ0PLIsvAvdKr6CaO2urQ+
	HzRy5BsJ5QqEkHAYc7BLpMppMfeB1qovo45KZXw2zhYKiUVYSY2c7XsnsUl4whM2jtAUDw==
X-Google-Smtp-Source: AGHT+IFGFLhQY541F1MT81ZGgQ4/EVOQEkohYUcbjz8cw1FYiBq/y5FUQr2Ohh5ELsVakc9OFDvSug==
X-Received: by 2002:a05:6000:1a88:b0:39a:c86d:e094 with SMTP id ffacd0b85a97d-39acc46dd0bmr6520332f8f.17.1743077272712;
        Thu, 27 Mar 2025 05:07:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ac9bsm35109955e9.12.2025.03.27.05.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:07:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-usb@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] usb: renesas_usbhs: Correct function reference in comment
Date: Thu, 27 Mar 2025 12:07:35 +0000
Message-ID: <20250327120737.230041-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the comment to reference `usbhs_mod_probe` instead of
`usbhs_mod_init`, as `usbhs_mod_probe` is the correct function
used in this context.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 4b35ef216125..15ef246a1245 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -698,7 +698,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto probe_end_fifo_exit;
 
-	/* dev_set_drvdata should be called after usbhs_mod_init */
+	/* dev_set_drvdata should be called after usbhs_mod_probe */
 	platform_set_drvdata(pdev, priv);
 
 	ret = reset_control_deassert(priv->rsts);
-- 
2.49.0


