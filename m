Return-Path: <linux-renesas-soc+bounces-23451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50FBFED1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 03:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 341D73A6A8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 01:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67E31C8FBA;
	Thu, 23 Oct 2025 01:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNJG4F0f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8717E13C9C4;
	Thu, 23 Oct 2025 01:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761182030; cv=none; b=f+QSt4KD/TUeuiO9Dd3IRl+TxMboRXyZpHfEEOM9D+xumH8LQ5DbYwEea1Ox6vd0AFPr2eHdtxSSix2xcQQcgiZCJd1dRyNO2DVOY92af08i6VvhWUNOoIH0XII6hV3MUc4eD0xWu1K+bLHWAYKq67Z1RV3qwGFWHzYrEblpjNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761182030; c=relaxed/simple;
	bh=P808A1kDpIeRXSqeZnWX2v3EWvt3tXkCz6fODMYDMLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OAjZ1SAkr8Ily37JOYp3Hu9+RFqUWYitv1PVk/TOaiYTLPFLe3xqCm4rE9tfuPmqw3NrGWnd1f9RWptEbdRclJQMaVcWoMjMcZtQVgl6UlBzrYjk1KeBG0oxaZr/XWLPf0qNyAbEPv6BZQ+d0WMMVGUKPFEioKM6XtxMh6PtyGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNJG4F0f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D6FC4CEE7;
	Thu, 23 Oct 2025 01:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761182030;
	bh=P808A1kDpIeRXSqeZnWX2v3EWvt3tXkCz6fODMYDMLQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pNJG4F0fYA4rW9EfqedifrusrBIuu82evln3/s5A+twtXUnHTLj4BrDZwihTBy3j9
	 EenZmyxW6U//tK2q2eZOrBEBCWYODJgMHEIrO22n+AAFToDblIHaeqavG8ltT1roNO
	 T+xOw3iEU5IF5SudwlTxI4+A1oXcvIrFOnoyHVLAJxkuhyzf1rljWWsZDaoKdlBUs+
	 0V1XcrOIr5q37KSeegUHydKBIEjwHDvW48N3nocwyEg0E3ABOdbCFMEoMl8Tj6/TKW
	 drhJygiQPe8/wlHtHq2Sm63jVDvcEhrGgpUW/Vli6LPGmw9yHh+TLYr7Vc06xZ0eVR
	 xwRyLs4uPMb/Q==
Date: Wed, 22 Oct 2025 18:13:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org, Niklas
 =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 2/4] net: ravb: Allocate correct number of queues
 based on SoC support
Message-ID: <20251022181348.1e16df68@kernel.org>
In-Reply-To: <20251017151830.171062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20251017151830.171062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Oct 2025 16:18:28 +0100 Prabhakar wrote:
> On SoCs that only support the best-effort queue and not the network
> control queue, calling alloc_etherdev_mqs() with fixed values for
> TX/RX queues is not appropriate. Use the nc_queues flag from the
> per-SoC match data to determine whether the network control queue
> is available, and fall back to a single TX/RX queue when it is not.
> This ensures correct queue allocation across all supported SoCs.

Same comment as on patch 1, what is the _real_ problem?
Allocating a bit too much memory is not an stable-worthy issue.

