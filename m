Return-Path: <linux-renesas-soc+bounces-27926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBjqJ5kChGk+wwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 03:38:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03034EE04F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 03:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10F43300B10E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 02:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DD72BEC2A;
	Thu,  5 Feb 2026 02:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFI1kC0l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7257A2BE7B1;
	Thu,  5 Feb 2026 02:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770259082; cv=none; b=aFvprGhrwUwc9qMOTDJuSWvbVdm6xgOwF14OeSk824lh0QYtTVxcL4PovdCwzArubsGClarryoEskR4IlWSzYOvRCJb99G7QLuN+O+ecLs1ZJbEXWxLj+OD00q6P3RgAsQr6MVF66qayVMi3eQGOTZ8oZG4cqI0FROIG6TCBGwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770259082; c=relaxed/simple;
	bh=cto3XPtyqaXxv4BXyDBQtiDFldXDC0LpsCmkQrntc28=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BmwrjSVaOtol26X8+ldy1DJnv5tCVgrWLN0JBzyvDH/J9/Az67yiOCZYn814Em3UcVTtmSKwDakmy5ABHymB1OF1UlnMjhDL7gfDrhwKydQ/nLN8RDjMNy4sb7lOEqD5bm6fAOSQADvH+rz2WVzJ91CguOO4kdeE+pHbWp4Hs00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFI1kC0l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BB1C4CEF7;
	Thu,  5 Feb 2026 02:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770259082;
	bh=cto3XPtyqaXxv4BXyDBQtiDFldXDC0LpsCmkQrntc28=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nFI1kC0lOly5CKPPsTmZmqjQd2euOFj/GI7xPbUJS7HXHxHM+LmfpRUHBdQ2yO817
	 gwIsASvsTlgWObofrBXlEdY2PX6vYU2Gl/qESfre/xnT0yWbTAWDGCjn98haFog4lp
	 xmCaAHzvvBGONW5giq3ZQd2XUGuQ6xEL/R+3ds9KwmoEnk2wgsnLIMUMdwpFBWsZdA
	 E20Fq39V/d0ZAzNL//F8QsMV2ZjKHAm9LX+Jkw82cub1OqHQJrFgCcmTKnLE6shB0R
	 BMXamdH4ChI8PdsEjrj/WkTg3HXRIBjr/cQ7UxA0AAtJsIZ94jx1hBdMtsipogDahQ
	 YHVOaHvjFXS1w==
Date: Wed, 4 Feb 2026 18:38:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Biju <biju.das.au@gmail.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/G3L RMII{tx,rx} clocks
Message-ID: <20260204183800.3dd59ad0@kernel.org>
In-Reply-To: <20260204-audience-eastcoast-9e0cf9b96fd2@spud>
References: <20260203104541.264759-1-biju.das.jz@bp.renesas.com>
	<20260204-unroasted-obscurity-c3f5cde43036@spud>
	<20260204-audience-eastcoast-9e0cf9b96fd2@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27926-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,kernel.org,glider.be,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 03034EE04F
X-Rspamd-Action: no action

On Wed, 4 Feb 2026 18:02:50 +0000 Conor Dooley wrote:
> On Wed, Feb 04, 2026 at 06:01:33PM +0000, Conor Dooley wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > pw-bot: not-applicable  
> 
> Aw shit, this is a netdev patch.
> If I have screwed up the state, hopefully someone can fix it?

Ugh, looks like I didn't implement the logic to ignore "+dt"
in emails right, cause the cmd didn't even work :/

