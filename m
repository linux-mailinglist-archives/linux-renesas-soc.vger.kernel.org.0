Return-Path: <linux-renesas-soc+bounces-6374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA73390B85E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 19:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D6211F21F5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 17:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F5F1891CD;
	Mon, 17 Jun 2024 17:42:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93ED1891C5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 17:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718646152; cv=none; b=DD89O/mz+X0W7Gx7rMJ5VC53ybMMzW1q3BHXhYoYONL9wSUTOE/xIeVq38XNhrkjQEKeJXlxzXNIQf3F4sCbeMj0rxB1WDY9/xFEHOlSqN4wXBeHn3zVy/fknIPKbne6hWiVlXV/P0nCflaUdfYYYBEmkjXfeoWc7UUx16rT+v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718646152; c=relaxed/simple;
	bh=VLVi3NjW6ZjOPBS6B5xIUZyONtHXm49n4UW/qdiwB3M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sI8ScqQvckjBT64scQHHJIcH3BFky3pJXsF7JLZxIBs0zDcTytqx3ZwkzqzguQn+ni8walUvxB2+lPRZdx6AigwoOYpZCno1wEL/P2UFPEJ8XHyxa6YrqIeBXMVPS8wB+GB9DTkppAjGbyXEPY1Gjexi4o/3UrG5Q0dMKIDVgCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b49f:13a3:7ee:d02c])
	by baptiste.telenet-ops.be with bizsmtp
	id chiM2C0074amk4u01hiMaR; Mon, 17 Jun 2024 19:42:22 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sJGN3-002KjY-Ik;
	Mon, 17 Jun 2024 19:42:21 +0200
Date: Mon, 17 Jun 2024 19:42:21 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: peng.fan@oss.nxp.com, daniel@ffwll.ch, javierm@redhat.com, 
    dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/fbdev-dma: Only set smem_start is enable per module
 option
In-Reply-To: <20240617152843.11886-1-tzimmermann@suse.de>
Message-ID: <2643bb67-e3a6-8ca7-37d1-e98080952589@linux-m68k.org>
References: <20240617152843.11886-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Thomas,

On Mon, 17 Jun 2024, Thomas Zimmermann wrote:
> Only export struct fb_info.fix.smem_start if that is required by the
> user and the memory does not come from vmalloc().
>
> Setting struct fb_info.fix.smem_start breaks systems where DMA
> memory is backed by vmalloc address space. An example error is
> shown below.
>
> [    3.536043] ------------[ cut here ]------------
> [    3.540716] virt_to_phys used for non-linear address: 000000007fc4f540 (0xffff800086001000)
> [    3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/physaddr.c:12 __virt_to_phys+0x68/0x98
> [    3.565455] Modules linked in:
> [    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted 6.6.23-06226-g4986cc3e1b75-dirty #250
> [    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
> [    3.582452] Workqueue: events_unbound deferred_probe_work_func
> [    3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    3.595233] pc : __virt_to_phys+0x68/0x98
> [    3.599246] lr : __virt_to_phys+0x68/0x98
> [    3.603276] sp : ffff800083603990
> [    3.677939] Call trace:
> [    3.680393]  __virt_to_phys+0x68/0x98
> [    3.684067]  drm_fbdev_dma_helper_fb_probe+0x138/0x238
> [    3.689214]  __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
> [    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
> [    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
> [    3.705161]  drm_client_register+0x60/0xb0
> [    3.709269]  drm_fbdev_dma_setup+0x94/0x148
>
> Additionally, DMA memory is assumed to by contiguous in physical
> address space, which is not guaranteed by vmalloc().
>
> Resolve this by checking the module flag drm_leak_fbdev_smem when
> DRM allocated the instance of struct fb_info. Fbdev-dma then only
> sets smem_start only if required (via FBINFO_HIDE_SMEM_START). Also
> guarantee that the framebuffer is not located in vmalloc address
> space.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Peng Fan (OSS) <peng.fan@oss.nxp.com>
> Closes: https://lore.kernel.org/dri-devel/20240604080328.4024838-1-peng.fan@oss.nxp.com/
> Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")

Thanks, this fixes the issue I was seeing on R-Car Gen3/Gen4 with rcar-du.

No regressions on R-Car Gen2 (rcar-du) and R-Mobile A1 (shmobile)
which didn't shown the warning in the first place.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

