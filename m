Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87CB147DBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfFQJBu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:01:50 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41239 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQJBu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:01:50 -0400
Received: by mail-pg1-f193.google.com with SMTP id 83so5423399pgg.8;
        Mon, 17 Jun 2019 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=2wMW9Dh6mUNEmu+hYi9PSNyuMCTovDxEpPcbK8G0uxI=;
        b=bLGxhujuNWrvsWURqZjixTP7rtEWZ2TRJrcX9vh9DGVs8XkiNJkw+2qEAFumQqNfKY
         hQmjwFXu2NJL1SF83bRMIrgbN15EOESO3ejeNvIUoBenSzxkAKQj0gpEf6n428YqiDk0
         +SqAlatLhSfsR14b1ecvhC7ojn5/shNsnMVNQHToQUVUV4U/ty5bYhy+ultme6u8iZje
         MjjwDSYIp9PnUW9oe1n2Rv+RZSU36ZJ88wGQ4MviOudHqk/6v0IDWL2ZhT9XYVuJEIqb
         YxQb9wqr+IRII8nxQwgy2VCg4j0KHMAtSp6oWahPGyzF7Tspkr5C0pFDcPBf87WfgbUD
         M5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=2wMW9Dh6mUNEmu+hYi9PSNyuMCTovDxEpPcbK8G0uxI=;
        b=VUywAvhWhCL/QJ+u0tn9dyr15gb1KCQ4EvaDkJw6ks2vhxgpIfcoKP/EWyMS8KCzh7
         Us6AYKpGWrxFWPB80f2Jg5Q5c+O3zJy6Cew6tqYzKn76jGzZdW82atvDoMBpQ9OQfqNr
         0LIDwEVOnhg1ZvnFM723W9GzQ2rdLPKhzHMo+hxZTe4eKMSQfZoX5juPhFgKa66Ho5Nu
         JgdoMextmDbaQ+rwlesSy5FTq8+t7IBSaDPsykygzLWf2X1QS6tZ+aWpEZ8d8QvEjZ9y
         5KAZDmkgB4mNW9tg0UVg/tl723U7qmeSLtIQ3goS1LU9j+8Zy605NtJqpsJVSD93AxoY
         s0AQ==
X-Gm-Message-State: APjAAAXdiSlJOcX98D/uuNm6CHR6sY03/Q/3wrAIhcKacn6E6PrsOce+
        oS+hqqESZ/JLYYpt5iQIzB6uR6fg
X-Google-Smtp-Source: APXvYqzTjixHUr4ucHEPvvu4eSrPqlI+4fpHb4jpKJF6nbYCzH8cqZCHJrC+eq7/Suq/BVL4TyLVcw==
X-Received: by 2002:a62:754d:: with SMTP id q74mr88007225pfc.211.1560762109163;
        Mon, 17 Jun 2019 02:01:49 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id s5sm9591452pji.9.2019.06.17.02.01.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:01:47 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Date:   Mon, 17 Jun 2019 18:03:14 +0900
Message-Id: <156076219472.4736.14727682068388338615.sendpatchset@octo>
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds DT binding documentation for the CMT devices on
the R-Car Gen2 V2H (r8a7792) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0004/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:35:10.526874153 +0900
@@ -35,6 +35,8 @@ Required Properties:
     - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
     - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
     - "renesas,r8a7791-cmt1" for the 48-bit CMT1 device included in r8a7791.
+    - "renesas,r8a7792-cmt0" for the 32-bit CMT0 device included in r8a7792.
+    - "renesas,r8a7792-cmt1" for the 48-bit CMT1 device included in r8a7792.
     - "renesas,r8a7793-cmt0" for the 32-bit CMT0 device included in r8a7793.
     - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
