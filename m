Return-Path: <linux-renesas-soc+bounces-33979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IvFNEnOXL2rjCwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:10:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE91683AB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:10:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="R6bsdj/K";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E6C8300BCAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 06:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C666A3AA19B;
	Mon, 15 Jun 2026 06:10:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08503793B4;
	Mon, 15 Jun 2026 06:10:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503837; cv=none; b=A2x9EfVV8cX7lOnvP3QJuq4fsf6m7XJhqa+5j4uyRFCjhezv2tIOMffX3iEL0hQwqcSPYvoyj4dfcFnad8jLNvQ29jqkivtnoph6zAscIoPRFtBsFTefGSa3B9R/PVcJPL5nU/7j9lS/UAEGIhpez9wiayLKtasyFZGpMMN4/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503837; c=relaxed/simple;
	bh=tAuiapNAjJObSA+1cISJB4ykhXLBYsOUwitiKLwC/NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dG8fUsRQQRV2mzXfQ0/4qoZBP90mv0Gf9UBDDcBdOHUFsT/UsGaqP7L33I1SQLYZK4O2PmzVGhvn2YP6+1oVtTjZqFrpoy7R3PzcDJgmydgm4GFZdWAN/kBWXvgA89hbpd688rjaq21lun73GgVPwehP/I19dwS/RrJIJqrigKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6bsdj/K; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10551F000E9;
	Mon, 15 Jun 2026 06:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781503836;
	bh=61MpHJjcY0uerx3zYSr9mOX2E3p4+vwqJaUs4YZtERs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R6bsdj/KmRXFcmiJrsSrXTaCLEA05PrjKCMphpyzQ06oRPNczWb9wvNSbAbv47FP3
	 q2MCtDS/BK9oj8y1ZNA/pDRPzkwp7BInb/cWEu1GbgOCIf/zKhHsyon9aN9vgLKb8w
	 Cutz4jkktehlNbT7z/o1Q5ZfmyC0cVZ6uiS4DHZXqKgqWni7o7jsrS5vXzrrnHpsAV
	 8YrG/7+UEhBZQFIzQ5KHnOZv/he76JetVExMNz1s84cadtr1o864HcYaqPCuXho6dl
	 vJ3EYn1Ky0OBRQWm1h/ZOawcjV2ny6TakB2DV61OJCZzK8My+EKKA2P882qv4jHNPm
	 YWniiPmxawgMw==
Date: Mon, 15 Jun 2026 08:10:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Message-ID: <20260615-ultramarine-vole-of-art-653db7@quoll>
References: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33979-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DE91683AB3

On Mon, Jun 08, 2026 at 01:55:08PM +0200, Krzysztof Kozlowski wrote:
> Revert commit 51284d8b1dbc ("dt-bindings: mfd: syscon: Document the
> LVDS_CMN syscon for the RZ/G3L") because it is completely not matching
> reality and clearly incorrect in respect of renesas,r9a08g046-lvds-cmn.
> 
> It wasn't ever build-tested by author on their DTS, either.
> 
> The documented renesas,r9a08g046-lvds-cmn compatible clearly disallows
> any children and simple-mfd fallback, however its only use in original
> patchset is with simple-mfd and children, so this could have never
> worked.
> 
> Fixes: 51284d8b1dbc ("dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 9c81010d5a74..e22867088063 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml


For the record: this patch is still valid and justified, even with my
other syscon-related work.

The compatible here is not correctly documented and should be reverted.

Best regards,
Krzysztof


