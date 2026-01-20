Return-Path: <linux-renesas-soc+bounces-27107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB06Bvh/cWk1IAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 02:40:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 633FE606D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 02:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0166B80C5C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 12:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2017B436351;
	Tue, 20 Jan 2026 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUuHvB//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1C3D6670
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913562; cv=none; b=nB5qhrAQYynERAPCICk7IgLo9R23XEqW8xX8yRCEb4lwU7Yc53nAOq1FM4k8X6Q8WlUtl6c4oaftyprrzejM59B4R/Z0MDrVnSaae/livRoSiRx27ZNTHG/Jh6POAoimNX6cv0ofO5S1ZY+USOjSrIjRWJs8Avt0JJQKqqyHkmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913562; c=relaxed/simple;
	bh=tKERO6SBJJqx3TRK7XGrvuoyFR1bVVvpi8MF7J8Ro6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEN8lZjk4Q/YvwC2HYYJgn9nlOWYgkxftcvUGSVWqL6kpLHwcMbuwBz+HQBC0LC9u5IjfdTpCzJZv0/KWyvrGofPsqLUPkADiNHNuVif6cIscbPAKsmMWB7Y0G+cBenuFr/Zy5f8M8pv2AJV6xSQlZPQd/VJO6xDgcfDokZVQnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUuHvB//; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso7463278a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913556; x=1769518356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSRKj6wmV+AKwbO+bGsCVB/saW4/0FVnBMzHhAa7IM4=;
        b=SUuHvB//U5azkJAptRBi2hNg6e0eHeJyvP3UiQRQCdhVfaKsGgVus6BVPV1UgwM7Mw
         PE9w4sCsRSZZoukS9P9xB3Fc7gXFOYgOESmanrCAGAH5RCp2Sa+EK28UGlnSvUWQR+Vk
         fRrqyj8eSdDK3lzOAZNgScmR8zftY4JRVp0QFrxJiy9k8PNMOXv8enCjtkOdtbvoGjNl
         5/R80L0WxxqpG3eKt8eAB0Sh8vyRX0236p7mDjsPmdlQ2tS2HSEWxn/FbXmU7sJHlNKi
         60IIEqvHh5V6vgZd3N5R2hXv4fZegWN8XU4uKoEgmDqgM9ktR6ipUSwgmCvY0wulK8eB
         KFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913556; x=1769518356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSRKj6wmV+AKwbO+bGsCVB/saW4/0FVnBMzHhAa7IM4=;
        b=VXrmjBoK75yPH1uBEHgYPCOM7AgSGO2PuK1t2gWdEKFkfhJznsUnaUyBiGcoP91jCP
         z1MnHfol6JKtayHUJODbzsUPRubPGBdAYtd0G0UQZaCSOwlwE5Ft0BR6ENNHSATOAxKQ
         yFDe8+3KU3W2YHHZG26xUjQXHx+Fyor0eowxGS3vTiqB3TC9iEawuJ/7vYfEDRCxFaas
         MKrTSwh789vNDDImElKx9scA43BHa78YTywnbYNJna+3o6dvPZEpbJt2JphUWhjCeJva
         S664kZQ7E9w5Vn5tYyk5JdlWQZIhfvDiiXqS/M4MbWI6dzUXh0RfyAj5qmX+TG1cxcr4
         DBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxGsvufGDEA0X0CLqrfMquYwLBT6QhyDP4U59PXVmMdk2JDh8ncH5Fvt3UN+awoJ8vhVxi9HWNwHNivvVmfmtO9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD9NkANbD9xcQDLmPssgcw+UExI4p8OWrxpGw9Oqlfxa1TRGfj
	l8MLAYbOBYco5gchN35HtxPGU3PceAYFHbwIawiRydm9olFoZG9JHk8G
X-Gm-Gg: AZuq6aKTVFy2wfA+L7uQAsMk7p7uefKGkXiGiqJRON9i3Uvze4NOzZa/hkwsJrgjH2C
	MEH1FwKZ2IqUXwh9eWQDLsgfVCZI46qAwtpa3CLCZW6MUFMxJqY/kXLS5UbQ/RGttycOUluM31y
	kwTpA3xbD1fcu9xCNOK2Z4FYHbFk4GNT9ZrcsC0AmMjWFwMjv6wZqcEOE3Ez73wEHtyKmTxRTi4
	zU2kiMqt41P4krjKBWc/7aLsp6nfkOTA70LOr9Z3hkcCY+flQjgoYUHRcQ0FzW3ihnIZSkxN8zW
	8fyj/zNPQ8r0A3A9HDzVj1KEN8+wcamSUtQ8aVFc50FwHIPD5fOngboweSS4kJPqyC8w4v+DX1c
	mtGI7DHPWWqCAu/hOlkOmQ2IAS808pX4ioARjpkDNJB2LQAsuRxIbp/J2h8sIZeXHtqIcgNLk5c
	FEP5CC4Z6J4kLucZRxxM8ERteW78PeOq16w3w=
X-Received: by 2002:a17:907:a089:b0:b87:fad:442f with SMTP id a640c23a62f3a-b8800348bdamr159690166b.42.1768913555975;
        Tue, 20 Jan 2026 04:52:35 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c8c7:2ef6:8ac5:5556])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1420626066b.41.2026.01.20.04.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:52:35 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 01/12] dt-bindings: serial: renesas,scif: Document RZ/G3L SoC
Date: Tue, 20 Jan 2026 12:52:12 +0000
Message-ID: <20260120125232.349708-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[36];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-27107-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 633FE606D1
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SCIF binding documentation for Renesas RZ/G3L SoC. SCIF block on the
RZ/G3L is identical to one found on the RZ/G3S SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index a6ef02327be8..82f54446835e 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -82,6 +82,7 @@ properties:
               - renesas,scif-r9a07g043      # RZ/G2UL and RZ/Five
               - renesas,scif-r9a07g054      # RZ/V2L
               - renesas,scif-r9a08g045      # RZ/G3S
+              - renesas,scif-r9a08g046      # RZ/G3L
           - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback
 
       - items:
-- 
2.43.0


