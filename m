Return-Path: <linux-renesas-soc+bounces-29810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id edo2Bi7eumlScwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:17:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E91482C0126
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0420B300D0EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BC22DB790;
	Wed, 18 Mar 2026 17:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/ojEgzR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B45F2D63E8;
	Wed, 18 Mar 2026 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854247; cv=none; b=kpBST7KGfpUWCc+RgTgq7r2n1l64cMdVfdC6Dv5MnLnhVIYeLa0nmrqIezWzR7QhnPMbDfmBXzcVnJtIIpD0vUBtBeMbZ4kO+AerD7uGMidSh1UTpKDy/qotIEP5Rx7zQkkCvH6PHpHAgMyZrPr/TmGycSsWGw1HN32XxORYjwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854247; c=relaxed/simple;
	bh=HUY2/4gRri/fQKhRFzorL7GriVv5EjbW739jiuuwp0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mhpXyNRN5OAYmNkPZFwPSx7f5k+WyG1HxZyVyDUL7L2nxRs08yRfz5pKjEz3N7bs+XW5VPbVhsqQ4YU/G+fVp0IwAAUi94YHtMVBi+ceKBzisCTTh2S1zPh0LPO/na3G/pf2+0w20FTNhcugUpGmFF3naXJjpMlbNzzBfN5EYIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/ojEgzR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA09C2BC87;
	Wed, 18 Mar 2026 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773854246;
	bh=HUY2/4gRri/fQKhRFzorL7GriVv5EjbW739jiuuwp0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=q/ojEgzRMGqWsFJMKjs4TmIgH82cHym+DiGxaj2RijNg+xIYF7bCvrIFR7o5zQU18
	 ife29DKfY0KKotPYZdhQNXoj4YEO8g53meoDP3Ti+C8V2BG4mAsFPF8/GUYQe+MlWr
	 LW/4zb2WyOzJZT6xhQFbVOPzOV7BeW7FeHJq9g2qPi/rphmyhfUMcjNHEUzqiS633p
	 5JPO8CgAVucJCSclLy9fVmbGHn0hfkfHLlLyoJb8xVbqtPKfS/7gIHZ8gtUWo2Mzvh
	 W3bS516UnGNCW+VzsLi9Qfg8/0xLvyJVc9Ff6nEY3expCSodivO3kqLKv0371Tt9Xh
	 VmwFlxz+YOYNg==
Date: Wed, 18 Mar 2026 12:17:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH v5 0/9] arm64: dts: qcom: Add support for the Ayaneo
 Pocket S2
Message-ID: <20260318171725.GA51567@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29810-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org,oss.qualcomm.com,outlook.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.941];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,msgid.link:url]
X-Rspamd-Queue-Id: E91482C0126
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Feb 20, 2026 at 04:04:39PM +0100, Neil Armstrong wrote:
> The Ayaneo Pocket S2 is a gaming console based on the Qualcomm
> Snapdragon 8 Gen 3. It has an internal UFS storage, WiFi,
> Bluetooth, gaming buttons, SDCard, 2K display and USB-C
> connector.
> 
> Product Page [1].
> 
> The Initial linux port was done by KancyJoe (Sunflower2333)
> at [2].
> 
> [1] https://www.ayaneo.com/goods/9344082149621
> [2] https://github.com/sunflower2333/linux/tree/master
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v5:
> - Rebased on -next
> - Collected tags
> - Rebased/renamed slot to generic based on changes from Bjorn
> - Link to v4: https://patch.msgid.link/20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org
> 
> Changes in v4:
> - Renamed slot to generic, in the code as well, fixed Kconfig & commit message
> - Switched the UPD72020x bindings additionalProperties to true to allow devices subnodes
> - Collected acks
> - Link to v3: https://patch.msgid.link/20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org
> 
> Changes in v3:
> - Made renesas,upd720201-pci bindings supplies required
> - Fixed description and example of renesas,upd720201-pci bindings
> - Renamed slot to generic, added renesas,upd720201-pci entry
> - Used PMIC_GPIO_STRENGTH_LOW instead of numbers
> - Removed all output-low in pinconf
> - Link to v2: https://patch.msgid.link/20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org
> 
> Changes in v2:
> - Add proper regulators for the USB controller, with bindings & power ctrl
> - Add proper regulators for FAN
> - Dropped support for headset over USB-C, audio is connected to a jack port
> - Cleaned up Audio routing and fixed the DP endpoint index
> - Added i2c clk frequencies
> - Renamed fan node and used interrupts-extended
> - Dropped the usb-c self-powered
> - Reordered nodes alphabetically
> - Renamed pcieport1 to pcie1_port0
> - Link to v1: https://patch.msgid.link/20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org
> 
> ---
> KancyJoe (1):
>       arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console
> 
> Neil Armstrong (8):
>       dt-bindings: usb: document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
>       pci: pwrctrl: slot: fix dev_err_probe() usage
>       pci: pwrctrl: rename pci-pwrctrl-slot as generic
>       pci: pwrctrl: generic: support for the UPD720201/UPD720202 USB 3.0 xHCI Host Controller
>       arm64: defconfig: enable pci-pwrctrl-generic as module
>       dt-binding: vendor-prefixes: document the Ayaneo brand
>       dt-bindings: arm: qcom: document the Ayaneo Pocket S2
>       arm64: dts: qcom: sm8650: Add sound DAI prefix for DP

I applied the drivers/pci/pwrctrl patches to pci/pwrctrl for v7.1,
thanks!

I reordered the rename to be first (and used "git mv") and updated the
subject lines to match the history.

>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  .../bindings/usb/renesas,upd720201-pci.yaml        |   61 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1551 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               |   47 +-
>  arch/arm64/configs/defconfig                       |    1 +
>  drivers/pci/controller/dwc/Kconfig                 |    4 +-
>  drivers/pci/pwrctrl/Kconfig                        |   13 +-
>  drivers/pci/pwrctrl/Makefile                       |    4 +-
>  drivers/pci/pwrctrl/generic.c                      |  143 ++
>  drivers/pci/pwrctrl/slot.c                         |  140 --
>  12 files changed, 1795 insertions(+), 173 deletions(-)
> ---
> base-commit: df94cc5ccb88d2f6ebc0cac480a1b94162f4ff0f
> change-id: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d
> 
> Best regards,
> -- 
> Neil Armstrong <neil.armstrong@linaro.org>
> 

