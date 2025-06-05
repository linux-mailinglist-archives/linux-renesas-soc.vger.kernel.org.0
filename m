Return-Path: <linux-renesas-soc+bounces-17859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2BACE8E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 06:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ECC63A876B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 04:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AAB1FE44D;
	Thu,  5 Jun 2025 04:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="MbUqVah+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116DD1F8EF6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Jun 2025 04:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096541; cv=none; b=P+QWQ0m/z6e5K0MI1+grc/+PNoWJWct3FCCHQzkATevfoqjMagL5/xk/WR9B8hlvY9BAHgyGN4ts2krrwhZjzNSAYfE6NKq/yy4fHv4QPBAnAahXTxDKD7LJOD7OSrqYI2j+20G4+sfwM0B1gJAutW9POpaj1LNLyI90fSmj+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096541; c=relaxed/simple;
	bh=a9vspmwOZwaz+AyzjgcDWgvZX8fCbnDmm62t4KkqheY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dtxl9I5xAYBHQqmY7cyuCCfsSdC5jrkX4pZV+6qwThgncHqBB/oPVW+Xfp7OSLKorMxdDWOmqPkcd+ghAFK0EmPIDA+hBr0jajqPdVKBm5Fmb4aJYh8LwJkY2vcU8wJj66h+L2skNDcRHbeRYlO9yr2yJAUvt3N/PBLL4bPkJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=MbUqVah+; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742caef5896so537503b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jun 2025 21:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749096539; x=1749701339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjfsNmetPpQZcvk0DXM+9sLzYuAqIccObvN/JpO0d60=;
        b=MbUqVah+lK7MXo5D9b75EAAiO3RxL25XvgKnX3d2tfAGIJWU9X2cgZ6cOnYP+btdeL
         sxX1RWPDTiRC681CL/0yGaH6mernQu9ZansHs5yxLVfoKVHb2bySvLiZzN23Lmma8OrA
         B3LaElePpWuXrPxc7gV6jxXsfA/H1dYrqO3YfBD/KGBbeVURtNkWQzg22zzh0iPDiG53
         o74ARzsneQFNAYCyRpyOBaIOP2T6FfbBZ30p4MwKaGJA6fpoaTqz3b7FIAFPE9vdDiy7
         10rN3EUD5rrLZKZfwlsD6Z66sltmLKSWwsFcDl54dTfBfKSVc99p6EUOs+67awo27PXV
         hAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749096539; x=1749701339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjfsNmetPpQZcvk0DXM+9sLzYuAqIccObvN/JpO0d60=;
        b=U3m4VxBnrTRE1AX3h9OguZiIGmJGeiy65i2nDIrDUvNGfDU0jjy/LgJrtO5EjYiyvE
         pw9RLpB+ysNCp+3EF3WskADvf9Po3hmzeEaSRJck0mwmyGqm+LTlnr2NzNkdRSvhkRl0
         sZlQxdefAVW4OSUthW7ldjOFc6RdT6x20PoBdz2D9pw9vwHrrxrhrnZaHvumtLBKPod6
         JovvQXzOuNj4fV/ydJAM+EaSb0qjSeYjIGXF49GYyOIngoaoiDzIojghFpfbdKDC/T0C
         21LlxFroYWK235LtAVv+zpTUW3D2iM9piVV1lamtS6H5/qIPxJPuiCr1YOQm7R1qMxyQ
         WB5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBES4Rp2SxXzxzurQ5EiSg5+Z5fIdGvTePfVEkrBnEublq398eDbeMTL11Z4PBBm+ZD69VtUzAwqvieqQRVAy9HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzftGfwW54MaZqHtuvqz51PbHGqPErzpbNvOleeW0tGoawSHAXH
	yqqn+T5Xf1AHxaKM6IMEK9bw/5NSI5MZQ6q3/40Ff4oBUKlarXuyI45nypOyJyDtKyI=
X-Gm-Gg: ASbGncsuZ0LZowbl/0OPxuKjZZe4v7pnLAGxrMHD03eSnwWjTrKTcfGSOMDsr0GwIR2
	KQPnPwVUSIG8MgJlFs7iyphY/GDRHMj4zX8ewIoUxQB1S7IwiehXrQ6Ykq5ploY8kfgyjl38KkO
	lGnEEBjC2FAp9Gpj1HD325aRdPs1hz2Dec1NLk18xWGZAWEmSiHVM1A2PjoIrXSh4vX01DwQTa0
	yZPA4knCDG7N6tgYdZSwa/FIJs1sDyLJb/nj5LBmC9gSvj8zmewcOkfeqC27yZ7HwB3LmX/aoLQ
	nIkURTMpmgF+Bz4o0pktbtPqOBQSxO9isyjDoSD4OY/u1Foc1dWKCiGvJZKV19RFvaSnuEIMn/0
	GAJYhvhcDzhFSs2mqG05v+HvbQ0d+Yw==
X-Google-Smtp-Source: AGHT+IEirjuNisMSQ5l3eLZXrOk0WC7VdmxBT7nUZIwftQy8n8ayiAsp8QGY4W1u4FXoCgiVkkh9VQ==
X-Received: by 2002:a05:6a20:12c6:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-21d22c0e03emr7290700637.10.1749096539440;
        Wed, 04 Jun 2025 21:08:59 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb029fbsm9480924a12.13.2025.06.04.21.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 21:08:58 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
Date: Thu,  5 Jun 2025 12:01:33 +0800
Message-Id: <20250605040134.4012199-2-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250605040134.4012199-1-chiang.brian@inventec.com>
References: <20250605040134.4012199-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device type support for raa229621

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v4 -> v5:
- No code changed, included Acked-by tag
- Link to v4: https://lore.kernel.org/all/20250602050415.848112-2-chiang.brian@inventec.com/

v1 -> v4:
- Correct the subject and commit message
- Patch kept in sync with series version
- Link to v1: https://lore.kernel.org/all/20250314032055.3125534-1-chiang.brian@inventec.com/

 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index bac5f8e352aa..3dc7f15484d2 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -56,6 +56,7 @@ properties:
       - renesas,raa228228
       - renesas,raa229001
       - renesas,raa229004
+      - renesas,raa229621
 
   reg:
     maxItems: 1
-- 
2.25.1


