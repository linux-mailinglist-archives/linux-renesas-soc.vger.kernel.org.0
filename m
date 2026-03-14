Return-Path: <linux-renesas-soc+bounces-29400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK7zNd9CtWkQygAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Mar 2026 12:13:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 324DE28CD4A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Mar 2026 12:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 259BE3016CB0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Mar 2026 11:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3142080C1;
	Sat, 14 Mar 2026 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhxZUKci"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC646205E25;
	Sat, 14 Mar 2026 11:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773486802; cv=none; b=ErASSKoeMy4TIa6AQt+TzaKUGr5SDP5/25pIoZFZI8Byb78c7gAKxXnn9CmfP+Oxh1sWU60/FbuNoZlNzSAp1I6TN/a73i2lIWwSKjkQ9DP5lgPHGaHO4GzP7T2PWfb7fmVXyYA9Hc8IG3aPbYiuoaUNXLhjZ242L/FHtGwvVpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773486802; c=relaxed/simple;
	bh=ODoh/uo3L3wh5IaDZ19WEIvexQISgRPELpqrwmRuJ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBsslGyUTOsi3Xxn/Ixme+Sf/CuGKQKKrGUbSL3hKgc7tvOH4wNBej4UIJqJ2dDosi0P5crsFek5a/eqh4lxwsoJn8CTkFLXFCDORI71fe6Wr6Q+KvApmU875BPJsByLlZFRpgeCqDvTov13sF3Y+TVlRkfJCif9YmhmcvY58oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhxZUKci; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE73C116C6;
	Sat, 14 Mar 2026 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773486801;
	bh=ODoh/uo3L3wh5IaDZ19WEIvexQISgRPELpqrwmRuJ4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhxZUKcin2Cr5jeR/rtmpjTHba2BfrwSpJjdC5nNn0oHMcoPKEAK5WnLZ+ue9fMZP
	 NnfSWzsfLyumXGwgkv1rJSeoEtibMqNJW8IRhBbUho+nWZUzTAsuE3zdHlshSvWun3
	 mpiYYgLKomX/QJgdGpdoY9/hh6SxuOA0bKH1+q43IaoaUg0J3HwI6CISSKQqlnvH/z
	 T7FrAZ01h0GuDcqrHqm0xYTJyILZg/Fh+Gy1ZoWux5/LUDoaFtxNZpSw6ynmm+dtue
	 h1UpjpDdjKscBfoItqXDzYK8OVR1kJdDd5qOkOu5HD5kB5+RJPP3OOXEX37gXRqsmv
	 e6SzcDQe+FZtw==
Date: Sat, 14 Mar 2026 12:13:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
Message-ID: <20260314-arboreal-bold-vicugna-cdca27@quoll>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <cover.1773399675.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1773399675.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29400-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 324DE28CD4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:13:00PM +0100, Geert Uytterhoeven wrote:
> The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> 
>   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.1-tag1
> 
> for you to fetch changes up to 0928a28daf017504e14920f4131bb99e3bc39dba:
> 
>   ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232 (2026-03-13 11:00:48 +0100)

Next analysis tells me:

Days in linux-next:
----------------------------------------
 1 | ++ (2)
 2 | ++++++ (6)
 3 |
 4 |
 5 | ++++++++++++++++++++++ (22)

Please keep non-fix patches in the next for at least 3 next releases, so
you are sure any community tests/complains reached you. It is
unreasonable to expect that community will test your for-next patch
immediately the next day.

I merged other pulls but this one I will leave for few days more.

Best regards,
Krzysztof


