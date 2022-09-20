Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176935BEBA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Sep 2022 19:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiITRNe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Sep 2022 13:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiITRNe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2022 13:13:34 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A4467CAC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2022 10:13:31 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x29so3841853ljq.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2022 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=CKF6BQYE0M6ZjBPhbcszEL8I9WMlppNn68v5wJA0796BG7bPWJpkYdwEwzDJ5zO38c
         IPNqON+dtxkoS+e/7xKGdb6qPQB+r/c2Yuf90VngC03lgHqfqZUGcYNjMgo4q0Zfhz10
         6pxweTu+fdgwOu5D90Ke6IrkyuUbFQ/iw1PY3McWdxPyn0JrrCjhGHCy+R6BqhUQOu6o
         AQ+Ekwo40g4tnZyPRmBBIhT6hEQyP3A5f4k3Hgja7NW0Y5QX8rhRigefqZMr5u5vTNU6
         ZcfCm+aZzRayBZMx+htEyQTwvDyIO4UhUDxIzQBzLOW6WG+qgtu063fA/i+Nq+nAkwDX
         vrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=2xnzkz244ltAnyfgTsfWlMhjQABWTbgHK0muzgxg2wj8myzA+ypVM2b2tcuLscVJx4
         jonMhX+2dEMB4Fqng9ir+s/xmE8xR9418tYdLCdNVs8ZOp8TObVDZ846F4cTGo2ZunEq
         VNRXKELuNMz5Zk5qtF18amhFohA304pNwj+yJA7w26I08EiHKdilIIpbVQnZBntOIRJV
         ywcHeuWB+1mTZ0tL5Fsoae/woAq5NqY7bWu7CYvrifvajbL4miKPVIDiOiL8FmZ4ETCT
         4quRPYKtGrzf3gSwctiOmuCDUUBVuZNhJTh1dvYJCsAH+lJxP3O6uEwYwn8zHP41qC/j
         fjFw==
X-Gm-Message-State: ACrzQf2rrdQOyli7X54uKuEGAuQ4qnD7HXXN38CPfGgK/h2awNyGlwfl
        l8Q3t9vt22V4nSDWdMHzzbXT9rfiguZ1vZTKTEU=
X-Google-Smtp-Source: AMsMyM7ginoDrKAdtAgW1IEq0YZdt2lXPByyAXoxUm1dZu3PThJiUcKmNHdcUnqloNSw8Rq9Z0hc5ANYJCrpuyhQR5w=
X-Received: by 2002:a2e:9050:0:b0:26c:55f7:406b with SMTP id
 n16-20020a2e9050000000b0026c55f7406bmr2669339ljg.459.1663694008982; Tue, 20
 Sep 2022 10:13:28 -0700 (PDT)
MIME-Version: 1.0
Sender: williamsmartyrswilliams@gmail.com
Received: by 2002:ab3:7354:0:b0:1e7:1f4d:2991 with HTTP; Tue, 20 Sep 2022
 10:13:28 -0700 (PDT)
From:   Ahil Lia <mrsliaahil070@gmail.com>
Date:   Tue, 20 Sep 2022 17:13:28 +0000
X-Google-Sender-Auth: nURmjpF3BA4MULOzY1lsi8WGuMU
Message-ID: <CAArs3EZZ5dzLGUOWVzeuSemLcDL350Mt597nWCCidn=eHF1nAA@mail.gmail.com>
Subject: Hello, I need your assistance in this very matter
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


