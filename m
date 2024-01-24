Return-Path: <linux-renesas-soc+bounces-1748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F483A1AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 06:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F1D1B22417
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 05:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0186F9F8;
	Wed, 24 Jan 2024 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBUpOPbT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4DFF9EC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706075968; cv=none; b=WoNF1OHmcb7ZxsjorVsQ/jNeA//onSGcQ3vQMtu2Yi76LIEH+py5X7KGODHJQuANzmwpTYg1r69ObHfU4jzIpEkuebpwqyW2v6Wo6HUux3rOQss5TfDp8x+3T9yiXq29Zw+AwIRJ2nmynHQt+oiEv5kTyMoM5Ok8I0u9X36kNMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706075968; c=relaxed/simple;
	bh=yFrBozIaKa9pAQDFKe2ZCraZhpn/YfI3TF+Anbs/H2A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HJRULSCubamx5Pnq7AepYh9jlKYdpxk4PASQXJ7WVqlBpqXZ1nu0YiN6t5WtrK6dEyWcZhDTKVrpiMve9m3gK2VWqo2VVDF0Rl7agP7TVvJXW2VgfffJbzVztqKsPXtklZQZYtGSr9hWL5SPyIyhs4ycOB9h4CUXYMNBfpgGMtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBUpOPbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48444C43390;
	Wed, 24 Jan 2024 05:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706075968;
	bh=yFrBozIaKa9pAQDFKe2ZCraZhpn/YfI3TF+Anbs/H2A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aBUpOPbTiMioWl4no25kDR0vJDt6WM95RpRIz0jij8zo0D0bOjgL44TwDz1g2Tolq
	 Ezq+YrmjsWZgk4lEcSCPulj3Xl/cgADt6qzsg7+P08okWa+1DTQYJYC31vgDc7U8PW
	 SZWvVXHSx5zlKEpGG1677A0SUBbyOf2rR6q+DX2GME3NL/VTSID0IjVptsNKO6myDG
	 nm/pG4uOZzzmh8zIhQcubzZeIZlB2XpUr8JBldofKG2WU5G5X5+AAzd9cjV4fZBUuk
	 vVM0YoQHWSaxKQZ5DbtPhX03/De7G9f5ySIE34PpwtIyteTmdxadIRNKNd4H7eiet3
	 nk8b2VBwwQB1g==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: error27@gmail.com, linux-phy@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20240105093703.3359949-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240105093703.3359949-1-yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Fix returning wrong
 error code
Message-Id: <170607596591.395031.2360574561399395550.b4-ty@kernel.org>
Date: Wed, 24 Jan 2024 11:29:25 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Fri, 05 Jan 2024 18:37:03 +0900, Yoshihiro Shimoda wrote:
> Even if device_create_file() returns error code,
> rcar_gen3_phy_usb2_probe() will return zero because the "ret" is
> variable shadowing.
> 
> 

Applied, thanks!

[1/1] phy: renesas: rcar-gen3-usb2: Fix returning wrong error code
      commit: 249abaf3bf0dd07f5ddebbb2fe2e8f4d675f074e

Best regards,
-- 
~Vinod



