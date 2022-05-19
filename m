Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02E052D78D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 17:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbiESPcf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 11:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbiESPce (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 11:32:34 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19125C84D;
        Thu, 19 May 2022 08:32:31 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 22DDEFF808;
        Thu, 19 May 2022 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652974349;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hKrtA8hHRp6m3e8Ogw2x8R6ZNuMP/N9koMR2t9nuceE=;
        b=jV4c2heL8ZjOSlM0aINmt5Dos9dvPDEfNGNw9Sil46OAxB1tQPOtdJ+4OqbCwsnX5+n6nC
        igIE9nxcWx1xuz71PmIm0D+m+qZzRPh/ug8gI6ot9iPxvbKcyXHtJFgsrXkcfSnznOIwDR
        +6cqsApt5dC+xHOGDjVgqjKRlhkiVY7ReOm72A6sKdMQ7ODx6ddrFreDloZgyc5oc8kZt5
        wno7RqScG6PfTQ9bw4NcPoyxUzuDRxJq7zvR+J9bxdcU3RYGbDNNvcoQy5hjBj0EGqA4/R
        WWzM34MtfcpJrgeEr0hE8PKo9/Xyj0A+hZZRnk5Ps7inyKoJD/k3y7hcgJ+zjA==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next v5 00/13] add support for Renesas RZ/N1 ethernet subsystem devices
Date:   Thu, 19 May 2022 17:30:54 +0200
Message-Id: <20220519153107.696864-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas RZ/N1 SoCs features an ethernet subsystem which contains
(most notably) a switch, two GMACs, and a MII converter [1]. This
series adds support for the switch and the MII converter.

The MII converter present on this SoC has been represented as a PCS
which sit between the MACs and the PHY. This PCS driver is probed from
the device-tree since it requires to be configured. Indeed the MII
converter also contains the registers that are handling the muxing of
ports (Switch, MAC, HSR, RTOS, etc) internally to the SoC.

The switch driver is based on DSA and exposes 4 ports + 1 CPU
management port. It include basic bridging support as well as FDB and
statistics support.

This series needs commits 14f11da778ff6421 ("soc: renesas: rzn1: Select
PM and PM_GENERIC_DOMAINS configs") and ed66b37f916ee23b ("ARM: dts:
r9a06g032: Add missing '#power-domain-cells'") which are available on
the renesas-devel tree in order to enable generic power domain on
RZ/N1.

Link: [1] https://www.renesas.com/us/en/document/mah/rzn1d-group-rzn1s-group-rzn1l-group-users-manual-r-engine-and-ethernet-peripherals

-----
Changes in V5:
- MAINTAINERS:
  - Add Florian Fainelli Reviewed-by
- Switch:
  - Switch Lookup table lock to a mutex instead of a spinlock
  - Only handle "ethernet-ports" property for switch ports
  - Handle RGMII_ID/RXID/TXID
  - Add check for pdata to be non null in remiove
  - Add missing of_node_put() for mdio and ports
  - Applied Florian Fainelli patch which makes stats description
    shorter
  - Add Kconfig dependency on ARCH_RZN1 to avoid Kconfig "unmet direct
    dependency"
- PCS:
  - Handle RGMII_ID/RXID/TXID
  - Use value instead of BIT() for speed/mode
- Tag driver:
  - Add Florian Fainelli Reviewed-by

Changes in V4:
- Add ETH_P_DSA_A5PSW in uapi/linux/if_ether.h
- PCS:
  - Use devm_pm_runtime_enable() instead of pm_runtime_enable()
- Switch:
  - Return -EOPNOTSUPP and set extack when multiple bdridge are created
  - Remove error messages in fdb_del if entry does not exists
  - Add compatibility with "ethernet-ports" device-tree property
- Tag driver:
  - Use ETH_ZLEN as padding len

Changes in V3:
- PCS:
  - Fixed reverse christmas tree declaration
  - Remove spurious pr_err
  - Use pm_runtime functions
- Tag driver:
  - Remove packed attribute from the tag struct
- Switch:
  - Fix missing spin_unlock in fdb_dump in case of error
  - Add static qualifier to dsa_switch_ops
  - Add missing documentation for hclk and clk members of struct a5psw
  - Changed types of fdb_entry to u16 to discard GCC note on char
    packed bitfields and add reserved field
- Added Reviewed-by tag from Florian Fainelli

Changes in V2:
- PCS:
  - Fix Reverse Christmas tree declaration
  - Removed stray newline
  - Add PCS remove function and disable clocks in them
  - Fix miic_validate function to return correct values
  - Split PCS CONV_MODE definition
  - Reordered phylink_pcs_ops in definition order
  - Remove interface setting in miic_link_up
  - Remove useless checks for invalid interface/speed and error prints
  - Replace phylink_pcs_to_miic_port macro by a static function
  - Add comment in miic_probe about platform_set_drvdata
- Bindings:
 - Fix wrong path for mdio.yaml $ref
 - Fix yamllint errors
- Tag driver:
  - Squashed commit that added tag value with tag driver
  - Add BUILD_BUG_ON for tag size
  - Split control_data2 in 2 16bits values
- Switch:
  - Use .phylink_get_caps instead of .phylink_validate and fill
    supported_interface correctly
  - Use fixed size (ETH_GSTRING_LEN) string for stats and use memcpy
  - Remove stats access locking since RTNL lock is used in upper layers
  - Check for non C45 addresses in mdio_read/write and return
    -EOPNOTSUPP
  - Add get_eth_mac_stats, get_eth_mac_ctrl_stat, get_rmon_stats
  - Fix a few indentation problems
  - Remove reset callback from MDIO bus operation
  - Add phy/mac/rmon stats
- Add get_rmon_stat to dsa_ops

Clément Léger (13):
  net: dsa: allow port_bridge_join() to override extack message
  net: dsa: add support for ethtool get_rmon_stats()
  net: dsa: add Renesas RZ/N1 switch tag driver
  dt-bindings: net: pcs: add bindings for Renesas RZ/N1 MII converter
  net: pcs: add Renesas MII converter driver
  dt-bindings: net: dsa: add bindings for Renesas RZ/N1 Advanced 5 port
    switch
  net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver
  net: dsa: rzn1-a5psw: add statistics support
  net: dsa: rzn1-a5psw: add FDB support
  ARM: dts: r9a06g032: describe MII converter
  ARM: dts: r9a06g032: describe GMAC2
  ARM: dts: r9a06g032: describe switch
  MAINTAINERS: add Renesas RZ/N1 switch related driver entry

 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  |  131 ++
 .../bindings/net/pcs/renesas,rzn1-miic.yaml   |  162 +++
 MAINTAINERS                                   |   11 +
 arch/arm/boot/dts/r9a06g032.dtsi              |   64 +
 drivers/net/dsa/Kconfig                       |    9 +
 drivers/net/dsa/Makefile                      |    1 +
 drivers/net/dsa/rzn1_a5psw.c                  | 1063 +++++++++++++++++
 drivers/net/dsa/rzn1_a5psw.h                  |  259 ++++
 drivers/net/pcs/Kconfig                       |    8 +
 drivers/net/pcs/Makefile                      |    1 +
 drivers/net/pcs/pcs-rzn1-miic.c               |  516 ++++++++
 include/dt-bindings/net/pcs-rzn1-miic.h       |   33 +
 include/linux/pcs-rzn1-miic.h                 |   18 +
 include/net/dsa.h                             |    5 +
 include/uapi/linux/if_ether.h                 |    1 +
 net/dsa/Kconfig                               |    7 +
 net/dsa/Makefile                              |    1 +
 net/dsa/slave.c                               |   18 +-
 net/dsa/tag_rzn1_a5psw.c                      |  113 ++
 19 files changed, 2419 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
 create mode 100644 Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
 create mode 100644 drivers/net/dsa/rzn1_a5psw.c
 create mode 100644 drivers/net/dsa/rzn1_a5psw.h
 create mode 100644 drivers/net/pcs/pcs-rzn1-miic.c
 create mode 100644 include/dt-bindings/net/pcs-rzn1-miic.h
 create mode 100644 include/linux/pcs-rzn1-miic.h
 create mode 100644 net/dsa/tag_rzn1_a5psw.c

-- 
2.36.0

