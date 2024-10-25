Return-Path: <linux-renesas-soc+bounces-10154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 094549B074D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 17:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C229F2815B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 15:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AA221895B;
	Fri, 25 Oct 2024 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yakc96jM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A53B21892A;
	Fri, 25 Oct 2024 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868731; cv=none; b=iYRGU4qmugKFJg/hIQl8JOsaEt0hD/LC/9gmyrNJvm74Fo+YSyKtmCR6ve1v5+3ClhKEe5W8BKFEs/BkrKP+NI7l+wskOQLPzfAVesBqc+wb1n+BF9+Lz3qfn4E4F0flAORHgw2T/e0Sc2yL85RtHZnLm81Ng2FTSn0SkFWpLBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868731; c=relaxed/simple;
	bh=ieidjccXhzvVHRfKMptUC3kls1NypHCKk3IU2lAs/Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJG1f0MltqZ8N/HsqCu3oTcQRjJN4pMjAYLpk1to09WjxJIMEBJwMTegU1FFW1112isS6aBTqmnfN6fWzKi1/1RlFcs7wz5hCpO6coQ6v3AODIpGPN3BQyC5N6hEB0PxnOcbXdEZsZ5VMiJz0yfA9RsXnvy9yh4h2HdAOArI4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yakc96jM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so21622125e9.1;
        Fri, 25 Oct 2024 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868724; x=1730473524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBBO1Lebj5/SaQn2Hdwm1c+s0lJXbMJ34ohLpI/cDaw=;
        b=Yakc96jMQdOh0BgAZDqRmrMuay6Hoja/9ljlfzXCdrB+0Bgp6+eCteazrjOBTfx6m6
         C9eHkKCV6bNCJSXwMTXV25QRBTO0QoIj6i8kdhAPMt2iKkGWTt0FVJ+vyLUnbwMJODmN
         BbW8ie0RJY8LVEQKz/I07gdcV6eEF+tBz1/sw/Ol/Xks0lrGuCHyNlDclZMU2SWqHmFJ
         RsjDAqeCsOtkivOHlu59KVZJHcdid0SlPcDDxUzEQovnyopOF26UBqg0KyXw4RrlXN4C
         mJM8N6VfR7oZTf52VmotYEQXP3/L6aKayBjs5WpaMFEbFB76r6+r92axdGBEZj+nPQj+
         mM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868724; x=1730473524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBBO1Lebj5/SaQn2Hdwm1c+s0lJXbMJ34ohLpI/cDaw=;
        b=jzo4pCz4g59Fy+Q35OQ6TCKlIjVaLKjzk4sEm8gKt/MKF72rP9/0ObqFV5HlYe+hoe
         Jl0B0jIlyy6uNjo6YfhxDqYNxd4/OsbUq5NG0EORsbFgGoDL/jNWd3lfXUYSNvfU/q/W
         wVmmlmYGK2ixVCeav26Es4Adhnj7vzafxRMuZmcvcphcpLyNZ/RdM4KJ+YtCUCIXzvOO
         QK+P8jlHugMudFT+5r/WPChHG+CQrO5GRnbgmtQfEzrzuohsVin5ZeE8tpVRjAMc+09F
         XHQ+r8HR3s9LsL+r0IK/msRC9JIHTMKd6B9WXfRDMqsq8hOvkvZ5J5zD2aDfJY8fkISS
         FVOg==
X-Forwarded-Encrypted: i=1; AJvYcCWv64jI+WtJqWUvfwAIWzdnmBrBUwhORObIBl1Gg2yQDTDmX1wtsrR3NjD+uAKybBBhhUsBw3tKYZYJTQE=@vger.kernel.org, AJvYcCXVN3wBoxtPeQVE1ramWoyF/U/eRA4xzcLVBYGZu6NQR+4ONVTHRqnnO3zsQijdDf4PAT3p0Ls8yfoLAFeS0ewf7ME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzvtxi82Foj9zjWUKbIwaJovANKEsHK8q5iSDq/6pVGjQQP8n6
	EJwj2cF4eY5omjlIMTN1lWMpEFSsDJOmYcUfVZYIflgb4LN661C1
X-Google-Smtp-Source: AGHT+IE1Ooq4uxdshy/Gw09lywlvjoh6XLYrlE0NY9i4/adMvTDm5eMWSpYau2tMMzMHaVStDxJTtQ==
X-Received: by 2002:adf:f452:0:b0:37d:54d0:1f20 with SMTP id ffacd0b85a97d-37efcf0c295mr6876807f8f.24.1729868724271;
        Fri, 25 Oct 2024 08:05:24 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3b57bsm1764349f8f.26.2024.10.25.08.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 5/5] MAINTAINERS: Add entry for Renesas RZ ASoC driver
Date: Fri, 25 Oct 2024 16:05:11 +0100
Message-ID: <20241025150511.722040-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new entry to the MAINTAINERS file for Renesas RZ ASoC driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 041df0410e81..9e8a17623486 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19734,6 +19734,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,riic.yaml
 F:	drivers/i2c/busses/i2c-riic.c
 
+RENESAS RZ AUDIO (ASoC) DRIVER
+M:	Biju Das <biju.das.jz@bp.renesas.com>
+M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+L:	linux-sound@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+F:	sound/soc/renesas/rz-ssi.c
+
 RENESAS RZ/G2L A/D DRIVER
 M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 L:	linux-iio@vger.kernel.org
-- 
2.43.0


