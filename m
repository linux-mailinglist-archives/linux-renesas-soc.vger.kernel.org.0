Return-Path: <linux-renesas-soc+bounces-32630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Pl5GH7pBWrpdQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 17:25:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C9543FD1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 17:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCC92302AB78
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 15:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C06407562;
	Thu, 14 May 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWFiSNnc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241D31E83E;
	Thu, 14 May 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778772212; cv=none; b=FNS5HaNJM8MoBP+zGY0p5izFY4SDQy3WUR1YgTnTEpTU3Eu68FXkXFGZXE1RqsdgzjVI98lsYO579PJ0S8eH1F64F5xljlesywT/bBDtUQn2OSFnDkqQXnch1EFGCLQLmWMmPm43I17QkoGMhi0Nf8E1QmblYtAZQXDLmEWxRlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778772212; c=relaxed/simple;
	bh=JvugWyByTkXEaIiK4vIpB6X4Zi+TSZyKhUr1GwFqia0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9k2+SzCshSVft2lPmUjxmAKspooc3z7pOGOn/RvmwElqJxm0rY+104FlS9IrP1/Hb1KbPvLcefIxLe7IWP0Kch70t8al+w+C90r62k80Av595thp3wPsK/8ZiBT3ny0RLIFzxfL00eOhuSvIj1yeD0vBG3IGU+WuzIQ4958EIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWFiSNnc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FC2C2BCC7;
	Thu, 14 May 2026 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778772212;
	bh=JvugWyByTkXEaIiK4vIpB6X4Zi+TSZyKhUr1GwFqia0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWFiSNnc3dSAI7/O8AGV6HRJlPPpdM0omY94DJV0t1xNMNDmXd77WNVptjBI4LqM+
	 J6eBL3atJACHKI7alCexSwPf8VItP7gqXfKFdio/YEVXB5Y5DMGmt2pbAXD7Zo7aag
	 pBRGqZfGuBq77ctyeUArqY3aWFwgcku/nuHFfWaPiZkaNTT2H5qlfczGMIcZ48hrxH
	 QX/qKDZ6qYc1j5QYnecdWpga9qP/lIzPEnKPiCuxHe0Dp+FLWWiSQQ8pdt7fqtIAeY
	 Z1zbliDw451ngxw4FNmDmvdNzvp2wueQi/MfOKwOupMWNG9+/cK5MUYFFmRuLgSHgX
	 XzSohzDYdTcMQ==
Date: Thu, 14 May 2026 10:23:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Simona Vetter <simona@ffwll.ch>, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: renesas,rzg2l-du: Add
 RZ/T2H and RZ/N2H support
Message-ID: <177877220882.612619.10485324075713791036.robh@kernel.org>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512144104.761531-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: 111C9543FD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32630-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,bp.renesas.com,ffwll.ch,vger.kernel.org,gmail.com,suse.de,glider.be,lists.freedesktop.org,renesas.com,ideasonboard.com,pengutronix.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action


On Tue, 12 May 2026 15:41:01 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.
> 
> The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
> supports the DPI interface, but includes SoC-specific register differences
> and has no reset control. Add a dedicated compatible string to represent
> this variant and update the allOf constraints accordingly.
> 
> As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
> RZ/N2H specific compatible string with the RZ/T2H compatible as fallback.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - No change
> 
> v1->v2:
> - Dropped the "port" property in favor of "ports" with a single port@0
>   child, to align with the existing RZ/G2L bindings and simplify the
>   device tree structure.
> - Updated the commit message to reflect the change from "port" to "ports".
> - Dropped RB tag from Rob due to above changes.
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


