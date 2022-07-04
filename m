Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05348564BF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 04:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiGDC4k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Jul 2022 22:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbiGDC4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 22:56:40 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D556469
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Jul 2022 19:56:38 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id r1so7390872plo.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jul 2022 19:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DzA2Xk+NtOKQ5imTIJiacLihoXAKd/32IL3C0vDDbNw=;
        b=OeedBF5yGFSurVImInYzqcG1l3t4a1mvWMNbkRN2ebaljZq8BFrKk6x26+c5I63REM
         JRJf8ILhikuJ/W9cZ3MAZ8iHx+aPBqDyGuo2NRTN9AK7ezpAbbA4/Se9cUWd042Edvst
         UncM6C+5pH10JAmnSj8Rsgbhq5uO566d2snvmJB9Z4SC3d9rVLVJ1r18oFB2oXWGO2aY
         g1D6sQetFzejk3hYDiyqRvGgFO+3jl3wE9QOvoee023LEBtIkBF9w+BOkATpNIpTFYkE
         c0gj68AmnLOssoJmvp1vipC/GdGtWpwGSx8hQPdo6Dg238+FiAPUvR5A13tNNsMYp75i
         Qulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DzA2Xk+NtOKQ5imTIJiacLihoXAKd/32IL3C0vDDbNw=;
        b=cKhPMreOYMsoiP+G48/4JzrkGpAQthFDAqI+liHC0YRwnG/F11vXd8Pa0rai3VnDWx
         5WwZo5xt4/Z9QMsUd2F0jr+nX8xehqJWoYFqk0GQXJMBGrIUly38lYfo1jva2Lm4ertB
         2xPYNrvLa+txA/UBX9+itW4ykp6nSbE/9sPKkSeCj4ro8O2X6RHQWLOPLC0q6pESi0Eb
         I31K8ncqUw4SSGqvHlUtWfnEZ4chwCkcIB6oxDY34wGRNqEFad/rqZy/ufu4eyBhecr0
         qGHwMQkxHQ2WEJjZRwrHDKGvWQKFyoY3XTLlRXZb4W24aJsxGjbssxKPbNzEQ9rR7Ur6
         kB2g==
X-Gm-Message-State: AJIora+KdYumhnm0dH+nN601M82O3cJxXzyb1kObZ279NZi1h7m/SGLd
        hr8I0ewSjP5LRbiaTdcawZN1jzlGK0ZjzzgQ
X-Google-Smtp-Source: AGRyM1vxgKRz3OlVWxnPNYjGve5XGnrafsBNV18x02gWKsFzVAdNezEwV6iOpT5Y8yDLLiGaCR+mug==
X-Received: by 2002:a17:902:f792:b0:168:e97b:3c05 with SMTP id q18-20020a170902f79200b00168e97b3c05mr33931322pln.94.1656903398069;
        Sun, 03 Jul 2022 19:56:38 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902f78a00b0016b80d2fac8sm14283887pln.248.2022.07.03.19.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 19:56:37 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 1/3] tests: Support enum property type
Date:   Mon,  4 Jul 2022 11:56:30 +0900
Message-Id: <20220704025632.3911253-2-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704025632.3911253-1-taki@igel.co.jp>
References: <20220704025632.3911253-1-taki@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a support for enum property type to AtomicRequest.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 tests/kmstest.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 11cc328b5b32..224c160e32fa 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -269,8 +269,18 @@ class AtomicRequest(pykms.AtomicReq):
 
                     min, max = prop.values
                     v = min + int((max - min) * int(v[:-1]) / 100)
-                else:
+                elif v.isnumeric():
                     v = int(v)
+                else:
+                    prop = obj.get_prop(k)
+                    if prop.type != pykms.PropertyType.Enum:
+                        raise RuntimeError(f'Unsupported property type {prop.type} for value {v}')
+                    for value, mode in prop.enums.items():
+                        if mode == v:
+                            v = value
+                            break
+                    else:
+                        raise RuntimeError(f'Enum value with name "{v}" not found in property {k}')
 
             if not isinstance(v, int):
                 raise RuntimeError(f'Unsupported value type {type(v)} for property {k}')
-- 
2.25.1

