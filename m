Return-Path: <linux-renesas-soc+bounces-5676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEEA8D3F33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 21:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 932D0B23A22
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 19:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC601C6883;
	Wed, 29 May 2024 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noGkcr5h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940711C2339;
	Wed, 29 May 2024 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717012570; cv=none; b=ew90ObUUMOuyipPTgG+sSWK2dmv8IxBXGJnG6ZvihxYGZSomvcgQ9Jq6XZvoDZbHvRtzKO5Ifrw792Mn+65gl96wVNlazv4QfWZOKm03jIjiMJr59kBZmcVhXgDuOabtQGGFCEuBlHO3T6ib/HYSg2Q8BdJiHNC1kSiZtnZxOzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717012570; c=relaxed/simple;
	bh=TBklheaPOVSZbia8qZxB0VNyWBs0CAJRg+n/yZzg/ZY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=RgR3T+/CVEqvFRx9JaURachK5aZowB2kEqAI8xNtWm+7Nt8J684wDGRDo564FONVcVYoRPCTa5YqcyUdX67PdLE05/rBCadCFmuTIVgL9FJVqnImyNTW8vcYrE+n6jEIwkbaovF9pHitgQ4x/CiWIoVltem3kJD53aaNJvshDfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noGkcr5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A8BC113CC;
	Wed, 29 May 2024 19:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717012570;
	bh=TBklheaPOVSZbia8qZxB0VNyWBs0CAJRg+n/yZzg/ZY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=noGkcr5hN4wDQz28tlzVzx00cMEJdSilyR6Spv9eSDHNzUO3dFU9tmRNlp34aZIX7
	 R0GVjymgCTfFqZGhTRDug+TW73N9jxD8sFQg1/WYFbXbu3Fxr5DLZpf6qcdx7zZN8p
	 J+iqjNtOevuI//mE25WKPuEQy5ZlrxTEmGfS9K1+azTtl/LTgJezrdsnW2gpa3xreI
	 mIsJpcW1aIjb7p4oGKOfp6gfP5YOofHbSWnkYgQdqQU/JThJY5ThbJ/rkFQTTF6+Bb
	 VnuRGhb4eFaRlv2Z/ALoq7l7hY4Z8Z8uyqIrba+KCOlfZbrooyamG0ZsdBtbjJfIen
	 d6Rj/DcZkLFkw==
Message-ID: <20f4f283b9f842f3868363a3f078b2a4.sboyd@kernel.org>
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
Date: Wed, 29 May 2024 12:56:07 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-05-29 02:35:09)
> A global spinlock can be initialized automatically with
> DEFINE_SPINLOCK() rather than explicitly calling spin_lock_init().
>=20
> Suggested-by: Ye Bin <yebin10@huawei.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Shouldn't this be first so that the previous patch can use the
initialized spinlock?

