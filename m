Return-Path: <linux-renesas-soc+bounces-20597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E05EB293A7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 16:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A2633B0112
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 14:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DABA1E25E3;
	Sun, 17 Aug 2025 14:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a82f15FE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB30188735;
	Sun, 17 Aug 2025 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755442301; cv=none; b=BG7omorQuSV9Iwc8fh4k2DclK0O+jX0AJgkrinNL/KaqK30V6GveVZ94fJYTLwSrZwJ3iEukiJYQcuqUE3dpYFkWpnhxIAYE7wpM1rXOKRWvK8xKU+Zs7tAQ89Kn5IGpDD1kJODHpWj1bGyJwQW0VValifZFO3jwhN57wHcbLWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755442301; c=relaxed/simple;
	bh=yDuk4CGbVKpnv/ODkqhiMbEA1YB5hHNU9g+K0Z6xw7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+cuGHGf0P8jIZYqkCdtyq9rxSlrFjwbI7N8WFGIb86yrDILZVFz5LaprngqqBdp99fwwt7Q8DhMKESBnAK70z2N1QOGeIGthRj9WsZf/P02LZLP8IERSXSJkZSpfqJ/gKsDX/jzMbC75nXN19JymW63YDca5J5t/IExTTb2IJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a82f15FE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9d41bea3cso3724472f8f.0;
        Sun, 17 Aug 2025 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755442298; x=1756047098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hn1AO1fgkdn/9i2vCFP7KnGsKz7pgQUhDqNHZkyhm4=;
        b=a82f15FErQeY5IYUMrYaajWEeBaqeBWticwkWy2wIDWOd3sFewDnVKfSix9aLPOOb2
         ad9vUSZA2AVpNrPyeSvWRRjEnA9bsgCSdCetVrZ0nVvi/53FkPqnMr+WsvlHf8j+KQc2
         xgqSs5grW/cKuiCXWHNcnajGSrx8EP/L6hKkeRnqoZG7vKfgLTnWkC6ers/t7Tz5GVOp
         OsN5a8OLoqYM7hlKcho3XDWeBxARty1M+3M2nZm+eQr9go/Wd1W+ltg+p8QmFUujZ3Il
         lx3EUmjzL7vOBrWdgCk/QD3QwFbYf3VuD7UcB8055k0Xn0dY//ar32Bo4Zm+QE+Ug2OZ
         2VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755442298; x=1756047098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hn1AO1fgkdn/9i2vCFP7KnGsKz7pgQUhDqNHZkyhm4=;
        b=cMTGlE6zTGIytGLZFKo0XRo5fZPHCjqPDnD8ohDAAs1NYiN29z3IY/7B0t17wVbGFu
         jSGTcUDcINULgnPQyAytvSxDqw5avrMkkbb79i1O72t/jsDzXok4vD/r2VQsZ8qYFZJe
         kIG7lkiojaMbkuTlQB33/m0PMdBq6rxpEz7P/RHbsDY45KYOOhcQz+UJ6hRbin1YDLqv
         MPZiNPsWAO4Sf3X8j2Xl3I1eOsWaOIX8BxGlATa7Z44nCqEfpvyXa6O7TZWuZ2GqsKvu
         onx4gagluXf+8ZSs1bfoQxv0d7hgCsW9aZ771cuq3+wfi9wmXF6rZKNuQU9mZsan/7GP
         S0fg==
X-Forwarded-Encrypted: i=1; AJvYcCUtjquMlsXWAflhpSKvoe2/+XXnQuaLoXS2AwhacCPDY8AygYQLYAQI0Yl07QbcGV2B2WNUzpkpmbaoJMYZ@vger.kernel.org, AJvYcCWQdzYysrbwSvNog3dzCnB1vcemqTxe7XeQDXrWJPZEKsjJdqITbgp9inxZuru2jmsKLCeTaClSiVauwGxYQESvA8M=@vger.kernel.org, AJvYcCXeBTcxiaFdfJ5H7xZ8xOm51RZYtsFqHe4YS0uLsAEMTvxx5u1zVcf8euvNn1Pdz9qhzaNe0a4UifLL@vger.kernel.org
X-Gm-Message-State: AOJu0YyP+WKrpFq2spsOzJGay2skl8PHOcGo9nYg3eGh2YS9VW4rmuWx
	WZB1SqE0E8dj8kBf81dYx0hG+Zk1E9YGQA00k2GAHjZcCAjvWHx/JJRC
X-Gm-Gg: ASbGnct8SSvKmsNHoEEV/90JmCUm6GuSytpImaRQd7oZR6mAhkMmGkBve/eSgE0FQnS
	/OiMybYS5WjAe6CwoFIO4VUzqsAx5YSF9x3RGm9rNwULzQ/6FDbKaa9qkEhTcnkwPYdZYbGQOK4
	QdHeGj6PWCjn3SGHZAhwQEJCYlNHWkUAtJRPruOkFeBv/fKcFVM3r4vhZKOBLWUO3Rru4GVXhah
	mwcs4xhBEW30TBiA2FfSoy8NW/PzeKo10QLYXp4Blwwkg25vqLaeLiz4QXiEkQ/9ND65XAzCis5
	IG4jJa/A3g0gX04RYYtihmI9QF0n1sxGm3zjbHk6LydWiHB+WgTSwkeKuf5DbIto04rtrxzTSqG
	Rm+2e8jMHzsVX9dJmWeKVrGH4YxzoQ+t5Om4dyAeEl0y84OMSYzv+XEWeWFmsiyfsauJSyyxbfA
	==
X-Google-Smtp-Source: AGHT+IFp8g5VhH3XFbgUtEhQY4C7V/JNecYxXMAifaV10ETRvOQ3ZN7ifxIBGT2X41wuWrXVZ6vCpw==
X-Received: by 2002:a05:6000:2c11:b0:3b7:9d83:5104 with SMTP id ffacd0b85a97d-3bb69c717eemr7419653f8f.51.1755442298447;
        Sun, 17 Aug 2025 07:51:38 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c99dbsm9917352f8f.36.2025.08.17.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:51:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Use schmitt input for NMI function
Date: Sun, 17 Aug 2025 15:51:31 +0100
Message-ID: <20250817145135.166591-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817145135.166591-1-biju.das.jz@bp.renesas.com>
References: <20250817145135.166591-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The latest RZ/G3E pin control document (rev 1.2) recommends using Schmitt
input when PS0 pin used as NMI function. Enable Schmitt input for PS0 pin.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 9f6716fa1086..08e814c03fa8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -132,6 +132,7 @@ i2c0_pins: i2c0 {
 
 	nmi_pins: nmi {
 		pinmux = <RZG3E_PORT_PINMUX(S, 0, 0)>; /* NMI */
+		input-schmitt-enable;
 	};
 
 	scif_pins: scif {
-- 
2.43.0


