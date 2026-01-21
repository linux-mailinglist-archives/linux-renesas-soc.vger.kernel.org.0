Return-Path: <linux-renesas-soc+bounces-27240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBw+HvFRcWkKCQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:23:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 694BA5EBD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94B4786B787
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 22:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6BD43E9FF;
	Wed, 21 Jan 2026 22:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJqU17PH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F56643D4EC;
	Wed, 21 Jan 2026 22:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033642; cv=none; b=O0QLZbCV+F7KJ4ivNNeQSMdg575oYBaSNr1y/6g8aRFmhJQzXaM0HNqeViF0wU9LlCUAFskseyjKq03jorctN6o6sf6ST4OBzqrsaJkdyevA86A7z9Gh34IUBBd7peSMQaARScrCPpAyOXSTo0xUSuRz4UupGDUnpGFfX1UbmDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033642; c=relaxed/simple;
	bh=vdyfrJ5mOts4dmA/F7z9nX0PKIM65ZWRGvCPJg7l1Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mg9mXG5ZAZzn9i3vAOullXgN0wV9ECLzXX2N2iHGG42RhyAskZS8jw0J8yPLGUrg6htO/z2B7W+E1PwK0cm3LPwwq+Ss2MGJwcRQh1Oq4fmAVo9jbseKVp7iQbfwvl02XGFZm2Zznfl+0wnPwq+qXrJfa785vhfKIMjwQt5mWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJqU17PH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0900BC4CEF1;
	Wed, 21 Jan 2026 22:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769033641;
	bh=vdyfrJ5mOts4dmA/F7z9nX0PKIM65ZWRGvCPJg7l1Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJqU17PHURbu0i5HA76ubSo+lqcmlU4vknDyDtY+cat74opbtC74LWnC2AZ37ASPN
	 DJ3CSSR+99b9ZGU/njVfFEgSCh1sjwesVvQ49DiG+UChHgY1Qe7VUQjQZnPNrmXb3r
	 ImQjpZGfUW/qqLWn738cDUVkCl+NesMhO+8ksgWP6FkgCIK7/ugIr+b2wHaWHxHIG/
	 bl9UOiEo8UxurqawkIATgg0U31tzGn16N3atsEEn6OZUCb0SXNj4Wi1GIesUSHqLZ2
	 MIHCRw90dMClljWTF6LgwzRVCGQELZ/HqqYTjNXEsH2dSHuegFZUiMa0xsWaEGyxxo
	 Zl/t/mT/oKmFg==
Date: Wed, 21 Jan 2026 16:14:00 -0600
From: Rob Herring <robh@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Santhosh Kumar K <s-k6@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 01/17] spi: dt-bindings: cdns,qspi-nor: Remove
 duplicated constraints
Message-ID: <20260121221400.GA218496-robh@kernel.org>
References: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
 <20260121-schneider-6-19-rc1-qspi-v3-1-43e70fab4444@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-schneider-6-19-rc1-qspi-v3-1-43e70fab4444@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27240-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 694BA5EBD6
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 06:04:57PM +0100, Miquel Raynal (Schneider Electric) wrote:
> The if/then/else block sets the restrictions in all cases for
> resets/reset-names, very much like it does for other properties as well
> such as cdns,fifo-depth. Drop the constraints from the place where these
> constraints are simply ignored.

But they aren't.

> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> index 53a52fb8b819..b85dba351822 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -136,15 +136,8 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> -  resets:
> -    minItems: 2
> -    maxItems: 3
> -
> -  reset-names:
> -    minItems: 2
> -    maxItems: 3
> -    items:
> -      enum: [ qspi, qspi-ocp, rstc_ref ]

The primary reason to keep this is to prevent making up other names. If 
the names are only in if/then schemas then anything is allowed and it's 
not visible in reviews.

Rob

