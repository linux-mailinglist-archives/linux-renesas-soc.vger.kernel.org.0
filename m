Return-Path: <linux-renesas-soc+bounces-23851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C57AAC1B33A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E55B71AA70B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163742494F0;
	Wed, 29 Oct 2025 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FL9ub4xw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294124DD17
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747111; cv=none; b=lvNRsPzKynNTi5lGES8nksHTqlmQtFcJjjlAL8fcdJs6Vyf4Q+g8bfBq+zRn5fRKSaEIyQHajNFG4Pwz7SEQ6vPelvz+SxMR+/cZFQ8s9nGZNMzAdheAmDfktvboTKy9NbnTMktOZ7oNVM5hioYzV27Wn9F/DE6nCOYVapTGsHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747111; c=relaxed/simple;
	bh=YxKCqDpzLn5hW98Qchc7Gw3CFI1BEe5qc1Eq+8M8wuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZomEK/6tkMPyG5bKWbXRARU/XZ+RikjAHHVyAvvYzL/TJNE7CokhInplzBzkbf59aOzkCTjxaR8FwF9ovIDEQduMePFHDrL4dEhc+kq98uVjmJQasAV9iwtzWPd+HNw/vViNA4QqCX9/o4er9lAe0jrNmGkgikWEwKLmCQOGm60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FL9ub4xw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so73221715e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761747106; x=1762351906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wps8Tclr//0cxda7/H585r6cl0r8XAUnNbHG7akvxZ0=;
        b=FL9ub4xw81uT7bxpRXQVouShbiViS6sfkFZcGKhnpHsSUKiaN66nDQtGkF63/W9/oK
         BgIZd/qGpqXTYGLR7LDMWDpzdwi4rhrjVol2T0e940tZ9psNX2KuEVi2UvRESX8fxxEk
         XREfUZ00eh2zaChw8CCEEbdatydCdC2G+zX5DnFFllQqxcNINNf/2o1vpR3gUbwlpQiw
         lzsswkgDphumpqd2ypZXb+12St7CLQJaXXe4kkN8TqHgp620q/FM/MyKWrzLoJJp4QP9
         j2IKwIBgOe+BlbDKwET3UV/qih7mqJHnf5fWE/DS00CBtFhEQg8VaOXZsOnMPcXgtjsU
         OqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747106; x=1762351906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wps8Tclr//0cxda7/H585r6cl0r8XAUnNbHG7akvxZ0=;
        b=lr1GxKTPp9cw0vqr8WA6D9MpXYPyiuYmjcmNkni1VFj9UE+MEilQUsF+vRc5f4ANdO
         EfQxTXTbpzBocZ+HHZnXbhYf1fCzszXFYIO5ocdPBRaJC/Up5SBZzztUb0Cotx0IhFxy
         Adp+/LtR2+QRQyRNx8Doysp8eeSchZDXOJ8UUwjPPD6+Evl4OtqdE3X2D0k7Q5ujY65u
         7ArkcLl4Q5gX/4cj9nnWwrN5o4m65QHw6P/gkIOQaKeK+K2Ox2+HGtNYhddNWa6B//QU
         sDzDaq/f22Q9V9tL+mIZe+243cAKhPqNSibgFtSKvsDZODnT7TYcM10UVgkP5ApcHDlY
         SFvA==
X-Forwarded-Encrypted: i=1; AJvYcCVAAkqKZLp+7yl1OcOrWBHkYnrka7gBFrRlRK0taBHtZSytYYTbKvWSbk/FpmeKBLB+3ZHkiK2taAFJMaFg20IAYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBV9Gr0GhAyF2V0kUvcW+WvxNnlfUpVhj+8p0LjpSC/jOOILvK
	2dzKg5N3PTxMsORl2HpTOoYwwNpxCMDe4ftdcmGsgJLTX/CdbO81gpfhMvgsQn08kpg=
X-Gm-Gg: ASbGnctU7tbzJqaZB4jAfBr7zM+as0jiyRLTMQdf9p2Abfeeut5tkQZcBLS5M21KGWG
	oE1UZxjSC7zZ9jc2BoyfCNWHvxv0p1oDoJB7LcwPX0SZi5nlDR11a1yG1Fn5zkPZVdMnhSMGodo
	qKpWx3wJAVucrMv9x+m2XPaBhd3bsZWZOVDtKfETDgFlEPK5ywXUr6W+DmLWZuWQbbTIFtNnWTx
	fGUHtYjo7oWHEjzL+Ni+v+Fcxoj+xmvsqzK4t1PJxt7tuzMAee36Ge35Bvw86RMk2VtmCn6fO2K
	hVaX5BRf1Odd18xWxZh3kMiNiDzFGZRDVgpWknRagz5/KTfKUEPspuIha/VohSaQAmYc+wiiEWC
	w/V3QBlZ9uqtOBK7kcW+r7OivA2uHvLuY7ulQlheFfh4Sm4zT+je9kq+ITlGgKnqPAq3hpBml1J
	Xn4UhlHkzLaL6DXsWF1pTl71O1i/apYUAys76LwCoJJvarL4cRhoyhdN+3FrKJtWhhsaCPvgs=
X-Google-Smtp-Source: AGHT+IEzlAZE9hRTmYR0/hE0kh5mGYt4Uwp8142hjLL8F6L5G9iVPPBs/x3dk7Iz3ZYqyRcAHD45KQ==
X-Received: by 2002:a05:600c:828d:b0:475:faaa:8620 with SMTP id 5b1f17b1804b1-4771e1ca0c9mr26073805e9.20.1761747105903;
        Wed, 29 Oct 2025 07:11:45 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9c6sm27076286f8f.36.2025.10.29.07.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:11:45 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: support.opensource@diasemi.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/2] ASoC: renesas: Fix clip sounds
Date: Wed, 29 Oct 2025 16:11:32 +0200
Message-ID: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
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

Series fixes clip sounds that are reproduced on suspend/resume, from time
to time, on the Renesas RZ/G3S SMARC Module + Renesas RZ Carrier II board.

Thank you,
Claudiu

Claudiu Beznea (2):
  ASoC: codecs: Use component driver suspend/resume
  ASoC: renesas: rz-ssi: Use proper dma_buffer_pos after resume

 sound/soc/codecs/da7213.c  | 38 +++++++++++++++++++++++++-------------
 sound/soc/renesas/rz-ssi.c | 25 ++++++++++++-------------
 2 files changed, 37 insertions(+), 26 deletions(-)

-- 
2.43.0


