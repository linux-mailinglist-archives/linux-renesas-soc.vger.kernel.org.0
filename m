Return-Path: <linux-renesas-soc+bounces-14160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F251A5765D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 00:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF94A1896F7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 23:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EE8213246;
	Fri,  7 Mar 2025 23:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKNzLZhk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5161537A7;
	Fri,  7 Mar 2025 23:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741391466; cv=none; b=Mg0oE0zlcnlbBP9+aw3wQjlAHcqOFQ37LxZaLWBGNczul+a9gswAf7osO1QFNnRFOlxRiz7684+haEulkhR4Q7zV41trSNzC4WfD8n6dCyy0pgmSAmga2RJZ9vmQf0p8dt8055lflpzUS5fv3lA7FVdZW+dchT8447LHUQvHxEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741391466; c=relaxed/simple;
	bh=HQ4++ZBWcKdzC2KL17+s3dBJ/J61Py38+YJbkNdGJPE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NleUT1L5GmZWiOhlaV66F8M5okTGeT6s8BZrvcix4T+TgSGspw4uKvFeebL7v4UTDc8WsgYz8hsrRu+GjdC5j4HHA1e4aZwJmObXRFP+YQheZNlhUSX+oHxiX9eWtEwRXLwtjXHfBFvYbn/Xw9AziYXIhFjhNZ50VMOE0KNEYpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKNzLZhk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1D0C4CED1;
	Fri,  7 Mar 2025 23:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741391464;
	bh=HQ4++ZBWcKdzC2KL17+s3dBJ/J61Py38+YJbkNdGJPE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SKNzLZhkYuPr4YNrItTbUHbACBfMlNIxVDKmKf+UhP+an0Bjpg2wiuAWe0T5B4ZLj
	 Li+2USiTuwKQJyRZKTCOWTh8MB5l/YFsu5DMpdKM+D4hlljGYD8gMRtz2+gn1IXmJT
	 f9eeL8RhFNDSYwizTr2p8lXlzo62rLFumxv0o6vB1bkH8Tx+XojshorYvzNJTVOy76
	 ttmwCqy1VAwmYN0C7tZrIYDoNle7qnIE1uuf+g9JUYb1/Q1mJZMBCjjMYf4PyaRH1t
	 h5RDzv7Tu69QY2Bx0nRMdSFd2NFA6QyOqLdpOe75+x9E10xeVQBSL6gN4NDdCRFXT9
	 DgK5wb/d5f6Mg==
Message-ID: <dbf8ce431e149c7304b2e7487cf2b197.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1741362159.git.geert+renesas@glider.be>
References: <cover.1741362159.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.15 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 07 Mar 2025 15:51:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Geert Uytterhoeven (2025-03-07 07:47:40)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 9b12504e8c8c2f1f7e5f16afdd829603dd0c95=
08:
>=20
>   clk: renesas: r9a09g047: Add CANFD clocks and resets (2025-02-20 17:42:=
03 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.15-tag2
>=20
> for you to fetch changes up to e1a098330ef0555ad216e549a018d99aee7752c1:
>=20
>   clk: renesas: r9a09g047: Add clock and reset signals for the TSU IP (20=
25-03-06 16:39:31 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

