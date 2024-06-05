Return-Path: <linux-renesas-soc+bounces-5846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783B8FC4F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A83D71C21C1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 07:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A04418FDA6;
	Wed,  5 Jun 2024 07:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvVT/o6c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A11218F2DE;
	Wed,  5 Jun 2024 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573790; cv=none; b=JmILFGZDDP+p8BxxQixDsaufZBbBYksvwASlzjZFFEg8zmuUz6BMaIVMIDz16uLCD5Rk6HnGhEG9TgYlYFZVbdpLpV572+YMxb5DMx6MYYTNFBTgNcoYHhNJf53nUkjEgabmUM38Bw5DIFIARlWQPapNBIiR+f7vILRIG2vsc+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573790; c=relaxed/simple;
	bh=USKL0G1o5LheoimXtr9ZYPptszOk/OOcnEsp0qsWC0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VdvJJh4v/qs1MYnII8hKQ7DKLS8PoF6TXZLd79qOM6XQIVNUiHxIQ/jvQl2DVFYTBx0EgEsPIcjAh7ZmMiTzNSvnAVICC5/Lq2n0wwoA7yCqD0PC+VrCB6Lx+EiEFK+ishVXPc1m76cmiNaRUz31jd4J8uGdvY3PJmU3sfHqUaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvVT/o6c; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-354be94c874so5547830f8f.3;
        Wed, 05 Jun 2024 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717573787; x=1718178587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxXe4sA/PErwQyeZiZFHuVEidHuYAz95sjxpUK1e8PA=;
        b=mvVT/o6cC1/oOQgOFmL/HtK1K++l3a8Pj48tODq0J1p7wlLPCbLzQNxx6pilAqOYP9
         stOVTyiV2UPlHusa9DnnladAPLK8SADuR9+xbSkIvioHLuoNJ54nkhKqeQa08edjuR0k
         wNgdMZs0cWKCvfo5anmojIgqh9R1I/E2l1b1Ntx+pk4YePgc/8f40W9yzLci2cw4bMMe
         Zm75v+gh9BYK90hG3Gh2JJdLmS5QK3XID9gkJnGLHTID2sqh4hfYRcwSEFyqa4MEubf1
         ZZEBl1lQx8tJNthpRy59auq6byJ45BliikQUo6n3TpfFauer4rkxJ+X+352BJ2nhUa7w
         viRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573787; x=1718178587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxXe4sA/PErwQyeZiZFHuVEidHuYAz95sjxpUK1e8PA=;
        b=MiM3Khh1RdJO5DARRvLLkO962ilVRoQ525u/ftP1Z0PZ8rxGrdBP0IcbAd8VtAVpIa
         kPtONLsxGrosGf+GJ3UIGxZC8cKydEiSXI3rt48BhSWHqSNsU27Y/ry/tKDu3eP7K1fJ
         UsYQnayOaSnl+YtZ7nTiss/dMP/HScsRO3wxTHXaoGfYHCJ2lZzgD1yIJpG6/JhLkXkV
         KP93AQ2aacF9LgPH0MSRdSrkijdD7EfzSxmpkEPy78oibpo6Rn3LJqL09PgZolWxzNQF
         F80lpEBdGyaIqH/CVC1sz+8zQE8VcODTyhlN3y4X4TLQsdU0tpO02yi//mClA9pr6CWv
         HcmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqal6ubaA0j1UThhAlW1DSZrAaFEVV1vVLR625L6g2aGqH99OrRH34HehKRpM+3tq5elUTtKHZXZ0wTmNLE3mkDkOdS8sOt/Ib0Sm2iijsutB6Lmp7aT9esPCiu6sObFL0rI7i7qvWU1buhdT7DjUAToy1YBFGmOtbznk3gPU0eyAFEnOLzJZ5B/3y
X-Gm-Message-State: AOJu0YyNfDrHB9uQEnUE6QPupfNm6QyPPM8MG3ga60Wr23eDAF80rzu+
	2sLjdStDq4NUNvOVW81e42DhBbXJFbcFDZZrhIiuJkzL/o4v/NJF
X-Google-Smtp-Source: AGHT+IHeZK1Cm71nBtwgckr34373Kx2vWINVKF4tV/EJj2FoJd/EFN2NxWzODW9ItZiA7XzusiD0Og==
X-Received: by 2002:a05:6000:1d93:b0:35e:ec8f:cb49 with SMTP id ffacd0b85a97d-35eec8fccd6mr527937f8f.61.1717573786665;
        Wed, 05 Jun 2024 00:49:46 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064bbb1sm13527200f8f.101.2024.06.05.00.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:49:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 1/4] regulator: core: Ensure the cached state matches the hardware state in regulator_set_voltage_unlocked()
Date: Wed,  5 Jun 2024 08:49:33 +0100
Message-Id: <20240605074936.578687-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Ensure that the cached state matches the hardware setting before
considering it a no-op in regulator_set_voltage_unlocked().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Driver code flow:
1> set regulator to 1.8V (BIT0 = 1)
2> Regulator cached state now will be 1.8V
3> Now for some reason driver issues a reset to the IP block
   which resets the registers to default value. In this process
   the regulator is set to 3.3V (BIT0 = 0)
4> Now the driver requests the regulator core to set 1.8V
5> Due to below check of cached state we return back with success
   resulting undesired behaviour.
   
Hence an additional check is introduced to make sure the cache state
is matching with the HW.
---
 drivers/regulator/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 5794f4e9dd52..65ee54b13428 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3765,10 +3765,13 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 
 	/* If we're setting the same range as last time the change
 	 * should be a noop (some cpufreq implementations use the same
-	 * voltage for multiple frequencies, for example).
+	 * voltage for multiple frequencies, for example). Also make sure
+	 * state is the same in HW.
 	 */
-	if (voltage->min_uV == min_uV && voltage->max_uV == max_uV)
-		goto out;
+	if (voltage->min_uV == min_uV && voltage->max_uV == max_uV) {
+		if (regulator_get_voltage_rdev(rdev) == min_uV)
+			goto out;
+	}
 
 	/* If we're trying to set a range that overlaps the current voltage,
 	 * return successfully even though the regulator does not support
-- 
2.34.1


