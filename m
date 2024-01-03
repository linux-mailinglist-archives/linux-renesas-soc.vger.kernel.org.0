Return-Path: <linux-renesas-soc+bounces-1280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B8082372F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 22:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09134281B45
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 21:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101861D69F;
	Wed,  3 Jan 2024 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESFIez2p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D0C1DA21;
	Wed,  3 Jan 2024 21:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CB3C433C8;
	Wed,  3 Jan 2024 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704317856;
	bh=73LREQTxsSnXIYw93DHSfO0naLDfX2w7eQgpbIiIwPU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ESFIez2p7wZP/2gn7ruqrQK4nV2PxBtzP80+gqQmMjvqExlf6CLoORLaPyuOpxUe9
	 Lr4jAMtdCEdFDdFylvURuXxue/x9Ht/HrfGnwD3p5hRmDsggoy3fQJDtKxgUy91sYy
	 a9B5CXPflVNv39YMuPSuXgizcx8JzTc4G/l7DX3yAMOGN4VFkb+MDR6xo/K4rP98Fx
	 fYbu9XYMrEZP0QRrLrdCZvqMBUJG4WBY9B3GE8ZeTgejxKfxGe5lTtbS1M/gk8Ib7a
	 b7DNgYZg4kUmg0fsOSd/NaPhwhYh90XRUoIfxBy6xb7cURgis237dcR76cLAQS+O/r
	 MgAr2YvQdvVSQ==
Date: Wed, 3 Jan 2024 13:37:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net] MAINTAINERS: I don't want to review Renesas
 Ethernet Switch driver
Message-ID: <20240103133735.7bd660b9@kernel.org>
In-Reply-To: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Jan 2024 23:56:15 +0300 Sergey Shtylyov wrote:
> I don't know this hardware, I don't have the manuals for it, so I can't
> provide a good review.  Let's exclude the Ethernet Switch related files.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

> Index: net/MAINTAINERS
> ===================================================================
> --- net.orig/MAINTAINERS
> +++ net/MAINTAINERS
> @@ -18358,6 +18358,9 @@ L:	linux-renesas-soc@vger.kernel.org
>  F:	Documentation/devicetree/bindings/net/renesas,*.yaml
>  F:	drivers/net/ethernet/renesas/
>  F:	include/linux/sh_eth.h
> +X:	Documentation/devicetree/bindings/net/renesas,*ether-switch.yaml
> +X:	drivers/net/ethernet/renesas/rcar_gen4_ptp.*
> +X:	drivers/net/ethernet/renesas/rswitch.*

First off, very nice to see a refinement of MAINTAINERS to narrow
down the scope and make it more precise. Thanks for doing that.

The solution itself is not very idiomatic, however :(
IIUC you want to support SuperH and the AVB implementation.
It'd be more usual to make the entry cover only the relevant files.
And for bonus points perhaps add an entry covering the switch files,
mark that entry as Orphan?

