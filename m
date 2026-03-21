Return-Path: <linux-renesas-soc+bounces-30055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNzpFpJlv2lJ4QMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 04:44:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D222E8282
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 04:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E7A9300EFB4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 03:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D235637FF4A;
	Sun, 22 Mar 2026 03:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RySlusss";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yhFUUf3K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC837F8D8;
	Sun, 22 Mar 2026 03:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774151049; cv=none; b=j0wXO2+iiwu+OzNrIVTMbYNW+UzgO/A8+qIbESAhTaHbOJrrpdS0eLtg8uQy6SBOwvvL/qN9JKnvgQKG3VWYAcvdBsOJdVIQ97Qn4w5p9g9G0jq1BFW4MNcAcqApgooMEWv4K2l9dDHubZWu4W5i4hFuVYr8ZGJPRjJp7PrL6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774151049; c=relaxed/simple;
	bh=y5zq2D3lOiI0Qw3PR34/ItRcvLMn+HjX7/inOrvLOHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXEvCdq46iENX3GSIlLnECot6Z7jUHnnElmmAEXCZDFHznKyDzJEf1CZ8XlRL8LYN0M9gecqZKRRtUL2boIk2UAhC9tyjVMueWAS/qLj7NNH8ejl4b6LNrEOKjOlXxQHo1KgGvmbaHELrzXP4t6tXQlSesRBl0cVHtu7+68lCX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RySlusss; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yhFUUf3K; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fdhxD1Cvqz9tn7;
	Sun, 22 Mar 2026 04:44:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774151040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pPmmUr2rdYksgu0/4NHiyOVIMPthGnBqroydjCMUJA=;
	b=RySlusss3CTCUBE78BS8aXqfbboUE1Z1SicgUIk2VKxEJ2DWD0wwsa6GlRv1KfKJRQMys+
	8sSYPF4MqxtaZkSvsZOI4lGIpJQRJYVVx6Ntg9HYd9HzHzQ6r4yqi86gO3iKBSxYsUE0WW
	OU8WawIEdLlA665CNn+OFwmfWRIaAU3UqtvAbP4uyFHZPaz8xPe82zF1/VhPNE9ftsXOS0
	T0CBDb1LpUxCYM7IX5rmzSd6sIvKUdVx4OiEkMRuLmep+rbSqj9YHJRLOSOo6vBSxk+MAL
	lWrZC/eyC3lmHhtz5Af1FoBdzR2qZJIFiibopUN68O24t8nPYOk8BKestlk41A==
Message-ID: <78d477a1-9f02-49e1-802e-4108b63141eb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774151038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pPmmUr2rdYksgu0/4NHiyOVIMPthGnBqroydjCMUJA=;
	b=yhFUUf3K1QVHAVbFAXyB66CAuhcs55jnwqqzHajoRG3esaKpWUMboXmW04Ypp3C6fATRot
	LE+X7Bsd21XRQq6U1Nmx5eETTYi+gt2U836HcZ2AaVesGftQFQA/FjYNLvH151Pb/Qc3X4
	Yu7pQ2OJiGHNTDrerqWANrCTbVLDGtWFOK86Fv4qpV9C4DsWUCrdtrd5tPd2C1AT6YpJxo
	4+hW2d9ZB1FZEHQWAhcg+h0OaLlw/F38anRmtKmC0ZX5AD+3anLwdiMUt/TVoBwrEiy/uw
	D9wWYXDfezVNcEObz2WcQQciVlFEa2v1FNbLvLLBvRmsmS1zTB8279UUSGMj+g==
Date: Sat, 21 Mar 2026 19:52:57 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
 <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
 <c8d878e2-8ce8-4526-9dbc-96e4f42be4cf@mailbox.org>
 <6c3829c4-3e1e-41ee-b969-820948d10611@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6c3829c4-3e1e-41ee-b969-820948d10611@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9f572a9e99c9b97cc2c
X-MBO-RS-META: 9nomey8gwtghgdcywd5hib1z1ngije3q
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30055-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org,mailbox.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: B3D222E8282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 10:26 AM, Neil Armstrong wrote:
> Le 21/03/2026 à 02:36, Marek Vasut a écrit :
>> On 3/19/26 10:22 AM, Geert Uytterhoeven wrote:
>>> CC Marek (for Sparrow Hawk)
>>
>> The upstream supplies to which the USB controller on SH would attach 
>> are not described in SH DT yet, and they are always on, so I don't 
>> think we need to describe the controller in SH DT yet, do we ?
> 
> Indeed, not necessarily, describing it would be required for power 
> control and eventually to describe usb hubs as subnodes if they also 
> need reset and power control.
ACK, thank you for clarifying !

