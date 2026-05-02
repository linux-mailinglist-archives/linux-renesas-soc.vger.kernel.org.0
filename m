Return-Path: <linux-renesas-soc+bounces-31886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE0DMT+L9mn7WAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 01:39:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DABA4B3AE8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 01:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B45783007E25
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 23:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08EB305968;
	Sat,  2 May 2026 23:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="d9HOVMyV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7540175A92;
	Sat,  2 May 2026 23:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777765179; cv=none; b=SPEeTAbuPcU+KmVwV2Odi+QHsNM4LVlgh1QacZgMOt4e9q+NhhaUwYGf+7TBaxq5OYXpaPUcKXEDmyUyzZhqygbJgbSnTeBbXTL5GOdHI3FHiL9nxIpGWhl2asPhJSfJZTdAUFiqSxMtwm9VwkjKI5iy6u8YJU7OAOMjWKEOuUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777765179; c=relaxed/simple;
	bh=G3JF5eEv1JBbgseoFQC10u3gWJvjBResLPsxk4Fv9M0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9Psh96pRIq7FHd5PziK1GMO33sqtRM1ydkMdlrbI+23eWQBDg4hzviFnmKB+I4Pijn/lrZDHMC257CNtXKHOamlOegBnsN5x3+LG9SmJBBCfR0Cjn+0+CxOIymbtQMyG/1DFsfimXB6DjHnX4H7Kv9k4OmfErv1if26EbTzV5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=d9HOVMyV; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g7PWn37rZz9t65;
	Sun,  3 May 2026 01:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777765173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfILjtLnryyVkFeL+4YyfSAyo9v1cIId1IUMbHc/7qg=;
	b=d9HOVMyV+ERwC0R89d4h1I+F8HG5GYp0N9FSJCr2qXU/85Mb48wp+DZY6TjAd/2swt5u5C
	tVJH8rRunB3zDWvh6WFYsLGlR5//5UycBAO8mb6rUH5l3diyGRU9V/hymox+LdbP4PpGSd
	1yhmMEJMi3hIsmC1Ec6dPh/Z3eAu572dnzoJDF5tW9ML6Y644St7vPz7cOnhR6up7AyX65
	TXTz5na3KrzEAk/1WFVpJUKWgMFX1ZqZsiQDuB9MHQwydulYZjh8OWUhHRkboMHuaOP1Cb
	Taxgx3XRXrpP+BhbCMSLGqL6APU2oYlKF5XY+kCKLC+23+K8JabFMNBeIX48YQ==
Message-ID: <380861ce-b832-4789-93fa-c2340ce487e6@mailbox.org>
Date: Sun, 3 May 2026 01:39:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
 <20260429221153.GD132396@killaraus.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260429221153.GD132396@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: rcrxobjd51jeq56ffsfaa15qkptt7r43
X-MBO-RS-ID: 3e84285b24ac2565bce
X-Rspamd-Queue-Id: 2DABA4B3AE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31886-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,glider.be,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 4/30/26 12:11 AM, Laurent Pinchart wrote:

Hello Laurent,

>> +/delete-node/ &vin4csi20;
>> +/delete-node/ &vin5csi20;
>> +/delete-node/ &vin6csi20;
>> +/delete-node/ &vin7csi20;
>> +/delete-node/ &xhci0;
>> +
>> +&du {
>> +	compatible = "renesas,du-r8a779md";
>> +	renesas,cmms = <&cmm0>, <&cmm3>;
> 
> Shouldn't you then also delete the cmm1 node ?

Please see my reply to [PATCH 1/7] dt-bindings: display: renesas,du: 
Document Renesas R-Car R8A779MD M3Le , the CMM0,1,3 all seems to be on 
the chip and accessible. I think the CMM driver should be aware of the 
IP, even if it is unused, e.g. to bring it into low power state if needed.

> And does the DU still need three clocks and three interrupts ?
The Geist board schematic indicates that DU_DOTCLKIN1 is present on the 
SoC package and is supplied by Xtal X22 on the board, so I think the 
answer is "yes" for the first clock part of your question.

As for the interrupt part, it seems DU1 is present, but not connected. 
That means the DU1 interrupt does exist, but is not going to be used. Do 
you prefer to describe it or leave it out ?

