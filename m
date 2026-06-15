Return-Path: <linux-renesas-soc+bounces-33998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eOGMAk7SL2oUHgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:22:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAF568550F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:22:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mVCcf1ev;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05DEF302C907
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 10:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E4D330675;
	Mon, 15 Jun 2026 10:22:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA28B79CD;
	Mon, 15 Jun 2026 10:22:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518922; cv=none; b=k7vTK2eaDfBHIrNHLL8Xz6MBGZaA2DA1vlrKb/TJNIq1291i3qbJtGAHcnBwSqxNdq1wubjjxuNbmgMtAke9y+bR3Y+bV3ap9svxRYITOShNqVRGRUFjIEIyXm/1L3n+V+8XBFzOpkaFcigfU/SMwm9w7Q6t1PH7kEndGUsJcA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518922; c=relaxed/simple;
	bh=1pgoTUa/iaFDUDl6dNuZhTQb81x2vd4ypbGHLcDcZ5Q=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W7QMQhZSkR5UAWCrKIXuvR7mqZEMl7TXOEjRyUrhxBvp90ucagYwMihnV9xb9QZeaogeD2hYlfKOuPD7haQl6m4nY5HUC1ssUHeOc/CkBJsPcHW9FU9xctvwDD/AGJzsuDAX5m1h3xnMAH1pSy9fp2b0A2eGP/s1cbLWOMYYvgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVCcf1ev; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6CA1F00A3A;
	Mon, 15 Jun 2026 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781518921;
	bh=pOMyA4oeoJ6pkRQwgpC41H2yFFgKVKeVKbT/i84cSqo=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=mVCcf1evQTW1CRlsDkWOa11pBr3M+jTO96geXI/hhSQw/xbewxDoOggW3gekJp/rY
	 ccCPoWnq7jInai6PXaa2cPOH6nlyBi2qy4usFw/Rb2B+wGffK64XrYQV47IVODSqEN
	 XpNnaYutAopQgs4rh/JpvGBKEjZix7V04jPh7Qz4S6DVIi52kbp96jROOTc2EDRzQ4
	 To8irBKN77urpH+XoS75K5f3oLWd3NpxaBcENxPrhP8tM6lPWhDSo/UntFZGC/PrwW
	 81JOCUQcLqvbt8yLX2nlgja8zE+FTpplqZqgr4dCfUIGN2JEcTRvrIPaJcMt2NpGrr
	 gIskWnSyKYCSg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Message-Id: <178151891887.278191.1501610164206818615.b4-ty@b4>
Date: Mon, 15 Jun 2026 11:21:58 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33998-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BAF568550F

On Mon, 08 Jun 2026 13:55:08 +0200, Krzysztof Kozlowski wrote:
> Revert commit 51284d8b1dbc ("dt-bindings: mfd: syscon: Document the
> LVDS_CMN syscon for the RZ/G3L") because it is completely not matching
> reality and clearly incorrect in respect of renesas,r9a08g046-lvds-cmn.
> 
> It wasn't ever build-tested by author on their DTS, either.
> 
> The documented renesas,r9a08g046-lvds-cmn compatible clearly disallows
> any children and simple-mfd fallback, however its only use in original
> patchset is with simple-mfd and children, so this could have never
> worked.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: syscon: Revert renesas,r9a08g046-lvds-cmn
      commit: 4143734f197c0065bf5fce7da22f4d0eaf404753

--
Lee Jones [李琼斯]


