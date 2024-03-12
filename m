Return-Path: <linux-renesas-soc+bounces-3724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7558687966F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 15:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1A0B1F226CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 14:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8697CF19;
	Tue, 12 Mar 2024 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0Yq+x38"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0761A7CF13
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710253993; cv=none; b=RzW7vuliMvx7WSwL8tMzdJsLtPQKA0TA5dePCwqWlCQZR4FT6uSwObEhUjSZs8HGYX8mQkI5it6Igh4sPVow93PZBo/E2gwImYgkaYpV0D38YVK5JwMH0VHF2Dq3XXX0TCrzEqib3PrvktpFE13IEnXbR8j65mNYxWfVELexJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710253993; c=relaxed/simple;
	bh=o+/uYG6ofoGRjEwsvYc8C8zo1je2WRBdUCHAT2+qoUM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Y53nWWSqzlW4D504kavjZ52PZuqpfwTTl05MVcIq+oOnNQJIPfFjsG0ZA7fqe/JJW82J3NALyL31GjTHiK9kb09njVipzytGoqWiaNFF4bZOIUkKEzPXT/WKo/DIQbOX7oTT7TczWi/iDezSJy75j0domHR6CAZRMK/Qd2c6xBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0Yq+x38; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559CDC43394;
	Tue, 12 Mar 2024 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710253992;
	bh=o+/uYG6ofoGRjEwsvYc8C8zo1je2WRBdUCHAT2+qoUM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=f0Yq+x38BEf/FiNAZ3Ed4YUEKFdHPxG2im1UIHJRcsCs1ngf/R8D+LxuRIG3fb24k
	 ytBlJ4GaysQeJOCJEw1T51ElqwNl1o0bZOIof8SsrdNScnnYS9+9uugk7MgtSXynir
	 oElUd3KBIb6B4YJ3eIxz8VvZ29e7r7ailhnsdCGy8yuATziOEMGHMlxqRjXjmrVPt7
	 d7cfzbWtJe1XK86r2l8OWHvWyhJHtgDhb3GLahuattn6HibxNzHv1D9mA3m1kLCPvM
	 aqHw/qlzR+afCmbZSM68DYtlL/R8KKEkXzPHA9oMRvT/vbQFHcv5AmlDG/vs+pDip1
	 9m3djBSXNYn6A==
Date: Tue, 12 Mar 2024 08:33:11 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 Magnus Damm <magnus.damm@gmail.com>
In-Reply-To: <cover.1709741303.git.geert+renesas@glider.be>
References: <cover.1709741303.git.geert+renesas@glider.be>
Message-Id: <171025376614.2190678.4481264601902284281.robh@kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: renesas: r8a779h0/gray-hawk-single:
 Add remaining serial ports


On Tue, 12 Mar 2024 10:02:33 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds the remaining (High) Speed Serial Communication
> Interfaces with FIFO ((H)SCIF) on the Renesas R-Car V4M (R8A779H0) SoC,
> and enables the second debug serial port on the Renesas Gray Hawk Single
> development board.
> 
> As SCIF0 can use the same pins as HSCIF0, it has been tested by
> switching the first debug serial port from HSCIF0 to SCIF0.
> 
> I plan to queue this in renesas-devel for v6.10.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>   arm64: dts: renesas: r8a779h0: Add remaining HSCIF nodes
>   arm64: dts: renesas: r8a779h0: Add SCIF nodes
>   arm64: dts: renesas: gray-hawk-single: Add second debug serial port
> 
>  .../dts/renesas/r8a779h0-gray-hawk-single.dts |  25 +++-
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 127 +++++++++++++++++-
>  2 files changed, 150 insertions(+), 2 deletions(-)
> 
> --
> 2.34.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y renesas/r8a779h0-gray-hawk-single.dtb' for cover.1709741303.git.geert+renesas@glider.be:

arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: serial@e6e60000: compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,scif-r8a779h0', 'renesas,rcar-gen4-scif', 'renesas,scif'] is too long
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r7s72100']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r7s9210']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r9a07g044']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
	'renesas,scif' was expected
	'renesas,rcar-gen1-scif' was expected
	'renesas,rcar-gen2-scif' was expected
	'renesas,rcar-gen3-scif' was expected
	'renesas,scif-r9a07g044' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: serial@e6e68000: compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,scif-r8a779h0', 'renesas,rcar-gen4-scif', 'renesas,scif'] is too long
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r7s72100']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r7s9210']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r9a07g044']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
	'renesas,scif' was expected
	'renesas,rcar-gen1-scif' was expected
	'renesas,rcar-gen2-scif' was expected
	'renesas,rcar-gen3-scif' was expected
	'renesas,scif-r9a07g044' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: serial@e6c50000: compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,scif-r8a779h0', 'renesas,rcar-gen4-scif', 'renesas,scif'] is too long
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r7s72100']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r7s9210']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r9a07g044']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
	'renesas,scif' was expected
	'renesas,rcar-gen1-scif' was expected
	'renesas,rcar-gen2-scif' was expected
	'renesas,rcar-gen3-scif' was expected
	'renesas,scif-r9a07g044' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: serial@e6c40000: compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,scif-r8a779h0', 'renesas,rcar-gen4-scif', 'renesas,scif'] is too long
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r7s72100']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r7s9210']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r9a07g044']
	'renesas,scif-r8a779h0' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
	'renesas,scif' was expected
	'renesas,rcar-gen1-scif' was expected
	'renesas,rcar-gen2-scif' was expected
	'renesas,rcar-gen3-scif' was expected
	'renesas,scif-r9a07g044' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#






