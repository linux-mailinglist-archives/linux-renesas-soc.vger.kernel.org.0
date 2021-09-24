Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F159C417171
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 14:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245657AbhIXMD1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 08:03:27 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56714
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244439AbhIXMDZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 08:03:25 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8166140783
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 12:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632484911;
        bh=TKyRV9O1Y/ljz5T9kCOw405tGOgzBL0k1lCSjTA1wYI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=L9HjsOhFCpjV5nJxzwpdhvyGToD7aFtNO2XR0c5uP3t3dWhCjDpO/cMZoD5mPLMRb
         kb4J/cQ7OMudK8bk5MeEJ3ZVfNWYhDLuvdlde/fAa2WIjkwF7jEanKpXwlqC5tGUy+
         TurNDf8oFF0Ssjze/OtyH3iPpm4vnsoimmEM1QW0vuS9diwUv4r2ucGRMspLeupCRl
         Kxks8MMChTA87dgtNfg9AXXCOf+H76g0ybWFOVk57gKOWIlbCNfu7TayxqwNqqMqVa
         nFy81nGJ3FF0dkXgHkbfy5Q+0BFcM+Dx9va1AOs2JDuY7AkBiqz1B3J0fTTVh3H11b
         cPW6T6gngurlA==
Received: by mail-wr1-f69.google.com with SMTP id f11-20020adfc98b000000b0015fedc2a8d4so7926743wrh.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 05:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TKyRV9O1Y/ljz5T9kCOw405tGOgzBL0k1lCSjTA1wYI=;
        b=eO/oX4G9PlIY6AhyZTu761UKYQtbjiD2yokK9eidADaTGETWG7Zf5KwGlDHKeHj2JA
         jA2EE/EzkLfiKXVGByiobtkJE8NGo38/Ckp/FdwiL2+hcuI68A12gOUatnneoRb4+HDH
         lh6md5cxhbxK35dXM0LQNb2J7e0nNN2g6VzbdQStzX7WwC/jQK6eiEv/kKzOCuPG1KNc
         QXssEmiyNzTpG008T1+wAidtL9Z1gI/QNx1HH8LvISD8ikCKcTZOJea5sWK7tn8Q1zx8
         2DyvTgot5qnTQFRdUPueFRAQHBKDv05ZSMczX/2/TJcnHvM+Uob00ooc+4yTau0bokxB
         +JBw==
X-Gm-Message-State: AOAM5326YpZisAz/mjir58DeTen4J1hDdgrGqAa06iLNCqS6NPjAv44S
        6B3JJXycFKwqy5o0LdsIAl1lI2GHOUqkovMvHl1fz2PMGBi0dPuIg+8MUVP5rmc39MP8t8iJNKR
        4HVWQkSIxFbOFIz/C1dIXFsZ5/1+oiuHLiQI3G6uotMHRewNp
X-Received: by 2002:a05:6000:14d:: with SMTP id r13mr11212097wrx.420.1632484911273;
        Fri, 24 Sep 2021 05:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzquSMRBcbVZ+YVahWJFTiZdrKlthMmH22osg55fb8riVZxx8aZY78k3Bx0kxcH0Mf93sm1aw==
X-Received: by 2002:a05:6000:14d:: with SMTP id r13mr11212062wrx.420.1632484911102;
        Fri, 24 Sep 2021 05:01:51 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id o7sm10100619wro.45.2021.09.24.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:01:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: rpc: renesas-rpc-if: Add support for the R8A779A0 RPC-IF
Date:   Fri, 24 Sep 2021 14:01:12 +0200
Message-Id: <163248485488.53812.2936557522765718572.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922085831.5375-1-wsa+renesas@sang-engineering.com>
References: <20210922085831.5375-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 22 Sep 2021 10:58:31 +0200, Wolfram Sang wrote:
> 


Applied with added simple commit msg, thanks!

[1/1] dt-bindings: rpc: renesas-rpc-if: Add support for the R8A779A0 RPC-IF
      commit: 797f082738b10ff397c8d3b7804b747d766e62e6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
