Return-Path: <linux-renesas-soc+bounces-19217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71232AF946B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 15:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 163B0486A50
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 13:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DA5306DDF;
	Fri,  4 Jul 2025 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JE4+YTJr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34275302048
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636620; cv=none; b=hEL/gJKJRbdzkUM8APTbSRTsq+yXPtBAJiVbqAcSZjHdVetAa97s8M3ZCz/cYHmMc6An/5NR/6AUSnxQQOqJHEoS52oXxqcYvtiH0KD7XoAUIvqsbLUhoQNko1lvYHB25XgqgeQ5NYUgHYDfG8MOkgZtSnwWgG2/EcX7q8EM/ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636620; c=relaxed/simple;
	bh=qTydbvwsipxNicmaEZ+CKER7CcHb2CWmAMgsd8CYofI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qftAz1qGt4oUA/riKSu68n8be6fhacivAk0k3p0cyaXQ+FIeJm0ZaOFxQ7B4yfF9bKX6ahVWp94+zGKTcSu+XZYNZOr175xxmYzStVor4batrm/ZvbNcNyS3LITowOj9OJEedSOgqRtw7/uE2PpGpGaldFr7OV0AVni5wFdu9jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JE4+YTJr; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso1510860a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 06:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751636615; x=1752241415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVHE9lJ0YDRv5jonU7HwVUdVK1j8h+dQL57nzRKWT18=;
        b=JE4+YTJr540uoJUiObsEN2jXNaeXLSKPq8Yv+zDsWB3o5/WxGUGSkitipqYjioAaaF
         Kg4x+VCPa9vhQtvshxs8JXJkPu/iL6hjgp+4a8hhYRfuxKRsssmYpxv6hfqoaItAtYlK
         7q1tp/0+xkYZ5pnsSfP7hpg1JXUP6v9qa6w32Rm54m9ylFr66LAn0ak6q1SHF6/5VjOc
         neUbCKmLeViI+mAX00/oSSt4B5ZjPeUwJ3q4zLoeDeJl0JlVCTJ4ZNYwUvp2KCwgYGA3
         SoTfTL4BlWzX0j5Gut4TDdTVi4FGyi01BLrI8OuGHcv+CHVcsvS+fME83urDYUTHpmp6
         vFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636615; x=1752241415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVHE9lJ0YDRv5jonU7HwVUdVK1j8h+dQL57nzRKWT18=;
        b=mstL1iUnn1mGG7rMkm+ecaItqKHv7IBUE1IlkR0hVz675U8Zs2NUAaR/BNx3UkjPPk
         Ibzn6QiPspUObpaaGCazgyPvfnUrq5JYV8jSmhrVtAZCy+v4AKMPxruMfm1CgL6Gsnkk
         0LnLZmA7Xs9RrHxrOchUlqPgMfR9Pw7xv6L0gW/JzEpLPgUNuA3GiFIqkdO+VdXybMbg
         X4Cw1tjT56I5xHu/0ARV5UTcYkbY58w3VNBk4mm9FxvBw3j/3gXccMdLgNYmyKRMoo8f
         w/sAjUDzXfA/1gUinjtkXHECuuIY9TnlLZlrvlvCj4wWLhkDK+LVtUkuI0hdBkttEOPS
         tAeA==
X-Forwarded-Encrypted: i=1; AJvYcCWv7iVfTYAZPJrOhxJJs9X5wT9awkFaV0A9m3Kd+mQCKmKcYbSgIw5qBk2JG/5PdEwf05luPrBH2mZxKLQElYUy5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDVg8GeJhL6771RzIh2e9o/+rtM+CLxqqhy0csOvhcFpZ1810s
	EMInF++aq2mfRHOfgTu1dbP8LpmEeJ2n+4QIeYoqj3jyA+cSTk97CpsAwk/EeOLvVPQ=
X-Gm-Gg: ASbGncs53pHpuWYbRgBgTxxbAdEG9ALUurvQmWPmTYA6SNIESv/ERWLPjf0TBqx0xbK
	vA/I4SfTa38G3xq4a1TM4pYMYuXDkkKnx48i0u2hoPuUuOV3BXp+9xa/kD9dOK3iL+7e6RQ+HhR
	t6u7VFbarYfHq7rHn+Yz0Udve+GMnVrqjdDTOViu1WVGmlnxOypp7qVgxL4i5hECPQWm2rGg20F
	/GDR+ESdr9M52/HmwfQPzT8DkQ9xIGKXRW4aujW0Z0wgJp9OUkOYBHZn44JbdJbEfzTo6IjLNmf
	j+8ejLXWelVdnWJUHZVSC0DqqKSu+H0+hPAa9hiCkViuIsQPLBIe4aklQNWuAxVIpZwzOeBRj3D
	DcoMdKnljJmZLOS7BOgbsFXF5ew==
X-Google-Smtp-Source: AGHT+IFGPw3v50tj/GPM1uEZkj/0eYHeSowBVbc3cQ6zDPa98ZgFCGKQvA42xxJtIW7UpUVkFtB5/w==
X-Received: by 2002:a05:6402:5191:b0:60b:9f77:e514 with SMTP id 4fb4d7f45d1cf-60fd6510ce0mr1836018a12.10.1751636615396;
        Fri, 04 Jul 2025 06:43:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fd3895ac7sm1084916a12.30.2025.07.04.06.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:43:34 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/3] clk: renesas: Add MSTOP support for RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
Date: Fri,  4 Jul 2025 16:43:25 +0300
Message-ID: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds MSTOP support for the RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
SoCs.

Along with it, a fix for RZ/G3S MSTOP was included.

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  clk: renesas: r9a08g045-cpg: Add MSTOP for coupled clocks as well
  clk: renesas: r9a07g044-cpg: Add MSTOP for RZ/G2L
  clk: renesas: r9a07g043-cpg: Add MSTOP for RZ/G2UL

 drivers/clk/renesas/r9a07g043-cpg.c | 130 ++++++++++++------------
 drivers/clk/renesas/r9a07g044-cpg.c | 152 ++++++++++++++--------------
 drivers/clk/renesas/r9a08g045-cpg.c |   6 +-
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 4 files changed, 146 insertions(+), 143 deletions(-)

-- 
2.43.0


