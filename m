Return-Path: <linux-renesas-soc+bounces-29728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHf1KihiummoVwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:28:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B22B7F1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09A47303EC8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36C337EFFC;
	Wed, 18 Mar 2026 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGRNUAhJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC76037CD42;
	Wed, 18 Mar 2026 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822353; cv=none; b=E3zNasd2YE46FeO82BUogiK0B1aQs4SK1/Y9nX8crK8AhfIxp5MLIrXPd0o7wu1t6jx5h/i5HmANG5Hl8U/KBydyE9Xxh9l1cZsoAb82dh/5B0Th6GHF7g22hA5TpPfuc2+tuy8feXYfTYgPnfZYt5F/2Cy3ORJ6K8e7TvkNw1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822353; c=relaxed/simple;
	bh=s+IDRg28ThLwYPv0W5lpsZv1V0qt2+rCZG8v42jQQH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSoDxtkW+w71EcCB8k2jE5mtlAtM/L9PBJ2Hs/Og07Es1cAl+EtmY9LIaR2B6gzIG+uFIOxIaKI779Pjtf6Gzwh1FEMqJSHLBIqjmLX8XkFahrIyPQiiNIB4GrLYmDKNmtdyy1jR95SWfuJJFtDAbquU7ao2J0yhdYwGtACeIuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGRNUAhJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BCDC2BC87;
	Wed, 18 Mar 2026 08:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773822353;
	bh=s+IDRg28ThLwYPv0W5lpsZv1V0qt2+rCZG8v42jQQH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGRNUAhJOlZ6qZLn2EF+zOlN+3eLFomlnZdqzisj5GpzMCyYWma+vIrFmd79Xcr6u
	 ZwJ4sZtOQA3YhzHj4M3hAYeAy0ndtgVfU3nJSuSwT7ueaotce63XtR1TMp7+Scv5hs
	 9qg2yt8DPd2yYa8E7srUprfWvSFPVeLNnjMLS3NhBoIAdvAxRLHEOTWX2wuHfrkesT
	 El5oC9mcTQ2byOZoeugxiJsuq0ArfJt/1kK3vvFs1eBx5W0qkr1kCwHbiKc4n2yTUy
	 WX5wQQLlgozwtB3U+KY5SVFhRqp59VVX1XgCMNTALAUHmIBXKNZZzb99n5B9k3mvE0
	 ltK9g6JGlnS6Q==
Date: Wed, 18 Mar 2026 09:25:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Dawei Liu <dawei.liu.jy@renesas.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com, linda.xin.jg@renesas.com, 
	tabreztalks@gmail.com
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/isl68137) Add support for Renesas
 RAA228942 and RAA228943
Message-ID: <20260318-elite-archetypal-porcupine-a5d2a5@quoll>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-3-dawei.liu.jy@renesas.com>
 <9ec35dce-5f6a-454a-9ab5-e61b22796325@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ec35dce-5f6a-454a-9ab5-e61b22796325@roeck-us.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29728-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[renesas.com,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,roeck-us.net:email,renesas.com:email]
X-Rspamd-Queue-Id: 491B22B7F1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:23:57PM -0700, Guenter Roeck wrote:
> On 3/17/26 19:19, Dawei Liu wrote:
> > Both RAA228942 and RAA228943 are digital dual-output 16-Phase
> > (X+Y <= 16) PWM controllers. They are PMBus command compatible
> > with the RAA228228/RAA228244/RAA228246 family and use the same
> > 2-rail non-TC driver configuration.
> > 
> > Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
> 
> For my reference:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Note that technically the devicetree patch should come first,
> and I can not apply this and the next patch because you dropped
> Krzysztof's Acked-by: tag from that patch.

Was there an Ack? I see only one reply from me, but maybe something is
lost because entire posting is completely mixed up (v2 being part of v1)
so it all appears mixed in my inbox.

Best regards,
Krzysztof


