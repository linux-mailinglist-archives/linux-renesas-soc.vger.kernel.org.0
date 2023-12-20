Return-Path: <linux-renesas-soc+bounces-1219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A281A900
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Dec 2023 23:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9453CB21FEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Dec 2023 22:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9340349F8F;
	Wed, 20 Dec 2023 22:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1zcWhDs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E1D4A986;
	Wed, 20 Dec 2023 22:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D963BC433C8;
	Wed, 20 Dec 2023 22:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703110726;
	bh=tOUJ0WccCEXWp8MHHoPlSoSd5LfMd7VrGq4j4eW3ixk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1zcWhDs3OBRdvENEsRzzdC5tETWHDxNu1+kJyU8997sAZ0jB2T2uH66vnuhxJVjj
	 XuHCDuvh1y/3bbEXdwQ2ot9CdjQw8MnPeSncRE1LberZro/FzsOPt1jO3hpDQ8D/he
	 J50obyMNSo9PUC4xCgF7DUMcagNMOEF4r3GsfibKS4LhBHlP1SjrlFQDEnRIyThQgN
	 RUUZwur0OGaKVyzV1TLla5Ole5gQENuXKWNIhK5FVdSfWa29wxUAYnikp9haMzN/1E
	 JK3CC440XIWK4Shp4BcMR4CG4a0jfQQ8D4W3ixdYWLNxSpjCtZBNUrituOTQ9qUWB6
	 6r1ut1w4SF+AA==
Received: (nullmailer pid 1227947 invoked by uid 1000);
	Wed, 20 Dec 2023 22:18:44 -0000
Date: Wed, 20 Dec 2023 16:18:44 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Yusuke Goda <yusuke.goda.sx@renesas.com>, Frank Rowand <frowand.list@gmail.com>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v5 3/4] of: add for_each_reserved_child_of_node()
Message-ID: <170311072431.1227893.4440437764849213064.robh@kernel.org>
References: <87o7eom2jn.wl-kuninori.morimoto.gx@renesas.com>
 <87jzpcm2ho.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzpcm2ho.wl-kuninori.morimoto.gx@renesas.com>


On Mon, 18 Dec 2023 06:47:01 +0000, Kuninori Morimoto wrote:
> We would like to use for_each loop for status = "reserved" nodes.
> Add for_each_reserved_child_of_node() for it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/of/base.c  | 29 +++++++++++++++++++++++++++++
>  include/linux/of.h | 11 +++++++++++
>  2 files changed, 40 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


