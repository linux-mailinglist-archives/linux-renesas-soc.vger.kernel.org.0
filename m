Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B620166493
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2020 18:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgBTRZz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Feb 2020 12:25:55 -0500
Received: from sauhun.de ([88.99.104.3]:35012 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728756AbgBTRZy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Feb 2020 12:25:54 -0500
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
        by pokefinder.org (Postfix) with ESMTPSA id 40FB52C07FE;
        Thu, 20 Feb 2020 18:25:50 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/7] i2c: of: reserve unknown and ancillary addresses
Date:   Thu, 20 Feb 2020 18:23:56 +0100
Message-Id: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

One outcome of my dynamic address assignment RFC series[1] was that we
need a way to describe an I2C bus in DT fully. This includes unknown
devices and devices requiring multiple addresses. This series implements
that.

Patches 1+2 do some preparational refactoring. After patch 3, we can
have child nodes with an address, but no compatible. Those addresses
will be marked busy now. They are handled by the dummy driver as well,
but named "reserved" instead of dummy. Patches 4+5 are again some
preparational refactoring. After patch 6, all addresses in a 'reg' array
are now blocked by the I2C core, also using the dummy driver but named
"reserved". So, we can have something like this:

	dummy@13 {
	       reg = <0x13>, <0x14>;
	};

After patch 7 then, i2c_new_ancillary_device is spiced up to look for
such a reserved address and return it as a good-old "dummy" device.
Sanity checks include that only a sibling from the same DT node can
request such an ancillary address. Stealing addresses from other drivers
is not possible anymore. This is something I envisioned for some time
now and I am quite happy with the implementation and how things work

There is only one thing giving me some headache now. There is a danger
of a regression maybe. If someone has multiple 'reg' entries in the DT
but never used i2c_new_ancillary_device but i2c_new_dummy_device, then
things will break now because i2c_new_dummy_device has not enough
information to convert a "reserved" device to a "dummy" one. It will
just see the address as busy. However, all binding documentations I
found which use 'reg' as an array correctly use
i2c_new_ancillary_device. On the other hand, my search strategy for
finding such bindings and DTs do not feel perfect to me. Maybe there are
also some more corner cases in this area, so this series is still RFC.

And some more documentation is needed. Before that, though, the generic
I2C binding docs need some overhaul, too.

All tested on a Renesas Lager board (R-Car H2). A git branch can be
found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/i2c_alias_device_v2

The I3C list is on CC not only because there is 1-line change in their
subsystem, but maybe also because they need to be aware of these changes
for their I2C fallback? I don't really know, let me know if you are not
interested.

Looking forward to comments!

Happy hacking,

   Wolfram

[1] https://www.spinics.net/lists/linux-i2c/msg43291.html


Wolfram Sang (7):
  i2c: add sanity check for parameter of i2c_verify_client()
  i2c: use DEFINE for the dummy driver name
  i2c: allow DT nodes without 'compatible'
  i2c: of: remove superfluous parameter from exported function
  i2c: of: error message unification
  i2c: of: mark a whole array of regs as reserved
  i2c: core: hand over reserved devices when requesting ancillary
    addresses

 .../devicetree/bindings/i2c/i2c-ocores.txt    |  1 -
 Documentation/devicetree/bindings/i2c/i2c.txt |  4 +-
 drivers/i2c/i2c-core-base.c                   | 29 +++++--
 drivers/i2c/i2c-core-of.c                     | 86 +++++++++++--------
 drivers/i2c/i2c-core.h                        |  3 +
 drivers/i3c/master.c                          |  2 +-
 include/linux/i2c.h                           |  6 +-
 7 files changed, 83 insertions(+), 48 deletions(-)

-- 
2.20.1

