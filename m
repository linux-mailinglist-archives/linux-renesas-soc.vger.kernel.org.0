Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 727AD61C25
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 11:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbfGHJNl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 05:13:41 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24098 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727065AbfGHJNl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 05:13:41 -0400
X-IronPort-AV: E=Sophos;i="5.62,466,1554735600"; 
   d="scan'208";a="20843039"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2019 18:08:36 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B0F194219A7E;
        Mon,  8 Jul 2019 18:08:36 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be,
        thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 0/7] treewide: modify sh-pfc and add support pwm duty zero
Date:   Mon,  8 Jul 2019 18:07:41 +0900
Message-Id: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series modifies pinctrl/sh-pfc and pwm drivers. Since the R-Car
SoCs PWM Timer cannot output duty zero, the Salvator-X[S] board cannot
output max_brightness. This patch series can support it.

I'm not sure whether pinctrl subsystem and sh-pfc driver allows
to change the pin configuration automatically by .gpio_disable_free(),
so that I marked "RFC" on this patch series.

< log file >
 # cd /sys/class/backlight/backlight
 # echo 1 > brightness
 # cat /sys/kernel/debug/pinctrl/e60060000.pin-controller-sh-pfc/pinmux-pins |\
   grep -w 71
 pin 71 (GP_2_7): e6e31000.pwm (GPIO UNCLAIMED) function pwm1 group pwm1_a

 # echo 6 > brightness
 # cat /sys/kernel/debug/pinctrl/e60060000.pin-controller-sh-pfc/pinmux-pins |\
   grep -w 71
 pin 71 (GP_2_7): e6e31000.pwm e6052000.gpio:459 function pwm1 group pwm1_a

 # echo 1 > brightness
 # cat /sys/kernel/debug/pinctrl/e60060000.pin-controller-sh-pfc/pinmux-pins |\
   grep -w 71
 pin 71 (GP_2_7): e6e31000.pwm (GPIO UNCLAIMED) function pwm1 group pwm1_a


Yoshihiro Shimoda (7):
  pinctrl: sh-pfc: add new flags into struct sh_pfc_pin_config
  pinctrl: sh-pfc: remove incomplete flag "cfg->type"
  pinctrl: sh-pfc: Rollback to mux if requires when the gpio is freed
  dt-bindings: pwm: rcar: Add specific gpios property to output duty
    zero
  pwm: rcar: remove a redundant condition in rcar_pwm_apply()
  pwm: rcar: Add gpio support to output duty zero
  arm64: dts: renesas: salvator-common: add gpio property into pwm1

 .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |  3 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  1 +
 drivers/pinctrl/sh-pfc/pinctrl.c                   | 44 +++++++++++-----------
 drivers/pwm/pwm-rcar.c                             | 36 +++++++++++++++++-
 4 files changed, 60 insertions(+), 24 deletions(-)

-- 
2.7.4

