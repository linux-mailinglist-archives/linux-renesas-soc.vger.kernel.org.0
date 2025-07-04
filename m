Return-Path: <linux-renesas-soc+bounces-19222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A874AF94FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6067188707A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 14:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0609E18A6C4;
	Fri,  4 Jul 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQnf500S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D8A18C008;
	Fri,  4 Jul 2025 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638113; cv=none; b=FcTyV3qeMq7lcsCnGyM/F+jO6racJAkZoDSJiMbFQcR7K01munNl7mClwYikhMY5l6G034VHDw1Z7KM6j6xJ+tqC5TEALKxIrfHTgQnzViFxkig41g0AoYahaNk4BeDa57SMiIjDRwdtltzfKfuxlAGLBKF2s0uP+TWK4Ukj3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638113; c=relaxed/simple;
	bh=rkudmlwj5S5EgGAdSMyc96jztEkaEpIzKdfZIMBoCJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KTE/t63GHRj2GPnxAeDxCJdRGtSFx6eeLXO8lHEb1nB3rzbNMNs1Z3InEtjQyBLKOzyf2UoNEkMC4D4j8kk7tK1Hw3uNNPAdocUrvxWXJZy7U6y6RaZIgYmhyijkhUffXRFRSA2M4tskwzzXAIZ5G5wblfBnzG6CcG05Mbm7opI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQnf500S; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so647183f8f.3;
        Fri, 04 Jul 2025 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751638109; x=1752242909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgdvoWmTjoUV83Jp0UzfixiUnTbiJL6h1V/XZeYQOAg=;
        b=JQnf500SYRl0b0mkH3Gwt78XRr0oN3UPCIOozQOaQU+TuQmf9GJsm9A/fkIlCVbwni
         EQtaY/36nGc+Ei7YfChqYxpWy3eQr0cUj1i4p+0OivqodSvrKYK7GfauF+PY5yQO8Wfk
         8ephlMHHK+PgE8oAXKuvlST+SuAsC6O1F0GY9l0EPJkmTr9gPIK/FgIxZ6xRt0SGhoyq
         F7dps7bWgYvfY1O7p+Wp8l7xVTqChaJecWooY1qgoDokOuJdZGSqDDqdN2mv8aAqSiee
         zm0G6rwg+toze2ijtHj1W30jAKuo/5WFVUlp3UFB2V1aDILtClxgpamf2jX3ZwATVnCp
         ++eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638109; x=1752242909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgdvoWmTjoUV83Jp0UzfixiUnTbiJL6h1V/XZeYQOAg=;
        b=BEfLfPlMGReCzCQVA5g+xmhwqZYQb6FO6yoyJMQC5zAimw5poMfIqefQ1jsARviraO
         +K/sy46EdKS+Abz7esYVD+zfXQ1JNqwSwrnnPJs+EycptM8yHNIMYQg6KX3zqtplRpdK
         Rq1+UDiBhK1jD0pEQRcUiqofZe8HGFSn36iVGZ4V8kNMM2r2jQgFDblDB2RRPjFXapDF
         JF5Yb2tlwacsvnaujqeUfF3H+FOKYTpuRacygNLlp6cc/GZwCCFwZzW88E2Scyhrwdtl
         pAVQgloaQ5KD7J6aAw/7D3ljyFLuNtoH4Vl3RSlbSXmgwHk81g7IwypbPPosGvYdVEx9
         rTWA==
X-Forwarded-Encrypted: i=1; AJvYcCVwNW5dCr3ifLmUL9Pz2mvPemYmAhaDUo9DGu6bM6N08aDstcHGT6rsf2jlnwldWYRG8Q6fglk3BA+O@vger.kernel.org, AJvYcCX18+QEOiltjVZU/YgdIpB90LMmHkGDY9pPm42t/Iio0dY6cu97jNYvmOd/2jSy6DKJht8QaakVcN8suFUm@vger.kernel.org
X-Gm-Message-State: AOJu0YxWeg5pVXtRff1jdWzrZ/Py75pbd781SzHXibCzykmK/8ZKmWZ0
	VbIrUaXVV1SbG95FT1vibGIfMQr9zQ25cVD5pXoEg6oLEXDR1g43iUOP
X-Gm-Gg: ASbGncsE2eGbt3m/y5b1SPFgF3yE1PxwLAnxufFRODl5BT+/+Nwx3nrtpOiVTQGszbx
	EAXRYhAO/tEw42zMFPej/VVhh0DwzqxYXp4YkasxDzuUTgqZBZFoUizEaFlcNcsfx/St4snjRs8
	vEG0wzkpuEibZ3uvNS+QRocbIrnSfDu5QUZOgoEsrXemMj3z7j27gOjFFxh06KYA7CpcA1/bwaW
	N3b8G8+WImLEEQ8/0ls3LsblMN2Fy/MCUiC4kd6R/5ki/S9Ydxd9WO882JW5CrREOCqfCISldQn
	VACjddwAr5VfRkzXAJu1SouUCAPlwQrx7VvlBnJXCdmUFG7rbdg6/h7KJCzJRjkj4y+lIOy3PVC
	uZblMxxllmPjJugSxnYsk6yWFSkgl0VQ=
X-Google-Smtp-Source: AGHT+IFptSEGZ7HUfijhgVKjvnlANq6yGkg3IZdo37Q9u9/fWa7aeHsGqK31baJFZu20DXRkh6AjTA==
X-Received: by 2002:a05:6000:430a:b0:3b3:59c3:483d with SMTP id ffacd0b85a97d-3b4964c097bmr2358697f8f.14.1751638109010;
        Fri, 04 Jul 2025 07:08:29 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e31c:ff37:8f66:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225afd4sm2535946f8f.83.2025.07.04.07.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:08:27 -0700 (PDT)
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
Subject: [PATCH v2 0/4] arm64: dts: renesas: Add XSPI support for RZ/V2N and RZ/V2H(P) SoCs and EVK
Date: Fri,  4 Jul 2025 15:08:19 +0100
Message-ID: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds XSPI support to the Renesas RZ/V2N (R9A09G056)
and RZ/V2H(P) (R9A09G057) SoCs. It introduces the XSPI controller nodes
in the SoC-level DTSI files and enables a connected serial NOR flash
device on the respective evaluation boards.

Note,
- DT binding patches have been posted seprately [0]


[0] https://lore.kernel.org/all/20250624171605.469724-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v1->v2:
- Added Reviewed-by tags from Geert
- Moved assigned-clocks and assigned-clock-rates properties to board DTS

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a09g056: Add XSPI node
  arm64: dts: renesas: r9a09g057: Add XSPI node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable serial NOR FLASH
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable serial NOR FLASH

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 21 +++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 55 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 21 +++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 55 +++++++++++++++++++
 4 files changed, 152 insertions(+)

-- 
2.49.0


