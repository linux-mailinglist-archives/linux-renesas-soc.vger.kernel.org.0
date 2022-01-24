Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E60D497FE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 13:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242511AbiAXMtT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 07:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241952AbiAXMtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 07:49:17 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB29C06173B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 04:49:16 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id o30-20020a05600c511e00b0034f4c3186f4so3040837wms.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 04:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/b6PA9cOecnWMlIqKJJZ3uz0OmPs+N0pBg6iqWcCqlU=;
        b=jkJU6wi43zN5lChyDuo7K+pKejJrU9V99hIZwTi7w9A4yBMT/AlBT+VA9qPZYFWZAl
         jGLNxebZBTS5Fwwr0n5edN1MbnOEMAO/sXZmXzFJryxIT3r5IpH3uvKNJLF2vIqG3Tey
         IROJ3Sc/rz00S9n+7lQ92TOAT8mF1dYVdclB9+L/j2kEnXDxh7D6phe1Zy3rQKjObe/H
         TWaoal8ZjLu5fSW1eWiF7dFjEha+8P6geXqC9ZX5P3XVjhCQ+pJjlyJxHiROdOoEcf+/
         52cmB1knp6uh8MexlR0DVv9bJXrNnlh71WojGvHn8ktzPLn7X03IXtxFvMje4C9Ndsgk
         6nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/b6PA9cOecnWMlIqKJJZ3uz0OmPs+N0pBg6iqWcCqlU=;
        b=zQOJccAXud0Qs1VbRpfCYxXjTd8JwptDtZ2ZqzedCEscolDUcgZc7JZHDOD5jTGlhl
         yNOowMEftI9b7OvK0Dhj2ENlfJl/eaEuW90BfKjPNdbLhL9xmh6JQNbtUpL4ihX9Wgoo
         ulljo2nvW4iIprgZAW5u2CUOJzR+uMH44wflGT4uwlpsWAhYUWjiALlTcSu9tBoD47vJ
         6tstc4B1lHkIKhFqQUG516eZ6MMUm7Ot/2UvkN9haVveUyBazPBYwxTBixZ2qDwtj4s/
         sfIXljyyiNazxwsN8ZIO4ynv7L7DnNUnhLf8Ob6dch81IOM/QHLPgkP4wMWYEZfS4y2i
         10rw==
X-Gm-Message-State: AOAM533wT0Q/08rd35AZXnJl8S8+OUHc2NbE0FlRWBBbnafCj5WDeROo
        fbDISGiwvNTgJAmdArTd56+CCRwcQp8YyHQn
X-Google-Smtp-Source: ABdhPJzZjK31lK9cJC7snyU4sLInVLN0X5KOt6jOVHYGjc8yWb36OppXjO5qsZcKyO4KY4GXERvImw==
X-Received: by 2002:a1c:7517:: with SMTP id o23mr1708972wmc.120.1643028555463;
        Mon, 24 Jan 2022 04:49:15 -0800 (PST)
Received: from bismarck.berto.se (p54ac53e2.dip0.t-ipconnect.de. [84.172.83.226])
        by smtp.googlemail.com with ESMTPSA id f14sm3040604wmq.36.2022.01.24.04.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 04:49:15 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/3] media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP
Date:   Mon, 24 Jan 2022 13:48:55 +0100
Message-Id: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series attempts to increase the flexibility of the R-Car VIN
capture pipeline by allowing for free form Virtual Channel routing
within the same CSI-2 IP block.

When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
routing was centred around the CHSEL register which multiplex the
different parallel buses that sits between the CSI-2 receivers source
side and the VIN dma engines. This was a bad design as the multiplexing
do allow for only a few combinations and do not play nice with many
video streams in the system.

For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
given CSI-2 receiver to be used together with the scaler.

Later datasheets have expanded the documentation and it is now possible
to improve on this design by allowing any Virtual Channel to be routed
to any R-Car VIN instance, provided that there exists a parallel bus
between them. This increases the flexibility as all Virtual Channels can
now be used together with the scaler for example.

The redesign is not however perfect. While the new design allows for
many more routes, two constrains limit a small portion of routes that
was possible in the old design but are no more.

- It is no longer possible to route the same CSI-2 and VC to more then
one VIN at a time. This was theoretically possible before if the
specific SoC allowed for the same CSI-2 and VC to be routed to two
different VIN capture groups.

- It is no longer possible to simultaneously mix links from two CSI-2 IP
blocks to the same VIN capture group.

For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
capture from CSI40. While VIN{4,5,6,7} is still free to capture from
any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
are disabled that VIN capture group is free again to capture from any
other CSI-2 IP it is connected to.

At the core of the redesign is greater cooperator of the R-Car VIN and
CSI-2 drivers in configuring the routing. The VIN driver is after this
change only responsible to configure the full VIN capture groups
parallel buses to be to a particular CSI-2 IP. While the configuration
of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
IP output ports is handled by the CSI-2 driver.

Before this change the CSI-2 Virtual Channel to output port was static
in the CSI-2 driver and the different links only manipulated the VIN
capture groups CHSEL register. With this change both the CHSEl register
and the CSI-2 routing VCDT registers are modified for greater
flexibility.

Patch 1/3 and 2/3 are cleanup patches moving code around preparing for
the real work in 3/3. The work is based on the latest media-tree.

Kind Regards,
Niklas Söderlund

Niklas Söderlund (3):
  media: rcar-vin: Refactor link notify
  media: rcar-vin: Breakout media link creation
  media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2
    IP

 drivers/media/platform/rcar-vin/rcar-core.c | 387 ++++++--------------
 drivers/media/platform/rcar-vin/rcar-csi2.c |  58 ++-
 drivers/media/platform/rcar-vin/rcar-dma.c  |   2 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  |  18 +-
 4 files changed, 173 insertions(+), 292 deletions(-)

-- 
2.34.1

