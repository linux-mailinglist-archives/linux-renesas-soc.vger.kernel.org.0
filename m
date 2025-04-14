Return-Path: <linux-renesas-soc+bounces-15924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7814EA8866A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36CFB3BAD2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9682741D2;
	Mon, 14 Apr 2025 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EY7GkXWV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E02472AE;
	Mon, 14 Apr 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642689; cv=none; b=AHirMenMWxxeVkZ9bcGHVR0UEfydy/z4sZuWBakg4JMK0cc8UBbnJmumd6ph+AEFm2K/U1ejzMjOUii7E9clV32FqLWH1L3fFMbVXbV1ve43dAG9d4MGRbV0pNBkqbAv7zScfah2VFoC7pNFBWswCJ5YDCb1AEc8TToPNZzqVYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642689; c=relaxed/simple;
	bh=sHQtjHiBu/dJWoqqAoj9leqE6eonNf842HpN5HjfKWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpCQYCYz93bQvi0ZY/1bregbwrryfS55eEAGTV+kq/HhqQcoDVx3kc4ssByl5hCEsL51xEC1sd9RrkETvYn+CnSs+g78ez3568+6sgNra/8HhvYKf2a2gt1u07nAYde84thQbnhAetZdk42tmEd2JaS32v/1jupcAvEMCQixQPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EY7GkXWV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913b539aabso2646450f8f.2;
        Mon, 14 Apr 2025 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642686; x=1745247486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3SQi5bbVq7b0/N9UTMk42Mwa8HLJXYUGZ8y/oALcAE=;
        b=EY7GkXWV7Ft2eFwpFjhpx0emNCfhLzDbARoaNaAavFRn7m+BzJtJqtGBLsWpyAEY2X
         Eh5jMzhXIl+IkNCRc5xF5TJFDXUqfZAMNFHSv1PEv3R71KmrpFxHmxvFF9vbe8PGoQXE
         ZDKIayU50It1uTuHLB/WnS0JlrWwzXILTNkEqtdBtrEYeiI4Mg82xsH3QAcPz1u1YqPW
         XCkaVhUxE8jdaGvSVDgmVx6IGryZHuduIT2YjhGRV1Oq+e3TnfnKBWYgOL6bha0wTXrg
         2oB/py+yfKygKL0SQnR9zBLbseNrWzt1qidt4zCdnNVgPQsRLFMS3+3dqkToh+nbBFmg
         Iwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642686; x=1745247486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3SQi5bbVq7b0/N9UTMk42Mwa8HLJXYUGZ8y/oALcAE=;
        b=IboemLNP/Z2E9R7xmtkl1bnLuPBWIdgHizClaUWWCifn3CfvEAUq3t9DJnaMFxzh5Z
         ctL0c2lkI3GB1MwZqMAl4kWfyKoN7odp8ds9kQV20j6EGKFbjm9PSHx9+D70DJZJXMGf
         kGPxrv0EHWp7f08ID0v20r0kB/I/gYP/jXab5HGqBrCXD0289NyXBusfj1n7jCtnMAxb
         Lz4Gxx88Ny5bUYh1R5azuTkewAj3qON2DduNqbuiI02yGPT92UNI1m1YXuzx+bSMNpKX
         LvFrPp2xas9XaoZiHMerzNOVlXX2zesYP2UShgPUTOFtcGmfHHEwE23XXUq68K7S7+kc
         Z+iA==
X-Forwarded-Encrypted: i=1; AJvYcCV/bN4M92aRJ8gDAuGyV1155OkGG3Q1m9XVtrMZ4y6PAbaYV8Ftw8F0rzEe+tpzSsbggIxMcqPQAI5fY0iTZDVAdTU=@vger.kernel.org, AJvYcCVS9FlNvaVJW/x7RE47l+8C7vSqTZVjy3G5Aj9FFnKDBDDWcLiQOceXhFer+aJW2jQw7RfHh3hiOsqX@vger.kernel.org, AJvYcCXZUKbPKpCAd723OBSJcce1FAKf977jIloziB184Dvi4tkjjcNB2JvKzoxutOVeaocRXnWz6Dw2NNqV+LyC@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3cn5SejTGemYCWs/UJFoE7F4IBPqQ5uE/H2nzXEJ38H72Mtn
	oHDk5lxH+EMTyLojcwaZIetNDNWRPvlaZvaXuATANEdsPmZ9hXUM
X-Gm-Gg: ASbGncs9w/Wyn7A3KjmMoZ386cSwMBs0dkFrCWNqdYXvPcnjCx+mlNpxx+Y57qfYozQ
	ehSSgLb3ypaud6zDvtpbPS5e0WqFFP7UPC7OX/a6usavF94QwONKXCxOyBn+frWIYme/Zg9CUoK
	U+DDioXMr5L2RefHsC8I3mjE4bDqhDXAgpw7fDUVKnhOmrRMdmpO6R8gu7yH6HYdlDTcPomZB3t
	lSHzE/teVuXKbFBAJl+syFWVkcb40H/e4uuL0jCo2+d6SlnNLODyRcxRsyfPRJcIAWCMEqjwLRp
	4IL5dcVRhTEwHmgLBZVV1kvI6gNAkfmV0R9v/Me8/fqVydip/HIUPQTtICN/3OXZ
X-Google-Smtp-Source: AGHT+IEDsZPPhDuruTrdFcyXN9YqZckypb/C2JUNrPicgL2MaB2YrYVbt8z7U7orWDYJVrRxUv2rSw==
X-Received: by 2002:a05:6000:2d09:b0:39e:cbca:7161 with SMTP id ffacd0b85a97d-39ecbca727amr5436112f8f.10.1744642685419;
        Mon, 14 Apr 2025 07:58:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bdf9sm11067041f8f.22.2025.04.14.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] dt-bindings: phy: renesas,usb2-phy: Document RZ/V2H(P) SoC
Date: Mon, 14 Apr 2025 15:57:27 +0100
Message-ID: <20250414145729.343133-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document USB2.0 phy bindings for RZ/V2H(P) ("R9A09gG57") SoC.

RZ/V2H(P) USB2.0 phy is similar to one found on the RZ/G2L SoC, but it
needs additional configuration to be done as compared RZ/G2L USB2.0 phy.
To handle this difference a SoC specific compat string is added for
RZ/V2H(P) SoC.

Like the RZ/G2L SoC, the RZ/V2H(P) USB2.0 PHY requires the `resets`
property and has two clocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index f8d15f239b18..2822dce8d9f4 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - renesas,usb2-phy-r8a77470  # RZ/G1C
               - renesas,usb2-phy-r9a08g045 # RZ/G3S
+              - renesas,usb2-phy-r9a09g057 # RZ/V2H(P)
 
       - items:
           - enum:
@@ -105,7 +106,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,rzg2l-usb2-phy
+            enum:
+              - renesas,usb2-phy-r9a09g057
+              - renesas,rzg2l-usb2-phy
     then:
       properties:
         clocks:
-- 
2.49.0


