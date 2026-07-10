Return-Path: <linux-renesas-soc+bounces-35070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F6cgCUAlUWrk/wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 19:00:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0EB73CD70
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 19:00:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=sLmfLuOd;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22785304E54E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 16:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CBD43F8C2;
	Fri, 10 Jul 2026 16:55:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65943F8B8;
	Fri, 10 Jul 2026 16:55:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702523; cv=none; b=Prl7hlqt/1H8/R6Dh5chah9XiDrfdOHPiKgoG011V1xi4qa2Iq4SvctU8J6vp2THvrZnrfQlv1iCvtGOGgD3UbIukHA5GuXE/VcS7c3TlELiT5HQp54rYI5S9LZCPFw+MSmDEg1Qj7aXMeTui5dH5sCjFbnT20jrTMGmCQr/wLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702523; c=relaxed/simple;
	bh=UjxSN9svmwXOeyJ1UPe3NeYnyfx/h6gTHTP9Tc+U/5g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gzbm5vSaXEJDOS2DuowdbGVDkqDbl+IkhJsrvKnRzwu/nItg13HTR0ScfsA1WZb8ZKYwKnLatwsf6VmTaBfgonCk0lz1aNkfapo2lcpO5X5tbcDoyx5MWDwJtoFsv2iTzMfFXvd4elsxErKDl7s1UO5tiH5FtrQCwux0QZZ0X/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sLmfLuOd; arc=none smtp.client-ip=80.241.56.171
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gxdHW4C0RzMlBX;
	Fri, 10 Jul 2026 18:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783702519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UjxSN9svmwXOeyJ1UPe3NeYnyfx/h6gTHTP9Tc+U/5g=;
	b=sLmfLuOd1o2QsOdRII9dnXDrfO3VvwfIMWZWI2Zm6jCEPgsKW2l7shxw3WHlXBDMxp4SCt
	bJVvLPVrb4hpNTyr5hF8dNaGLBLc9cso2lJDYkivgAQI6+r8+zeMMegtB3afQRN+0owCGO
	tG+iclJz436BI4rlSd48gcMCWSmMIvzmEyVQFgNm3352b1dsv4Odb401lCHRBDo3VDyKQd
	oUALxiEpgIyepfz2ZeCbprhsLb5yTyHvSh01B0Zp0KQQsciC2ly4SjSLHxeEe+SRY8otVY
	tX9e99kWDWMj3rcf8Tsy/mj+WHt6ROm/MhrKVw6c8XiMMeig9ypFV8E83SxQ8Q==
Message-ID: <a3723ad0ac56ca5d6986d2fec5a02386b423e207.camel@mailbox.org>
Subject: Re: [PATCH] dt-bindings: memory-controllers: renesas,dbsc: fix
 bracket
From: Manuel Ebner <manuelebner@mailbox.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Fri, 10 Jul 2026 18:55:14 +0200
In-Reply-To: <8ad5043e-0d5e-486d-80eb-87168d9ede87@kernel.org>
References: <20260710113029.436415-2-manuelebner@mailbox.org>
	 <8ad5043e-0d5e-486d-80eb-87168d9ede87@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: fcxmjbho7dypwzhr85t63i6cb7qj5m96
X-MBO-RS-ID: 5d12656b401615a3090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35070-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B0EB73CD70

On Fri, 2026-07-10 at 13:37 +0200, Krzysztof Kozlowski wrote:
> On 10/07/2026 13:30, Manuel Ebner wrote:
> > Remove needless ')'.
> >=20
>=20
> You sent multiple patches like that and that's unnecessary effort to
> handle.

I'm sorry for that. I got the suggestion to send a patch per file when
sending patches with Documentation/ABI/.

> These are trivial - one patch for all bindings should be enough.

I made a unified patch for Documentation/devicetree/bindings/. It's
18 files. get_maintainer returns 44 addresses for To=3D and 18 addresses
for Cc=3D. Should I just send it with all addresses?

Thanks
 Manuel Ebner

>=20
> Best regards,
> Krzysztof

