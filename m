Return-Path: <linux-renesas-soc+bounces-30894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGvlFgwQ0mkSTAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Apr 2026 09:32:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF939DA2B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Apr 2026 09:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0115A3009534
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Apr 2026 07:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549FA33A9C1;
	Sun,  5 Apr 2026 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xon4QGKn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29824DDCD;
	Sun,  5 Apr 2026 07:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775374343; cv=none; b=RktOteMcMyUJdQTaPK9GHQB1fOuUVYpqwZ+fZK9VnuuhN2mppoIWSFizZ5v4+a7csmKaC5EeMu7Axf1SvJ0DWAPriONxmVOk/AacdNR9A7h+Kk/rDqB24dfUgSLib9/C+R5WQeNvRzzuhqADqf1Rxhjio770ZP5E0DjM26PLvtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775374343; c=relaxed/simple;
	bh=0EOmgSmZQHdpU9boeuf7jKexVd54Hiw/ztad9oO6RD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAyNDYPsVW1BMx0TK4jGwXGokDKGN4kVSMm2H+kvVQAG/7WXKnKQew6Yljn1o8cS84tfDsmE5bz8IvogWuDIvTQYpbDz4bKYrsooNOc8AulcdbgCoWKEUcScPfFTu5lfo4AbtlR0ihIG5eqMBGETwXbucaVUZw1pnmzUKbWkxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xon4QGKn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30663C116C6;
	Sun,  5 Apr 2026 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775374342;
	bh=0EOmgSmZQHdpU9boeuf7jKexVd54Hiw/ztad9oO6RD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xon4QGKnOkxjtFC5zcuw9kpWZap0n6ZN2XUrGurQbL+NO1QkB8pGBVoldRFGOWD3v
	 TWchyvzq+El1vBk8Tiw92xzvhVDCbxWFBSw5qYQWjn+LqGHaWzuHhCKhl63Dqhlffa
	 ma0y8plj62wEzfJlZsi8Tl7mc1FzlaGwP0EBvuXgtOW8SdaR8LnWYDH4kWDaWQ2RYV
	 qrwrHpUCW93IRk7gEO342eNJGHWJgFpvJ3+NgMjmYmx4XTYZ9WfbWz+D60LH5wyj5J
	 REqyb/VPPB9VRK7Pp9L1ko5GsKTwkHqwBOVS7pBwHBkVoqiB4rvNaPg/0nsA90u8/5
	 ECU8dRQrXUJpg==
Date: Sun, 5 Apr 2026 09:32:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: sound: renesas,fsi: Add support for
 multiple clocks
Message-ID: <20260405-ultramarine-orangutan-of-wholeness-bbcc6b@quoll>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403112655.167593-2-phucduc.bui@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30894-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1AF939DA2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 06:26:53PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The FSI on r8a7740 requires the SPU clock to be enabled
> before accessing its registers.
> Without this clock, register access may lead to a system
> hang.
> Add support for the "spu" clock so it can be managed by
> the driver.
> The binding is also extended to allow additional clocks,
> as FSIB may require more clock inputs, while FSIA
> typically uses fewer.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

And not after every sentece, BTW.

> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  .../devicetree/bindings/sound/renesas,fsi.yaml       | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> index df91991699a7..225cd8d369bb 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> @@ -38,7 +38,11 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 8

Needs valid descriptions.

> +
> +  clock-names:
> +    description: List of necessary clock names.

Instead constrain it. See also writing-bindings, writing-schema or
example-schema documents.

Best regards,
Krzysztof


