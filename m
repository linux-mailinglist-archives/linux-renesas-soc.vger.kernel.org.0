Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F36A19446D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 17:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbgCZQiO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 12:38:14 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:34744 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbgCZQiN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 12:38:13 -0400
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id K4eA2200s5USYZQ064eBAL; Thu, 26 Mar 2020 17:38:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jHVWE-0002rD-Re; Thu, 26 Mar 2020 17:38:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jHVWE-00064i-P1; Thu, 26 Mar 2020 17:38:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] dt-bindings: usb: generic-ehci/ohci: Document power-domains property
Date:   Thu, 26 Mar 2020 17:38:04 +0100
Message-Id: <20200326163807.23216-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Greg, Rob,

It is quite common for a generic EHCI or OHCI block to be embedded in an
SoC in its own power domain.  However, the current DT bindings do not
cover this yet, leading to "make dtbs_check" warnings like:

    arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dt.yaml: usb@ee080000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
    arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dt.yaml: usb@ee080100: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'

This patch series documents the optional presence of "power-domains"
properties in the EHCI and OHCI devices nodes, allowing the DTS writer
to describe the controllers' positions in the power hierarchy.

Thanks!

Geert Uytterhoeven (2):
  dt-bindings: usb: generic-ehci: Document power-domains property
  dt-bindings: usb: generic-ohci: Document power-domains property

 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
