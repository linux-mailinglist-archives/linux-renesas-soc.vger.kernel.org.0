Return-Path: <linux-renesas-soc+bounces-5677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4308D3F35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 21:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ED0F1F25D6C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 19:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCB71C233F;
	Wed, 29 May 2024 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEp5jvRb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCE615B0EB;
	Wed, 29 May 2024 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717012598; cv=none; b=EK7VkyGMH9VQbCeN0M+l7wP5Q66jr+PN35oiTsxSM0Go4m3KedTM/a90DYpcFAQXKfNrESttgZzSvxRBdmHwtQ1KPa+B8GD9o17Wzxqz5Ggu7rT6fT0dJTrlfigisYGGi9VedPm2scaYqa6CI0ItVM2aSMbBPNXABybFKrkn3L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717012598; c=relaxed/simple;
	bh=HXebE+uT07ix5cHeKB9Q/BIZhdYV52dqNDGCEf3QumY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ELgiTYE690ebrltaf3Nh1NsrhLY1O3rjBOz5SJ2/VbQ5mFAqBOUQio1nhjyOZSsmqiovuXgzb0hyEwidEO+JgxYmgUUtRf4PU4WOYgKNV5aV3aBEycKPdzPnvvpCbQFo3lwTeiljw1NZDWstu0QZbDN0EmSXwP/SfyTyLnEaweA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEp5jvRb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3C3C113CC;
	Wed, 29 May 2024 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717012598;
	bh=HXebE+uT07ix5cHeKB9Q/BIZhdYV52dqNDGCEf3QumY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IEp5jvRbWU3vYXDWPIvPCdvg3mueZJ7g7Y61zqU++xNB0iXbardV4S+sXQ1eZtQzw
	 fUq4y7ljpKhJEW8YD4phkmTVK29rmRUc9WL7nZR9Gkf9XEBCVlUxoNPYVf2t4oOiD7
	 I96KoFQ8n6myzgQ1Lulp9fK1YfVXU5/NspZCK0QxiCeiyfFFE5k6J9XYyW+U2G4yP4
	 1XdfE+ivvOvftncJi8QJa5PIkNjm63kk0KEGDdfCqxS4Blw0OI8mtpagVUm9p7D0tK
	 SHGUVtEhrVIqdZYYjuVvgyTPD7rkTaC1pTQPx9iX9RZE+MypU7cDzzkejcgVMkQwBD
	 gaSRAEPIWkhzg==
Message-ID: <ad2db69fe8bd07d44a842db08617e754.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8da2c908f00043f05f7e26e3c26400aea0cfe8bc.1716975021.git.geert+renesas@glider.be>
References: <cover.1716975021.git.geert+renesas@glider.be> <8da2c908f00043f05f7e26e3c26400aea0cfe8bc.1716975021.git.geert+renesas@glider.be>
Subject: Re: [PATCH 3/3] clk: renesas: rcar-gen2: Use DEFINE_SPINLOCK() for static spinlock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Ye Bin <yebin10@huawei.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 29 May 2024 12:56:36 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-05-29 02:35:10)
> A static spinlock can be initialized automatically with
> DEFINE_SPINLOCK() rather than explicitly calling spin_lock_init().
>=20
> Suggested-by: Ye Bin <yebin10@huawei.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

