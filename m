Return-Path: <linux-renesas-soc+bounces-22500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F49BAFB86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 10:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F11217A2DB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 08:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4562882AF;
	Wed,  1 Oct 2025 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngSsctkV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB122857C2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 08:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308487; cv=none; b=iH/XX1X0W9sZcA3tke2SsdLuM2o+AW9OLHNu66cx0bXX5uJzFkpxTx2BVCoG6zh98xVqWuCDF5eu1vuEo1jTyCgckLTQU39we+hE1VXyKdAWE+hfRkbXPfXLm6VVWeQM3sPmp2G386o9PT5799Ogve1tbgO2yoLtNtdI0jq35b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308487; c=relaxed/simple;
	bh=YB1a54MMJXi5nKTH9gbuafJV6b8bO8PW9GeT78qICUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRTeVAdza/oo/B9CCV9yHjwYc+0jfAyQzn/cSs0FgoXRpyf3wwGq53ltTfD7Yz+H98pgGi0L5hUC87mb/palo5p+hSUv2ffqr5LYRZNwICC9wdz9+3WyXOOCMppMkiEok25ovmMqZzeDvlezlBqVuGPXhUKbBRNLCbXpKYoz5b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngSsctkV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b5d80f5a23eso631875a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759308486; x=1759913286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=;
        b=ngSsctkV+orETuTs/jHKwV3b0NfEvAZJvMRZrYO6TrNNhZOMCiSovUW4wHZGEwbjD3
         xt92lRtYuS+5u8jAL9m8hYxqC5L/hnPAl4ZkCyOQn7oojbz4ZaSt4aeQ/Rb5CmdD+00T
         37PwGpGf3n5hqiHy8TNGMVPtCR3K8Xa6prfVoj13LJBK/sEH56Bu8PCwQxF5Ef2zT1nB
         k5MWJduRl3xecqnpq9WUhFKUfUziJXT16XlCCxpyv8+raJBFc//mXV2R4Ps/j0eoaIQn
         wrYJfdvKFftMYe+1XVsP91dyoCmyzF7MdO6pLZxbSnICqHwpWD5SiJ3XgB+6i56KRl/t
         haMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308486; x=1759913286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=;
        b=a0Pci0Ahvf4TfGJgNNwz2PaDoXmXjPGzj0JGSPLFeNWaJnStTS+n3R7ibuQfHldP+r
         cezBq5Z2FhqRurKyWiOFY690bDLMBWri+T5rFRJIVx23k3cMOzxJQl1IDUsnobwX58JT
         pBrxXZ0K3ylC4N0ftzln08UVrMtbfjTKJ5xr3em7Tb3QMff+rliyPHdWbUmnLqMalCJT
         anUjOwLMJwGLvzolI4aAuZQZB0pEkTFSpOd2FvLcmVHn2KIuyGFdEg3nxIPjhrB85mH6
         tkrKzS57p+aBlv/Nhzx4RlzTEpoAyy7JYdQ49Gj1YnaKLCi926shJs8mvr7dR9FhobF3
         eEjg==
X-Forwarded-Encrypted: i=1; AJvYcCXsBEIJOBobyVXg5zSL8y8zqGP83mDXwRQmFcwcZFL5wxDklVXky2wDMIlkXWkiNFvYtAiUK0I6WUCL6eRyeUHIwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvRNMX4k7/sP01fdg32sb1BdBYitW/69Xrs/pmVKVl5kq4pkKm
	lZGcBfuVSkNcmOwH65kFCC9onfHLQTs+1TWmP2ow82UYAhCkx+sRCS/RCI/Nog==
X-Gm-Gg: ASbGnctCEHRpoSlXEToE0VWF1O5SVJmz2IinDJhxqr3lLBO7pZv/nb8sxdtcMQRTnwW
	35sAl16aBIh6K6EfDoTalykTG5PNuayLSo4dhsG8m2i9ylIBlBRJWwuNZ/eh2ugA5BFYzprDSZW
	hxjsKa97Und/LbzJm9rGQG0l317olHjkWUEEV0v+WAx6oJoMha4aQs4em5fzx+VG6EUCdAUC5ps
	BSS7aHpACbs/hLoAKPSUgTJkqA9wwJpG8bVXSvWILrqIKNohibStQFAZBpAv7xohrTkmxyfFL9f
	mAOy6kndX1MKtSaBNfkFh34qshPJJEfivk4tzkZJP6ZEZmc/lTHJpWS8e2AuWV4idKOUCOAo0Dn
	NRrkO0RTMXZq7Gia2fhcVoD7d/K3uzNcUmcV3Vei1SRrFiyA26HJUrruW5lUtDTZFlMZGZ++auF
	78OWFcXbFTe3QaHRX5Stj2zzrUwHydz4hjTYQfGwB1vJ/4OvVbsYSopBgN1u5GhxCaLb77dSJfn
	RCeVQC+FURj0D1p+0OsbWNsOvj2XgaeGsvzRcJkh+ZNdgI=
X-Google-Smtp-Source: AGHT+IFBY/scw80qunl2/T9Vu6PBaPWzoOPWOZLXzt1OOaGSVwS1oF91+HBdH7KtkzG6z1iTX3repQ==
X-Received: by 2002:a17:902:f689:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-28d16e89030mr90619895ad.10.1759308485671;
        Wed, 01 Oct 2025 01:48:05 -0700 (PDT)
Received: from 2001-b400-e387-f8be-46e6-cc88-b318-45e6.emome-ip6.hinet.net (2001-b400-e387-f8be-46e6-cc88-b318-45e6.emome-ip6.hinet.net. [2001:b400:e387:f8be:46e6:cc88:b318:45e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6e9d22bsm1789250a91.3.2025.10.01.01.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:48:05 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 01 Oct 2025 16:47:50 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com>
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
In-Reply-To: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
 Leo Yang <Leo-Yang@quantatw.com>, Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759308478; l=886;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=YB1a54MMJXi5nKTH9gbuafJV6b8bO8PW9GeT78qICUA=;
 b=9gzrykNcBM16KdVMIcgRlrKvmyEZmO4QeUAovkAYB+AyBN+PsDPZv3TANn7fES73RwX8lDO9T
 vVHS1f30eGtApZ+9z9igVVO00ELz8Jd0iYfWzrFWVfjKYXrdqQTH9bu
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=

Document the new compatibles used on Meta Yosemite5.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175e109a78d931dffdfe28 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -89,6 +89,7 @@ properties:
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
+              - facebook,yosemite5-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
               - ibm,fuji-bmc

-- 
2.51.0


