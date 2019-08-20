Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F077795E9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 14:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbfHTMdP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 08:33:15 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35021 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbfHTMdP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 08:33:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id d85so3322202pfd.2;
        Tue, 20 Aug 2019 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=zvwNQi4BCeuIA14cWZa0cHRt7U/PvcH30olqD0I+BGs=;
        b=OeF/l51CBLge4/Wv3+5rrj7xno8+xVbhY59avBJvgnt8NCKcSbwr86tAxJLEHTN6Sk
         kmqX0omOoG3gZMYhUvnhnIEUfbjYqRr1WW5rJ7jqniTU7IIpoRkyyURuMg2AAZ0BkrGL
         1CkCCnk13NNifXaSziMVFvSi5lRjYban9TJ/WS7CMBjs8ina5EQ01sXjcH84/nvEwQdM
         XEBQelq7hD9gywe1tT1y4OlmrpJexraQbOUcfXtI/e01zErwP+l83whuTXzWH8yJu3zL
         1RmQ/hF+IUKSX1DWo1qhc4NLg4K1wDLimdn19QPpAXVpjxX1X7kIr3XJux5ToMq0FOjR
         gXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=zvwNQi4BCeuIA14cWZa0cHRt7U/PvcH30olqD0I+BGs=;
        b=BI2PJhnQGuOpCjIXZwLdfF+vSiR5EgYyL2YTNUGfWOFkbMmcJbyR1FO/ydZDEG1/Rg
         DPvP8MTiyWk1C9K9+7Ud6FqXrDJtfVUrwNUZI9AU6a5AW+begWSqUtlpOnD8soFFmI+0
         K+LMXDSU3fMXVS2MgAOSIKDDoO465yVlFBEAC8ELFxm2iwXSQPCABz9eY5Zajt24yz5n
         Z/BwrXZmOoZjtPH/xl1Bpehg6cZniG6WsG/1tNrSUWSAJYXQ6wk4QBTuy3ZGTOqkxozV
         dqGQpjuEZKAj//X3UIkKo8P1qJFo5DvAqp5pOh/G17ZuSeCiCD4N2UbTrS7JLp/hesls
         njKA==
X-Gm-Message-State: APjAAAX9bkwdJgu9WZMma1SJQcD7Er64/Q9/f39K3vNntKCpOJxfsNrf
        r22vH5/+Klgai63mFUdi4SWeOsIZ
X-Google-Smtp-Source: APXvYqwzXZIQ5h8iNoF7/9ju+JjQYuHdT8iC1R4a+hrxV1YRmTnUBfmAlaHmjz3x6+/O3wSReeHT+g==
X-Received: by 2002:aa7:9ab8:: with SMTP id x24mr29047690pfi.98.1566304394239;
        Tue, 20 Aug 2019 05:33:14 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id m34sm20772366pje.5.2019.08.20.05.33.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 05:33:13 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        tglx@linutronix.de
Date:   Tue, 20 Aug 2019 21:34:52 +0900
Message-Id: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Subject: [PATCH v2 0/7] renesas, cmt: DT Binding Documentation and Minor Driver Updates V2
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas, cmt: DT Binding Documentation and Minor Driver Updates V2

[PATCH v2 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
[PATCH v2 2/7] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
[PATCH v2 3/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
[PATCH v2 4/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
[PATCH v2 5/7] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
[PATCH v2 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0 SoC-specific match
[PATCH v2 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated 

This series collect the following rather trivial changes for the CMT driver:
- Add 32-bit CMT0234 and convert CMT1 DT binding docs on sh73a0 and r8a7740.
- Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
- Add missing R-Car Gen3 DT binding documentation for D3 (r8a77995).
- Update the R-Car Gen3 DT documentation to reflect current usage.
- Introduce SoC-specific matching in the driver for CMT1 on sh73a0 and sh73a0.
- Document old "cmt-48" binding as deprecated in the driver.

Since V1 the only update is the addition of reviewed-by from Simon - thanks!

Please see each individual patch for more detailed information.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> [Patch 3-5]
Reviewed-by: Rob Herring <robh@kernel.org> [Patch 1-5]
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

Developed on top of "renesas-drivers-2019-08-13-v5.3-rc4". Earlier posted as:
[PATCH 0/7] renesas, cmt: DT Binding Documentation and Minor Driver Updates

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   42 ++++++++-------
 drivers/clocksource/sh_cmt.c                            |   14 ++++-
 2 files changed, 37 insertions(+), 19 deletions(-)


