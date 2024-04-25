Return-Path: <linux-renesas-soc+bounces-4910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B90FE8B23B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 16:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D67DEB203C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 14:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59930149E08;
	Thu, 25 Apr 2024 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEDNtr9S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F1149C67;
	Thu, 25 Apr 2024 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714054599; cv=none; b=VPUJrEi7YLYokKfisocck+QN17Fl9XYdDSA/1+ukTRaNtEdGbd49X70+rPL37GsF4KlBSZpuKfCS0aU/J7NabTgXZzXZguVfMyzhJeulFCuZXZoDdHyO8+xS8hvR3rYXG6/kR15yXGyaxLt4d7w3eyC6HR5tvwn614rE9BqjK5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714054599; c=relaxed/simple;
	bh=n+3q8cF6PNdO/izVSLJhs7im/d7HTf56k6kw7GXeHwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fmUYNFJNOwtErDn405i3gB6MQ8S4qkbP1EqNI9gSenSyqA9TrYy79gFyrMMJRRpO6HTtsoLjGP+JtpJxEibau/qrnKdGtHvRl70Uf5WtP5SLhltKw0FYm9JAZ3fG/ibmrfmssoQiGWdpQgc5RqtwFifDRXkme+IU9npuJ2GVewA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEDNtr9S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E63CC113CC;
	Thu, 25 Apr 2024 14:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714054599;
	bh=n+3q8cF6PNdO/izVSLJhs7im/d7HTf56k6kw7GXeHwQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vEDNtr9S4/yVnJbJa+Jo8abru/GOebq/97NK9qGhWHrAJUzIzoW8iWKD2tjF5Wm1m
	 RbOPoLb/Z5olaj2Dgb9YCJRASuHxTJ3ypF2c+/Nv723pSYzeulc+bg7ILfkc5fgUOo
	 a83FG8/UBWt8Q6xcMf/QtTns2y0mQdjB1ExRak/W+v9RDRhbXfSv8Y6JIjy+bFFtAE
	 WzCcoBKEVrF2F5qn5AlNQaGTzmnT7V5Avtr9O7AkeIErcjhmpZfgvSSf0vKrUelqUW
	 HRTLRAy/WrFNBB14cDw7L2eL/JhkOdzY2/chhsPXkiNjUUAI2rpxb0HH5Ejvz2pLyE
	 db1m7Mo9g0v/A==
Date: Thu, 25 Apr 2024 07:16:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Paul Barker <paul.barker.ct@bp.renesas.com>, Niklas =?UTF-8?B?U8O2ZGVy?=
 =?UTF-8?B?bHVuZA==?= <niklas.soderlund+renesas@ragnatech.se>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] net: ravb: Fix registered interrupt names
Message-ID: <20240425071637.5fe0199d@kernel.org>
In-Reply-To: <1f131230-56a5-4547-bc77-c508e61e8a55@lunn.ch>
References: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
	<1f131230-56a5-4547-bc77-c508e61e8a55@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Apr 2024 00:45:35 +0200 Andrew Lunn wrote:
> > Rename the local variable dev_name, as it shadows the dev_name()
> > function, and pre-initialize it, to simplify the code.  
> 
> Another option is to call dev_alloc_name() soon after alloc_netdev(),
> to give the device its name earlier than register_netdev().

Maybe we shouldn't be advertising that option too broadly. One has to
hold rtnl for that to work. Mostly old and staging drivers seem to do
this. Name are not stable. If other identifiers are available, that's
a better option, IMHO.

