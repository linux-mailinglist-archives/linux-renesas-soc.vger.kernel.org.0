Return-Path: <linux-renesas-soc+bounces-33741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PWvTKTjxJ2oO6AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 12:55:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D737E65F2C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 12:55:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nh0+1DoW;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 350E63022947
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 10:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B333F8EA1;
	Tue,  9 Jun 2026 10:55:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD093DD505;
	Tue,  9 Jun 2026 10:55:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002549; cv=none; b=amr/ZfMG3bzTM00Fk9hR4cVdVOjHhJAgy7Yr2m/ZHZVOOytyikhww6RK0WMRl9a5gaFfdCABxij4+d5192ehAZf9uMswa63F0lk1upiKPplrGK6S7HS9jZWcWOZzXHdyWV7VXWXP9ZpYuz4s5jNW3LoRNFa9S+7s8d7rol39ZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002549; c=relaxed/simple;
	bh=beKfc4r4KzVPu14v7c2Up2dCryd+1ea0ljrSoi4u1vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rldSC1Oq9fao/gcKgFKjlQt4IKBw54VoZrPBE+A42I9R88AUzlZw7eVjXUfxkZeXAYZMjfyasVPuHm1qvu9STQ5lnGZeffX29RbJVbyjHaT9ofSWNFfLBLB9DK8XGqQ8ijv5CGa75PBhZW+sktSLDnsf3/3fRWCIo2Um0lIZheY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nh0+1DoW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB5A1F00899;
	Tue,  9 Jun 2026 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002547;
	bh=eWt1hIGUG4VVl6t3Lb7SwzBt8jaRjmM77PJvAbXYh6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nh0+1DoWGz8PxRCjAefH/c7JUS42e1lHnLFPOcQEFnOJQO9/ipqJR2pb5SUwjLoNz
	 opn2WT/tah17G395xBWCFM1u2SlSD3Sd03U3P9omegst+hOVt5ZvgKj7goVFV8IBA/
	 BwMWEagqWbIfuRd9RdrN3Gej3IX3RiSo4LmSZyh6jNpr4Wnmql9VwgAHTsIPXaNyaX
	 6Qy+s4ROu7fcKvbGB62YHRGU6/oZ6o1qJKNc5nmLQGQFiQzJ1zdZ+CevFDS0GPejBI
	 0+r7oHmMCy5n14HxKscWKfFn5SNkJEswN1gCYxAxiXrxd9HE/cebhQUaJomBfDBUUo
	 /iSy26G8OMqwA==
Date: Tue, 9 Jun 2026 12:55:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
Message-ID: <20260609-imposing-noisy-griffin-5c87ea@quoll>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
 <cover.1780319122.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1780319122.git.geert+renesas@glider.be>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33741-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:soc@lists.linux.dev,m:soc@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D737E65F2C0

On Mon, Jun 01, 2026 at 03:18:19PM +0200, Geert Uytterhoeven wrote:
> The following changes since commit 44f1ef06ceec55b7704c7d773d6136ca8b90f8b7:
> 
>   ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6 (2026-05-15 11:35:25 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.2-tag2
> 
> for you to fetch changes up to 0d4ed954061efc3e47fa889d3de0675f933f438f:
> 
>   arm64: dts: renesas: r9a08g046l48-smarc: Enable audio (2026-05-31 10:52:23 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


