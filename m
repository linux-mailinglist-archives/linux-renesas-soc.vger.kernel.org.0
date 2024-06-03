Return-Path: <linux-renesas-soc+bounces-5795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD688D8B4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 23:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20CA71F24394
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 21:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09A113B588;
	Mon,  3 Jun 2024 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXWn8dcb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31CE12DD9B;
	Mon,  3 Jun 2024 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717448916; cv=none; b=BGFblFabmVi5BhNNWEvMg+XHeRRdMSWbJtMCP/r4dJdMcdziX0szBSR5Vr+8VoULUSWmu8hvlLCm3y+3vfsGunipaa9wx3JxxZ0jPCx33k28dzh7kHlp7bbvAanH9viH2Bey6dq68IJZlgGDkgrhDpBAE8OhmJDPEwA4SdA9s9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717448916; c=relaxed/simple;
	bh=oDGVv+9khMw1ShEtjgyevMaWQ2mI0Q/x5OCXo+uAqH4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=cdTr3kQqCTnPMcu5beowkuAcUWtE3GMngP5kNR1u/S5JlX2kRkBFgwbY7mjCR+RPpaPhqVYRhOpgH5eQbRXpKgivqV6ZoyaoIIZe6mvbE/ZaIh5XQ9F3jsg4O6xQh9aooZlX+eLoE/ZufJdDhq71STgnJwogK+vpKEG8JEjk0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXWn8dcb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27592C2BD10;
	Mon,  3 Jun 2024 21:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717448916;
	bh=oDGVv+9khMw1ShEtjgyevMaWQ2mI0Q/x5OCXo+uAqH4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jXWn8dcbiRExnYu35X1Smo4MeU6LzrJf8nOAR2/BIBiQtuVAX7TbYDLnzHwOofT6A
	 ZtfYMk1ntLLme884O3ezVIigBJzQ4zmFdkrLgE2Vz97ysdjWO4Soazq/M8mQGIi1Md
	 UnPxBttjmo1ptUZElHBM44b+2tUkoZHhV2wiTroCMnIvlHUN0RWlvSUc1Pfoy6Wlnc
	 O9tee6QS1SBM4qOpET3HpOsrZZVONChbHauDonWUvXdAPN+uV+tqn3spNYVN8yI4I5
	 Wz3lhRJ7x3jDj9yxUOEpzf6aRf2JM5TQo0w8sAOz1kd3WIQGF9kB55WA+z6HzCDZJa
	 3sXcAJURvHl4g==
Message-ID: <b5154b430d6f45249249d26160dc1711.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9073a6bfb7791e492156331fa8a0ea87a7c7cef6.1716975021.git.geert+renesas@glider.be>
References: <cover.1716975021.git.geert+renesas@glider.be> <9073a6bfb7791e492156331fa8a0ea87a7c7cef6.1716975021.git.geert+renesas@glider.be>
Subject: Re: [PATCH 2/3] clk: renesas: cpg-lib: Use DEFINE_SPINLOCK() for global spinlock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Ye Bin <yebin10@huawei.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 03 Jun 2024 14:08:33 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-05-29 02:35:09)
> A global spinlock can be initialized automatically with
> DEFINE_SPINLOCK() rather than explicitly calling spin_lock_init().
>=20
> Suggested-by: Ye Bin <yebin10@huawei.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

