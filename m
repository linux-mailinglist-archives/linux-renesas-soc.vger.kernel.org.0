Return-Path: <linux-renesas-soc+bounces-21842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D4B56352
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 23:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EFAD168765
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 21:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5179126B95B;
	Sat, 13 Sep 2025 21:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4VkzS74"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2903B242930;
	Sat, 13 Sep 2025 21:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757799148; cv=none; b=Dn/Xsui4Ja9OAWvaVDU12xRm2irJK920uqlJU/Myre55d3qXXzCg6QyEHZiQDqMQs/Zdy++F100gm/VddSx1bsW7ApFDqML2BQ7EkSgZB6I5q5mWK/bEnrThEYymeYeML0fcXycd9GUkEQz+V45Yi2vGVh/iGSHnrYq1xSMxqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757799148; c=relaxed/simple;
	bh=rSCSwKK9L+HCcdcctj7EpBzirAn6F5FvcqBpA1CJzZc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ObSxq2OFOweBraOnv8iiSmGRU/yBDb9/7ERE7l4LJUj/61J2WGuo22qX0XfK1PRJ/fDtOMSps0LHSW/Mpz/TFwM1Ek/TCBBZOc1sBfZ1JPZD0IEw0gu1TcFbAGJU4KdJxzstADrs3hnOOBhmOoeIuEbpxnBdXF43eh8M1qiK8V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4VkzS74; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A526BC4CEEB;
	Sat, 13 Sep 2025 21:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799147;
	bh=rSCSwKK9L+HCcdcctj7EpBzirAn6F5FvcqBpA1CJzZc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=n4VkzS74D5A+UlsbJjIjr6bvv+qdMBE6XLvLJ0kszghtbbkuKygj1U8jfjTQQXZc9
	 4V2KdpVgowdlDE0OAVwgSJTw9dSctbF31X0cdZwWhAMDuR8lAnYWFIeAIay2fESe62
	 4P/nKJskLMMwJyY2HUwjhJ2Kr6DI1A64ApSoQHH9qPTsA/tDJKTWaxADSBqDJwDZkX
	 6lPqY63dAYJngl3ncCBEkhLIuxJRpjGeH09KuDckYKIdg5lmz9UKpgBIXQpfic8XEW
	 9a97Wft1SgpBFuw+KW4MZkUYg4VPMYPyO98w/KL21bvfw1p0ovGx17axvobp7dHH8S
	 d9BvCT3+44tOw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f63aaf6e71de897954fbde4e4a17a9dcdbe5e7e1.1755674703.git.geert+renesas@glider.be>
References: <f63aaf6e71de897954fbde4e4a17a9dcdbe5e7e1.1755674703.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Fixes for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 13 Sep 2025 14:32:26 -0700
Message-ID: <175779914676.4354.3523598829995253008@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2025-08-20 00:27:18)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-fixes-for-v6.17-tag1
>=20
> for you to fetch changes up to f63aaf6e71de897954fbde4e4a17a9dcdbe5e7e1:
>=20
>   clk: renesas: mstp: Add genpd OF provider at postcore_initcall() (2025-=
08-18 09:36:55 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-fixes

