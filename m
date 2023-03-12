Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0216B66AC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Mar 2023 14:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjCLN1Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Mar 2023 09:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjCLN1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 09:27:16 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C56139CCC
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Mar 2023 06:26:56 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id x3so38512659edb.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Mar 2023 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678627615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGTUZkkfCkNxamopwrKu7mj2z6yaQ9NtQM+S0XNMv+Q=;
        b=Pd4GYJuoIpKMXFk2TWkkcUxKUSddOD6pPz0xn0z/64rFpDDy6bpCS3uisE4kcLXjzD
         K1z9OyVeJWDXualnrlw9aBaI0x2oPbk0DUqjfDzPE+ebySoPwDvyPrFbW2lRaOcqTsmI
         Ekx/PwTpjUSSUyXAudfRdX95QEywhl6T5VHuBmbOF0+eqlFoV4I9LntAGiOPSjO87wF9
         R1PmNcJpcCjJlzvT/Ci4CeD7D8TGu/iwB9t04MjJqrylcBw7w7UjJdDntVKfTd0SJm3Q
         eFfeOdtoB2GmmbkgCn+pdxX4kUy6OK8jkmAeB+uZ460ekL2GkEmEFTXQWrdK9wtp9ZJl
         xysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678627615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGTUZkkfCkNxamopwrKu7mj2z6yaQ9NtQM+S0XNMv+Q=;
        b=epTgkNGh1ZNw1e1IMiNX64NotUZ0xTOotLYSL9/rG33Y1dgJGgIfFcFqZkXV8rB0bv
         zrmS9jmynW28XBA83pPZrzT4dhWOiYMDCBINbVNQlS+8AxGtdTr9TFc/c/Is7Aa9OctG
         DcQJ6D9vxtsJ6P4NZ1aLG0STp3iGxn0iZOVmpJNRvk8Zt0egVfvEwMvPYKn/GVJfEURA
         eoug2Y/y2RMLmjqlcSVCWgxzUZURhehDv+64Ya16j1xsF7rUArr/55uMqo6JkRi89uSq
         b7Ve8AGc9x6Mzu8dmJq2iAsIJosM123S6HWIQt6HW9nKaJoixZTTqyb4zynq9Z3z/18t
         m8Ew==
X-Gm-Message-State: AO0yUKW851IBBvBdlxoRTnyh4uJ/JnJngRUPeYrxoNePXtxnO8WMWi4d
        tZeYTp2vIh2l2ibdbx1z1hE4vg==
X-Google-Smtp-Source: AK7set/hQZFH63oA7isHWbOCxn+vRqfDmoIje4sNMZQlhJlZ/rLcdMw7EGdg6+XEJ/da73x+5iKoxg==
X-Received: by 2002:a17:906:9613:b0:924:d90a:6f97 with SMTP id s19-20020a170906961300b00924d90a6f97mr2461178ejx.13.1678627614817;
        Sun, 12 Mar 2023 06:26:54 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id u21-20020a17090657d500b008b69aa62efcsm2244715ejr.62.2023.03.12.06.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:26:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] soc: renesas: pwc-rzv2m: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:26:50 +0100
Message-Id: <20230312132650.352796-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312132650.352796-1-krzysztof.kozlowski@linaro.org>
References: <20230312132650.352796-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/soc/renesas/pwc-rzv2m.c:124:34: error: ‘rzv2m_pwc_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/renesas/pwc-rzv2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/pwc-rzv2m.c b/drivers/soc/renesas/pwc-rzv2m.c
index c83bdbdabb64..452cee8d68be 100644
--- a/drivers/soc/renesas/pwc-rzv2m.c
+++ b/drivers/soc/renesas/pwc-rzv2m.c
@@ -131,7 +131,7 @@ static struct platform_driver rzv2m_pwc_driver = {
 	.probe = rzv2m_pwc_probe,
 	.driver = {
 		.name = "rzv2m_pwc",
-		.of_match_table = of_match_ptr(rzv2m_pwc_of_match),
+		.of_match_table = rzv2m_pwc_of_match,
 	},
 };
 module_platform_driver(rzv2m_pwc_driver);
-- 
2.34.1

