Return-Path: <linux-renesas-soc+bounces-24650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C09C5CBA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 12:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E4E84F4A0F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AF6314B86;
	Fri, 14 Nov 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5eZNGG5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C04313522
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117533; cv=none; b=d+SJVKmTC8CuvxNOjr67bkhNHrXEEPYERqKE5l+OCybFpW+YvUC9cnG46rTcoZ7ejSCyLADIM4P1pdZo3/hqKWOU0ARjRrEj3MLXh62mOOBfsbrPBeJE5StCf/WGIG3gIlVv7pImjsDPnzLDSs9H75ro4Ko8oveKupRBLsJjwPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117533; c=relaxed/simple;
	bh=ru2guaIk7rMFxFxpc2N5M6yg2VTwXiC4MjDfQ6kWZxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aiTI/XMuGlrubAq7kV1YnpXhCNi4xygoDW8DZJoV9YbW8wUakkoaCP2O+6YvEGOHKome81r8oQHTc7hYJMlnSmz1kQ8XB4/uVg/H6fPsQyIA/X3IbR7HcTVaZjMhy/9fpTVGDIots+bgY2yVP6QHoLpWf+n2QbguGmnKDK4OJ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5eZNGG5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3108f41fso1013004f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117528; x=1763722328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BlqBBFnU6cpkdBKW6lNeDZYEdxfRJJxWHLMTx3xDXs=;
        b=D5eZNGG5YQWZtMyvqIa3KVOnUgH1TBk2LpJvOIDRNg5mnFK8rK96OMcnlesMpZXS9l
         XkNXOht3btt5bkDC+/8lx4+S5cV0t2iRc1741V0vtmRV1b9g9ALm5HLzGqVXi5G9qA4Y
         C14b1cv6EiTdrDPGctnNpSMH0EIj+lpoyZKqjCHxkcB66M3vjzzK6AoO01JZ5EdQi19s
         e7SVkT1h1JbT5X4AQCbWBi/DXtqS4p6OH3v0sLRxjgVe7AqZWNtVBC4QH/fka5apx+Pv
         m7KJG3MeLnQ2JdTTdjNEX3Cxz3Tw0IQ2EH1aDCtW4uVAvuzp4xRanzt1kQV6yFRDpFdU
         yQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117528; x=1763722328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2BlqBBFnU6cpkdBKW6lNeDZYEdxfRJJxWHLMTx3xDXs=;
        b=R+E2h040AOGVMHQoMS8UFNRRiNiOqgloHyY8p7MKHBECQnkhj7A0xNmnfGnwhazgoG
         eC67jYNh0JsNqcMnNFvTh7/qsvh1pX568fV/Skp1mcDN6/BB/+/nKhyJflduNqfGCAyu
         FokeY/4CpnKPaXfXHI40BNKuiD7EkGsy82++BW0G47G3YGHuOEgGeFeH7Q3MeMXODsgq
         81ZaqslywnxxGFaOwrROkzi0ZKmen+6HusEotqp6q7pTIx3EyJ43udbfFShKD1UTDVy0
         EH551/ZW00JuNookzo7phW8XwwVrzyJ8VFMrzGPPARBiI/QqKFDO2/ZtqTEtlLMVtm5Z
         3pyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU00phZH31oNZw9HA85w6aexH75T6V8/t5IRo8ZnpCGHsFVwrZ4tbNNVVLabIs1+ijm3o5aJk3dOtRwOV+NDWGHlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww2qiGmONZSZukhuOa/kbo4Hz0z/U1sHMAFDJoAZMX01B5KOD7
	fx0kd96R+AIP50S4KnvMbsVP0YBUWKhAITEArVKtOxCUZXTZjv1xox39
X-Gm-Gg: ASbGncviNO6Iz7+N6JNrfrMW94ts6tb9ClaRRdhVQv8xeaZFF/U7zxhmSCF8NsSWDM7
	2t/WEvXOP6hKVVxvdvk5aTd8b49m3E3nVYmaey1hS1hH1j/xi0GDuhqIWVvRT+JIpuXqEuSYGEn
	dHyO9m3ilbX/9eEmByLBOK0X4NWG99HP835HawFbsPyAABC3iW4P3TWEr9S3GKO7QhxpnFX90b3
	zmn2LacCGYnG5gAC741G93PsenvON8lrUGYJhJ7suCwVASjkQzA08t9OxQg6bzK5AknIavulvrn
	jifzSxGj9lPAcyBadsgB91MRWRppqP9GGjc4vCgninvzkHcqcOEjJ1MId23rZH074Gkp32f6xMa
	OfRfiyhM0xjcgwndFG+jdhs2VYeG/6gArNv3lg3FinL+EArPR9ZHkU7aVRp9RcAnUrOgPOD+QW2
	pZ+PnoZQh9sLjE1B8bHyboS1mW2Le0/ZsV3L56hg+l//oopz2j7uIHmeh7P54X8fwwj+xCPgkEv
	L/NJA2HrRXLVhOf
X-Google-Smtp-Source: AGHT+IENiq1FIhiBDu3DOoS3VvOneVM2ON1HCZYGoXUdTVJ1zjs7sgGz0Gqc2GRNOhTZl2xSdT7f+w==
X-Received: by 2002:a5d:588a:0:b0:42b:2de5:251e with SMTP id ffacd0b85a97d-42b5934e2fdmr2898715f8f.26.1763117527909;
        Fri, 14 Nov 2025 02:52:07 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:07 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 06/13] serial: sh-sci: Use devm_reset_control_array_get_exclusive()
Date: Fri, 14 Nov 2025 10:51:15 +0000
Message-ID: <20251114105201.107406-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1065773555ba..78fb3b6a318b 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3710,7 +3710,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 
 	data = of_device_get_match_data(&pdev->dev);
 
-	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	rstc = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
 	if (IS_ERR(rstc))
 		return ERR_PTR(dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 					     "failed to get reset ctrl\n"));
-- 
2.43.0


