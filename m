Return-Path: <linux-renesas-soc+bounces-30132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAbbJV3XwWkaXQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 01:14:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 978712FF6B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 01:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9725F3001596
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 00:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99B842050;
	Tue, 24 Mar 2026 00:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaTn4Rvq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B433A2772D;
	Tue, 24 Mar 2026 00:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311255; cv=none; b=vGaUOPY7y6qt+dOXgegNTq1OR51RhMxq7JY22rc/1QjVvJT8HlNfL9xLKi3TawGu8187qruiz4J58M7ePBSCzBZT0nnbRdu80YCiarcwdBcC+7rxtyo+PX24tkG66eVKqTiUZZZ7NZ0xFW1DuYHYNM6EUJUHjgi698SSty7H+gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311255; c=relaxed/simple;
	bh=lhJQJHgQA3/FSpGv4O/1DgzapYOamVujjmZkgzX+/+c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YpjSoASMOXkoyz7jx3ogDSajTdQZk5Wih6VkDjaGJ9WPCMFs+VZ2kpsbUkoH5IvjubdAQmwPnOxbgU1goZTKpX99Qn9YYKBYdEdfURbi1LaCJ2VwX9BzJ9JLXJ5pV+FOcEJ6d2UEH82T95a+gQTRB2GaCPpWMWa+5rNL7Rpa74A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaTn4Rvq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890FEC2BC9E;
	Tue, 24 Mar 2026 00:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311255;
	bh=lhJQJHgQA3/FSpGv4O/1DgzapYOamVujjmZkgzX+/+c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DaTn4RvqfuGaXS9YReMbGDnXASNNeGF+Lh2UYIG7Z6koOqocibrNkGGM85koFbrIu
	 MSei1l1l3nMKHJOYxjWcTb+f7BOfUKpuLWdI76V1jMcsEBzSill56aczjBUJvADtyZ
	 u2pQ7UX0B649sGOqriBnot0Zjw0ZUez1WfcBHqiceUOc/7rg0B1jSOjxhW4MS07sGt
	 ygidEXOEc81gVXht+y0AdvTMixsafWUxYO1QzYAiqXCb1ZOLClN69616laRFyKHWpD
	 vDXbLOt15yGws2uP5xYXNbEgm+cSOdKcaouRa9+57odWi6qkEQytMi8RgOuQpETbWF
	 44xSJuf3ofw8A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1773399986.git.geert+renesas@glider.be>
References: <cover.1773399986.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 23 Mar 2026 17:14:13 -0700
Message-ID: <177431125366.5403.11545955529864995912@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30132-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 978712FF6B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Geert Uytterhoeven (2026-03-13 04:13:15)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 1b4f047dc4010d51821694cc4ed73b52b3040a=
5c:
>=20
>   clk: renesas: r9a09g057: Remove entries for WDT{0,2,3} (2026-03-06 13:3=
3:52 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v7.1-tag1
>=20
> for you to fetch changes up to c8d5972a25408b1daf73653ccd5207fdfc80c964:
>=20
>   clk: renesas: r9a09g056: Add clock and reset entries for RTC (2026-03-0=
6 13:33:56 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

