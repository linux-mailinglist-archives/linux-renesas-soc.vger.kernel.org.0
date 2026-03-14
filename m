Return-Path: <linux-renesas-soc+bounces-29396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J0/DViqtGn+rgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Mar 2026 01:22:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B932E28AE58
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Mar 2026 01:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF798301F3AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Mar 2026 00:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D49273D76;
	Sat, 14 Mar 2026 00:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzEI3zWu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535742B9B7;
	Sat, 14 Mar 2026 00:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773447763; cv=none; b=plQTAF75D2yT6H65UwSo56Rq6NVKuAePXOFNGUqU4yMxq6jflxAnj5ZddQ3MR9R+4MAPtpp4+VcAX9tIWbm3y8LxNDGWsxa4OoTEvxOhR6VUp2J9vLyomtOMsNAHCTypjl42buJlrdPnwmVLxa+zLaQjccOw4TxfqxXYfisumR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773447763; c=relaxed/simple;
	bh=0+ND1aRfu6WzcrXhB1aDgdM8Yq2QvZyjUnfx/NhOjKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjEY4DuAwfB1wyCYbjmWJeUX341wNVmFqVfReomd7ZK+er9Z83+HaHWCxAn2sxywT1oApZbx+9zPniXHMnPA4HtpGcIyLuvq4qEvL0IG0XnRbIqKjfBRAfbQ0KbSi2Rc4BAgET3cJEmWEiduSpzDPDAtEk0ndQc0Qq4yf4NQRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzEI3zWu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0709C19421;
	Sat, 14 Mar 2026 00:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773447763;
	bh=0+ND1aRfu6WzcrXhB1aDgdM8Yq2QvZyjUnfx/NhOjKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzEI3zWuh5hwPxsXbtN5wQQhswZ1wBZRStI3/HlA6g2q1OHdOCHe4Au40dVHOTHOE
	 ACYbfxArYDHimS9JyVYQo95QR55ZCGRwrO711y4hZ7tabkwtAaHUOimWUPe0LXdP7T
	 83aVUvTXGq2e0WSxlbZNSLOiR4y5G+l0YOZq5Iy8mboulZyvD3dEFc569Ysy+h69P4
	 tn41DDvbKdoKHwQrM9wVJrCEHG3py1G+rTq71f3JHhtN91Sg8qQ0fysztWcgCtwbJW
	 1C4cS/ZprDkH0GSo8KnMiYNELYEfnWuE/mMRhjERVLHwPmtGtbtLPKmZcHT+H2461e
	 kK/ek8C+kR37Q==
Date: Fri, 13 Mar 2026 19:22:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-serial@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: renesas,rsci: Document RZ/G3L
 SoC
Message-ID: <177344776029.3722290.9591899535804850157.robh@kernel.org>
References: <20260312082708.98835-1-biju.das.jz@bp.renesas.com>
 <20260312082708.98835-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312082708.98835-2-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,vger.kernel.org,kernel.org,glider.be,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-29396-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: B932E28AE58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Mar 2026 08:26:58 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document the serial communication interface (RSCI) used on the Renesas
> RZ/G3L (R9A08G046) SoC. This SoC integrates the same RSCI IP block as
> the RZ/G3E (R9A09G047), but it has 3 clocks compared to 6 clocks on
> the RZ/G3E SoC. The RZ/G3L has a single TCLK with internal dividers,
> whereas the RZ/G3E has explicit clocks for TCLK and its dividers.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/serial/renesas,rsci.yaml         | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


