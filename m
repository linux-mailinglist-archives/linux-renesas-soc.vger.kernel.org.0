Return-Path: <linux-renesas-soc+bounces-19522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBD0B02AF6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 15:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78108A42D90
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 13:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C5F275B17;
	Sat, 12 Jul 2025 13:39:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B51D432D;
	Sat, 12 Jul 2025 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752327566; cv=none; b=WEQFn+eaDsywJro8phi1hKjsIrEEE8gCqYqqUeS6qJDAT2tXCixPIEmZHG/fqG92zGcSYzGZXvSbYtwQE40GN173ngSlx1bPFzfPwyYhjlAAFWRZ2yhP1qqHcaJhpzN6kz9n1TFpaSE+mnoj+KHpxQu3H6yHGxVuBlg4Q4/mCSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752327566; c=relaxed/simple;
	bh=M5hXdZsaeetKfYAp1XDJARNbi69VSQ+NmQ8EhXHh3RI=;
	h=From:To:Cc:Date:Message-Id:Subject; b=KI3hny9e0lR7lB6/vGtY0wFXDloCp+qTa5xJte5UIDbdBJjyq5lf6vE8ceZoovZlvG6a/2smBMP+3q0Yrdjn+E90DO3XpD8GgrgjONg6zOOVXlTUNEgDBk2GKkhufEUdQ/rGC5kkdJ7xB62DxQybn/JlcueJO9VgrCfHuvnEQOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7048c49f1f1so24738176d6.0;
        Sat, 12 Jul 2025 06:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752327563; x=1752932363;
        h=subject:message-id:date:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SZndGvUIt7DDXRADXtu3mZLDJeHdxPsKl8EmZDOSHs=;
        b=avCr43mqB5kuoYb8GkoLAL7n7oFfQ7if5dFqBcJMWpURg1w5TBaJkm0Uze4m41MtbK
         /tkp+OIhIbN+7PwLb0dpH32G79gtczDjhcW9aN3jUm5GD7OF3IOHsDAPyBTdQ528CnWu
         u+v2liZsCJq7Wy6K/0vF+r8erFjyqk4uVWhykesSQwnbZKsyZdVq+Vr9Vmohyh5WRUNg
         6/dxY6s0iaxb9jb7h2BEMODXNdpdRxTaW5GIff8ZOh71ogL50G5RscAiB/wuPxcjdcng
         bKn5ZULSGZufEm3KKjJDroyraAs1F6K8/CiA3okIFdFj7okDCTHlIk7gOY7y+vYXR3SM
         ATMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRaLce8E6XK4SZTEWurrTeqtq9gnO6l2Hwekceq4L9ieyu1pyHaynkriqXEy2L7k4ARNvBwUa1QxvdfEUn@vger.kernel.org, AJvYcCWUqIqCNytag2KWFVEcRLggajAXUwVd9UiQ6YjPaLEpNcOuKUDjFC0clMFkOjgzifnsFFF4o7qRVWza@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3nPq6g0AJDmW2LzgOEsE2FM1/eMCDrCYz89fztS5TLr0QW1i
	S4oaVNlvCSX+OY/V0YarLM1mpZzWKpB0EUBNt1tZ+Ge9i18Ps3xbOXWhpU2WZk/x
X-Gm-Gg: ASbGnctNHFKLLVrqgOC/vK84NQ62x/VT4rLAE0zchlaGKAcYOcMsUVcROjSsYcCdjr7
	6PC18fWsM3Dj/JeViIsGM28aczm5RIEccmPom1lcp+7ZDE03CueQOx0pRLGqOnQcfcJy3zBtdVn
	R6B7VNTiDeElCmI9i/RdhRbw9xwSEHLeZt6EkXpRdZ4sh9cmNcWcLrhDGwvrYSI4NReMyIuiF7A
	7MEvqYfkL291PmClf9G7P4CbPvQ/+pRSocO4WSV6TfiSHhnUKP2iy1OudfRZVgL8EKripeFnSVd
	pPeSY/9KCEu+qyMgELzQj6+tQALAOwBllUoqXRo3j3dBXhhJ5aoLtjtP94SpbcnCrbIoy6XbgZE
	4BxGBzPdVpSKPl0BBC0XVp4h40UlSlCp6ZRduv7ISIcU=
X-Google-Smtp-Source: AGHT+IGkbBEwGq2qLBGHwHO2t0nzxcq5VVfnRjSsIiJN3bTfGveARjN7hFqIzPalJ2ym9OzevmoWOg==
X-Received: by 2002:ad4:5f0c:0:b0:704:7d2e:dd1c with SMTP id 6a1803df08f44-704a3518d25mr116039096d6.3.1752327562897;
        Sat, 12 Jul 2025 06:39:22 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799ef69sm29506716d6.20.2025.07.12.06.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 06:39:22 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be,devicetree@vger.kernel.org,conor+dt@kernel.org,krzk@kernel.org,linux-kernel@vger.kernel.org,wsa+renesas@sang-engineering.com,sergei.shtylyov@gmail.com,p.zabel@pengutronix.de
Date: Sat, 12 Jul 2025 15:39:19 +0200
Message-Id: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH v2 0/4] Add RZ/A1 and RZ/A2 support to the rpc-if driver
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

Add RZ/A1 and RZ/A2 support to the rpc-if driver (v2)

[PATCH v2 1/4] dt-bindings: memory-controllers: renesas,rpc-if: Add RZ/A1 and RZ/A2 compat strings
[PATCH v2 2/4] ARM: dts: renesas: r7s72100: add rpc-if nodes
[PATCH v2 3/4] ARM: dts: renesas: r7s9210: add rpc-if node
[PATCH v2 3/4] memory: renesas-rpc-if: Add RZ/A1 and RZ/A2 support

Document new rpc-if compat strings for RZ/A1 and RZ/A2, add rpc-if nodes
to RZ/A1 and RZ/A2 DT files and add support to the driver. The reset
controller is made optional since RZ/A1 hardware comes without reset bits.

These DT bindings and SoC DT files are also used by U-Boot. The patches
have been checked against checkpatch.pl and the CC list is taken from the
get_maintainers.pl script. I have not run any scripts to check on
the validity of the DT binding documentation change or new DT nodes.

The patches have no ordering requirements, feel free to pick up part
of this series and/or ask me to rework and resend.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Previous verison posted as:
  [PATCH 0/6] Add rpc-if to RZ/A1, RZ/A2 and update/add board support

 Changes since v1:
 - Added reg-names to the rpc-if nodes in r7s72100.dtsi and r7s9210.dtsi
 - Moved the compat strings to keep sort order in the DT binding doc
 - Added driver code that makes use of the new bindings
 - Dropped board code

 Applies to next-20250710

 Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |    5 ++
 arch/arm/boot/dts/renesas/r7s72100.dtsi                                  |   24 ++++++++++
 arch/arm/boot/dts/renesas/r7s9210.dtsi                                   |   13 +++++
 drivers/memory/renesas-rpc-if.c                                          |   15 +++++-
 include/memory/renesas-rpc-if.h                                          |    1 


