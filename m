Return-Path: <linux-renesas-soc+bounces-25525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B3C9E870
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 10:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D37BC3492B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15F12E0407;
	Wed,  3 Dec 2025 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDbDAgP7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AF52DE718
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754916; cv=none; b=n07YgcNHRKW2GeJT3ItuLDS2ZH4CO6zkJcVFGyoitXUhy5NQZeTdVYIwj7Ke/E0Kg/2/UQERHksQpZOrQXCYzvW1ycHLkRhpQrS+VgXY2qZV75puMRm/x+vCYdw13xTa1/f8c06Z6j3VdT9og67sToIp86sjG6ws6zmbs1FkXqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754916; c=relaxed/simple;
	bh=yssZF7K0Fbv9cwQQlBewlNdZddWwBq2PpzjY6jra8Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=udq3DvWyOfxtLXN8nrKnisLEnlhZuMeoJ0xVzGynxQg9WvXoV1QSAUohZNx1l3lKkQ6BpYhPmKE89/AqccR6rD/IyfhxObUmSgPDeBbMCCyacLwD0rWQ9UP1/TzNJpUQ5xXtpUcJR/NCAugYcq5o2AktBgWeMTiVXoPCgCCFdC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDbDAgP7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so59967775e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Dec 2025 01:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764754912; x=1765359712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1KjAbD9vfYKFGC9wpIjH2Dlz0vt8hyP7o1r5A0opOOA=;
        b=mDbDAgP7eoO5fQZBOnvTtlCPFEnrLFE0cRNB3AW4CpUL+UJExEV9no+uUWcXzS5RGP
         PHoXYIoryWMr0PnXUqygJrZpQVh4bDw3iSlsuXdR6r77GSKjljUyC9lk94rMTBm/YVYc
         ZHXpkT5+sl52YN7ksC3G4QDW1w1Sb8IRXHQ2ESW6A2SyvQN6Y1dWlrfEdVnz8v3sXN4D
         NPSuBD0hTQFV4Cz/nosLodC0V8NOS3ccxFrluC9tdL/pyCj8p1N+rI+jreV6YxpUVfVd
         c6M+Ww1vvAf9p/VHNpdafDKyzzJF94BzRRs5IeKxQjM5NyRpvuocwrO1evB0PLP9V/hy
         KW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764754912; x=1765359712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KjAbD9vfYKFGC9wpIjH2Dlz0vt8hyP7o1r5A0opOOA=;
        b=J/wtxl+F2sGiFpQyNCM9hePeMOa9Dpf1CZ+n8m75LA21ux2WiCu+8mLK56f9qUcdlU
         7lwBbUG20BqgqdvTtXqkTdOlx0foaPjYFCnQ2OXBgHzKmpSoDPO88TBgn1wRQtL/zSgb
         Fst1hBjpu1tm8pvX6ZxiOOqsDmlxd6ReRBELFEzrHMKfNL8v2TbY/QX4SGAx1UNB4TWe
         vTa/tGQUwg3TJrG/o9Qhcdux3YNM9AwDROe+R8zH7FUENYh4gKvTvRRmSV5u6pkgb3Ze
         7mbv2Fl+/eD0isYT6+KxAVul6dXTyq+AMpP/HTlFg1q9ELInSbSikIO093oJ4DSnl5Ok
         hxdA==
X-Gm-Message-State: AOJu0Yxz++xyO1edBaiUCI+iSn4CqqZF7Y9HS0h14qJoe5XizPj+EzRz
	COX8Tkfcfcs+bLCg6d1M1DX1W4NMA0T6qVKlj/SkChRptQewwxYzjS4U
X-Gm-Gg: ASbGncs7hzQVcisHOjZbYBZFB++p6xdvh65yZOeFyZu8XCGqzfuB7Tq1IDwQv/WatIl
	kOnSV6h9K6RqK72FkQvYqtBxGwtX+WNkUvG5jeA1/X2sta9R0k4Xwc8NFKJlcYwZbkRtdk3DARn
	yHycOyWW3ppthiD5bh74xU71zfRI4vbmf7TkZVP3NvrppIkF/RN6ISopqquIg5DZME1BAX/7C+5
	15T5NaSYHeCfqfEnho+xp4dOqyFOu/MfB7v8HWfeLwQ9dEoGQ7A+Gb7BFL4OcbPNsgvOhQtU0zl
	UsqwUrPLhI9CeOWHS7Pbrd3+0ivSVe/JZiw/oJX0BIzSIka2anH2PPVBhMJFMDs9J9LSnNDopl1
	f+fqovc3/Ee98s6lXxjqRL4N2Z81n+gQKj8lE7KqBiruFRGWvdegi6jJD7B6RGLpRCiJ3mFfeg1
	XyIl9D7X+N0H6kVb9Rq+liy00xHMwpojzRaEQcZuxmVW421Q==
X-Google-Smtp-Source: AGHT+IFOKWCtBrW/auo2VdwhYd5bSuu/9kFVql+wt6gQtOyEU3WrjtFtQvCmx37Ot4A/J3ttSP39xQ==
X-Received: by 2002:a05:600c:3592:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-4792aedfbbcmr21374945e9.3.1764754912185;
        Wed, 03 Dec 2025 01:41:52 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:7655:4344:c8be:eb31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7a87f8sm38632815e9.12.2025.12.03.01.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:41:51 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add RSCI clock entries for RZ/V2N and RZ/V2H(P)
Date: Wed,  3 Dec 2025 09:41:45 +0000
Message-ID: <20251203094147.6429-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds clock and reset entries for the RSCI IPs in
RZ/V2N and RZ/V2H(P) SoCs.

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g056: Add entries for RSCIs
  clk: renesas: r9a09g057: Add entries for RSCIs

 drivers/clk/renesas/r9a09g056-cpg.c | 126 ++++++++++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 126 ++++++++++++++++++++++++++++
 2 files changed, 252 insertions(+)

-- 
2.52.0


