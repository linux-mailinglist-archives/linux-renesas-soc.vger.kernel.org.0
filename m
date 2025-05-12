Return-Path: <linux-renesas-soc+bounces-16953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E6EAB2E30
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 05:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F8C316ECED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 03:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C92C254874;
	Mon, 12 May 2025 03:45:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77763BA3F;
	Mon, 12 May 2025 03:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747021510; cv=none; b=hWrBnxJI4aFrcldCY4r2WnwlHzX6dZHKZuoqeTslnqE1IoUkv8z6GDaBDv4Fcheuipw/ZVa4h/0GUHtuGJtCEU81GdGBM7ad3Gfw6ez4ORRlgKHkJ1erj8CcdWSC20KSyDc9JuIVzMAeSQj4GIh1ig4Ft9TkUF5vJMyg3EWBx9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747021510; c=relaxed/simple;
	bh=X22DcoaE4AUQQWTxAymBYEluB6Xchn/7RkfILlLYVSE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGRXz3BmNjdzqEHbaqkitcPZyQd4kdiKHLvORhu4mzhSMRzGX6CkamWfxpnXhFfpNUEfuAaE5on8sGWrZ7HuTBTJf33V4IHlAcpGPEOHwyLFs2UdmTYgKp/2Rf18SAxpbbwORM6BeH629U2TmpbVsTOSs9olhxWd1DsnemDQUUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 54C3ieWE054642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 12 May 2025 11:44:40 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 11:44:40 +0800
Date: Mon, 12 May 2025 11:44:40 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>,
        Conor Dooley
	<conor.dooley@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 2/2] riscv: dts: renesas: add specific RZ/Five cache
 compatible
Message-ID: <aCFuqMM128wcjE0q@atctrx.andestech.com>
References: <20250509-sapling-exhale-72815a023ac1@spud>
 <20250509-mantra-trickery-56f699596346@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250509-mantra-trickery-56f699596346@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 54C3ieWE054642

On Fri, May 09, 2025 at 04:37:59PM +0100, Conor Dooley wrote:
> [EXTERNAL MAIL]
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> When the binding was originally written, it was assumed that all
> ax45mp-caches had the same properties etc. This has turned out to be
> incorrect, as the QiLai SoC has a different number of cache-sets.
> 
> Add a specific compatible for the RZ/Five for property enforcement and
> in case there turns out to be additional differences between these
> implementations of the cache controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Ben Zong-You Xie <ben717@andestech.com>

