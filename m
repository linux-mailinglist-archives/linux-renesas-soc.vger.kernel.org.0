Return-Path: <linux-renesas-soc+bounces-19570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBF7B07EE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 22:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 407B4189ADFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 20:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6484E2C158E;
	Wed, 16 Jul 2025 20:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ws715Onn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70FA276050;
	Wed, 16 Jul 2025 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752697771; cv=none; b=rYo9Tqh1BIFx/UtIknMzkdBzg5qxaM5rMFDPkomU0geeSXgTTfSga110umgFp8y3Kv1KmPkuM4OYuUtc/Gr1zJFExyvANqCtZvzgikHP3RdVheuzMwLpAW1aIoTYogBTkPSXKj1y7Nd/CAXxv61tWhBk7fs47RI5jOEZ2XTEAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752697771; c=relaxed/simple;
	bh=+Os/S0psLbqwRgePy1azhqHWR/ODfIORB/aObUr/CaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SVTgHUp2hOd4ixb1PbRZ4GIn+Jti9vQCsScSo5y7BPq4TzDnhD1c8boBnBQwL8Zm5yttgmOcvkSTTUUqkX9JRBm2/qAT5gny8OD2EQvxZ34g9r9yjZxZLsU5sIxqUThk4uLEBaoZDowCup0lASQECbf7JUUqmYnI5mLCyos7upM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ws715Onn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4561ca74829so2886735e9.0;
        Wed, 16 Jul 2025 13:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752697768; x=1753302568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv42pwkQ8U2aAJLzyh0onhnRM8bThCgjUOBE6I0x4wk=;
        b=Ws715OnnuFM+uuirmYP27WgJIA1E9QMWGbrWG0SSnB+y/zM9qD9UpRcOP/NDH6EJEr
         gsTCoUh6ihFIge6AlG7Z1K00pVZbhJv5ndSHyhzrgQGxYFo4qQ4QIa3Aq5Ucd61bMhL3
         fh/m/OPypnzwD5YkdkUdcVItg8MEWKUzIQaxNYFvK7WXb5Aly82JSEH2PV40v+aMNU5D
         27lJRYYxNAr4/BugEF5AoAOeCA+W3EBufyyxIuIkwNi1U5eJr5kBz1+XETGvJFHOhQbD
         tYUxcCz993jRBO1e5AcrFqPSd3yvXsS0RE0vtyv+aCTHIO8faCIvQ5tOxWImfleJ6j5c
         odBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752697768; x=1753302568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv42pwkQ8U2aAJLzyh0onhnRM8bThCgjUOBE6I0x4wk=;
        b=HHnf55XKdozpRoyVm0i+L63+kIICmNwfhxWX5UpI8WMAkYhQpY8HKxRffDEkG/Wi06
         kvGX9ulz/hkFQT5VNkgQYzSrIHnatZ8vfj2bDsyPnXQ1DiSxGzAORlkonPECC7DbcOoQ
         Kic7R2LzXsOcJSra0/29go61AUwEjLh+2XLRFiHBmpbWzV6NpPmReWeiK4DlWoKPsqAK
         y4guq8I6okIdrHH4elaTEcj6Qi8/XgO2mizWZIF6XthilJo7JwlZA+Lm791XGZlsihlW
         BP8sE76bHDY54yijpIi+XyA1SwDMu/lP+Iu0X+9pk7rcoHWXKtT+WUC9YTuG+/Qc7A41
         WeeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8C9WwGndoe08yFDobKFadVJcJv01UZT0h0HeDQPfbKTOYl6PDeimqcHma+DrTe3D1kXN61UzVceIt85v4@vger.kernel.org, AJvYcCXYho9NER3JbDmKYm7zyfqVoMSjBbLl+QstaYRCyAJCX9l0VHwQ274rpA355qMbNoKVsFqrunK1XH03@vger.kernel.org, AJvYcCXoERFV86CoF3wbI2PpIfKamqJ71AzE3fdHwnA2SFA56LNLpIM8/WQjhgWLIG6nAYo/rtoFI7UzxaF53IAT4lymCTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2iTflHDIQ6ktV2r5HcK+nMSMOXKcpxeo5qeNLodHDNQt2G6nb
	oq1D17Ku8u7X/koROMcP5zfku/W29HboKOkHaYHG5P4/Gn8maD+R0QK2
X-Gm-Gg: ASbGncvAMwz2PwG4cpyp93iYX5F4q0S8MW+d0dTYJ8bftvtyD3OusmaIPtCWZFSoYwW
	4URaTNJlqAsqAEQu2PkEFacTsUUNygOR0SvksN7/fJoRAPlgMNaoz3I1wLWdQlhVMv2Y8sxf12H
	BZL9VPwJBHDGmZbtGzIrCzNX++eQTYutsJc4JUWHM6DKfb/FaFZH6nyXyEo1Eus2eJJkugKLZj3
	+/Zjx9Z9M4mc3pH9lZYs2DWpMJ+hMv8eBrmbTJ/9CoIPpRI1ZSFOG8vbS4xY3Xf2t8NkBYTt28m
	Z1PO5RrvC4D+h6RiU1FeXwIRaiY7Co6Xio3ktvmB4XWpzeIuGlysHva4mQG24XZpOn/D8x4QsR3
	kLzsWVmg6/3cYh6XuwFIDBjnh15z/eLFm4FWRo5s48b1hYkM=
X-Google-Smtp-Source: AGHT+IH53+0XDdUwczXbl2+ZIfTEYSel7KTLQmeVOmoZuMxA7trRRVuXUk9gWLbPmT3bhXFLUcwCwQ==
X-Received: by 2002:a05:6000:2006:b0:3b3:9c94:eff8 with SMTP id ffacd0b85a97d-3b60e51c895mr3135256f8f.27.1752697767613;
        Wed, 16 Jul 2025 13:29:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7668:11fb:4cef:dbca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d571sm19068666f8f.57.2025.07.16.13.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 13:29:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] dt-bindings: serial: renesas: Document RZ/V2N SCIF
Date: Wed, 16 Jul 2025 21:29:23 +0100
Message-ID: <20250716202923.163950-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document SCIF bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC.
The SCIF interface in Renesas RZ/V2N is identical to the one available
in RZ/V2H(P), so `renesas,scif-r9a09g057` will be used as a fallback,
allowing reuse of the existing driver without modifications.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi All,

This patch was part of v2 series [1] where rest of the patches were
applied, so just sending this patch for review.
[1] https://lore.kernel.org/all/20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers, Prabhakar
v2->v3:
- Added reviewed by tag from Geert.
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 8e82999e6acb..24819b204ebf 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -86,6 +86,7 @@ properties:
       - items:
           - enum:
               - renesas,scif-r9a09g047      # RZ/G3E
+              - renesas,scif-r9a09g056      # RZ/V2N
           - const: renesas,scif-r9a09g057   # RZ/V2H fallback
 
   reg:
-- 
2.50.1


