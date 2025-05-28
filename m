Return-Path: <linux-renesas-soc+bounces-17624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E69AC6AB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 15:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71312A246EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766A1288C25;
	Wed, 28 May 2025 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X//Zv9nN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD3286D7D;
	Wed, 28 May 2025 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439286; cv=none; b=ept30hfsWG8WAS18SogveSekvG8Kow7lo9+dFo/Snq7jswC7GEwK/3HQHzb1hzzGDrqwfnGaRtg4QhR24M9TLYxZ2hx578Q+C/2j0pm/5pBv6bhNwDthzhQ0BSyJH9dDv9nycImaW9RHmv4calvawvUjMPnw+VNMKdN/zaeCHUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439286; c=relaxed/simple;
	bh=qAXP3u+F6kQv8fklR/9r9VbSdVa03zSafbWjGJc6TIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8/lrFwmP+AffnBvvwecCsa/Y7JdKyJ0nvXARA4DOodGhLyBlqEtV4rsdIMoXBS1Teec5rCkBwh0gRlZvHygq/DYTn5pl1LTT9AZQN41MQ8vF2SHn0jL2+2ONPiHR9O354DaQpkdF92Gz93TbgngYEINDfXXOZHCD1K7KCGtsEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X//Zv9nN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad8826c05f2so435543066b.3;
        Wed, 28 May 2025 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748439283; x=1749044083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=60xNEii/ejRTOcRUkHwbDeFVkYWfusBxmvyh2qWNN6c=;
        b=X//Zv9nNB6iCXC3Z4W/y8rU6JXbXQ8hS4eB3zn7dIpfXJlmyLjwD7CgUtUdfJh2WOZ
         DvyAjFhyNuSkUazUeOst5rvETonISSesPAY88kaDP7dSmEN4k2LaXJ55WR3ExewfD2Az
         Jgd5e/2UwNYXkw+ANY2Bn5oiuYj3w3OfLdzZivWcWXLsLKjNuT0FnyoOxFvtGpbztMSp
         KXE188DyCl4PTAI4DrQ1EbFO055tQITcvQBbHsj9uoF0qq4IZrJmHZ6YzRfCEJfQUEP4
         huQ654j38GixaoEnial/N+Ll9ikZV79toVJm9+sxvgGWlSiEDi4pT8BxAKY3AqD1OvX9
         qSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748439283; x=1749044083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60xNEii/ejRTOcRUkHwbDeFVkYWfusBxmvyh2qWNN6c=;
        b=gJ2C/qRuTt5eSGrxvtKmM+wHk1F3u0YasWngPfAf5NFIQHZm1EgDVXv2twlbvCxY+A
         KlPqHWRMSCX2DDRxfFpDsZ8OXnZEk9cV+wZyyCUTzjcLDaLA9FxPY8YGW5YxcvGStAAu
         LlxPPE/npzWTfxxKscWaEqXS1MZfbfupQ4IwuH5WKEhfvXLiCpsycIaL+My/ZVe7FjPa
         X3mFzJRSPDVtryqEUr2JiyaI9iqOb+48FOOVoLGnZG5N5ZIw0WW9EWqiblaplCqrDRFi
         hu/mq8lpAtiDa3vunCW5UrqcsaUaVqtmILIsu1xrMJpjn89tneKL2VdFldxHMZl1OSUO
         fSMA==
X-Forwarded-Encrypted: i=1; AJvYcCVDfWEMXUaeqQIH41+KQ0P8aLzQzDFPpa5s01AosH+ZvLtc+30Bi656JkxihL/Tnx2wde4HvvRoSbRQ@vger.kernel.org, AJvYcCVLXzRT5LiKrpNyDh866GokUeXJFdlqkHjVyh+HRS5csqE9NhoGQEQSJ+H57Wf94c2CpP+chutrtrFdSG7a@vger.kernel.org, AJvYcCXEMzCjiK1ZfCIc0V0GsZpEHqtsYGAvyYtfdfBf1fUTo4N+tTcgHAXal3xHOwO+3D1GoiYWBF9WHrsZ4a/WYJK48G4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0kcSFB8wUbqJfZZPwXwGkKEe8kcAhiehCB94wvPfqgVaO024t
	cpO6nP5PZWiAvlBS51aW8BRLbiwtenUUOJOkJaSWKQIoNKVHQr8v2Lad
X-Gm-Gg: ASbGncvJRFiVNEvb2DmRm5QSvXU3nozTGfFSSa4JEwoChIhyXXuy/u913KEk5Zg3+c7
	DE0Czyg7604rAc3UjxFv9BODnUKKYkDw/dpZJK3JQpFfoWCo9s4QwwuvorInVMyyqCtQTfYzGHL
	lX83+87/815Mr4G+ee6JJhO+hRKkut8xwq/zIyX/b4coL1ZVDXdKYKSbvAmONLUuIS8KdRQpECy
	H28xKihpvN4Yb3cKGlyH74dMQtDlk0ruZGfGlXzvWo3RpXfAsDqf4XsWWzWAuvZqLcf0AR0+IzQ
	4BGZeOR5LHA/dQ8mozpqfyzpYBbH8UJpT6u61vLPqvkDx0OQB0B7Vz9gEO+jKdDc0f2QEXP+RgL
	o
X-Google-Smtp-Source: AGHT+IFOoYxe9+Z/+NoI14zW+cDeiop575WEkIIi/FLFUl9a9GCb/oDdN6EXweUmggecB51ORj+C3g==
X-Received: by 2002:a17:907:8687:b0:ad8:8883:9fef with SMTP id a640c23a62f3a-ad88883a01fmr714474966b.26.1748439282766;
        Wed, 28 May 2025 06:34:42 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7078:193c:ccdc:e2f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b486d5sm107881266b.149.2025.05.28.06.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:34:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: usb: renesas,usbhs: Add RZ/V2N SoC support
Date: Wed, 28 May 2025 14:34:40 +0100
Message-ID: <20250528133440.168133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Renesas USBHS controller found on the Renesas RZ/V2N
(R9A09G056) SoC. The USBHS block on RZ/V2N is functionally identical to
the one on the RZ/G2L family, so no driver changes are needed. The
existing "renesas,rzg2l-usbhs" fallback compatible will continue to be
used for handling this IP.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 6f4d41ba6ca7..a19816bbb1fd 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a09g056 # RZ/V2N
               - renesas,usbhs-r9a09g057 # RZ/V2H(P)
           - const: renesas,rzg2l-usbhs
 
-- 
2.49.0


