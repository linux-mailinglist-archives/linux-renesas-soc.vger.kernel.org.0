Return-Path: <linux-renesas-soc+bounces-30131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KPQI6rYwWkaXQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 01:19:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4592FF8EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 01:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CAD23117CA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 00:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FE8248F66;
	Tue, 24 Mar 2026 00:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHECWCy6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F832459D1;
	Tue, 24 Mar 2026 00:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311143; cv=none; b=MyCJpYinaBcWFM5kJm2efDCYsgd92IwK5+sYhGe0d94O1tvCXwA9Q7YUZpjmc3FGLTc3Xbu+ZXqZGE85nF0bndJPuuuATi/YJ7aNEPBQlwSsSZtScvpp2lajivc3fYj0gAO46MmRtzD7NP934I/mkxQgrkhUKtC0wOLnzJMtUoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311143; c=relaxed/simple;
	bh=3d94VpZd83GM75ewdyTGCQUds65SXEiLlGyDDdQljTw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TWN2kXGNXc5ipWostyJ/FZ4F+r5xCMrC46unjBfr5NcJCl16hp6SOZ7+O8rPCzrhCje+oFtfdVvftUH53YgaoQTXVjygEYRCytcWmgPltFkAubc531oLqlPHyhTcVtIZSO0UUqyfIGjBUqzgKfSl6e2yTiwSZF3zxXmIKUo7ppc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHECWCy6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF633C2BC9E;
	Tue, 24 Mar 2026 00:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311143;
	bh=3d94VpZd83GM75ewdyTGCQUds65SXEiLlGyDDdQljTw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YHECWCy6Zc1CWjqgaSHkzxn5CWuItVrBr3HtmSV+pqb2LozX8wg98ptj1Oti5gpRf
	 Ei1H+hRn7KuaybpHYY6b2QdDy93zQq7fnGIk/vDTAtIjPgoteD7dWA7qIluOBM2tsN
	 R5riTAI/YCzEzZfuTmNofb4uygNAyPtr1L1N+ec6R6atODtZXOTJvBSKNntrSolzNo
	 eWiQwdxaWcABet+JAZaWOq5wfZvjp8Oax68t+Aa5tCJkYe88Ucuq5mPFsWW/Vl1Hvj
	 IvUtO6UgkIXDxqWZSqFoZLn+OiPmIja9ec+QwuA3z/WwNbAR4pbu7bjjoj13JbJrxw
	 KfL6oyTWpjn5g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1773399185.git.geert+renesas@glider.be>
References: <cover.1773399185.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Fixes for v7.0
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 23 Mar 2026 17:12:19 -0700
Message-ID: <177431113981.5403.10886179003607189492@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30131-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF4592FF8EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Geert Uytterhoeven (2026-03-13 04:12:26)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-fixes-for-v7.0-tag1
>=20
> for you to fetch changes up to 1b4f047dc4010d51821694cc4ed73b52b3040a5c:
>=20
>   clk: renesas: r9a09g057: Remove entries for WDT{0,2,3} (2026-03-06 13:3=
3:52 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

