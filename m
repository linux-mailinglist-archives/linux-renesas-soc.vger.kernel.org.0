Return-Path: <linux-renesas-soc+bounces-22430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB1BBA7E13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 05:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA3E7AA5A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 03:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1EA1FDA92;
	Mon, 29 Sep 2025 03:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxZb874d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42DD515;
	Mon, 29 Sep 2025 03:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759117701; cv=none; b=PhD4SK1f/Apgaa6okrZokYj3X8UoJGqhMUWND2mRvO1c2xznmYweQPmMTDERor8wIQXXhlLe0z3+/bNxyJ+GHDD3Kuf117HxNTMRFxW3CA+CzTqEqbbZpsyl13v9UUNEwzWxs4QK+DCoKeHhxJJAkbM6SZCsWDrhgElrRFpV/O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759117701; c=relaxed/simple;
	bh=AeitMKrh+ZMi7IdhxDVaLH+9R9YhBwmzMrI6tuxwdWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6/bQrnQo0Zj4M8Z5Cd0dqPLuagqGW8/0yQB5O4viNpzfapyOeEW53rTUw3CtdXCnLwcLY5YSn3zAueiq2aW6vNpkgsmk0NfYfVC8TKQWSIr2ZDVNjG2SCJxXEET8oUaZTYwxx1T98Z7hpWyhahTJ8oQuuNOGwVkYzo1KnF9uUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxZb874d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DF7C113D0;
	Mon, 29 Sep 2025 03:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759117701;
	bh=AeitMKrh+ZMi7IdhxDVaLH+9R9YhBwmzMrI6tuxwdWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hxZb874dZRgOv1HcVCM2nlK8+4uXf8O66F3aKe8KxXKLjxI6WmGcgKWnQBhjyG3BN
	 1ttY2BzIRohK8OCgIGLv6mlYGglti4m/xY9UzPQ3/zEk6wMe0Mg9Y2fi7C3X/N/Jxs
	 K86f+hUYnVviAHrGlhafXYtHTQDRsQY7NNGAhBXpMCqAkwPNSbTVwhLTIwUMVWblkg
	 2+3Ho00ds2VPPTGBJe5DDqVoShhpmrqjbpQ72hoHiNTs01HNuwzwr0sBhjyPg6Z1GI
	 QXBGwgIu0iQMB/BFqxTbyRfpx1PfkifXZOGvGDcmFFnnis7b3VL63v0PlQKUcsSNog
	 KsU1RxXYKAOKw==
From: Kees Cook <kees@kernel.org>
To: Andy Shevchenko <andy@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar <prabhakar.csengg@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] lib/string_choices: Add str_assert_deassert() helper
Date: Sun, 28 Sep 2025 20:48:18 -0700
Message-Id: <175911769613.3662480.16218936940501384278.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923095229.2149740-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250923095229.2149740-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 23 Sep 2025 10:52:29 +0100, Prabhakar wrote:
> Add str_assert_deassert() helper to return "assert" or "deassert"
> string literal depending on the boolean argument. Also add the
> inversed variant str_deassert_assert().
> 
> 

Applied to for-next/hardening, thanks!

[1/1] lib/string_choices: Add str_assert_deassert() helper
      https://git.kernel.org/kees/c/c8a935a31bc7

Take care,

-- 
Kees Cook


