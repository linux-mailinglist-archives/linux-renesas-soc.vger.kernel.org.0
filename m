Return-Path: <linux-renesas-soc+bounces-7472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1359E93A8B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 23:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B136B21ACD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 21:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699D014430C;
	Tue, 23 Jul 2024 21:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mN7PJHMi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424CB13DDDB;
	Tue, 23 Jul 2024 21:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721770124; cv=none; b=LIPTG37Yuub8Q8V6QYcStwrWezT+o7qHVuVx8CdN2fwr6CSHCtxlIaa0hXbXDAQMxmlwXjvohPWHbdL4If2tWKCTc/Z04RmNwEphr0coOmUZXY0neZD+snrudpJkLyDiQxYQGkSiDTt3F7cu0nlxkxfN8XWxEa20KoC+IPR7k/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721770124; c=relaxed/simple;
	bh=1DuTU/4GzAiGpJjiPNA4NvSs7zP/dsLStlGl6xBplbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkQSkJkUqVSfRh4MZ5VJ18CeHFAZ9P1P9QjlRs+I3vh8iYgfdgkJTiENBHrx92RON9ZuV3P1uXA1a58gveJGHmcA0sIbCPPHsni8Af+A5KTpn9K4uirStWwm549XgVkkKYysGIJlWspNrer47kvnufhpUeMqXukw2CWHgAWKFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mN7PJHMi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C77C4AF0A;
	Tue, 23 Jul 2024 21:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721770123;
	bh=1DuTU/4GzAiGpJjiPNA4NvSs7zP/dsLStlGl6xBplbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mN7PJHMi7ZIRZW3DcxcJhJkDpoWp1qZSZhzuzXnVfWnuvJn1In2DhtNFgC2OOagU+
	 VkaXqKBib50I8Nh/Qd+7Phkmwlwp+1VW7wqtylUcUrfJTaN+vOctfnhd77BVZyN8Ld
	 i27jItCZ/Exk76o3hXgH6skUAXBad6Z2GaN9PBeWRwH8rVOzbr4AEJSni6lrS9D3SU
	 2T2NJE52hyrU1LH5wuXwghcBvO00AfriRc1t0kxjT+TlrW16HBSIbfDfKb6MPBGrJZ
	 m2AeU5KRPrRrhZqeSemr3IBsBT17NybD5dR5Qy1nEtokvck2goy8QY/mLRyTrA47FE
	 bd1hjSQ7flasg==
Date: Tue, 23 Jul 2024 16:28:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH V1 resend 1/6] dt-bindings: soc: renesas: Document RZ/G2M
 v3.0 (r8a774a3) SoC
Message-ID: <172177012203.1133136.2632527102375897752.robh@kernel.org>
References: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
 <20240723110733.10988-2-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723110733.10988-2-oliver.rhodes.aj@renesas.com>


On Tue, 23 Jul 2024 12:07:28 +0100, Oliver Rhodes wrote:
> Add SoC documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.
> 
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v1->v1 resend:
> * No change.
> ---
>  .../devicetree/bindings/soc/renesas/renesas.yaml     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


