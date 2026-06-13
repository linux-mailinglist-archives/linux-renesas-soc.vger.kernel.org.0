Return-Path: <linux-renesas-soc+bounces-33974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XLFxFPLfLWrWlwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2026 00:55:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87667FFB9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2026 00:55:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lG8Z6A2q;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6017303102A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 22:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7342B38644F;
	Sat, 13 Jun 2026 22:55:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F010348860;
	Sat, 13 Jun 2026 22:55:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391309; cv=none; b=WfMG6K6bXBEcyDzKmYoto2snKeBVQux7+GRwNTvI1Efs9VFQaEuq/W8S6yp6o5pc2YyGu8arX7hM9D9hINxZNOy6ISqKF0TNcnI7eeISm4Ab782Hmn1C/HqX+JAofnv81mWGaMpjnHogyDx9pQa2aIhNgCxDt0DZO76yMcQAcqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391309; c=relaxed/simple;
	bh=J9DiWiDK7K9/oXdPmU3j5j+VWKzMANtAkUjwJzRIu3w=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=o3R+XgvNnUc+W5a3UUkKULetZgWESqlX1V9cvTr4uKf3Go9M0RN2LC8bxqOM+x2jpsGhSz3WWPrVrF+pNNHydojaalxU0BoeAhoHH/D5/vENFzJvv9tVYilxlwixHYlH32Sercib8afWIEPpQ1IeUNGzH0qp1/ilJmUKYGpPlc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lG8Z6A2q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0760B1F000E9;
	Sat, 13 Jun 2026 22:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391308;
	bh=4f9/blj4BXdBAPUsarxt+51kEkxWTwNsH4korHyf4qY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=lG8Z6A2qeXqnOVUplP6ANtarPUpVWz/f9oftkf7WpSQC71UxnsSkngmiynebXpfm9
	 JvcYiMx1o22UecnEri4RoaqvQwyreKXFQlXG/DXt+Vu1HOnfxYXdj99oIzDmgJlk1E
	 kzSCO5H5o6puIZ4hvnTmD71K9WfqShObu88GSyETtjg5c9DjOseDO5rAn0NIX5tYhn
	 z3AVqMTbt9hKr62caY/wjYKfKsZnlFmxJokgPm1r9Zlgq4761RJuirijUQ83q5jl/W
	 7FJ6reXlEaDNqlOxEMV1hYWO4n/mLO5Z4VYOkh6FRKwnuGd6/Vkv9D4qYQcg63joVt
	 VC9B/XuHvyukw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1780319315.git.geert+renesas@glider.be>
References: <cover.1780319315.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.2 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 13 Jun 2026 14:52:35 -0700
Message-ID: <178138755538.819343.3952660707396245502@localhost.localdomain>
User-Agent: alot/0.12
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33974-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F87667FFB9

Quoting Geert Uytterhoeven (2026-06-01 06:18:33)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 4f42053949324867dc40d67829f18a01539e63=
22:
>=20
>   clk: renesas: r8a73a4: Add ZT/ZTR trace clocks (2026-05-15 11:30:51 +02=
00)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v7.2-tag2
>=20
> for you to fetch changes up to f5e45196023dd454dcf5dd8add1cf99d77336271:
>=20
>   clk: renesas: r9a08g045: Drop unused pm_domain header file (2026-05-28 =
15:09:54 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

