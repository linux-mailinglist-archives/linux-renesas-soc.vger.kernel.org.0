Return-Path: <linux-renesas-soc+bounces-17839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CCDACDF58
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 15:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E50ED189909A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 13:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A161C1EFF8E;
	Wed,  4 Jun 2025 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="OanJit2J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2572557C;
	Wed,  4 Jun 2025 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044274; cv=none; b=eYW7OTGevP/Zzjif6KCHuc8JRABjpLvPVlna9pR3rmgxzRYDe+xFw8Pesd6+LWgJkppWWUx7C08bZN07jwXAkUuLZznMXtVwVYj0Dzd7cxYzBC5kyYmCEy+Rf7Y1nVtUOkwx+P1L/f8HoCgG0tuul5ipv4RCk7myT6MmIyZtRRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044274; c=relaxed/simple;
	bh=rW25kGFKF9OW0rXVmccGSvuXOG6b1nRyoTUDa2HMP1s=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=JN5oDD36XmzRiP9PDsX4b712C7UUeW/U38Zv22C0tdaOb/iROXKQlN0yz9ebIHLMOtusZM8z9630VmYRBIya9qiLQWGjZGC8HvAcb7M+iDOh8xaPI3UZ1L1yUwmIYezWn//l79Lk5+PwoEhpCi16uPqwP0eriEmDFDGl9Iv4CJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=OanJit2J; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=wyZv9KmZ8ZdATx+EOquAs3+NIy2myEHEKYHxNZgEXhI=; b=OanJit2JpnZYvfrkIw51bNItJV
	7cw8Mb8Z94Qn8g9NtLL0E5nZlu8D9ZxOeDRnyumv+qINF7C/XA0lqjhAxGFgr4dv1elr2agTHGH8y
	YJlxCVjW+Nj9VlFy4FUax5Wxkt+P2HK013M04fDSQB6LvJlIy/TgVb11sU0uZwMztGdQ=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:38330 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uMoJM-0002D8-4F; Wed, 04 Jun 2025 09:37:44 -0400
Date: Wed, 4 Jun 2025 09:37:43 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Message-Id: <20250604093743.b416894b67fcc49b3c4ef9b3@hugovil.com>
In-Reply-To: <OS3PR01MB83195CC101339CA1ECDCD6C78A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
	<20250522143911.138077-3-hugo@hugovil.com>
	<OS3PR01MB831999C4A5A32FE11CC04A078A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
	<OS3PR01MB83195CC101339CA1ECDCD6C78A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	*  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	*  0.1 URIBL_CSS Contains an URL's NS IP listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -3.2 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return
 packet size
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Wed, 4 Jun 2025 12:08:49 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

Hi Chris,

> Hi Hugo,
> 
> Sorry, one more thing....
> 
> > +	/*
> > +	 * The default value of 1 will result in long read commands payload
> > +	 * not being saved to memory. Set to the DMA buffer size.
> > +	 */
> 
> The comment is a bit wordy.
> 
> You just need to say:
> 
> /* Set read buffer size */

Like I said, this is related to something that is not obvious, so that
is why I put a lenghty description.

> Or...no comment at all. It's pretty obvious what the code is doing because you are writing
> RZG2L_DCS_BUF_SIZE to a register.

Agreed, I will remove the part that says "Set to the DMA buffer size".

Hugo.


> -----Original Message-----
> From: Chris Brandt 
> Sent: Wednesday, June 4, 2025 7:54 AM
> To: Hugo Villeneuve <hugo@hugovil.com>; Biju Das <biju.das.jz@bp.renesas.com>; maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com; simona@ffwll.ch
> Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Subject: RE: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet size
> 
> Hi Hugo,
> 
> I'm fine with the code, but maybe it should go in a different location.
> 
> Since it's a register setup, it should probably go in rzg2l_mipi_dsi_startup() with the others.
> 
> Additionally, since it is required to make rzg2l_mipi_dsi_host_transfer() operate properly, my suggestion is to add this to your previous patch instead of making it separate.
> Otherwise, it's like you are submitting one patch with a known bug, then immediately fixing it with a second patch.
> 
> This also would prevent the merge conflict with my patch that also modifies rzg2l_mipi_dsi_atomic_enable().
> 
> Chris
> 
> 
> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: Thursday, May 22, 2025 10:39 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>; maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com; simona@ffwll.ch
> Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org; hugo@hugovil.com; Hugo Villeneuve <hvilleneuve@dimonoff.com>; Chris Brandt <Chris.Brandt@renesas.com>
> Subject: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet size
> 
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> The default value of 1 will result in long read commands payload not being saved to memory.
> 
> Fix by setting this value to the DMA buffer size.
> 
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h |  4 ++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index a048d473db00b..745aae63af9d8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -549,6 +549,7 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  	const struct drm_display_mode *mode;
>  	struct drm_connector *connector;
>  	struct drm_crtc *crtc;
> +	u32 value;
>  	int ret;
>  
>  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder); @@ -561,6 +562,15 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  
>  	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
>  
> +	/*
> +	 * The default value of 1 will result in long read commands payload
> +	 * not being saved to memory. Set to the DMA buffer size.
> +	 */
> +	value = rzg2l_mipi_dsi_link_read(dsi, DSISETR);
> +	value &= ~DSISETR_MRPSZ;
> +	value |= FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
> +	rzg2l_mipi_dsi_link_write(dsi, DSISETR, value);
> +
>  	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
>  		goto err_stop;
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> index 0e432b04188d0..26d8a37ee6351 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -81,6 +81,10 @@
>  #define RSTSR_SWRSTLP			(1 << 1)
>  #define RSTSR_SWRSTHS			(1 << 0)
>  
> +/* DSI Set Register */
> +#define DSISETR				0x120
> +#define DSISETR_MRPSZ			GENMASK(15, 0)
> +
>  /* Rx Result Save Slot 0 Register */
>  #define RXRSS0R				0x240
>  #define RXRSS0R_RXPKTDFAIL		BIT(28)
> --
> 2.39.5
> 
> 


-- 
Hugo Villeneuve

