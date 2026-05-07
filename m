Return-Path: <linux-renesas-soc+bounces-32230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMwnFuxy/GkEQQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 13:09:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A757E4E7403
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 13:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC01A309DFFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 11:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022A03033F5;
	Thu,  7 May 2026 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLq1CdFv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15063016E1;
	Thu,  7 May 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151665; cv=none; b=b8OV60yEIDCOE38p+ugaxAWVs1ipBGuyDZPTe8/aSBFEW+B2rLwJJvBAMyMbV2YtChrVwAb4ATLrfsAqvUMi3ScAHshY0oIVHIcPzxzXA7ICfZ1nz1dl0rKOZHtVworGbpX6PQK+L1gvzBJD8ZxPIajCez8BofsrHgcEsDKRljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151665; c=relaxed/simple;
	bh=VsLfezyCt7vIJ+75OJlLtcik64poHocYFtrMurVBGrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uheE+Et/0qIvACrIWzzZx1pOzIKYX3zlr7M7mku3lbqrB55SVMIJqT1e5Q4zrT94rCxbdt+ydd6KZ+4gFHj+oG43jpD8IQPutYUErvan61xQZFzFStl59FjkntOlewz6QuS9Ebf9r97lVk4sifV8nIFWKe78u/0AaDpr7u1P33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLq1CdFv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941B0C2BCB2;
	Thu,  7 May 2026 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778151665;
	bh=VsLfezyCt7vIJ+75OJlLtcik64poHocYFtrMurVBGrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nLq1CdFvust2E+bSlO2rZIfs3qVNSVz8NCm0MenXQ8SlD4cJ1TqGW7Ed0fEohVYsR
	 mqOdAd8jY7JTSfKGfaOJ88KIlphKrGOOQhgBUO31aWy3EiOpAFwjNlXVyV1B8US4Mz
	 mEp1nTx8vKusSnYIXIkICtA4387u54daTz0gDxZqEVy7vQeCBDqsZJZALRUgass11O
	 KhHKaoicVcfjCisEygYz2oxiEHtGuvwpXsEpqyEwkhxnyXqPrPcjFKiWruCiK1LeYH
	 eAmwwKkGSdd9dAFrx2EOpyLa6qY75abSROHAntGRUgcdLTbI6TwOZepfuIMGo4qkss
	 SFLf33S3YvGrw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260421172910.218497-2-biju.das.jz@bp.renesas.com>
References: <20260421172910.218497-2-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: mfd: syscon: Document the
 LVDS_CMN syscon for the RZ/G3L
Message-Id: <177815166231.1778719.12864751547345173276.b4-ty@b4>
Date: Thu, 07 May 2026 12:01:02 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: A757E4E7403
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32230-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 21 Apr 2026 18:29:03 +0100, Biju wrote:
> The RZ/G3{E,L} SoCs have an LVDS Common (LVDS_CMN) region which is common
> to all LVDS channels. The RZ/G3L has single-link, but the RZ/G3E has both
> single and dual-link.
> 
> Use the syscon interface to access these registers for scalability.
> 
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L
      commit: 9bdbd5281d13269e99e5b04017db046c733c4750

--
Lee Jones [李琼斯]


