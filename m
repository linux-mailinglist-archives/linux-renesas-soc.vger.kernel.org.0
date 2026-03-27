Return-Path: <linux-renesas-soc+bounces-30397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLL5MkboxWlTDQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 03:15:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7445233E256
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 03:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35ABD304FE6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 02:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91E7310652;
	Fri, 27 Mar 2026 02:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Dc2OFgny"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBB8311C11;
	Fri, 27 Mar 2026 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577723; cv=pass; b=sQwq2V1ZpsYSTtv5vF6L26+Mi2Efz+/2YAtMDMCj42a8kaTS0w6+zP1G/ySE6gX5+TwJOfHX3mhaNIxHsQZ3XTWdWhveQJBQg+63mia5Rjx6ZxhXG8txWk1yip/Kdkxs9pZG3OnhAfQt9z7Ma3McnaCQRr0r6ia75BNTQhpRcBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577723; c=relaxed/simple;
	bh=jCkqxU3vqnwlj8j+4/RZnSRw5eAswlEHDZoSQaNhPWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVff2c6tiJo57Lc7feqeev4aDyw2lGsnaT7XXBQe7xDJUNofeYxAT5/HI2Le0JQrbCvDbTpXV1Phhj43pWA+L4bMyelHnJBZYAFEjDTHvv4uwn3rM3OLP1oFO/6HcMTarv1Fe3nJXbOESwnMVjkjkWhdCx0jfzGTWJAJQtSiAvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Dc2OFgny; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1774577706; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LC1EIRM0nsq4CRa8tKo1flFXz2nLkPKBTFbU/eFNdZ5jtmFouep5hw1YqAs+1mZOAC6fOFXKfQ81GM9u6wgVltL/5RU1ZmpY2T/tRLR3qhjbWXII/ADHrjzgfwbpaTra4TOt7P6Ryd8JSwVnSwY/XVpN9JyHnJqvM5+rg0pD7HY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774577706; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IP/XhJElv+TyBVv6++iQhgFRW3wkYKqljaaRTwlKHGg=; 
	b=B7Ku4NcUy/x0EjOXh/64dG/Fq6TMiUXtXwbeDMg9UIzYyO+W62SRguFWHIpNXKK4TA3ej+qVWLskSPXLLtCi9PciqYg7RZOIK/Wk7jSXdmcBk1tGNEeYej+XUkeCWijCGQqE2IrYM4SBYh2cXO2gB+lnGMwlHXGTJWtrvqpBy5A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774577706;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=IP/XhJElv+TyBVv6++iQhgFRW3wkYKqljaaRTwlKHGg=;
	b=Dc2OFgnyysv9NpJ+1uiqm5BLgRTvHjeeTdEKH06qf9pCWSxll6GVxy/68eelTJCT
	KYPHYQCTmOUprbjlKvC/hIH3k/uhjLigZLea0WZSD+Hz4cMIuWWbaAS+zvqAnl8gzWf
	+KUiiv/Zpmf125ZjaP09hrU+K7RtHc4wcM1rDChg=
Received: by mx.zohomail.com with SMTPS id 1774577705177729.188682794289;
	Thu, 26 Mar 2026 19:15:05 -0700 (PDT)
Date: Fri, 27 Mar 2026 02:14:58 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Biju <biju.das.au@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Steven Price <steven.price@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/4] Add RZ/G3L GFX support
Message-ID: <acXoBfUu3XNg2G62@sobremesa>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30397-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.larumbe@collabora.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,glider.be,bp.renesas.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 7445233E256
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Applied to drm-misc-next.

On 20.03.2026 16:41, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The Renesas RZ/G3L SoC includes the Arm Mali-G31 GPU as a 3D Graphics
> Engine (GE3D). The Arm Mali-G31 GPU is a graphics acceleration platform
> that is based on open standards. It supports 2D graphics, 3D graphics, and
> General Purpose computing on GPU (GPGPU). Add the binding and driver
> support for suspend/resume functionality along with some improvements in
> panfrost driver.
>
> v1->v2:
>  * Dropped duplicate err assignment
>  * Changed the format string of dev_err to "%d" and simplify the dev_err()
>    line by using err rather than the same PTR_ERR().
>  * Collected tags
>
> Biju Das (4):
>   dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3L SoC
>   drm/panfrost: Drop redundant optional clock checks in runtime PM
>   drm/panfrost: Add bus_ace optional clock support for RZ/G2L
>   drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC
>
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_device.c    | 34 ++++++++++++++-----
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  1 +
>  4 files changed, 30 insertions(+), 8 deletions(-)
>
> --
> 2.43.0

Adrian Larumbe

