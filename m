Return-Path: <linux-renesas-soc+bounces-30666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHSNOiXAzGkWWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 08:50:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F30B3756B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 08:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE208300B9FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 06:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3006233B6D5;
	Wed,  1 Apr 2026 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgQhyOQU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073142C237C;
	Wed,  1 Apr 2026 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025822; cv=none; b=iGJcOJxaH5CvhT9PRWAAz6xeOGHuSw6ualxf9SIn+Gu4OVOeLqLwFVgn6sCIIfi/16tiF4z7mPeydlflrhdxCgyHcv41XFuhEofiRo+HcXYXuSJAc7EDenP6fgsdaUYkRZmIVb01HX53mIyZgCs1isr5P/vihQX3CogDLNfoEaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025822; c=relaxed/simple;
	bh=xQfNP3419siynC57eKQ8sUBYE/3sPo5aVFSHN6wPcnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4BOunI1u+5maatJIx6PUra1n3JKwUl9ASAJjiR1WgtupTgscjrm2+DF/xHUGxYe27yp1+S/0XqI4NAxqv6Jtnw/56xsEMo8dHz+WF5+ONIH7zOwhfyz1anPOlV4WHsUvoPngJqTzvn2IHGuWd0rIvppyCBGgvj9qbKclNCFrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgQhyOQU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127CDC4CEF7;
	Wed,  1 Apr 2026 06:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775025821;
	bh=xQfNP3419siynC57eKQ8sUBYE/3sPo5aVFSHN6wPcnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZgQhyOQUYFWowrJjXkknmsT39PdoceQT6Xi0wlo8N984nyytfXkU76NjCttW2OMb8
	 XUPhd8SJs01w6t0XstI58merXGMVgveOz4kQhhmuivyHFP0PQJ5kJ0e6w+xqZkSHOr
	 76MyBBvOkuIYMSDXXPye8KrLluUonfGfan3hIYBTz03/yRxd1AK0hqohnfY4Ydx4Ij
	 /GQPN8cRpxTxAsmY+JxuBl8+gl5hHwu4QiBlumNsil54p9S484D0PKI6CDkR7YYLPo
	 V/sicDBKjQoFiDZ5b89HjBobSr4qILfHhAWrGuwVga8lYniFHahqkBlDIQy1oBl5Av
	 KWigjoqbLQW0A==
Date: Wed, 1 Apr 2026 08:43:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: renesas: Document MFIS IP core
Message-ID: <20260401-great-merry-jerboa-e2934d@quoll>
References: <20260331104527.29170-1-wsa+renesas@sang-engineering.com>
 <20260331104527.29170-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331104527.29170-2-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mailbox.org,glider.be,gmail.com];
	TAGGED_FROM(0.00)[bounces-30666-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4F30B3756B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 12:45:23PM +0200, Wolfram Sang wrote:
> Document the Renesas Multifunctional Interface (MFIS) as found on the
> Renesas R-Car X5H (r8a78000) SoC. MFIS includes features like Mailbox/HW
> Spinlock/Product Register/Error Injection/Error Detection and the likes.
> Family-compatible values are not introduced here because MFIS is usually
> very different per SoC.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v2:
> * added interrupt constraints
> * fixed whitespaces in example (Thanks, Krzysztof, for both!)
> 
>  .../soc/renesas/renesas,r8a78000-mfis.yaml    | 191 ++++++++++++++++++
>  .../dt-bindings/soc/renesas,r8a78000-mfis.h   |  28 +++
>  2 files changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
>  create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


