Return-Path: <linux-renesas-soc+bounces-17380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 971E4AC0E30
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0371BA83FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A00528C86E;
	Thu, 22 May 2025 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="JZ42M9P2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26728C03F;
	Thu, 22 May 2025 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924491; cv=none; b=rMOXErIvy9CnEKxd77C9BbLimQYXt03WiSvdMx3I+8Gi53U7lDfKrphkAw97q55AeENYpfCW1GbFHnfHzkFqA/g3+LFRCFrjUwcbv0plwTJ4CRCJ6DgH4S5287AT98LEbNHqgtoOUUDZpSUopgakTKyVHAbxOGsfjwo/Sr1eKpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924491; c=relaxed/simple;
	bh=c2fhfgJhxxShEmXj79y8vYzylslOBBV8VYZ66Q9upYg=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=rPH3idluhSM0rvbdgl+KlV3xyBKjgGGy6UEmjVfsxnofAgQ3Jl5DJVJuc0p6X5IwBlDAKosfx//8zOO3/fb8FsWLyN2w396o6iWCHAAlShRz1hehIp5hhu/UpdVkb48DKvx9PZOCw3+JqCTBdFclI4YJzKvTNz72xpPHeNza3+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=JZ42M9P2; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=KNH97gaggb/2wYQaAga1tD5BDYJYpNJdDjfVqWXvc0o=; b=JZ42M9P2ChwaXIpqNCTevCVa+S
	fGDHj20jfwMfzp/idK9InSj9LDVscAQzJ8KR8nxye7d09RS+IF/+fudnNq3yffn3nRrnBbrvPkvwp
	Phj24q9hLT7r/TRJmDdTyAs5VNLFWEvmhQgAswGejGu9mOustnztVPSPSO3HqMS9IxpQ=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:56132 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uI70K-0006Cq-Hn; Thu, 22 May 2025 10:34:40 -0400
Date: Thu, 22 May 2025 10:34:40 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: biju.das.jz@bp.renesas.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>
Message-Id: <20250522103440.e13dfb99deffb934f791e3b3@hugovil.com>
In-Reply-To: <20250522140322.64667-1-hugo@hugovil.com>
References: <20250522140322.64667-1-hugo@hugovil.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	*  0.1 URIBL_CSS Contains an URL's NS IP listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	* -0.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v2 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI
 command support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Thu, 22 May 2025 10:03:20 -0400
Hugo Villeneuve <hugo@hugovil.com> wrote:

> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Hello,
> this patch series add support for sending MIPI DSI command packets to the
> Renesas RZ/G2L MIPI DSI driver.
> 
> Tested on a custom board with a SolidRun RZ/G2L SOM, with two different LCD
> panels using the jd9365da and st7703 drivers.
> 
> Tested short and long writes.
> 
> Tested read of 1 byte, 2 bytes and long reads.
> 
> Thank you.
> 
> Link: [v1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugovil.com
> 
> Changes for V2:
> - Change commit message prefix to "drm: renesas: rz-du: "
> - Reorder variables in rzg2l_mipi_dsi_read_response()
> - Remove unused macros
> - Add missing bitfield include (kernel test robot)
> 
> Hugo Villeneuve (2):
>   drm: renesas: rz-du: Implement MIPI DSI host transfers
>   drm: renesas: rz-du: Set DCS maximum return packet size
> 
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
>  2 files changed, 240 insertions(+)
> 
> 
> base-commit: c4f8ac095fc91084108ec21117eb9c1fff64725d
> -- 
> 2.39.5
> 
> 

I hit the same problem with my mail server, preventing patches 1/2 and
2/2 not being sent.

Fixed by modifying exim4 smtp_accept_max_per_connection option from 1
to 100.

Will resend a proper v3.

-- 
Hugo Villeneuve

