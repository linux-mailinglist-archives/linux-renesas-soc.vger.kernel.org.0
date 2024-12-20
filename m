Return-Path: <linux-renesas-soc+bounces-11596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5737B9F8B14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 05:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 564081894668
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 04:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFF886334;
	Fri, 20 Dec 2024 04:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="M3L6Ozy/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B18374C4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 04:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734668230; cv=none; b=PbCbalxRtdKeWkvL3bfvkvM78mrNfRNgXdh5yfaIEcI6LB7TnMGJyunFpsWW0CNMF2PMbSd5ylDmz5eOkeYAEQaqQvOfH1Ta7Aqate60qczB2TPhTSPrieuYEAAjPcR6LbtaPhmu85R1kmJ5sJ3gtbRo6pwykYZ27JRZXBKyMGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734668230; c=relaxed/simple;
	bh=RT07yzo82VgnOLgnzIwCLH/Ph+ly8TDmbW5eT7fDV64=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X6+pp7VaDYjkZTceGO/7XUx/fDufje/pzYlHbtQ5atzRtvhKwOasQaQ9/ryF5JRIiT4AanlAGY+ShiBgLNTI8L/nUtSpSLx2HcetPEKzs6i2Aj1VBs4D51pakM5l9XEa2Jneb3huidQf6A5yHVLtLpn+/44or1RlpGqVGNGvQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=M3L6Ozy/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401c68b89eso1678727e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 20:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734668226; x=1735273026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qUR6QxjH/XKpq6/uxgbPtVelmv0GEa1mOlsKd9dqvck=;
        b=M3L6Ozy/Wgaq5XwFrRXOPhRu9zB40Ofg6Z0PohX1qEQQwUiVXcnrI+PoEryTGdWBvg
         PK3OsvWeh8mPk72VnKSbdWHpqCT2/69Z59/6pywy/STpRv2TlPsJHmEbkPrmUa4yPQ5F
         UMoEpIWVNE2nXQthrY5R79T6nrU+tj3Li3TXNuxV8zomFBoIZe2ITmJ4D4CtRsJHZQj4
         V2DOJ+ieXLkaUhhRnjeFmFKbXj2Lt+krDHN6hTe3ksmTXyMDgc4E9XqIgr59cEEurMl9
         uFzmyY81J3Iq6M4WZFn2wwkhLlLlnPqaK54JWq3r/XRlqtaBpCSnYU1jyddL+p1Py/QI
         JsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734668226; x=1735273026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUR6QxjH/XKpq6/uxgbPtVelmv0GEa1mOlsKd9dqvck=;
        b=UIHX33oBnroESX1LMHYVZHmYoqeq87gX/XA3gm+zBfk8Csl9r0Kph1y/93dGqXwesV
         AivEp6UXjcjDvm20kHG4eVwu7p2YL2IsSiTH/cG78o5hpwbAqqi6ZMTjUW9JF+Ozsjqw
         uDEN/ic3MTCY+DlrzSoHbynqhpRNidazvlyJqipUfjekrsDlNF1WH6wcCLvrEWLCgl4Z
         71WLR6GSofZC+vQ62OnzxCokVyLLHu4sTJWQU3186bV5QbPve2mNS3qTG8RWZgw7cqqZ
         9UWD/Vn4Esc8W8LlZlmmSLJ3e2qGmmKvFZMXUGWcgLOszdeneMJLQ308Ow6u60vRcclB
         DPSA==
X-Forwarded-Encrypted: i=1; AJvYcCUMHRdKk3ahSxUy01xmOlGAtNLmwTX0kwSut+kSQMWY0qubQL6gk5ftVQwC4Rh8Yh77NgY/ZayRtmiG7oLJB3wJoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjG6vY/1Un5uOx2pYjyegEfHk1zEOw/6svPEWiaVs54UcETACv
	l7O8UxVGvO5kzj2gp4SMneEecPX4nvewKDjbTNIHKWlpMcgQFN4FLcBdRpdvQOM=
X-Gm-Gg: ASbGncvXKV9n9mzUa+gjWcJ4g/Radxd5hRlr+1HYsNTPezxC+ekB6uf2x3NlCN0iCyJ
	O+YPphVYLCUKVo2FHHpojSOZm1ogqavDoDYDRyYPx87pfQUIo2V4pIKvRoTdKFhQ9b6yNZjR2dC
	Xib4OhGzcgZ0a3Bqc9nmRNxL+ltU+kgKgub/rxnAvdCm04uNK26t5rET0C7u7a/st19irT/ERJr
	6f+oCTFlMv6jgyWzsQgAXgXTQaeh9DhLlZNIyb8yu3JkzBG5XnrPuXkiYQDy+6KcFlq7XM=
X-Google-Smtp-Source: AGHT+IFou583DBvKBiY/GjCG1N580/eBnCfNksmDMwsIjhIaqx1DSBeDG7vU0yCMAN6wyGXxTRsoqw==
X-Received: by 2002:a05:6512:1246:b0:53d:f769:14cb with SMTP id 2adb3069b0e04-5422944350cmr292136e87.9.1734668225237;
        Thu, 19 Dec 2024 20:17:05 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c1bsm357078e87.280.2024.12.19.20.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 20:17:04 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net-next 0/2] net: renesas: rswitch: update irq handling
Date: Fri, 20 Dec 2024 09:16:57 +0500
Message-Id: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series switches rswitch driver to per-port interrupt handlers and
does related cleanup.

Nikita Yushchenko (2):
  net: renesas: rswitch: use per-port irq handlers
  net: renesas: rswitch: request ts interrupt at port open

 drivers/net/ethernet/renesas/rswitch.c | 223 ++++++++++---------------
 drivers/net/ethernet/renesas/rswitch.h |  12 +-
 2 files changed, 99 insertions(+), 136 deletions(-)

-- 
2.39.5


