Return-Path: <linux-renesas-soc+bounces-9354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BAB98F10D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 16:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 201171C21E4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 14:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4D91A3A95;
	Thu,  3 Oct 2024 14:04:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9071A0B15
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727964288; cv=none; b=ezcF2Jcft4PN8+xzdo8M9xJDs59nuGTBo8x8y+/0UotaKPj4RwtC/JfakfcF6ww2y9XgFU0EtMfcnszDiLoJ+nLDbdcIIXOnlpI7z3+5nQXOAhBSqkITbNzIZIkzvUnUuVmZv/S+yEXWKXFcK9rUd7LqLMSAIPGf80CDVE9Gagk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727964288; c=relaxed/simple;
	bh=/1sLkX3ojG+JNCcmAA5vSnCNSDspfW2Rs8CQ+t/asPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hzxHu0LbkPlGF9Fe6g01L/e2JheR+bJm2vYFEj0/aABaPZ5VmT1AR7dgCXH+JFuDp+TbLZy0cLXuJ14O+OIArfBPTupctdvsBcTUCuW9hV6r/Shb5kfsySatHQeXtNPqzTXxJJD1TsHI3Kh+o8lKjxmnWgOp8tgdOjhkeMUSP1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by baptiste.telenet-ops.be with cmsmtp
	id Kq4d2D0075K8SYz01q4d5F; Thu, 03 Oct 2024 16:04:39 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRR-001CGS-2P;
	Thu, 03 Oct 2024 16:04:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRZ-006e9c-8O;
	Thu, 03 Oct 2024 16:04:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 resend 0/7] Add Renesas R-Car Gen4 E-FUSE support
Date: Thu,  3 Oct 2024 16:04:24 +0200
Message-Id: <cover.1727963347.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi all,

(another rc1, so time for a resend)

R-Car Gen3/Gen4 SoCs contain fuses indicating hardware support or
hardware parameters.  Unfortunately the various SoCs require different
mechanisms to read the state of the fuses:
  - On R-Car Gen3, the fuse monitor registers are in the middle of the
    Pin Function Controller (PFC) register block,
  - On R-Car V3U and S4-8, the E-FUSE non-volatile memory is accessible
    through a separate register block in the PFC,
  - On R-Car V4H and V4M, the E-FUSE non-volatile memory is accessible
    through the second register block of OTP_MEM.

As the first variant is quite different from the other two, and there is
currently no use case requiring support for it, this patch series adds
support for the last 2 variants only.

Note that the first two revisions of this series implemented only basic
nvmem support, and a custom in-kernel API, mimicked after the
fuse-tregra driver.  Then, Arnd told me on IRC that the R-Car E-FUSE
driver should use the nvmem framework fully.

The fuses' states can be read using the nvmem subsystem:
  - In kernelspace, through the nvmem_cell_*() API.
    A first known use case is reading tuning parameters for the
    Universal Flash Storage controller on R-Car S4-8 ES1.2.

  - In userspace, through sysfs. E.g. on R-Car S4-8 ES1.2:
    / # hd /sys/bus/nvmem/devices/rcar-fuse/nvmem
    00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    000000e0  00 00 00 00 fe 00 00 00  00 00 00 00 00 00 00 00  |....�...........|
    000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000140  00 00 00 00 23 51 23 51  52 98 52 98 00 00 00 00  |....#Q#QR�R�....|
    00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000200

Previous v3 submission[3]:
  - Some discussion about #nvmem-cell-cells = <0>, no changes.

Changes compared to v2[2]:
  - Dropped accepted dt-bindings,
  - Drop "pinctrl: renesas: Add R-Car Gen3 fuse support",
  - New patch "dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to
    nvmem",
  - Drop superfluous semicolon,
  - Drop the custom rcar_fuse_read() kernel API, in favor of the
    standard nvmem_cell_*() API,
  - Drop support for explicitly-instantiated platform devices with
    accompanying platform data, which would be needed to support fuses
    tightly integrated with the Pin Function Controller on R-Car Gen3
    SoCs.  It can be added when a use case shows up.
  - Move from drivers/soc/renesas/ to drivers/nvmem/,
  - Register the full register block that contains the E-FUSE data
    registers with the nvmem subsystem, but use keepouts to ignore all
    registers before the first or after the last documented data
    register.  Undocumented registers in between are still accessible.
  - Replace offset/nregs in rcar_fuse_data by start/end,
  - Use __ioread32_copy() helper,
  - Initialize most fields of struct nvmem_config in its declaration,
  - Rename nvmem device from "fuse" to "rcar-fuse",
  - Use NVMEM_DEVID_NONE,
  - Add an entry to the MAINTAINERS file,
  - Fix reg size,
  - New patch "arm64: dts: renesas: r8a779f4: Add UFS tuning parameters
    in E-FUSE".

Changes compared to v1[3]:
  - Drop RFC state and broaden audience,
  - Fix typo in one-line summary,
  - Add Reviewed-by.

This has been tested on R-Car V3U, S4-8 ES1.0 and ES1.2, V4H, and V4M.

Thanks for your comments!

[1] https://lore.kernel.org/cover.1721999833.git.geert+renesas@glider.be
[2] https://lore.kernel.org/cover.1716974502.git.geert+renesas@glider.be
[3] https://lore.kernel.org/cover.1714642390.git.geert+renesas@glider.be

Geert Uytterhoeven (7):
  dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem
  nvmem: Add R-Car E-FUSE driver
  arm64: dts: renesas: r8a779a0: Add E-FUSE node
  arm64: dts: renesas: r8a779f0: Add E-FUSE node
  arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
  arm64: dts: renesas: r8a779g0: Add OTP_MEM node
  arm64: dts: renesas: r8a779h0: Add OTP_MEM node

 .../{fuse => nvmem}/renesas,rcar-efuse.yaml   |  35 +++--
 .../{fuse => nvmem}/renesas,rcar-otp.yaml     |  17 ++-
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |   8 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     |   8 +
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi     |  12 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |   5 +
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     |   5 +
 drivers/nvmem/Kconfig                         |  11 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/rcar-efuse.c                    | 142 ++++++++++++++++++
 11 files changed, 230 insertions(+), 17 deletions(-)
 rename Documentation/devicetree/bindings/{fuse => nvmem}/renesas,rcar-efuse.yaml (54%)
 rename Documentation/devicetree/bindings/{fuse => nvmem}/renesas,rcar-otp.yaml (60%)
 create mode 100644 drivers/nvmem/rcar-efuse.c

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

