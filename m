Return-Path: <linux-renesas-soc+bounces-31887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEtbCcCS9mkpWgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 02:11:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6B34B3C11
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 02:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 218B43007F66
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 00:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB03439FD9;
	Sun,  3 May 2026 00:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jysqW7jA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658D17D2;
	Sun,  3 May 2026 00:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777767100; cv=none; b=ZLdOM+kEoiWsPnOf0KUkmL2xu55NcSoz4FvhLDMynQxLiBbSXRawG74yIr7JvWCDJk6C4yACeCGKhd8fnTX+sT35MijUvEugx66H97MYIas/jd3/1/akDa+AmVVD2WeUEOLGv0gQ6+cdTJ1mGDmWpXJNYAqSCzdCtZxUz8La3Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777767100; c=relaxed/simple;
	bh=nOqQcF/V39Xx7ALmukDgSIKiFUQ4IoB3wcksu9SymaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BctmaDRAQF8hDkvDi1cgi3qh064ipYg64Nx+S7B4btAF+gCLwrIXPbAZFGo84ZPasilj2wdV4PyCCt93bd03qPsGcT5bLS3EtDO5kC8VP0RJEpPGe6Gw/PBR7GinNRlGQ4zp3AC+J7MKDl5F/LryG4XSvSokJC1CikDHWAWNspI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jysqW7jA; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g7QDk6sXSz9tRD;
	Sun,  3 May 2026 02:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777767095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rBbGG49lvszkSs6r+vkoyB+q5ycwyPUBvGTobwqzXCY=;
	b=jysqW7jAuDFJrbua8FgWRyjdkmFUEE3iRBd6BzYPCL/hjHNKhq/AgbzZZgkZhOUQDQU+pJ
	ahFjUj3IB9jL++70DEsokWc+NrPeaVURtK2Z0c/5MAEptyxrW23tDQph3dL7ByjW+WvowP
	iFQCCEhTJaLnIbsnHaS+ZeRkiRj89a4Cn77U2MlR6Mpd1aK7vfhF85jPwF1zJehov1wKUA
	0miMQTqWQNhbM6MQCR51Zju7C/4XvZqBeIfVlyN+F8vIDMkoV2wwbAHvIUj8iQ4W7a+z2T
	zkq1WTNX5jj6xJk5UiRQPtbvDBAv2/Y9PRv4/twjkNg7OaVNI8a6oT3qa7d5sw==
Message-ID: <7e4283f1-c179-45e4-a8ee-5026e467fd21@mailbox.org>
Date: Sun, 3 May 2026 02:11:29 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 5b19e038c16ec512322
X-MBO-RS-META: bs89hkih9ipn8s579q3adtcmkkc76bmw
X-Rspamd-Queue-Id: 7A6B34B3C11
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
	TAGGED_FROM(0.00)[bounces-31887-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:mid]

On 4/29/26 2:16 PM, Geert Uytterhoeven wrote:

Hello Geert,

[...]

>> +/delete-node/ &pciec1;
>> +/delete-node/ &sata;
>> +/delete-node/ &sdhi3;
> 
> I am not sure disabling sdhi3 is correct.
> The R-Car M3Le documentation says:
> 
>     "M3Le does not support MMC1.
>      M3Le supports one MMC channel (MMC0) only.
>      SD3 is used only for SDHI and is not used for MMC.
>      M3Le does not support MMC HS400 class transfer rate."
> 
> The main R-Car Gen3 documentation says:
> 
>     "This LSI has four SD card interfaces (SDHI0 to SDHI3), two of
>      which can also be used as MMC interfaces (SDHI2 and SDHI3)."
> 
> So while MMC1 is indeed sdhi3, sdhi3 can still be used in SD mode?
> Do we need a new compatible value, as R-Car M3Le does not support HS400?

I think we do need new compatible string, yes, I'll include that in V2.

We can inhibit MMC support in sdhi3 with 'no-mmc' DT property, which I 
will also include in V2.

[...]

>> +/delete-node/ &vin7csi20;
>> +/delete-node/ &xhci0;
> 
> Shouldn't the following be disabled, too?
>    - ohci1, ehci1, and usb2_phy1,

Yes, they should.

>    - cmm1 and vspd1 (cfr. DU below).

Please see my response to Laurent in here in
[PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD 
M3Le DTs
as well as my response to
[PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas R-Car 
R8A779MD M3Le

The CMM1 and VSP1 are actually present, so I think the DT should 
describe them, even if they are not used. If only to allow the 
driver(s)to bind to those IPs and bring them to low power state.

>> +
>> +&du {
>> +       compatible = "renesas,du-r8a779md";
> 
> Assuming the DU needs a new compatible value...
> 
>> +       renesas,cmms = <&cmm0>, <&cmm3>;
>> +       renesas,vsps = <&vspd0 0>, <&vspd1 0>;
> 
> Shouldn't this be
> 
>      renesas,vsps = <&vspd0 0>, <&vspd0 1>;
> 
> ? DU1 is unused, but DU3 is used.
It should, and will be fixed in V2, thanks !

[...]

