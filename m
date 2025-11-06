Return-Path: <linux-renesas-soc+bounces-24256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCDDC3BCDF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C4D634F4F18
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 14:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3D4345750;
	Thu,  6 Nov 2025 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gUOZaJfz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2249C345730
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439624; cv=none; b=hih/PFAZ4JkADx+flZ4DLZ9vioNpGXRPmReAOkuVw99xIqIbGa6RFLOOY6Vt/VAkDOSe4yfT85gOqUa1iMUgX7HpFxGzinXgkvtsglS9Vppuz6LIZcEsgH0TRbHj4Xu03jCXaIo4CE+imlWY2t51FLZ948GM/+1GHVSU8zZb4Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439624; c=relaxed/simple;
	bh=FRH8KxX+aaghZgdbZDYvQy3T8pQdGJSOIegb7HwAmPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aI/9l40Nesv/PIq3mftH0dkDeO9HAN9d1lXiGposgdQSf5lBEwQa5aX46j9U0uhw+Bzk7m9oLbC5SwLLdYH58q5nsnXAZSysfqjhj1JbQIMrM9EoN6X7Thdb6YAKzvSRzfMuMhfzuVUhpfOo+STnCJR165ur8eJZtvjRrzg0EaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gUOZaJfz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so9162795e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762439619; x=1763044419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuidE0a2dKfVWIKlkxeWcF5Yy+eJEP448+dchNRz5GU=;
        b=gUOZaJfzMW1G1rsA4Br8q4VxKpcf4U5qAepotp81ne8F3gzTK/1VKsiYI9eFwCEysy
         4I6SrCC3ouGKuxQjnmjCVEqhKPWtSQvGBMh2No/xNruYGo1nkOg7VVcXteciMRBMgfwU
         6XmoO86cXOEyQEPXIEs2yjg2ImCxwX4DKY61uDigfOkS2upYIXBtdnSgn+Rz/ika5wNs
         39dMWxUPloizTDGQc1rxv+/4BjURe48GCl/eNRgoYxYFWOdN3iEOBpKbev+ldOK1Ml4v
         2Or8zUOMSmNoLY+8J2x3XQxmKScURFzR7GojwvGka8Q6bVjlkH0v08BG+rmzQqDPWpxc
         fHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439619; x=1763044419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuidE0a2dKfVWIKlkxeWcF5Yy+eJEP448+dchNRz5GU=;
        b=Yjvls8s5MVp8o08dEeDXRgFBVF1D0tOIg8Rx+S6fyBjt7fLb9OBsM3iI2rBD+qqIaR
         W+LlR53liuuoYWcmv2K1OHHEhqkmBp5iT0rIMqLobbwsuRXvnSpc7iZSTCmUDssxb2fh
         VE9Nwgsgq9FC1saIPCAWzmP02UFY4RoucfMYkr+m+7w0nCjDWHKFI0jMMeKX5cJqCnzo
         zULuxDAl1j7P0WugK1W22RnrhhGsBccYcEpQasBni/JQFVdRmWszp0N+ISm6AFQSj2eH
         ofhg7XOmNCekysNgSSX7eddineodya7DmuF2uRAifeuiEsj04kPsZnFKJ7BigR1g9YtU
         fsPw==
X-Forwarded-Encrypted: i=1; AJvYcCXOzwIEudT1v49rlBeXSjcYzEaqDqsshDBptQHb3U+legBa9WQ6c41kIO/VsHN6ImfNJExJ3pyj3l+nbGryzg7G+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5TmoFVsMvRJQcsplkcnzamqSzC75YDT/aOAuO5SyrcArJZVpp
	4NvFM5iFWl9uiS6oWrSqqO8MHAJxGmgPKWTNIreT/EnwYecyc5KAc8+ka063oFRv5NAHOiH2gIB
	0LWb9CXo=
X-Gm-Gg: ASbGncvHV0HQCYy34pQIr9HJs7yUQnwvcXoiDQu7TQbHyTuFEUUBKR0RRDlxyKzGB7A
	0uv4RGQGQhPnPwM9fWnquXm9uDpveqsrA0e0ZU1F4JejRoDArcnxyYwwCkQltpt93oZ2NRAnt3p
	CofV+smLee6i9TW2qUZtTMY/U1wwNutJeUN/bufT8pXDcA0wTDrxMB/1r4igheZWZJTuKB9RFsk
	OVjBud3+p/IlEafxMsVni+geg9Vy4VtjfZEL38gjLKiRKKfmLbTkm/tiC0l2CHsr+OvIoGkVX34
	8DtqDriYvIkZ1HNCGFt7Rwe4Ho6zcs8mbIC0FaZ9lb06KXttxWD4xbhkT1IAR1r7o5eszaNmA2S
	FIqta13hsDvUHNJ/UhEQUdjolQO1hniqKY/F2WPsMYF0dD3aLrKlfSLC4IOuEAapp/oh17DYdND
	fLpU89gW4gggsYkFPrMWSgYe2UAupUx3U9+VXE3sLy
X-Google-Smtp-Source: AGHT+IEGCXOaTbxgHVwN2bpZ3oM5GcbXhrmW5LLT6uPbqG7RyvXMo96EsCuQUlDfDivHug04wVefxg==
X-Received: by 2002:a05:600c:528d:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-4775ce15009mr86631365e9.32.1762439619485;
        Thu, 06 Nov 2025 06:33:39 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477622661c4sm50001595e9.0.2025.11.06.06.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:33:38 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM support
Date: Thu,  6 Nov 2025 16:33:25 +0200
Message-ID: <20251106143327.3049052-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds suspend to RAM support to the rzg2l-usbphy-ctrl driver.
Patch 1/2 is a preparatory change to avoid suppressing any
configuration errors.

Thank you,
Claudiu

Claudiu Beznea (2):
  reset: rzg2l-usbphy-ctrl: Propagate the return value of
    regmap_field_update_bits()
  reset: rzg2l-usbphy-ctrl: Add suspend/resume support

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 105 +++++++++++++++++++-----
 1 file changed, 86 insertions(+), 19 deletions(-)

-- 
2.43.0


