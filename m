Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE7A847DB9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbfFQJBX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:01:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37184 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQJBW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:01:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id n65so979758pga.4;
        Mon, 17 Jun 2019 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=VrOVxPuHy7nUA8bVhkN1FIu/LUmbz/UL9YshASe4QG0=;
        b=MrBsnZZijLIJU7ZxzMQhN5Y8wzzUrmK5mnz8PyRVEnC330Y4NMQnYDCAX/LvWxcAE4
         rUj/kHkHwTBgABKtomTYZiJmfQoFrLbn3ADK5PUvIK7xWmTcSV4WdpbXgyvbGALOtiCx
         r6r7DT2LVGAovCqaqKmtAeebEckOHQn2EAcmy/766rjSP/GrEaYqvXFL1WNDYt4kYFvI
         JUBqkA6JUWK5R6o2knCG5GBgaRPV/ZJzgQoIZYBBm88cTDci5WlAHbUW4SrWm2N9Ewf8
         9z8hAfmVJU2qvUb8sKzxuLXCqQ6b8CjMG1GAvRVM26xVD102C7MIlNDMU2sy4xWwTJc9
         AK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=VrOVxPuHy7nUA8bVhkN1FIu/LUmbz/UL9YshASe4QG0=;
        b=oyrElmSuMHRbI1ygp/YnRaQzmI1i0Z+mknTLcBPiufGJtjYRmE+Ix3qnC9xKK0f3KP
         LvoT/UkAGYw8ncqxIZDCeKT0HL6DnuVS7S2KYVWsP/97/FjJinF/mm+X5U0RbGp/qDTQ
         ijs9YhBAFbJ64QlEi815s0kwVxg1MbCmOTuc2TLKO+sxWjQZqyeSd29TOqPQ6jKT7wHA
         KnBxEssK4J5uItGWQ1nUj8lkY/qVY4LEqtG2Mi+6wUCEu6cYAemnLaaNdbRZwlMTo8D9
         aLgKXVMKhU5Zt2Pz6b0Md8/xzh22oYdPcfP3Siw6rQhlG64W/vhSlUXuZ2eNo1PdHtTa
         c1yg==
X-Gm-Message-State: APjAAAXebYBuktQ4hzjS+0wSzBTaou1ybGSqHDO/7Gr5aaO6xR0/Md70
        dFiJ7rkenQPcsex8/2CZMLJxN6M5
X-Google-Smtp-Source: APXvYqxFI2rwxXdGvpY4ADOKDFzZV9UVbprQAJUGzaobbMICkw2Nzv+TBTn73VuF9qGY3wVhXfd1Og==
X-Received: by 2002:a62:e815:: with SMTP id c21mr71977111pfi.244.1560762081995;
        Mon, 17 Jun 2019 02:01:21 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id g17sm14149549pfb.56.2019.06.17.02.01.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:01:20 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Date:   Mon, 17 Jun 2019 18:02:47 +0900
Message-Id: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 0/8] dt-bindings: timer: renesas, cmt: Various updates
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

dt-bindings: timer: renesas, cmt: Various updates

[PATCH 1/8] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
[PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
[PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
[PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7795
[PATCH 5/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77965
[PATCH 6/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77990
[PATCH 7/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
[PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage

This series collect the following rather trivial DT binding changes:
- Add 32-bit CMT0234 and convert CMT1 DT binding on sh73a0 and r8a7740.
- Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
- Add missing R-Car Gen3 DT bindings for H3, M3-N, E3 an D3.
- Update the R-Car Gen3 description to reflect current usage.

Please see each individual patch for more information.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   54 +++++++++------
 1 file changed, 33 insertions(+), 21 deletions(-)



