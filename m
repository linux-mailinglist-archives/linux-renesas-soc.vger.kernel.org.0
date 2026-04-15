Return-Path: <linux-renesas-soc+bounces-31306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJhCIywD4GltbgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 23:29:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE84082CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 23:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43CBC3040B20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 21:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DFD38B7C4;
	Wed, 15 Apr 2026 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2631fmd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D847F353EC1;
	Wed, 15 Apr 2026 21:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776288549; cv=none; b=GoTIwRSYQdh8nA8oq6E17WXFNnB3Hz3H5mKnZeNwaF8tUK2Vx1zOVkvoiTvpuM93xiWgZNJQq7i4bQF/w3iNrp3Mx1XC2JKddHGVEI0sMu62z93Ph6j7JPTm9AgXeYCF//kn1JS4jt5z1avJhNgr4LOvxOTqGYfLIHaXJ33/mzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776288549; c=relaxed/simple;
	bh=xqpZ2ktzLOaG03grkucHkMYRms9MYNWJNMGv7I1wFOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQfwvIvA+p1oUTl+cCF361nu52rMws8nVY/fQY/T1/UPrzB2THq21768B64lYnqap0xcxtg7m8tm5s+jVBKfiLVIkGT5RO9X7Ea91oOIYf0ct50NrmU2+szZ6LpCBj280bDUgspKr5H1BuhhfZXgXRrPcnOcu39gcOz0X0TrttY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2631fmd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EA1C19424;
	Wed, 15 Apr 2026 21:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776288549;
	bh=xqpZ2ktzLOaG03grkucHkMYRms9MYNWJNMGv7I1wFOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2631fmdcfClYaH77Qqdp/HCZH0OlEl7G4zrEMCbOJSw6E6/EuIDutVCbrGaEQsFI
	 vNjHWinM5wRA8D5+NIFBzHdW3dU/OzIS1NVXRJ7aDYVkDRT7EgBodBgaanmXzcpNhh
	 sWVln+UxseK/25vWBezDjkS7pEhSUkmRgPtaI1zvykk868dHLdrroG/FskaRc7cg1Z
	 EQznrnEt69ztR9bHzBeFAn6fOLyNwyTD3pjAiLrBlMpcdDGIGxkGiyBPRkdCahaY5p
	 RI0AMVxHEh7LTazAiuNZ8Of4lwZmSRkiX96/MQY0T0zwmQEg3RsSImmqwN13HF8Pju
	 RvRt24J8SyBRw==
Date: Wed, 15 Apr 2026 16:29:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: linux-spi@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Message-ID: <177628854701.543173.16954025159083410550.robh@kernel.org>
References: <20260402131020.143123-1-biju.das.jz@bp.renesas.com>
 <20260402131020.143123-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402131020.143123-2-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31306-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 58AE84082CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 02 Apr 2026 14:10:16 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible with
> the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tag
> ---
>  .../bindings/spi/renesas,rzv2h-rspi.yaml      | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


