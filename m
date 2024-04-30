Return-Path: <linux-renesas-soc+bounces-4939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE9E8B66AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2024 02:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AFB91C22337
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2024 00:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C37195;
	Tue, 30 Apr 2024 00:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIgc8eip"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACE4161;
	Tue, 30 Apr 2024 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714435292; cv=none; b=SGm+tVNPOZpKfJDUo+HtrgieXcsH1Dw9FP7RKyMJ94S7luV96cxZ4qYffBdukwGOgB03yRPaJCQG2Y7g2kuv1PHVdtFpa1p2JUm6phbJyktngVhXVi+sG8D2mdfIcSyMsdorED63BlW+6XQkJnV85rvGHRJdGU4eqX2l+/fQskM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714435292; c=relaxed/simple;
	bh=mABA1dMkoIIht9hFbMDBlrTfOSsY1WCDFh7sBQzEwws=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=J0zz7a9TTO4x9fh1D1X90U+xfg/2R2IpXJp9TEK4+ONyj2la9h0Nu5hJtrv0QP1qUxudcjbawjvxj27Iji4E/RYUJt57h2E0o+lUhS3A1tB95BqcxSr5Jz9CJu57ZwIdPdcQtThjudTBSUYsYRRxNj22JyRT0Ra0JMPEd/QXYm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIgc8eip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75727C113CD;
	Tue, 30 Apr 2024 00:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714435291;
	bh=mABA1dMkoIIht9hFbMDBlrTfOSsY1WCDFh7sBQzEwws=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IIgc8eiphfRyJWKLzFwTomfkXLldTGuXw6f+h05osbkn5tYmt4lCmY24ve7Y2B5Pz
	 Hvg6ObpoYbZ7XGATurgzWAN30XmvvGiWdULLbgIO/yudM95XKKvtenJ+qHiUhIjWGv
	 zLv12eyMT71Za0QqeHqX0VVxyRqLtxpQ3xChDgJRS4uNXicZkLmXf02GyyEhamghAe
	 dBYYRM8MmuCLk7p9gqj4QwTPXM4GoGiGDQMgik72NbeDZFanuRFg5F0UZ13avCuZIO
	 K2zGWMPyLxPRr87Y/uhylqOIcqTskN4wY7FlYJBuXNM4xdS2e5MneDIOuL5XRp4efk
	 CIeXFsTEsUxnw==
Message-ID: <782f77f8197aae7657089fe88398993f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1714118682.git.geert+renesas@glider.be>
References: <cover.1714118682.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.10 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 29 Apr 2024 17:01:29 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-04-26 01:10:10)
>         Hi Mike, Stephen,
>=20
> The following changes since commit c0516eb4cf04ac61b6fe1f86cc15b2f5f024ee=
78:
>=20
>   clk: renesas: r8a779h0: Add timer clocks (2024-04-08 11:12:32 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.10-tag2
>=20
> for you to fetch changes up to 5add5ebc4e35a703a49976abfd82e708d9aea4ad:
>=20
>   clk: renesas: r9a08g045: Add support for power domains (2024-04-25 20:1=
2:17 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

