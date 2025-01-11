Return-Path: <linux-renesas-soc+bounces-12055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E807A0A1E9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 09:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AF1216A17D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 08:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2857189B8B;
	Sat, 11 Jan 2025 08:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="rhM9LaCg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800D5188938
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Jan 2025 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736582972; cv=none; b=T6cuj6MsnRrCdF/qxmckmm8Zb53dMQPFAVXOaCZJzR/QAEI3pHiPGwNYEzeYrxaXhagdCprtlfcqT9y7vLGOJjLecCaS4he529OjAGG7DldQ1AncU01jOOeSnC8AnryZs2ijqRU/jD/7GLsPJQq6HO7Rj0bPA0cVrkw+NXTcjx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736582972; c=relaxed/simple;
	bh=QeLi9rN/Y81guSYpnmIBy+QWiBOTr/C3o5Sn3h3tGHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NdA031XlNJcvUSQY6PJF0rAVjlXEcXPZecDyCWGl6wIoWHr/ZwrpNikUvL6geueTd3j3oBIMUhhW/hq4LFqsh0dQag58CIirpHjeQf0+9+l1UmQiMek4vnqDiMUtLuhfZ5UqyORWIvs18C7VV6R9dq+9YXGJ2wVpViJrVYivX8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=rhM9LaCg; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21631789fcdso50439715ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Jan 2025 00:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1736582971; x=1737187771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYtOCvBtRy+GJqb4Nu0sYWtJIb4DzvtcXV+G0BBPLpw=;
        b=rhM9LaCgnHhBCwiNTaUh2+0J1VMch6h0oFy1q64tc6l/zHoXqOdi76HeWofKgndYiZ
         SD9wampZoGewyJFfBSb/4ekqXNsQ+gO+6TibFfg3B5Ju92b+RQ/9aend8DP0N2aSb3BX
         NyrnrQF3Hxj0fRRx9ROvOFbpax6GjGswC0YETUNoTAYazNmzigfSmh8Z1+5wGoJqCx6A
         CYzflTe27lEST/db6lXATMUWpScSbqwY5J9XTyj91faXG2bLWNinqUwqZsgkXaaBdqu9
         nxVf0Gnn1RlPQFTarGhuOjD/NM9KE7PVTi228wIMd5bFfG4G6gKFeJ39KN0+ZPEC74ae
         fc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736582971; x=1737187771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYtOCvBtRy+GJqb4Nu0sYWtJIb4DzvtcXV+G0BBPLpw=;
        b=MZs69AOwcZgWj1dObLdEL+/uk1szLfi51fhQCoKpCpC5QPHhL9O/QRBwvVqYbfnsgJ
         IhMgoZnhdRmD9M1Fn4a4Hcs/YixSP/zdqAn02x3P4mqKUNrAqXWAXEkFv75TxnlealHN
         cjG+jXZW1Lz49dBW5JDe0+sVRUz7Yed6ackG8jG97mnrpb0O8PfqN5ZhC7cIf9/8eCxl
         e+MvmQoJT1CrLouBweyMZjqe2s9SYTqq4tMRTS0EhRBW6zRkB6HE9yd6AO6hRe3Bdfi5
         lE+oY/j26Rq0iTi2qK/QMyrNDFbJ2rq/oCX4B50Pu1az6q3gutHXdKLRuyaqQBQMx++8
         6mlg==
X-Gm-Message-State: AOJu0YyyV7SjSrKg1gp0vmVWXqKItSWY2V9wm7W6xpOWk36LCdLFq1go
	QiWzJoLEoPVzoeifNUoXlice0OddOPAv2Bl5MWeZsHjqUEz7hAe/CrF3kI3R
X-Gm-Gg: ASbGncsF0WYrcDE9OLQRgAG9qOmGK9wbH4EtDPkaAMQq9VEc/h/jMV9Wu9Xql8xWYCW
	yClBcpqZ/gQAW3rKv/6gGlETCf7pbvMC1LdfQEKc5lA3+WXtd+VeIKC5xD+r/1BjOHtWM0wIJkV
	jApv5jHskUt0acvp8FVi/Ck5t0fhATLVhZwUVOVMdTZqr7Ib/JHMcdtBByMzoQPsEleOnIdrH/8
	tuunG7DzS2adkPWMoG9DRGFkOsoZQxuHxVPLEvxfopXGuYb7WraZVK2Sw==
X-Google-Smtp-Source: AGHT+IEGRfgKX+kFYzNCu9oGzJKNeMqUdJW+ydknt0Uo1OVsYm+SZRMugsPQogJVA8Iyl7HqyXu7Cg==
X-Received: by 2002:a05:6a20:6a05:b0:1e1:eaff:2c23 with SMTP id adf61e73a8af0-1e89c9f27a7mr15199395637.12.1736582970954;
        Sat, 11 Jan 2025 00:09:30 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:aeaa:a1da:95e3:2274])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31ddb9e3f9sm3778699a12.73.2025.01.11.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 00:09:29 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 2/4] dt-bindings: vendor-prefixes: Add Yuridenki-Shokai Co. Ltd.
Date: Sat, 11 Jan 2025 17:09:01 +0900
Message-ID: <20250111080903.3566296-3-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250111080903.3566296-1-iwamatsu@nigauri.org>
References: <20250111080903.3566296-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entry for Yuridenki-Shokai Co. Ltd. (https://www.yuridenki.co.jp)

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c768..5e26fe32a50e7b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1727,6 +1727,8 @@ patternProperties:
     description: Shenzhen Yashi Changhua Intelligent Technology Co., Ltd.
   "^ysoft,.*":
     description: Y Soft Corporation a.s.
+  "^yuridenki,.*":
+    description: Yuridenki-Shokai Co. Ltd.
   "^zarlink,.*":
     description: Zarlink Semiconductor
   "^zealz,.*":
-- 
2.45.2


