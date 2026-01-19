Return-Path: <linux-renesas-soc+bounces-27073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E232D3B7A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 297043000DDE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21731299948;
	Mon, 19 Jan 2026 19:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="R1aTZ08R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16821ABC1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852393; cv=none; b=TbURTSNh6cOvHHvlApp1V1RmSKUmQQVzo9JDOdK69e4pZnh+vwQVrs6i803RQMNfFvHhm1+fWKr/E4QWlVbrAB3tyFJk4ZycDjcQkXyP9aFlbV9IPQqnMNvMDGlIHFaf8SiI1dKaMXtPo0QJnmg0tinw2/mvb8ogj+77O/ZMgZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852393; c=relaxed/simple;
	bh=cCOGMatOjCygJhaLm5dX8JbCRPMR6iiz7g0izRcmSi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ozjaJDl6Fummlc0Q7ymI47mjgKw6bjiC8/fBHyiqSYaLrZYv4Y8kqo4rTs6WM+a3h6oHO5MBi5omfebEziLwDqIuV3qVCrynbIoubDdtXa5zp6OP4Ldb1Z3pQ0BcRVxlql3uGXYXTs7pgnemyfBbLE96igrNg1EjJSaFqIE0lxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=R1aTZ08R; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8718187eb6so711134466b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852390; x=1769457190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=62M9fYxW6bxhQFoqWyOWxOUBKTY2WZNqWwY8w9HHiSM=;
        b=R1aTZ08RH6ZHNku6iw0E1BRVrnMJI0KDgf1o+dYgDGhb1W0yZcDd+CAt1IKExp/TTD
         lgD85kummfkh03GSsOORCmhRtRDq7FuFEFvCk3UrTIyl5y0G10BOzBpstK8V0cS6k5fV
         sxOjxBmAeMV6D4xmCMG2TBnw5T5cGxdJV8WklwStt1hezoXWA7Brq5oNuV2X6o8QcSiH
         bL0SRUmGWNxm3DtbCvFxbYEhR13mU7M8/Pv7Rr7AOAsLTDkaFsPRHL4UodP54JFvk9rG
         QzSwxE+rK+ewNoYLhjLqHrew5ppyyavq37+hDgOjFDEpr/XgV39/RYUhSp3o6Du1bLio
         hUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852390; x=1769457190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62M9fYxW6bxhQFoqWyOWxOUBKTY2WZNqWwY8w9HHiSM=;
        b=a9WiuJiyexk2TsksSnTFIfRUKcE3wZyqjtS4LGsrfYtgMKrlfAgdt+0WCgjtEmmmKh
         eKh7PMSpre/LwQ6YcfLjAkd+dYt9dmlj51La26JUJ4RrIykM0K8gWwpxo6CSiocSVEKT
         Eltvue3bWrN5UtvuIqkXBW4/Zkwm8lCMDTJm7mqgDw35n+IDFO+PmFACoeeOXNadrwgp
         Typ03cZfcOAw5HQ1eYgdIHEV7fY4Ux0oHbO7vP/AxX87JijYQcBjYSd3/fOGO9rqXSus
         LHAOy+6JLxJJkpAEbDb8F7FqrAFn5UoPvVPAgvORPZ1K3wuCG4dS7wDlZ1wUNeDFQeW/
         x49A==
X-Forwarded-Encrypted: i=1; AJvYcCXzJsJPXvUTtCaCH8aCA4KaW6BZ7A4S7oO4h44GUsqtKipB23+23veuBjqXdjPMHJ3xjr5F05BTuS15qP/jTlLTWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/1hS2QIhWmQqYKJ2QRz+ohY+hm4lmlU0gzzzf3Caat9tUC9JY
	g0oO70eyUZLgQHKCA4Stc9C3UVdvtHy9prHoDbLX81cB06/jbIcqx1mY7Rpn4A5tva8=
X-Gm-Gg: AY/fxX6ZnTcbK8BynKks6aojGZQYDBpJR7CTJykuVnb/nsPwRWCINrivyqdguWvu0he
	GXGR/jzXUS+uC3pF4GOB1bAm2tQ8876R2JCYmbpqpbN36PtIDvebmMBcH+smrdbl7k3m8QqOw/n
	AMt8Yu7keJFQrIZdRFWdnyv93nWlRsdEJPdKCELlD2g8IfI6IS9xdoiY675JJd/kDCEmJu/VArz
	aMLmkyOm8v1/pC8OersSQokPQk7fKUluXnrYdrfPlagGMfCM8naphw19emaOEdamGr99yToktaQ
	8Owz7JaHecSU5Hk1EdGYP1bvTTF3AHwxGOIvrgC5oDSliXZGQ+vtdv+hbOjyIYkaDYRVFASM/oq
	zlsXbqM/Qxgu2oP7RmbJid48TIZmUsKTLyNrgqjsHoXEFwT/HGpqDINxNTIB9y7yN5OoRk7FNCU
	NIJpxHQNBUamyh9yohn17kR5HnLrhWc6Szp65CBy4=
X-Received: by 2002:a17:907:2d09:b0:b86:e938:1b3a with SMTP id a640c23a62f3a-b8792e37fc8mr1025443766b.17.1768852389914;
        Mon, 19 Jan 2026 11:53:09 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:09 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/4] ASoC: renesas: rz-ssi: Cleanups
Date: Mon, 19 Jan 2026 21:52:48 +0200
Message-ID: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
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

This series adds cleanups for the Renesas RZ SSI driver.

Thank you,
Claudiu

Claudiu Beznea (4):
  ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()
  ASoC: renesas: rz-ssi: Drop unnecessary if condition
  ASoC: renesas: rz-ssi: Drop the & operator in front of function name
  ASoC: renesas: rz-ssi: Drop goto label

 sound/soc/renesas/rz-ssi.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

-- 
2.43.0


