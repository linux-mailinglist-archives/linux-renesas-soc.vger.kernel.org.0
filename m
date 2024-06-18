Return-Path: <linux-renesas-soc+bounces-6379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341FA90C016
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 02:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C15BFB20E6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 00:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C2EA50;
	Tue, 18 Jun 2024 00:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhfnAN3j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AA1A2D;
	Tue, 18 Jun 2024 00:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718669281; cv=none; b=oS4gNyt+v3qZx7bP+ehvoG2g34Glo3t7ge8C22jylYLBjcLY6X7O/ycACfIJwhObVnfsdX0k2Wee1oyDjP++j/kEh+V0Jj8T0yx4jb5N7qvD1wPRYd1ierneY0P5yIrbHcn9IFSJey7ttt/xYNmMaQrbZWSWppi91lzajSCIOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718669281; c=relaxed/simple;
	bh=36CWnSggwu9XEgK+BEW2dfoLh8Wx1BkoZxBKpSE9AnU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCB0EY/eKGMybx2MT50lDSXB/7IpNRqqyZqLDsNhzpHy3SnNrPW3bKOyt/IrkqR/AuAiLE+nkvT3M80PIeThY5wzrY1UpKElCzMYVwKdq5ORZ6olZ5EBPjY+N9BwuJZ0XCvIoP2tziQpHESwdA2PNhpEuuvorkcjATCCHE+QrVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhfnAN3j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332D4C2BD10;
	Tue, 18 Jun 2024 00:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718669280;
	bh=36CWnSggwu9XEgK+BEW2dfoLh8Wx1BkoZxBKpSE9AnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VhfnAN3jYTWFr8q1guxkDQZQanRe3Z5Dtz9Akt8z35c7726VUAR34bxW2eNrZZA76
	 y2Yu+4A5MZbvkX5TtCNcH/L14PpuL58mOJsIiVAkTIThGPHzG5p6c4G6ZHQUP92uoa
	 RwtHKCgiu4BUBNUEtbZyC5I10jm6BohMcAPD5W5bxYjviSfrULY4Esr/snW6B0uoSK
	 7NXjSa+FRRh7OuYbK6m9DWFLCF7+4RqITigw6E8h3hINH/yxMNv5EaKIHhdOjEMwd2
	 cOONREvLbO+4pBbmr724rrUjbWbaYqRzWaI6ddqN3/ISSxX4ADSUPppzKyEJzzhWh6
	 cxdpPk4RHW0vA==
Date: Mon, 17 Jun 2024 17:07:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>, Biju Das
 <biju.das.jz@bp.renesas.com>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Mitsuhiro Kimura
 <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 1/2] net: ravb: Fix maximum MTU for GbEth
 devices
Message-ID: <20240617170759.270f79f0@kernel.org>
In-Reply-To: <20240615103038.973-2-paul.barker.ct@bp.renesas.com>
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
	<20240615103038.973-2-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 15 Jun 2024 11:30:37 +0100 Paul Barker wrote:
> The datasheets for all SoCs using the GbEth IP specify a maximum
> transmission frame size of 1.5 kByte. I've confirmed through internal
> discussions that support for 1522 byte frames has been validated, which
> allows us to support the default MTU of 1500 bytes after reserving space
> for the Ethernet header, frame checksums and an optional VLAN tag.


But what's the user impact? If we send a bigger frame the IP will hang?
Drop the packet? Something else?
"Validated" can also mean "officially supported" sometimes vendors just
say that to narrow down the test matrix :(

