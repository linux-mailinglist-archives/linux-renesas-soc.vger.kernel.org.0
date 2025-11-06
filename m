Return-Path: <linux-renesas-soc+bounces-24199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF87C39C2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 10:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB8C53AF1BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 09:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03C530BBA0;
	Thu,  6 Nov 2025 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWGsPiEz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947BA309DCD;
	Thu,  6 Nov 2025 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762420254; cv=none; b=NWIbP3CaA+JeoWoiQMbeKcf3rbjSUb0EXNpWfRoZeFyLXcAUGsmymM1SWfSRr1nTQRHuRGP5reyu1JqKXeNjx8txqi1hg8KT7L7n4TmTzgFmtjce5TEX+PB3ZV1pIzYAL0xjl5KMjl/NOy15Rjepn7YlyUowrPXQAWa/xLkiWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762420254; c=relaxed/simple;
	bh=Zr/M3urx6QmDn29/RLIk+hUCSB9dBqIdqWe9Jr4oLQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8XBsSSpU2/+aUibMNVFi30k9uw4Qp4d2DIcoABfht6HHExC50g8mEXWOhpgjZfZbhjEYw58bqyKcN5J3FsBvPk/MqQmF82kC4n566PVeyKxsJ3/cQcRlZ+v8iOUvktgHMMScjcjeSjWGDaJqlCN/hmXNMSkGAN65mFsHIvpbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWGsPiEz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FD7C4CEFB;
	Thu,  6 Nov 2025 09:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762420254;
	bh=Zr/M3urx6QmDn29/RLIk+hUCSB9dBqIdqWe9Jr4oLQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWGsPiEzv+CafFM4g0M2wjUU5bZFC93IW8NSL5kX4Gpn3NQwmBrF7d+aU6CVVUPK7
	 j1C+aHKpIlEjm+umGM4m3cKayDeZJkMBgQgxvEuk2VNfuvF2TXKyzTMVWWTzIvtMk1
	 oC9RnRdHyZWeGdF+e4mCHGsT27cnRhc/9q9Zsex1PGXdhLnE6GUPr3kGS7RF5Cm6EJ
	 Uv2EfP10o6wXT+KCUJ8nwyxmiIEQx61Ebs3lFBtI4ZsMhFKddkrA3nl0/br3WRG46x
	 0V4WxBBhOqibYfi+FaPE3w1D8TWSp3MxqaTkcBL5tEiI0ErSoR0qrGQOnFL75anrfo
	 Fgnhvq2O9ELxw==
Date: Thu, 6 Nov 2025 10:10:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: renesas: r8a779a0: Add clocks needed for GPU
Message-ID: <20251106-nocturnal-uptight-kagu-87bce8@kuoka>
References: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se>

On Thu, Nov 06, 2025 at 12:18:13AM +0100, Niklas S=C3=B6derlund wrote:
> Hi Geert,
>=20
> This small series adds the clocks needed to use the GPU on V3U. The=20
> first is by far the most complex as the whole tree branch needed to be=20
> described.
>=20
> With this and soon to be posted DT patches the GPU on V3U.

You have checkpatch warning which is important, because would block from
merging DTS if it uses the binding header constant.

DTS cannot depend or even be based on driver patches.

Best regards,
Krzysztof


