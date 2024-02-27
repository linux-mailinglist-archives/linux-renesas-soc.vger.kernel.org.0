Return-Path: <linux-renesas-soc+bounces-3288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88086A243
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 23:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B6FC1C24198
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 22:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4476014F98E;
	Tue, 27 Feb 2024 22:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syy9rMI2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A91F14A4C1;
	Tue, 27 Feb 2024 22:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709072111; cv=none; b=S41GXO/k8bC0dIb25y2VIgFJ3KmMZLyAvhqupJsP2ABhEXcVd1Mv+xRZivDLKrSXdJxzz3MvA3OjwlQEvYJvbjtBGWh9kWX5BPFwvEwnkZaRwHsDl1ZBfsf6Sc2B0FlQ2pN0aUwGQVXlLgeeHI9yMj1HrrdDOv4/Jmq1XFvuKD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709072111; c=relaxed/simple;
	bh=old29fqwWQlSYALVQwaXhWRH7AU02kmQcLAYDQ6bwSg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=RZKqvHT5JlfM1OXijgo5u8Zk6ihPG6eJJKi2ESxQIxW3fITlQlMdX0JIx5AIVKcVhW1l2o9H6JVv8a+ndWkWwwC5rvGDb9XGGEILjtMvwyPOyzwbJIDXFiRPOnkycNQeMIAESeyTw6vbp7q2tDhtaOvz1XgsESNxsysTBDMeWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syy9rMI2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5C9C433F1;
	Tue, 27 Feb 2024 22:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709072109;
	bh=old29fqwWQlSYALVQwaXhWRH7AU02kmQcLAYDQ6bwSg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=syy9rMI2VV7MhUBHf3/ebtgyWyT7DFlbzdyXmg23GvTr1L5M2iDV5dIK8wEg8mhyd
	 J7D/OpmKXv1AJZAJFZqH5frhDF1QfT+yEnGlZvJXZ8+Hcv0HTGFM598DhMMtQ7AEqe
	 ouc55BWOrD5wVOurZ2UNn6fBnhyjl6PYwURtpdVzfN1j71NQU116Rbxc/UwbCQlTG3
	 e/nXKDcGpYZI8SlO7nOZLKwEHwIsevHRXkrPcaMVsCgKjES8XNdYhxAV/Oautr4GNH
	 y7WqkpgNd2IYH+dxWSoPshYslN/E9fixbBVEaAaDkCpL60TO2UaXfew6L9mVQCuPOZ
	 uJ8lqCtblxA8A==
Message-ID: <4936880745fcb0dd5ce15cf3508d9b83.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1708687321.git.geert+renesas@glider.be>
References: <cover.1708687321.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.9 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 27 Feb 2024 14:15:07 -0800
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-02-23 03:28:42)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 5aaa139b9a03e1a43484a73248c6353a9c4d95=
c6:
>=20
>   clk: renesas: r8a779h0: Add I2C clocks (2024-02-06 11:20:12 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.9-tag2
>=20
> for you to fetch changes up to 81a7a88a98062ffcd8d7d5ac3b540a96dbff5490:
>=20
>   clk: renesas: r8a779h0: Add RPC-IF clock (2024-02-20 11:37:34 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

