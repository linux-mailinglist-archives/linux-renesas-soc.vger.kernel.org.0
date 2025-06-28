Return-Path: <linux-renesas-soc+bounces-18875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2809AEC6DD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 13:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5F61BC5871
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 11:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4474E248F6A;
	Sat, 28 Jun 2025 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP5I16ga"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF6C242D8F;
	Sat, 28 Jun 2025 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751111843; cv=none; b=T6nI3MR8WToMoFbcqGj95eRkvA1b4f3HdxpnnJilFtVpniSY/b6P0LSSjFWz61T/aZwztOSfiMu/HX5Fn7XJwwEovxMfHUCW0IyMdT6TPzpK0eyW7zvDmElY4+UDUphhx3Gi4V1/9sbSBzVB3xw7q5dOBsAXemEEZZEn5MU4fa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751111843; c=relaxed/simple;
	bh=yvzND0sg3vpEhdaF4vdRpgLUncWkV2C64H3T2NXjUg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJ1PvK1LMeFafBXIsLIk+fMf8Soz/sRKqbvsIkYBQUmPkuUpocdHOXLmbwll9U8fxBV6pIBDKHcR1uXJa5gvQSskYWy5y09ES+gB1mzAco8FC7hp8j4t20bfKHTCoH+Mqal9qHqjfGoWK7BZSCfoqdwXloLtNQ4hQesOy1ILhWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP5I16ga; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so2703727f8f.0;
        Sat, 28 Jun 2025 04:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751111840; x=1751716640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuC82DbT1dmtTLXSBrJ5w6LkrvFEvJAEZJmY/9FJv/g=;
        b=VP5I16gaAe9a2TSiANApDdsEkrUWnqyRTuk2KLkW6sYFGC+9kA84F9/IYETNMgwXlZ
         p7RmiIu49gerzij2p4inH/C/Syanq7dWrk0RZI0C4GAyEFu8D7O2UEfUCZgJy/60/m5g
         hDZS4wGq5Cm36DZ0ftZrUxHraUaVU0bMPbN8yyiVfryI/B+6/zO3+0tM1jgUV7cXwsyT
         vSM/bUncXbLDNs/BjlNUtieRhrf2eyuMVOwriZL/p/GjnLE5d3Wuuk/hXnoHz0Ge/MtH
         5fhbafXQUzZ/qvy6zeZvOH5Ghbku24thJNlgBfWKev7F1ujD/wUHsb09H8tOLTcjD05v
         LJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751111840; x=1751716640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuC82DbT1dmtTLXSBrJ5w6LkrvFEvJAEZJmY/9FJv/g=;
        b=IuZ9qu8LPyVliWZ3HjWhgw4QDmnoz7ZaVo0RMQAS41JrsH8o2rDIVkxS/TYN7zNDjr
         E+a/PXhEVx0yfQV35X4vaEX8jPXjsg5cdiDELBhDf/atqAj905vWOdBXqSYfNc2nm+wN
         xz+quIvniYnTzSF8eRg0FnOtNcxUEVlKEx+HH3/2Rsgs0+9pCT0+YyZCOarWkDa0kA/T
         mGZlMFlMomIWHardE52OceMa9WtDJZSj9ASZ660YgYDSOMDObsI+SBpl2Nb/tfYaJKUA
         J9+6vaCOshMchKcjCTYC9ZZKZhwvEscHql3dMnGi3vcg1o6isXzjWR6PXSljiphSIyf9
         YfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2Djx4LZSrm7sF5iGBqFNG4+UYTWJeculvFKuwyObZyN/Cx+EWsk7MJAp+YIssdw3BkZuCO+CXasiU@vger.kernel.org, AJvYcCWfryS25YHmsYm2Yi3LQLbmA1PrU5A7J6YjMiB3QSwSGu5xpAPPlb0JOKD1BK41q6ZFWAwUAYYp8PJCrs4d14Onfn0=@vger.kernel.org, AJvYcCWwtVWrBndsRiwYEHtWgA8ejAPbGJSsBIY8RYJrP72+fsDyENNKOlPT8KGgJ7UlxlzStYqMMadakW6UpU/s@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ZR9+oOzhTFuqiNROtSBk19OF1CMoXqOjgmM+TEnrr65BNZWw
	k8dqrkT4I0TA2qO/BDTCOzVM44/U36rwGcFb/QU6sbk5KRtHiYZV0HQH
X-Gm-Gg: ASbGncvGr0fEOvCposRp3g3OJAXFXz2NOLdj9DgUZJtk18SFKSxO51GNm/uXbTiPyPZ
	shQ3wAo0oD3WXrc6ks3X89F3dOE+CUotjTzh2sxSwlkVUWwxJNmDDbV8gllnNAv183ujzCvTHqT
	2zFzyFeq+PB2260lIFEqIG4EyaZIAQMjxto4vRAHc7CcjYT2UOKKZOlBjl2WclnilodKke3HgMl
	bAhQ4dJGYUUC48mLjY/ykxObYqEaW3c4NYBvrJDSwoZsn38S2cN/N12quQG7FUkt1KAJ2cOfch7
	D8o+/XbCqUVKJaM8o+tNRmh6XPsMA4pwjQp/axkn3YNFv0XttEeRG+YZ5XUPwLDdSjlaZ8NNT/P
	hSfAh5iaXDZ2SgW3yIrgG
X-Google-Smtp-Source: AGHT+IG09ATMYcw8IIItItTBNyXB9mBmFjmTyoZsuRr0D1YtmHXdtsrvLFML5KcswZmf7Cwze7KJ/w==
X-Received: by 2002:a05:6000:40c6:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3a90d0d6ce1mr6864480f8f.1.1751111839307;
        Sat, 28 Jun 2025 04:57:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dca0:b0f1:f055:ea37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7310sm5247818f8f.18.2025.06.28.04.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 04:57:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v13 2/5] dt-bindings: serial: rsci: Update maintainer entry
Date: Sat, 28 Jun 2025 12:57:12 +0100
Message-ID: <20250628115715.102338-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add myself as the maintainer for the Renesas RSCI device tree binding,
as Thierry Bultel no longer works for Renesas.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v12->v13:
- Rebased on latest linux-next.
- Added Reviewed-by and Acked-by tags.
---
 Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index f80cb60ae099..5aa31e2e31c8 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -8,7 +8,7 @@ title: Renesas RSCI Serial Communication Interface
 
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
-  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 allOf:
   - $ref: serial.yaml#
-- 
2.49.0


