Return-Path: <linux-renesas-soc+bounces-23452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6452BFED2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 03:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 637274E79CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 01:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B7117A305;
	Thu, 23 Oct 2025 01:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaVahkNP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F153B2BA;
	Thu, 23 Oct 2025 01:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761182357; cv=none; b=CFCHOFUJXXHaa7DaHDwaPALhUlvD/muREq/WMYgIaIfjFcSJmEZvnKB6vB70IDJemCqC/5hIZeK1/HVmMdmdNRD8NvFS8gza+NLohFBfUrYK+7Pg0BXSff9e2/yfkcLFc6ipZM8mwhfRokDRLETDbNQpsZTa1zyV3qK7WQMOZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761182357; c=relaxed/simple;
	bh=+YkaZfL0WPND0FxlYC1OWrM+e7Xv79vbmngIIAsj+ps=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4VqTjR0Wptql5tMVDXzRsKhkxeaIeFfmm0Uj0Vknb5cR1MxcDrUVqqpmnW559h2Dgdl2s57XBT5V/DX67Jxyigf0Kk4/BG9/rs2ro/NghSFab2WvGVm61q1Hl4Tu1SNzlNdPDRw8slHq5F0FFK+wBrPCwlK1iPNYss94Ko99cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaVahkNP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B960C4CEE7;
	Thu, 23 Oct 2025 01:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761182355;
	bh=+YkaZfL0WPND0FxlYC1OWrM+e7Xv79vbmngIIAsj+ps=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XaVahkNPtEhsJFTQHXMkL/ibF2CxczvDlbb2cX3F6ZucmpRWSzzdMiYf/IeG2GVys
	 0zAbKTRZhpyNclUp+Xt7H0S+fcBi9fv5yqkusQ33X3to9ZqpIIs6pQHhdAv9krcpYC
	 oKmkVDQLDEZ4kY/Jj8gQ3nw8xRzkJ0Tqx4SpL2tgdJydu2QDyp4SI1t/5z7eOclluQ
	 lMhiEoLmFiNNWSTEXVUwcbK6y8n00Bj5brvq+/kE8EYPrfdJW4ncvNp+n896vbUOv/
	 xc9ZkDLBW5ZuwkC6PBZON+OMVwDy8+0VlP6pUyNtP0XGeNuQ6Oi9FQWSlK3Kf2iHRq
	 4FEAs11lMzdQA==
Date: Wed, 22 Oct 2025 18:19:14 -0700
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
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/4] net: ravb: Fix SoC-specific configuration and
 descriptor handling issues
Message-ID: <20251022181914.5bb4f228@kernel.org>
In-Reply-To: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Oct 2025 16:18:26 +0100 Prabhakar wrote:
>   net: ravb: Make DBAT entry count configurable per-SoC
>   net: ravb: Allocate correct number of queues based on SoC support

These need a better commit message underlining the severity of the
issue. Failing that they should lose the Fixes and stable tags and
get reposted for net-next.

>   net: ravb: Enforce descriptor type ordering
>   net: ravb: Ensure memory write completes before ringing TX doorbell

This are not controversial, I picked them up to net. Thanks

