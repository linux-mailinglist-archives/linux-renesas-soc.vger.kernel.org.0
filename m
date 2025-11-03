Return-Path: <linux-renesas-soc+bounces-24047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5629DC2DFB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 21:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B0B43BE84D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 20:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47A4299AAA;
	Mon,  3 Nov 2025 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktjiQB88"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C423EA80
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200264; cv=none; b=og0nd8RGZIkN7+N9b3L7beYJ12kj04k2s7Xxbr/ESzOZ5tGriDgWK+y+WtD4Qht7UDLhcnk9zLVpJSelnKYx6faJDpAppqSwvSmLnHA5CxoCdxr+PKWXQVqg+jpVlqi6leYy+8YX7SwhRQP9pv4qDOOE9/roTrkr2jQX54if8xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200264; c=relaxed/simple;
	bh=ln6i411kQ6CJHX3AEbJla0cNUW37Yxjo8v/tjCWbTrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cIBoBfSYA1sf2ncxkq+1rdAdq8sj2EGI+1ylzjSG+MTaaybPFKlXHumBra4RT6pA9kToCNGhADLRui3l8kMCDgC249z48KoVoDKyDT7vdt/25ij0XAPTWigtC0sz0+bcP7+XpvHHh2w4N8vuWKpj5BFCnHV/65Lbnid+fcMuJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktjiQB88; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6ce696c18bso4384816a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 12:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762200262; x=1762805062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K9PlQ6g0ZlyemXXjDDNmNoclmHr0fzKsjRa3xohO47M=;
        b=ktjiQB88mmnaknuCsG9RA9Ht01yuNbk/fd37aU0J+Rq2Cxnd9SgXMXVSs0NadS+O3x
         o3BwaSEUALHosZN0y28Ohes/+TKj1uScz4fvCdfk1pJwrfZq1xz/wlZhFowLYGU4A8Au
         FE1eTaamk+bpfS6Jg0rCfdjxOzwejHIbCYpm+FVJG29IrqdCDE09DxnBJdxD6AifQzj3
         XrgIYkK73YUOhndUmqi+Qo0ZZBIFbKA+u5uQkFhiQ/QSOhRj+LgBh631mQiCkdpdc9iT
         /+unyFuJqgdwyS4XBqtddSrdHd4mO/wvHRlVDlW/bbEZm3SK2+as5e6+VzE/qFzcfDih
         3wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762200262; x=1762805062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9PlQ6g0ZlyemXXjDDNmNoclmHr0fzKsjRa3xohO47M=;
        b=tU7uIbW9JCUpBAqg9oPCGtmglrWXtxVi5EoQUiVsNgojAEr/vuhgmeBwBXX1leJiVm
         icd5HKfPpb/KgqEhKtp8B6fTT8MacsLZzXFTV9phSy8fgRJocxYf7xDTqwJSucayJ0wk
         znA3i+XZyXqJ6mtgO2tb9XYyF6yXqdIXS7ka6hf3x4DSkbQpppucwY7mnsAM4XE/MHNO
         2RynyGnQBMtycTduHrTJJ55Tz03IVU46l3f1eliuK9YSD3Y/MsEhxZd75bwO3tPI6srP
         sdqBIWEwCStq6mDZkY5ATtxScaEIK1Yg5sw246BCH8oleU+Nv4BCAAJqufjeB+ToJ5gz
         k12w==
X-Gm-Message-State: AOJu0YynBdijFwyq2hKf2cxkweHrBH7XLhu6z4Uxr+8r7Q1hXtQrfEYH
	GREWiA2hpCHoNCGkUxyCtLYEqX+vgWdfKWH6DlNkDDaF4J9Uy2dIwOdA
X-Gm-Gg: ASbGnct/ej9B5/ysmf+FdEYAS8hwSbTwZFxCW6IUTFsVKvTVFH4P8Ik3fi/BkVhycaH
	LNpYqtcG+HW1mN4Ht5PbPLPw2B4gPzgYcr3IcaQ0uR3GwT9f9qJpVSlXI59gFtji237ELIy4wZj
	zGEm+dg7/pdvaIxE4we4uG10Y5CF1MNInCTJA4c0dudlI+0l9LAzi9omKDpKhyB6adWt9QVPaSQ
	V21oozV0s3BMCW817kuYcPtoE34ByoG71skBG0vn0d8kN9caKtWTuksNuOqWf7Uv7FPo/8HC0Jo
	5kRtSEPDaOcOo8QI3i/bw6bSYiWp6txmQg7KJIAynEF/fX3XaLS+hded9+Hxh5svKCaxraEl3Pl
	A8zMKEsTjcX3njw89OepRxDHIwsSNwudi36tDGQzBng3mMQh+AgAUNRYxY9gioVEajQb8CAmeTR
	F6SjKvd/xznGaPa1aBy6SJeytyfbnikyc=
X-Google-Smtp-Source: AGHT+IHBzT0XgLzw90Yol8EUTMiqYk30dZ78H4h4McimJjXV0e24kxaiYrqwXf7YsQugI70u2j9xaQ==
X-Received: by 2002:a17:902:e74e:b0:295:8db9:3059 with SMTP id d9443c01a7336-2958db9335emr91532855ad.38.1762200262262;
        Mon, 03 Nov 2025 12:04:22 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:600d:df45:8e1:7a61:1482])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952774570bsm127494895ad.99.2025.11.03.12.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:04:21 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add display unit (DU) and MIPI DSI support for RZ/V2N SoC and EVK
Date: Mon,  3 Nov 2025 20:03:46 +0000
Message-ID: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for Display Unit (DU) and MIPI DSI
controller in Renesas RZ/V2N SoC. The first two patches add the
FCP/VSP/DU and DSI nodes to the SoC DTSI file, while the third patch
enables these components on the RZ/V2N Evaluation Kit (EVK) DTS file,
along with the ADV7535 HDMI encoder.

Note,
- The DT binding patch for DU is yet to be merged [1].
- There is a fixes patch for FCP binding that is pending review [2].

[1] https://lore.kernel.org/all/20251023213350.681602-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/20251103194554.54313-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a09g056: Add FCPV and VSPD nodes
  arm64: dts: renesas: r9a09g056: Add DU and DSI nodes
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable DU and DSI

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 89 +++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 69 ++++++++++++++
 2 files changed, 158 insertions(+)

-- 
2.43.0


