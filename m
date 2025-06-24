Return-Path: <linux-renesas-soc+bounces-18662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E761AE6D86
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BA171BC6187
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F022E62DF;
	Tue, 24 Jun 2025 17:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb7nszqD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998E2E62B2;
	Tue, 24 Jun 2025 17:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786239; cv=none; b=sDG7SctY8XD/8a975rG+9TEuHSOobCVTWR/X6DGeV2u61DMn3hjliHz9CD3vc3sTqe6fC8PyE3CwjZ+IvUe/lAZj6uHURwimX12m7AmU5EH0Taop/yK7cw5tUsEBMKaLlzhdFoyoXwNAmvfJCBYzNtTKH3g3Q8pxSlaW1qT2qBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786239; c=relaxed/simple;
	bh=KjfD8/sQycIfcr15duDSGm8a8lz63RMMwIonB2QQzCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F51uTVusJI20BUGPpumYwUsmkMaCeL796TMsPMTjCtdGHxRk1yXmKNj4oThZzXU01jFKDotif9LDObb8Fs832bpV/mvSDWd8GvXHIscvU9DhAAa0YhW6EgVb+UKm9SHVSQSwgFRUQfaJvdLNQT9ohjhM8vksEi+qZfMO7oVWcg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb7nszqD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d54214adso5495015e9.3;
        Tue, 24 Jun 2025 10:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786234; x=1751391034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yu8n/ZxSlMEyHw+8f9j2wZUhhCslJl7/P5zfwbE+6OQ=;
        b=Cb7nszqDOyjXSSne6TfneiKTAOzr/rJQgfxnRmoMIrdNfFtgWl7zSjorhQmeu8WhbC
         MQc6J+2l7ga1XLaWeZapI+MWUI604gBVLVOvDUnISlYYWoeqdT2fcVkinZbYleAazF9B
         MKRokJTZzhgmwR3f3XLMWTWlJPVPLY6bPVSnjfRDn9ba9s0nWRUP6mCOv9uTJtmX4Xaa
         VqkMYOW1uNT5JWWwO+wz+lrxWCiyhfs9WLWMwNT4j/ERcZno9438Eb1NK48Mgo7XJSaI
         MdKa5l+zUFvRUyoiuvaO435j8vB8tC0iJ+AP1K0yZjrkERTvAuCttts3CBhUAWhCG4qv
         zkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786234; x=1751391034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu8n/ZxSlMEyHw+8f9j2wZUhhCslJl7/P5zfwbE+6OQ=;
        b=nuMCi2nSQWvpr7E+llICC2J7wGOMWTMPs/s9TeHIf7gSeQtEj6dsKtlGQnwKD9kTl6
         DhEYPMGEmVgcLZustU5gShRH+uDy7NjQWZ/vl24gjOHfq1eIGdaGRU/Im01+94L60VGq
         B+LncwcM/fGK/lCJfKU4bctHocK/s+7gxr7tE38CE0EiJeghcUcYmI8wx2iz4HT++zqI
         qt/JRBSVGHGklxPsNL4HoRvOL0Um1tDw7I3pbiV5UNPbFwTIhhdwZUA3pX4Me7kn0Yns
         cIcSGYai0A2DERJPXjX+JqhljOTVEBilPXCBOqSs6+TlMEEDuSf9dst2OYdW7Fdh47kl
         yt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4IlBj8hnYdv4o97dh9LEl8+NVEOXMJTaXfVynzXvTucN38Q34IU1hxs7dFdz1Q5PmQjopgvBTzbOQSIFD@vger.kernel.org, AJvYcCURKXozVcqWkymlSWcXb/ZZ7VX4+BQgQSNivIyAYsG8Geqz7dm6e5IijSSEfuMjgvo/6j9PQLVNYYVN@vger.kernel.org, AJvYcCUbNAmvA0hjdWGBZstNA88GzdHL+4XLZ2GZo7tYY/pvmOM557ZZUhJjEc95wd/e5pnQkTDvvpPLNxNp@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBc0NrR+iG7NsVtGDM/4T/JfONuCclDlk9HrBXAFtftKn/z+2
	XmSsSuZxLgyPmS44tx9VHnf8KFXSs3lQvTYWXyZXV9a17ib46hzAJeR7
X-Gm-Gg: ASbGncvAbZNXfKStoEK60l/mYz2is5cGLGVtbprx7FghEcNE+OPLFSMHl99eER/S/RG
	nDdMmUUHHBgkW2vy3OTWOEJO6uvq706VJ+5yomNknpFnkvfPAm3GjfsbeNOMRe8mJ1cg8t9qhf1
	j0Soe67FYyHOKf/kfjjTKJ9oDhS2Ypf3QjRJcdNgMvYx2emj4S2mFyqhzg/5JCoJSCqHwHRaQFU
	Wpk1vda8s+9kq5tqXHaET34VxSGQT99Ld2o/zahQj6+FqN90GiGQNs9/DIe+qva2XUrJEGDteRF
	ORrUD7wTaTffU/OqFcfKJXlBqRAabgOV1H5B0fG4R098TLAsAExi1GzzY79LO5YAAcuGh4c3/hq
	a/jVRbAkSV6B7rJK0gaWE
X-Google-Smtp-Source: AGHT+IEYRMfJj8ckgsfejRtU0TYjIX32gYfl66cnRmBlGfHsjbeIKuTNWNIQEq5YMKboPn5X9A8oWw==
X-Received: by 2002:a05:600c:3150:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-453659dde70mr160985635e9.16.1750786233542;
        Tue, 24 Jun 2025 10:30:33 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm181662565e9.27.2025.06.24.10.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:30:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] clk: renesas: Add XSPI clock support for RZ/V2N and RZ/V2H(P)
Date: Tue, 24 Jun 2025 18:30:24 +0100
Message-ID: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the XSPI clocks on the Renesas RZ/V2N
(R9A09G056) and RZ/V2H(P) (R9A09G057) SoCs. It includes clock binding
definitions, clock mux and divider configuration, module clock/reset
registration, and support for fixed-factor clocks with status reporting.

Cheers,
Prabhakar

Lad Prabhakar (6):
  dt-bindings: clock: renesas,r9a09g056/57-cpg: Add XSPI core clock
  clk: renesas: r9a09g056: Add support for xspi mux and divider
  clk: renesas: r9a09g057: Add support for xspi mux and divider
  clk: renesas: rzv2h: Add fixed-factor module clocks with status
    reporting
  clk: renesas: r9a09g056: Add XSPI clock/reset
  clk: renesas: r9a09g057: Add XSPI clock/reset

 drivers/clk/renesas/r9a09g056-cpg.c           | 37 ++++++++-
 drivers/clk/renesas/r9a09g057-cpg.c           | 39 ++++++++-
 drivers/clk/renesas/rzv2h-cpg.c               | 83 +++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               | 24 ++++++
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h |  1 +
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h |  1 +
 6 files changed, 180 insertions(+), 5 deletions(-)

-- 
2.49.0


