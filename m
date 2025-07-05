Return-Path: <linux-renesas-soc+bounces-19270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849EDAFA14A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 21:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC3154A77AC
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 19:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F081C84CB;
	Sat,  5 Jul 2025 19:08:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DABF19CD1D
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Jul 2025 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742537; cv=none; b=KB+3j3TmJ/JJN8ameUMwElZXAAITIux93IVrkbdID91Bym/YhgK9e+vU0eBQoGcVruS+2asBQcYZqrh2Q4IL3jjhxcjiVt6J1/fY6uXNIfR9xwHuo3E2X/c+l4cssjjzedBGEFiDaCf8qwWNl1TrnXyiPzrb8dHmmzOlQ9C2uE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742537; c=relaxed/simple;
	bh=5EPCd7mgWkSSi69/gcToNW9Ic58X7LcISm/IhCKemcI=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=eAEgLS9GFvzXZiZGPInIqYl1VgihdQSQSX+2Aejo2Tyt5P5IroMyWnYUJp3fVdAThWVxASza4+VM+2r+Lmh/CUlNORu/Ey1iz4bO+xrKF2m4CTJU0pIPf+bvY3+jFha6oPwWtk3ADlqz8njPP2o90FfKK4AgAawkdjuMgT3kAm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6faf66905baso28230756d6.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Jul 2025 12:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742534; x=1752347334;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSZgO62sYhbRUrX6DM7v/4kR2Px5APcbuTHj31OnGIs=;
        b=oFjHSl36Ol/pbqEzuyrE6eoT0WKlGz85EHxf2W+AsLuUZQ5Rp/+lqGh2MvTMTdNHOT
         7MaDwY2MzvlN2bWu2zSgO2E1gjpGfiGcnkbk+h4EXTXDwKmmSiMuYeKWzmmRZ+5H5mFu
         2gp2GD3QBj80tOQ8+SEIMLw/9KgLOZJnlmpE51Lxp2jPLClCveR/sZuiiGsSh3OBLaXy
         PzbQmb6KUSuKTa/gixkLI4+wRSXbawPz4jJsOICzUKHKI3pDLHyU4ARKL0R+kpTD7U1f
         AsLMbPzd/iTyvRwYkkhOZmwjZTqWipXQeKtsuAlxcRo6nZiy7i2MPsVlqnlCRGzMTUe4
         VmLg==
X-Gm-Message-State: AOJu0YzNhu0hGNONLjwdzvzwRBC2/zY+E4EC16Kp0pAPVDMwP0BFdQav
	FWbYNX8PKRqUeALu1tnHgkpMPvwCeAYTm7mB+rwqFNRT4CHaJXauwOiBwFWQDla/
X-Gm-Gg: ASbGncvJA8cJ2nlk5gE6HgHROozpZJN7vaTxfQdHTq+QKJQTyvGb/g5unLbID8F1Isk
	yoPEGjMXGn13cygqpOJIwdswTzBpaNo5YpHYqLTl/sa5IaPqAYzsOQ+rHoe7uApg1fXAJboSiik
	x4H7zkmfewhDKdXm8rkQf2v25cJT7kV2jHaNMdEhHDyHP8zJEi4mC1Rji/8k3jDbFM7ORSHCha1
	DhUA91pPhGIL1yBNQUbtVLSYSJ/JSeYRoitSB2OLz5LDxxXiOwNsIph9sTX61ge6R4+Df3jP3zx
	lMrjOkTopIXDguhHkn4ZUBlfPiQsHJHrpySTxzE95olgYBqWaTw4rEY0M367v+RxttKUUGsj6T8
	onJs84ENmJG1Y
X-Google-Smtp-Source: AGHT+IHlYcqoYRBX1CedWs0nOi0wm6I/WwmU1OAgYdovrHTrIIvpfQ623IUSsz9ie37ZCshnjoB7Kw==
X-Received: by 2002:a0c:f086:0:10b0:702:ca9e:db95 with SMTP id 6a1803df08f44-702ca9eddecmr51493536d6.40.1751742534187;
        Sat, 05 Jul 2025 12:08:54 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc7751sm33024966d6.10.2025.07.05.12.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:08:53 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be
Date: Sat, 05 Jul 2025 21:08:51 +0200
Message-Id: <175174253155.83411.3250526926071589353.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH 1/6] dt-bindings: memory-controllers: renesas,rpc-if: Add RZ compat str
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add RZ/A1 and RZ/A2 compat strings for the renesas rpc-if device.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Applies to next-20250704

 Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml | 2 ++
 1 file changed, 2 insertions(+)

--- 0001/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ work/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml	2025-07-05 21:37:00.395177936 +0900
@@ -27,6 +27,8 @@ properties:
     oneOf:
       - items:
           - enum:
+	      - renesas,r7s72100-rpc-if       # RZ/A1H
+	      - renesas,r7s9210-rpc-if        # RZ/A2M
               - renesas,r8a774a1-rpc-if       # RZ/G2M
               - renesas,r8a774b1-rpc-if       # RZ/G2N
               - renesas,r8a774c0-rpc-if       # RZ/G2E

