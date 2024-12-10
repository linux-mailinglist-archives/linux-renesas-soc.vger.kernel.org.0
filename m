Return-Path: <linux-renesas-soc+bounces-11172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F18519EB784
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A522B164DDC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785772343C9;
	Tue, 10 Dec 2024 17:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Wm7a+na0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96D5234997
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850609; cv=none; b=CQ6e8S7QitPz533AVPbQtreVIgiwhN1eunrcYtMzyXe6bkGbVfVgb3e5831eWzNwm59XYy/m9rBU6aU3shHLbC+50CIceWy2hbV5BO9vNsWzCgPxdwAZM+4OrwRXrGK9cW9w2044nQxaJbDpvbCV2fObjJpE25t/iOAg03ODAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850609; c=relaxed/simple;
	bh=1yCY8csuIIkAJNzv1qjS14X6EKiSfNjbmMw/2hqxjeI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p6DppqASWYeEKOEx9Ni6patGVbObJYIQ2VtdLD0dYvj3ntbnKIEjPxrdiuRjRCqzbL2W/i9Yd4t8crnIZhRX51EsNcy6IwEv9CvpaVcddwNAddMFi6YsP+zztXweiDSR6Lh3VQ2XhVBSTX4JOpeXNSlNzonWvNyYNIBpnYxnhx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Wm7a+na0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8dd1so9451162a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850605; x=1734455405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vF/MqNtR19jOp/V/GGowSlg++EQ79hE7qG7Vk7joIg=;
        b=Wm7a+na0q7Joc9m89S3ZCSM+6f84RQF7v/5vb7DnRc11SkeEGtbS/2BABa67i4bQjA
         UsfmaKl1F8JY0uSjgEW7dvoFNXN1IH31S5CVMTj++MzysaGIhrJoNW8fP70WZeZteCtq
         vfLOLV954BZ0gaDvXDupOU6fT5aI9YcLlpNXg4wBh2tCeTeYj98TQ4stP1dDZPhURHf2
         WQ8XMxRAE+LODDOuuIIim6MrkdW1uQnRT+qtXNAI5VSPj/HBsYacTCIwcKray6Gi2IYi
         oKF1fwPySiqddzxYKEGHbCjak06vKLTODyY25zL1o5g9tQ8IJDzA36QSRMbiDEANQzWO
         b1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850605; x=1734455405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vF/MqNtR19jOp/V/GGowSlg++EQ79hE7qG7Vk7joIg=;
        b=q/3Lwt/tLnGTTqUm1qV1E58hT8CwgHU7oNwL2c6v/zvb6Hp62fyNfcaeGmGNiCF583
         fIdNfzuH0vApR9yHN44iy2Veye5/I++pO1SwxAyEBAVFuB0RjEOLzN17rEPGKFjB2vB2
         qwG3r0KeZ8bjbuwUppT6PZsY2uVEYRP+9lMt4W8rHk6fTzM3VMxVJoASh0fVoHD1UqDY
         Xau/x7ugBF8sySjB0UiafqjliDPC/e1D6wqfFBYSUQs2iBxcQLboVJ4XugW9rdMZ2gk4
         YuKX9e8OpmVY3YmJTkMQaZ85StUQNx3iu3f/bidOMzv5fNH40EAIg7TNdDxnm9b6Kbbj
         Ts9g==
X-Forwarded-Encrypted: i=1; AJvYcCXHqA1LO/soIYeqnJlaMB2BJ2MYyeDOXo5pq9zjPyy6/j1kT/ufwq688t9ICEF8JlGX59WJpf+dvL4QWmelTQ+0wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNCJybsfmy2HJkDi+1LA1p8mMUCgKGIlCq37HbmCClBvCZa5yz
	BfGrDZMSmGFTOYcaX38RxZU7MFR13OHCBVdTQvkGG3MMl4kj/HDpdFcW1mWc9Bk=
X-Gm-Gg: ASbGncuGgA2gHPjVunWNd8FUWoUbWvVG4DBw4/NzeOG+eCNM9j3+VfnuX/rqxPW548g
	NV1FpKdBcnUuUsKDsuVorlJdNXnxfesNhItet3NH60o2KJyfdlHdOiHOPIdSoE2+1dp+wmG5F4D
	DXScQVHQuaVwlxCrzJRw31LhVEPfJ5rCBMoMQUIMRh17j/2XihvhkpE0RRyXVer/bE+lwJEez+6
	cK0TfSqEYiQuT3u03VaNBUVKPXHLNe5XwHARY7BvnnUiepFF0mGg3iiwI0z+LKZOfqYz65S96IJ
	a41hrLlV
X-Google-Smtp-Source: AGHT+IHSX6HgwX58RDNMjWxEUiBxZF49DY7PE972rvdQuS2JxVwMHBYkw/019YuVN5dqWY39BwVGSw==
X-Received: by 2002:a05:6402:2696:b0:5d2:719c:8bf3 with SMTP id 4fb4d7f45d1cf-5d3be67e27fmr16737798a12.9.1733850604950;
        Tue, 10 Dec 2024 09:10:04 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 00/24] Add audio support for the Renesas RZ/G3S SoC
Date: Tue, 10 Dec 2024 19:09:29 +0200
Message-Id: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series enables the audio support for the Renesas RZ/G3S
SoC along with runtime PM and suspend to RAM.

Patches:
- 01-03/24 - update versaclock3 clock generator driver to support the
             5L35023 hardware variant; versaclock3 provides clocks for
             the audio devices (SSIF, DA7212 codec)
- 04-19/24 - add SSIF support for the RZ/G3S SoC; fixes and cleanups
             were also included
- 20-24/24 - add device tree support

Merge strategy, if any:
- clock patches (01-03/24) can go the clock tree
- audio patches (04-19/24) can go through the audio tree
- device tree patches (20-24/24) can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v4:
- added patch 18/24 "ASoC: dt-bindings: renesas,rz-ssi: Remove DMA
  description"
- collected tags
- addressed review comments
- dropped already integrated patches
- the changelog for each patch is detailed within the individual
  patches

Changes in v3:
- use renesas instead of sh in audio patches title
- use proper fixes tag for patch
  "ASoC: renesas: rz-ssi: Terminate all the DMA transactions"
- collected tags

Changes in v2:
- fixed typos pointed out in the review process
- dropped da7213 patches already applied
- dropped patch "ASoC: sh: rz-ssi: Use a proper bitmask for clear bits"
  as requested in the review process


Claudiu Beznea (24):
  clk: versaclock3: Prepare for the addition of 5L35023 device
  dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock
    generator
  clk: versaclock3: Add support for the 5L35023 variant
  ASoC: renesas: rz-ssi: Terminate all the DMA transactions
  ASoC: renesas: rz-ssi: Use only the proper amount of dividers
  ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro comment
  ASoC: renesas: rz-ssi: Remove pdev member of struct rz_ssi_priv
  ASoC: renesas: rz-ssi: Remove the rz_ssi_get_dai() function
  ASoC: renesas: rz-ssi: Remove the first argument of
    rz_ssi_stream_is_play()
  ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
  ASoC: renesas: rz-ssi: Use temporary variable for struct device
  ASoC: renesas: rz-ssi: Use goto label names that specify their actions
  ASoC: renesas: rz-ssi: Rely on the ASoC subsystem to runtime
    resume/suspend the SSI
  ASoC: renesas: rz-ssi: Enable runtime PM autosuspend support
  ASoC: renesas: rz-ssi: Add runtime PM support
  ASoC: renesas: rz-ssi: Issue software reset in hw_params API
  ASoC: renesas: rz-ssi: Add suspend to RAM support
  ASoC: dt-bindings: renesas,rz-ssi: Remove DMA description
  ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add SSI nodes
  arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
  arm64: dts: renesas: Add da7212 audio codec node
  arm64: dts: renesas: rzg3s-smarc: Enable SSI3
  arm64: dts: renesas: rzg3s-smarc: Add sound card

 .../bindings/clock/renesas,5p35023.yaml       |   1 +
 .../bindings/sound/renesas,rz-ssi.yaml        |  19 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  94 ++++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  47 +++-
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |  63 +++++
 drivers/clk/clk-versaclock3.c                 |  67 ++++--
 sound/soc/renesas/rz-ssi.c                    | 226 +++++++++++-------
 7 files changed, 388 insertions(+), 129 deletions(-)

-- 
2.39.2


