Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCD46CD88
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 13:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfGRLmb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 07:42:31 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34825 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfGRLmb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 07:42:31 -0400
Received: by mail-pf1-f193.google.com with SMTP id u14so12521296pfn.2;
        Thu, 18 Jul 2019 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=FJJ4rkRuhF7LTU4hOfySh4r8brseoVAdjIrtPFASQd0=;
        b=FHhlbDORRYih4c0PmfRD74x+rgX+lWUAYseXAlER5vzGO3GHEJnxqFQDVOcv+NBN/c
         04x/ddcKTojxEZoPdN6cAKcN/A4o0SDeMq8ER02faOcrrnD99RzEZOCGwgZwebw9vNyG
         U4t4S9YLHzqAEFJyLzYBnJiPtAmTuraTgaXVCsoI5qW30v5lkwYKsiLydO6SQ6D6NXOZ
         75xeiz+62GG5rwfCWnkcbyy1emlnxy5Qe/ZNWnPd7cfPNj2mmRX0kRhiHB9GiP11E+0o
         DlMNuj1Ci3gmUM4QBjLNT4rXCtd9T1e5/6kyIJKVG2rKO60qY4QQZFhXXaodfECQgEOG
         L9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=FJJ4rkRuhF7LTU4hOfySh4r8brseoVAdjIrtPFASQd0=;
        b=fOonE/82vdnRs3gkMYOa1JxNJSxXGshw0I5jBVv+vesQdDbXZdPyZitEeQ6ata9Tev
         f38aKwdgjNv+1Z3S8HztoOljTbbSEnGFhzh17cJPOLDiixbqQXS22eE0oMezteOPQ0Tb
         Db9adqS2B7JrnJAt5eLwFUwWbsVlc8Igpo0InSstFxuSTdDJGs4OojPFF6dGCicCiBV2
         +xbYElu8yL3+qpxox8OzdlfkTUV6zm2zxsFVaWUipumHU9IOBqCCaNIr5or4fWJIIdxp
         /Y5s/UgRtipUfpuqOQKyTb/T4MVHU/B72j7AC8XA6gx5UfyuOxjo1cs7SwUK1+jNeDJq
         x9gQ==
X-Gm-Message-State: APjAAAWoD/3KRY0LHrIbQ5grVpkeyDKTuk5MWOX/yb6azaU4hBG5XKpo
        JXCjHUD5uKcGQU5HYOpEBy1SSaNT
X-Google-Smtp-Source: APXvYqwR3+iTGixlr102W1kSmhTNQa8KT6Dr62Ly36Z/f4uuBVoyu8P/ASuOnqAx2tlg9LpIgv3bXA==
X-Received: by 2002:a63:f953:: with SMTP id q19mr46999949pgk.367.1563450149823;
        Thu, 18 Jul 2019 04:42:29 -0700 (PDT)
Received: from [127.0.0.1] (FL1-133-202-12-40.iwa.mesh.ad.jp. [133.202.12.40])
        by smtp.gmail.com with ESMTPSA id 2sm50436097pgm.39.2019.07.18.04.42.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:42:28 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
Date:   Thu, 18 Jul 2019 20:43:58 +0900
Message-Id: <156345023791.5307.6113391102648394591.sendpatchset@octo>
Subject: [PATCH 0/7] renesas, cmt: DT Binding Documentation and Minor Driver Updates
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas, cmt: DT Binding Documentation and Minor Driver Updates

[PATCH 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
[PATCH 2/7] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
[PATCH 3/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
[PATCH 4/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
[PATCH 5/7] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
[PATCH 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0 SoC-specific match
[PATCH 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated 

This series collect the following rather trivial changes for the CMT driver:
- Add 32-bit CMT0234 and convert CMT1 DT binding docs on sh73a0 and r8a7740.
- Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
- Add missing R-Car Gen3 DT binding documentation for D3 (r8a77995).
- Update the R-Car Gen3 DT documentation to reflect current usage.
- Introduce SoC-specific matching in the driver for CMT1 on sh73a0 and sh73a0.
- Document old "cmt-48" binding as deprecated in the driver.

Please see each individual patch for more detailed information.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> [Patch 3-5]
Reviewed-by: Rob Herring <robh@kernel.org> [Patch 1-5]
---

Developed on top of "renesas-devel-2019-07-08-v5.2" which includes
CMT DT Documentation patches queued for v5.3-rc

Earlier posted as:
[PATCH 0/8] dt-bindings: timer: renesas, cmt: Various updates
[PATCH 0/3] clocksource/drivers/sh_cmt: Minor DT compat string update

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   42 ++++++++-------
 drivers/clocksource/sh_cmt.c                            |   14 ++++-
 2 files changed, 37 insertions(+), 19 deletions(-)


