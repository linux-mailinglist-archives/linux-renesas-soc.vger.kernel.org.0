Return-Path: <linux-renesas-soc+bounces-27241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIJdModRcWkKCQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:21:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C815EB67
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4B7780AE47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 22:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C2043E48E;
	Wed, 21 Jan 2026 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rE13pehf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA1F31B81C;
	Wed, 21 Jan 2026 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033665; cv=none; b=WD5+lYRkB4g3YVqkfhA3jpLLObYyjD5locWTPjE2nC0KsctzW1YprUsm2I43uPfgYpKcQzQm0rIjVGzF88lTil+sjfEmGL3EQZwdFM/iuq245rCRpCmM/mgmD19mhU0UnMUhaK7Lk+NZRjWxlsC0JXa5lWnOQxdxNMgLK+fU6dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033665; c=relaxed/simple;
	bh=wM9aOdFem8/KGW7/jua3pY5HlHx/bCahM7Nujikbxj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdFM1QsSEfrqs2c+YdPFqAeJa3uFZ6VgPLQTFVwrDvbZ4lcVW3DyK2pgI5HLfXDhUSe+KPbMeGMN0mQeKxGzsdZK9KVPzj+D153z/Up94O6daouMcx4wsICxzv4ptIekfxmYV5BXxXng2cWBxSM76Ksi0QaT5nNXPmfwabpdQro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rE13pehf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B71C4CEF1;
	Wed, 21 Jan 2026 22:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769033665;
	bh=wM9aOdFem8/KGW7/jua3pY5HlHx/bCahM7Nujikbxj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rE13pehfLtK66TffUQIbQoGBXE5QTAdxtog9MJGh4whVGRTFDgYFe1W9LKS36Eq0z
	 sRduNjoKjDKeIiuBGD4IjgKFRtgB8BCGpQNM5N9YJAga1daoINm39VZtVoDXY1cJ/I
	 4AcY1Wje/o/x7RInmX/9fR+fdzMiKZDp+AdcQMOSKUzWu5uiLux2pTY3S0yX5hKm1G
	 7Q8r87OhtNFWPMh8hTDlCPmMXEuGQ9EDBw/CJV2uF2+v5r8db1akEg7B/odLUoIDQn
	 2NEj9vaGYa2ks2Etm92kZm94F0qTsNOdCW5OoSI00i7OApMqN3qAE6FgdctPwZNY9h
	 JgFU0a57ZGzZQ==
Date: Wed, 21 Jan 2026 16:14:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, linux-spi@vger.kernel.org,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Santhosh Kumar K <s-k6@ti.com>,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/17] spi: dt-bindings: cdns,qspi-nor: Drop label in
 example
Message-ID: <176903366341.223804.10612191633989016052.robh@kernel.org>
References: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
 <20260121-schneider-6-19-rc1-qspi-v3-2-43e70fab4444@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-schneider-6-19-rc1-qspi-v3-2-43e70fab4444@bootlin.com>
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,ti.com,bootlin.com,gmail.com,se.com,sang-engineering.com,glider.be];
	TAGGED_FROM(0.00)[bounces-27241-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: D1C815EB67
X-Rspamd-Action: no action


On Wed, 21 Jan 2026 18:04:58 +0100, Miquel Raynal (Schneider Electric) wrote:
> The label is useless here. Plus, if there are several examples with the
> same label, we'll get very useless yet annoying warnings.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


