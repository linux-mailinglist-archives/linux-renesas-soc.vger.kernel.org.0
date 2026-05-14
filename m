Return-Path: <linux-renesas-soc+bounces-32626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEyaKVbNBWpkbgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 15:25:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B325424DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 15:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A6A930ADF24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 13:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98A33E0732;
	Thu, 14 May 2026 13:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhl+pvbS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B33E025C;
	Thu, 14 May 2026 13:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764862; cv=none; b=UXD9oOCVunAdqe5rAMNIVo8VPJQP2zRK4WLnBDxQr06Bs2xi5N670OsxaYlnrUWTNfHWh27ZEe0y4yr8V1ZcYNR4NxI2LqnhnnNU5UOxWdJCSe7yEYXMZgyaxAjg8hMWNZidp++Uq1md8X9kjclydX8AXpGg7IaEORb1/i6zD2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764862; c=relaxed/simple;
	bh=/d6JkD/4Duqh2N5CT7o3NdRCDzek83LRZbMUXKP5S00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmFojGZJv0LakYyqWkU8CCoDdf7UXGybgqv6gUImZTRgUf5gULn7LQj2tFm5plsjhwFwPpjDYwPCjsYv1rOFXC8HrxI92Xy5076ln/OCzY+SYA4OztAfd2nRg0pXf5LCB9nLvHpxxnK5vx/IZisD+hjzCOhol+FCmPd063//K68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhl+pvbS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A688DC2BCB8;
	Thu, 14 May 2026 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764862;
	bh=/d6JkD/4Duqh2N5CT7o3NdRCDzek83LRZbMUXKP5S00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhl+pvbSZ6S7HzUWEwRzIj50xuMqM3Kgs2qd7rxxwC4uLXgbHc3tWEqcAYPoSxtkU
	 3DEN8LsChgWX4ZRW+YUit/4awrUqPZPc58VxaVbbCfQrvBwB/x/krfHDcJzxdy0XMY
	 08YIQcSG5vtx5EUc98+p53OrmIbu+n/ibskNAyTv2L3X3S83QwQsx73KBM1CcKk1BG
	 BIEueWAugB+95p5UFSETqu2XgSq0IplOZEOTTYNy8xmAm35pXsfDGfEOiu41vfmuLJ
	 5Pbbt6gWe02B6QLI1UvdAzouzyWrgHJvymcmpaecpV7z/+vItbu7DJNqNtAuXKfxOl
	 GMhSDq9UjtDMg==
Date: Thu, 14 May 2026 08:20:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: renesas,rzg2l-du: Refuse
 port@1 for RZ/G2UL
Message-ID: <177876485382.133353.4226109265397951012.robh@kernel.org>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512144104.761531-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: F3B325424DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32626-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,vger.kernel.org,ffwll.ch,linux.intel.com,kernel.org,glider.be,ideasonboard.com,lists.freedesktop.org,renesas.com,pengutronix.de,suse.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,0.0.0.1:email,ideasonboard.com:email]
X-Rspamd-Action: no action


On Tue, 12 May 2026 15:41:00 +0100, Prabhakar wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
> port@1 in the ports node.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3:
> - Was orignally part of separate series [0]
> [0] https://lore.kernel.org/all/d1e0d4e0fe74e60345a3d043fb4f9128c1057638.1778141145.git.tommaso.merciai.xr@bp.renesas.com/
> ---
>  Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


