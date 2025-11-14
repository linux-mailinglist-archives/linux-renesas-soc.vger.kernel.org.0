Return-Path: <linux-renesas-soc+bounces-24623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4593C5BE00
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F63435D05A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 07:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9E82FB095;
	Fri, 14 Nov 2025 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdb/zCRj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56582F83DB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107143; cv=none; b=IEVs5jyrqR2wFNZ8EAi4/x2a0A/qN2QImDHXG4U8EReKztwNVEJdcPkq1SGGvmls11bxbQaIlOy+7zW8M7OX+xjvFZYyl68HA2Qe0wFLYH4Rm3JjJgAzv3EQ8EqKdvJL9Y9INoC2VL6TDVX5mtcHtrzEhGyWl1QywwMfia0qsk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107143; c=relaxed/simple;
	bh=o1rnBfocrHJzjDC8V9OlpRup+6s1WoIhBZarRlOb6TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNDxlDIKbsPVy1wsaVg03gWjdS++nrP8IKpBMjQFUw5U1jExSUIkvOhnxw9XggOiF4wy1Hoi6TkdW+2XhylFz4l9FW1t8GLl9pEM9dHe6Zx+6l5w13E9AguR2QElsrj+ve19rvYEJmDUYh3r2U2gKF1Pa03+2yH6jpTFE9kfHiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdb/zCRj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4711810948aso11145305e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 23:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107140; x=1763711940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gtugt5POyRPdPZEOkeBhc/9SShTfFcU1Fk57+kN7z3M=;
        b=cdb/zCRjsD24bqxUh08aF9sfItGGOqtrbm/5yvEmQLuxctnJSdR4cdFqup4fdE7+NY
         86CwI+TqiqWeEvHC0/0dwTJHCpXHE9X+ExTzXpPLHksFkRnN18FnwbGZUrAO/iQVMZqW
         bKAbH0jFG0n8nB//d3m1rolPZXqVn1Uqv9OWyUapFcFFzFy9QirFUPa7/hhR7l5JSgLC
         iIMNc3vPdC62nYiIdTd5gX/ObPbC7QLekK9ZqO3iHMrtTJKcgEmyvv5ETo17XvG8hcKl
         9RFasIGqe42V/QX5fNTpU+2NLg/VSCEgv6qNs8O9dKXHISkDeSo2+NlpsfiaKhp8UAo5
         1OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107140; x=1763711940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gtugt5POyRPdPZEOkeBhc/9SShTfFcU1Fk57+kN7z3M=;
        b=FJ7yS5p00AcomVrX53+cO3ukChltZN+y+zfcLyitKyMyIw+Lefkcgjhu/ugTUztcLm
         h12nHNDKPRVWV1HU1RSztYJ92gX3sBz60IW77JXgAL+leMB4hN8tbIX1o7abWKKQVSMh
         VcSnAZ8n0mUjzWF+pK1BJIRq1tpO9yfElXHCroHbGn0hjW2Rjd/VQgA8Cqsm+GbJ21Aa
         CT4CvQrOI1VrwfT43xmLN8yFVMSJHJqGZFMKOSbOwXKC56MSKaaSyKqoWp26GLBXPDAB
         IaeVpbmzNso+3ejc1mxDmhMeF/yUjXCNwtuU/Dsib/8PrqJZib7A1RiW7wrkrc8RaEvs
         GPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJvBIqazYXaNVbIighzjXK2Vh3dS2jZlp3I4QX2vGZu6K3quk2MUotNiN3dWVd6LDeDO8jP/G6rWIFI2WFP5JPcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTPemnTov2C9H8MevptEZu457USepYLF1ny3ncGt6GISPcC6Fv
	UIDXx2thj2y7jjN4E+H+c+a7o/y6mzN9oV5FFP8vDvWFMfFV68DD65tF
X-Gm-Gg: ASbGncvVvjtPSKOPep4I3TDnQy7B3UpGkY1x8BWV1hUfcZfN2ba5WZhJFk7/sGpXtyk
	95VmRIRO5S1zDJVEIkrvhmMIdAMQaqjv8bdWirab5dSWcproQc6w7deb/KfM9udxvc5vbEfFOdp
	liTZD5gzKVe9Pry/eOrufw/wYaGOUloorsinyn/43gyp5kH994HmyfR7YbwNxK+uaB/dMTDzjRK
	GRetKb7UBLSM6/E0QyXTBhmT2jC4Ktgpr7UmvJhoN/qKC7fTUStv2LaICd7isMhcX4rPRXV+eoD
	1oQVSZlxq0q9etNzK/2fw+OwPtPB13EhSXgcr0INjP68m7ISPxGDqbRMmtFLjUe8eu8aPI7qx+K
	73Yv4OUpIsbh42yHeqCQSwP1MMTXgT6Bjjgo6rQMvZmyNXqQxws69lEjcWrRBXhhZHK4Y7RaGdr
	DuTwsM6d62ZFw14mNlSXFpAW1gJz79ruWIl7XR4vOf6PwympXlEhtNTOHH6lFejEEZ8SvhUVxL3
	H0M422AbM5q0MrtZWkmgeAL53U=
X-Google-Smtp-Source: AGHT+IF8ErsAkrTbvPtKk5YAcrD03Pxq+e86LCosiwT1QeFSy/EBdABo2BfsSDRYxYXL8vWvLJIKhA==
X-Received: by 2002:a05:600c:4f07:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-4778fead9a4mr17077075e9.27.1763107139927;
        Thu, 13 Nov 2025 23:58:59 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c847bbasm76347895e9.1.2025.11.13.23.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:58:59 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/5] ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
Date: Fri, 14 Nov 2025 07:58:49 +0000
Message-ID: <20251114075856.4751-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
References: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Remove trailing comma in the terminator entry for OF table. While at it,
add a space between the braces and comment block.

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected Rb tag from Morimoto-san.
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 845a55250d70..21f7d7c7c009 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1244,7 +1244,7 @@ static void rz_ssi_remove(struct platform_device *pdev)
 
 static const struct of_device_id rz_ssi_of_match[] = {
 	{ .compatible = "renesas,rz-ssi", },
-	{/* Sentinel */},
+	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
-- 
2.43.0


