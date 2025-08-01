Return-Path: <linux-renesas-soc+bounces-19841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF0B18194
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 14:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE8B4189D49D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 12:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEA7245033;
	Fri,  1 Aug 2025 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKbYnG8P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ACD23E334;
	Fri,  1 Aug 2025 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050806; cv=none; b=AgDa0fEdSlmk/GJF9mhL4voX828EyOwcJKIsc2HB7x4CJfmw+m5b8+0JDyFjKv6oxmtnllru2EC7dFzYd0wRfrDwYLAW6z9OdzhNWNOZX9o5JRwxsSAB9b7Td5howniIeEcWrJ7iOlSvhQpDqaFKtM7MO0s2y3GEjS3gpNenNWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050806; c=relaxed/simple;
	bh=JFYz6V+IvtvDYDI+ZKwyHZMHqrO8EobbLmbXNEJrJKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PM7zH9d7RQbiWP23rEEjQ/U/Gkud+6TmrSlsi8LOrrgkJBD4hyyXw76+PFy4GFrf1IY5lPZzEmucdARvdJVN340LJKbSL11dd7MNPuJb2X9+/rHeZoMDZsY4lxwDsyngM8V9mvSV7Un51u126ScyaQfbejie9F441xOetrqETZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKbYnG8P; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b7862bd22bso1816372f8f.1;
        Fri, 01 Aug 2025 05:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754050803; x=1754655603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ8fM5OWDAHdvBcoHevsxuePklCRjlv/vRe3mZGgCP8=;
        b=dKbYnG8Poqz1vdhsFJbK0hPtMuG/kc330DQSCoiPp4whyZlcaANjzDWVwY/xEpVV9s
         sNpCpzC0LOTvX6CfeOZHhj15CTb2whBX+HUY53l4MysuDn/qQy1UlvLnUpKqCnz4jZEB
         iWAZJU1GVptoscbcFicn16HARV2vlcGTSMo3u9wHniLG+bnLiUEJ7hTq7pz8wxBtbU5j
         u1MQs8dHLGdwWtYQiee62oxgpbiqaTb4jg+k3/JVpso1gDINeP83QlX86pb85nyr79x3
         SEwW1evp+fkBbdMtN0Zl5Gsu+7L7KZ73zJI2f43ltQQLmZqmwMZndiyt6OK+trTsUhUw
         5xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754050803; x=1754655603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJ8fM5OWDAHdvBcoHevsxuePklCRjlv/vRe3mZGgCP8=;
        b=H//hNcyYmU6peNNLgzPG365pR5cpN77L5CTklfpJobrmdIcq7BQvEEugYWmgajmj+x
         M5E+VImOlzI67e3tGeFdaxE+4jkAelkINq75u8+IAF4XTm6sccXhG7keHyOAQzXgsH9/
         P8D8td3q84BNcDB60um5i+6OC1iIhkp1OMaIzSYTrrMjC/+qqXZ70oi4UNohAiVibSQN
         eUjzE3JJPyKpZO2QvnwCDV6rOrHxrbhEhVaeD0sj5tKwxK1586IFIHKqruAsEmLJ0eD3
         zYFrRYFnNY8MaCHSQJUMqaGXIBr2IyXrUao5JiZZHcJiugFRyyfkxH0+7ow8vZ6aV3q2
         Z8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX+4WfDfV8BGT7SdvXrw3Vd8YvsKwXMlJEEElL71dqYOG18scGD4Bsi5UTsjgJPlrm42A4lDmtHvSVjh7mCqM0njc=@vger.kernel.org, AJvYcCW/uL/FzI0+qzgpb7CnMS9ljnsFLdaUqY2VmMdGqmUrnHanRznKIJ/dmuB07sXkeoj344QWBIAm6jgybb1r@vger.kernel.org, AJvYcCWwV71gaAFOPRfcJ+WkwVWzhurMw19rvn0g7IRW/KEBZvenZcSCYGa/sgWZcEaVEKkrzTskNbMWwOTv@vger.kernel.org
X-Gm-Message-State: AOJu0YwWSvPQzlwbLsF+uPfh1w9Vjkv41q23/Lcp0st/Bqh6K6Ha+76y
	c+wFufeKHfC+BneEKiIMRjIHJlpGvmSPrfOtwzMnqrD2ZjK3iFx796pw
X-Gm-Gg: ASbGnctSLpmP9TrvgFo5y/a8AcUWcdM/uOpju4mK/luce9PRgiz0zDZEbqG5WRrShKS
	XeGQvkbUOdPCmo0zS5MM7m41GaNBlTxqzOCo1jrkAaRYfSs3NTvyNIkVVfRvXXZJEwaMxYnr/xR
	8rAgU7r9tDD7A6hpy3oYhqDIq0Kz6+GMZGoIrq81mvUWpA+3lbduXJsa6QaB57dzK9Rp+wfBiCM
	qlH0RMwYT9ozfJ5lhHgowop13J6kVQ6PAaGdcuFjatmElkkleqKHzyj0O9/P8snLaLSJNWLg9dP
	IF3khSFkwDPxnrpyPcibNqcg4lKzxkWYVx+POQE9ZobcusnO91PG8gxsLO+IRtDiY73sMtl6GYb
	wBwe10KU1mkhRlwB1/sBZR4hRyxOr4BSNRGLnAmvT5uQjxzBinY/oRd8qKW9yi9C+EQWY9h7D0g
	==
X-Google-Smtp-Source: AGHT+IFfnc4+dszPguVkgyk1YUFpIJF9igwQLvvN40rTuusp2iyO5vQePl/JWxlsRO2NCkxAPHQZEw==
X-Received: by 2002:a05:6000:2484:b0:3b7:8f49:94e4 with SMTP id ffacd0b85a97d-3b79d43cd68mr4812706f8f.7.1754050803170;
        Fri, 01 Aug 2025 05:20:03 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4534b3sm5674472f8f.47.2025.08.01.05.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 05:20:02 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2] arm64: dts: renesas: rzg2lc-smarc: Disable CAN-FD channel0
Date: Fri,  1 Aug 2025 13:19:53 +0100
Message-ID: <20250801121959.267424-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G2LC SMARC EVK, CAN-FD channel0 is not populated and channel0 is
a required property. Currently we are deleting a wrong node. Fixing the
wrong node invoked dtb warning message. Disable CAN-FD channel0 instead
of deleting the node.

Fixes: 46da632734a5 ("arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated the commit header and description.
 * Fixed the bot warning by disabling the channel instead of deleting it.
---
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 345b779e4f60..0d357516e0be 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -48,7 +48,9 @@ sound_card {
 #if (SW_SCIF_CAN || SW_RSPI_CAN)
 &canfd {
 	pinctrl-0 = <&can1_pins>;
-	/delete-node/ channel@0;
+	channel0 {
+		status = "disabled";
+	};
 };
 #else
 &canfd {
-- 
2.43.0


