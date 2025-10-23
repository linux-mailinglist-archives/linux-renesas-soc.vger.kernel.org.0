Return-Path: <linux-renesas-soc+bounces-23545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEBDC03846
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 23:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B2ED3A136A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 21:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5AD26F467;
	Thu, 23 Oct 2025 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnsevFiF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51195260575
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 21:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761254608; cv=none; b=ZPsahX3UQKRZIRvfBTLzynudYwvqHSoDU47hJrMvf24koyZvaSksaU4xc3wPU2cjIq5GlHmaAAXRKx11wixbBmX+1skttHG/SWDUibhUSPT4GGnqTwiOiu1Z3uBOfvFi7w+a33+klz/qBDjJsF5GFAPap3r/2vF/ZYPHWjj40zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761254608; c=relaxed/simple;
	bh=yFthfjChABU9B3p7kO2QzRL1wEOgO5LPQX41KnTS8X8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T5E4Q52vgmbcK4ac/qQyDD4FfEWbHXjsQm0GT1viMYyTEKDDLURwbDtKjx+qaEapazJbNvh+bk0/dnlDFRm0BkdRc0v+GZ5+dKl/YQie8fIe5Yc8AhpxArM9qVqnkGW+/xqwrAHLurfiYIqyNT5XbSTRavCtK5zRSU2rH5ZkKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnsevFiF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-794e300e20dso2297705b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254607; x=1761859407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5by386MZx5aXAJgioDNPB9DUAiuf+2nw53TNdh/FOSg=;
        b=nnsevFiFJlr+C3e5N8IpY+Mc8MRKtEvJJP/oPD/qwkIN+MH+4gsMFq4Ar9U8qNvn6Q
         qb4xWVtcW3NHRqDCzEP4dQzWnWirEh+YNWOlG6e5vGMV9kpnMxG5SNkLbUJ6xb5P1B1i
         rYCfTF1Zq9EN0gft7BEP9PVYqLZnPQGKZYGuGwaA/oghxbh4YOqUDu4fdwwyFpIFbtAo
         /PfqE1swuQVVdyg6mnGPFcLEt7LnhZC1nvewz7nNuOoxe8sdTmYsLzEPF35rlpyygvdW
         IrN0SNS49bwijW86vXVa2oNnDIzxJBiaKY2xnCg6cxlazKM3G79+Lif88SigvaW0hcz7
         SM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254607; x=1761859407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5by386MZx5aXAJgioDNPB9DUAiuf+2nw53TNdh/FOSg=;
        b=lC7XNKLyNOcaaqa+NL2HlxjW9ADybOtmDvIsR1fB6+ZGpRDNQf0oh+/pawnTfIG2HG
         ju4YTmK6F1Djdagq2uUTakcXNpnTPaS1grVrQXwIqT1Gwiv3MxSvRC/bbKGqp4q6S1K9
         M41VfCDt0M3FG2s7/rUTqFrZ0dSnz6kTjn/iylEGGxJ7O4RAoMMEjXpQ7Hl8oeDIwMs9
         +7AT6AOv6oZbeLo9YVqKy4GZtqXUN40RhxWTFcKbP9WBYuH0DqrpKPMq+WfM94E6TQSb
         7oN551rF/emI/ZtsTvW4XSA96CVC9YcrJOux7STw0pNKNlSuAst7C5L532Rf87X4mmtc
         v98Q==
X-Gm-Message-State: AOJu0Yx+aObcbmYtdvBeOwroyABjKHn22GMnl+DBa1/sUqCwHd/eaIA6
	TipTz6PIFEDZ0yQEbFE7KnpNjjckhvkUKlDzu/9LTJkHvR+oAXZC4M5WnxU7SyQY
X-Gm-Gg: ASbGncttTNB+L7jJecIxsEaTY+Ce8CojtVHm6ngxHAfRJlQmgeUz0Em1Ic/ALHiYXPf
	9cjKZX/YenpEQg6j78VuzUJqjN7KxKY7YF6N72nkxnAKSgbxr9KDZP5kRZTSMP8BHdGB3U8TvPd
	SUxIErXC3Y7nGiULK+Ci0tTc4xESkhFuX1tSUkSluoTCpikxAy8jDX3NtteVaiEY7cwDlRpfSYC
	60eHpwZaldxuPphUnl/HQLZCu+n+rIW/600b2QeTatrU389PNfzfEPtDXTfkZmJciK8sWIMSL8m
	IlUxKJ+9N4wV311a/XUAR59czEofKs7/hxxWCR3Yr5rNN/wQkiR4toaG41nvd1Q2wdRnWH1Oiq9
	mYKFHqdTlj2ZWnqshCg/ykd9fLj9wLd89/fNHK8cAres/Fzs0Mio+UnzInLTb2hJ5VG4tJqlwHd
	n3ii64w2w1fCP8dfVQEPE=
X-Google-Smtp-Source: AGHT+IHGl0olTWLF8OaNJ/L8hBPnlgauLfY1yN9znwKhvU+1nASIFWBG/XX1hymKLG4TJ2s+SNOl1Q==
X-Received: by 2002:a17:903:2f89:b0:24b:270e:56d4 with SMTP id d9443c01a7336-29489db6d09mr3834145ad.4.1761254606662;
        Thu, 23 Oct 2025 14:23:26 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda7949sm34306965ad.3.2025.10.23.14.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:23:25 -0700 (PDT)
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
Subject: [PATCH 0/3] Add display unit (DU) and MIPI DSI support for RZ/V2H(P) SoC and EVK
Date: Thu, 23 Oct 2025 22:23:11 +0100
Message-ID: <20251023212314.679303-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
controller in Renesas RZ/V2H(P) SoC. The first two patches add the
DU and DSI nodes to the SoC DTSI file, while the third patch enables
these components on the RZ/V2H Evaluation Kit (EVK) DTS file, along
with the ADV7535 HDMI encoder.

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a09g057: Add FCPV and VSPD nodes
  arm64: dts: renesas: r9a09g057: Add DU and DSI nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable DU and DSI

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 89 +++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 71 +++++++++++++++
 2 files changed, 160 insertions(+)

-- 
2.43.0


