Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9F3428CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 16:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbfFLOZn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 10:25:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:23309 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437334AbfFLOZn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 10:25:43 -0400
X-IronPort-AV: E=Sophos;i="5.62,366,1554735600"; 
   d="scan'208";a="18494892"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Jun 2019 23:25:39 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 31406400967E;
        Wed, 12 Jun 2019 23:25:36 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] Enhance Thermal support
Date:   Wed, 12 Jun 2019 15:20:51 +0100
Message-Id: <1560349255-26336-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series aims to enhance thermal support by adding cpu-map,
capacity-dmips-mhz,thermal zone to support IPA and also adding 
dynamic power coefficients.

For CPU capacity-dmips-mhz calculation
-------------------------------------
dhrystone cross complied using the command [1].
[1] $CC -O3 -DTIME -fno-inline -fno-builtin-printf -Wno-implicit -march=armv8-a dhry_1.c dhry_2.c -o exe-dry

dhrystone is executed(with a loop value of 80000000) and took the average value for 5 iterations
of CA57 and CA53.

IPA testing
----------

1)Enable THERMAL_WRITABLE_TRIPS and THERMAL_STATISTICS in kernel

2) Check the current  temperature(36.5 C) and check the cooling stats on device0 and device 1

Execute the below applications on an ssh session

3) while true; do touch pic-`date +%s`.jpg;done &  will give almost 0.5 C jump on each instance

4) Executing dhrystone will give 3-4 C jump(runs through the benchmark: 800000000)

5) Now the current temperature is around 46.0 C and there is no change in cooling stats on device0 and device 1

6) Now change the passive trip temperature to 42 C, At this time CPUFreq started kicking in trying to limit the temperature, which you can see through the cooling stats on device0 and device1. You can see the system trying to maintain the temperature around 42 C.

7)  Without changing the load, Now change  the passive trip temperature to 100 C, the temperature rises back to 46 C again.

logs
----
2)
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
36500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/cdev0/stats/trans_table
 From  :    To
       : state 0  state 1  state 2
state 0:       0        0        0
state 1:       0        0        0
state 2:       0        0        0
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/cdev1/stats/trans_table
 From  :    To
       : state 0  state 1  state 2
state 0:       0        0        0
state 1:       0        0        0
state 2:       0        0        0
3)
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
38500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
39000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
40000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
38500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
40500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
41000
root@hihope-rz-g2m:~#  cat /sys/class/thermal/thermal_zone2/temp
41500
root@hihope-rz-g2m:~#  cat /sys/class/thermal/thermal_zone2/temp
41500
4)
root@hihope-rz-g2m:~#  cat /sys/class/thermal/thermal_zone2/temp
44500
5)
root@hihope-rz-g2m:~#  cat /sys/class/thermal/thermal_zone2/temp
46000
root@hihope-rz-g2m:~#  cat /sys/class/thermal/thermal_zone2/temp
46500
root@hihope-rz-g2m:~#  cat /sys/class/thermal/thermal_zone2/temp
46500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/cdev1/stats/trans_table
 From  :    To
       : state 0  state 1  state 2
state 0:       0        0        0
state 1:       0        0        0
state 2:       0        0        0
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/cdev1/stats/trans_table
 From  :    To
       : state 0  state 1  state 2
state 0:       0        0        0
state 1:       0        0        0
state 2:       0        0        0

6)
root@hihope-rz-g2m:~# echo 42000 > /sys/class/thermal/thermal_zone2/trip_point_0_temp
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
43000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
43000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
43000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
43000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
43000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
43000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/cdev1/stats/trans_table
 From  :    To
       : state 0  state 1  state 2
state 0:       0        1        0
state 1:       0        0        1
state 2:       0        0        0
root@hihope-rz-g2m:~#  cat /sys/class/thermal/thermal_zone2/cdev0/stats/trans_table
 From  :    To
       : state 0  state 1  state 2
state 0:       0        1        0
state 1:       0        0        1
state 2:       0        0        0
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
41500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
41500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~#  cat /sys/class/thermal/thermal_zone2/cdev0/stats/trans_table
 From  :    To
       : state 0  state 1  state 2
state 0:       0        3        0
state 1:       2        0       50
state 2:       0       49        0
root@hihope-rz-g2m:~#  cat /sys/class/thermal/thermal_zone2/cdev1/stats/trans_table
 From  :    To
       : state 0  state 1  state 2
state 0:       0        3        0
state 1:       2        0       52
state 2:       0       51        0
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
41500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
41500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
41500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
42000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
41500

7)
root@hihope-rz-g2m:~# echo 100000 > /sys/class/thermal/thermal_zone2/trip_point_0_temp
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
45000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
45500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
44500
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
46000
root@hihope-rz-g2m:~# cat /sys/class/thermal/thermal_zone2/temp
45500
root@hihope-rz-g2m:~#

Biju Das (4):
  arm64: dts: renesas: r8a774a1: Add CPU topology on r8a774a1 SoC
  arm64: dts: renesas: r8a774a1: Add CPU capacity-dmips-mhz
  arm64: dts: renesas: r8a774a1: Create thermal zone to support IPA
  arm64: dts: renesas: r8a774a1: Add dynamic power coefficient

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 59 ++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

-- 
2.7.4

