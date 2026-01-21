Return-Path: <linux-renesas-soc+bounces-27249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGjmM9RccWnLGAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:10:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEFE5F53F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6ADEC94567F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7386C449EAC;
	Wed, 21 Jan 2026 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6+Forhc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62473AA194;
	Wed, 21 Jan 2026 23:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036954; cv=none; b=Qupyyt5P3F1JDQgiOba3w2cHzrVQA6475BKd9CTCqtwBNCv0GJNeA2kZbf2o5/noqVAZW9+er8HzvSESS7m0QlUCO77N/5A4RHzElYqgCbn7MmOQDENCicpMPm3uaJJ0Ajucs7AO2IGDCvsI+5e4caWRmsQq3umt/17yPIpPiWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036954; c=relaxed/simple;
	bh=3oQWG9XH4ZQP+X3Ju4hk9j/vZ1Myo7J87FsG1IeiSnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpFaNYMGRO6cWhyEw3jssA5jIPCR5yBO3ApOTkbxWbfYGKVHn6AJ+TsndOUPfRaxIkdJIEP5AnLHigFFFCPN4FRtvg62uSnuXGR7MCKUjVsahpGn/SCNk/vfrLASs3U7yqg/bIvPRuwae+OZuht8DC1RQ2XRmMvt+w21ezyrReM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6+Forhc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426D5C4CEF1;
	Wed, 21 Jan 2026 23:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769036954;
	bh=3oQWG9XH4ZQP+X3Ju4hk9j/vZ1Myo7J87FsG1IeiSnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6+ForhcjPfqQmcTtug8I0eRCBRehh4bjqDyZJqrfhldaYp8CElmQyOmmYwBA6PQL
	 B1KcMBFiMC1vrSwb6JSD0SDw2JafUQXoIzKbR2ziYFL/v4434QD32nNYqLlZr8QzvS
	 PZ2FteQsExeO7NfITBxC3BQRYzEiALYK3Dx37OI030i3QYfyUl4uAdzpgILweYzj8x
	 8wXorXoAIk0MqjIb6B8GUfEAiaEGiben7rsnZPl6m9SPlGfCS8glMWMNbe3aWGxU8o
	 26XKbAik666U8TrbSPs258zkoprCIxinrtsd7qI4AGpDc2pSuFUDDc3ANT2eE5tex1
	 L75pheGUzKM1w==
Date: Wed, 21 Jan 2026 17:09:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Santhosh Kumar K <s-k6@ti.com>, linux-renesas-soc@vger.kernel.org,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-spi@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [PATCH v3 04/17] spi: dt-bindings: cdns,qspi-nor: Add Renesas
 RZ/N1D400 to the list
Message-ID: <176903695282.294270.16691976045231363256.robh@kernel.org>
References: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
 <20260121-schneider-6-19-rc1-qspi-v3-4-43e70fab4444@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-schneider-6-19-rc1-qspi-v3-4-43e70fab4444@bootlin.com>
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
	FREEMAIL_CC(0.00)[ti.com,vger.kernel.org,kernel.org,se.com,gmail.com,sang-engineering.com,bootlin.com,glider.be];
	TAGGED_FROM(0.00)[bounces-27249-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Queue-Id: 3FEFE5F53F
X-Rspamd-Action: no action


On Wed, 21 Jan 2026 18:05:00 +0100, Miquel Raynal (Schneider Electric) wrote:
> Add support for the Renesas RZ/N1D400 QSPI controller.
> 
> This SoC is identified in the bindings with its other name: r9a06g032.
> It is part of the RZ/N1 family, which contains a "D" and a "S"
> variant. IPs in this SoC are typically described using 2 compatibles:
> the SoC specific compatible and the family compatible. The original
> Cadence IP compatible is dropped because it is unusable on its own.
> 
> Indirect accesses are not supported by this flavour of the Cadence IP,
> which means several properties have no meaning in the scope of the
> Renesas compatible. Let's make sure they are no longer expected nor
> mandatory.
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 33 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


