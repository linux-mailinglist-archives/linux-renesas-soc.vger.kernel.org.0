Return-Path: <linux-renesas-soc+bounces-12366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBAA19F4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 08:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B388C188BAD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 07:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2906920101E;
	Thu, 23 Jan 2025 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWw2vR8E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFF81C1AB4;
	Thu, 23 Jan 2025 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737618323; cv=none; b=nWmSVt6q+p7+Cf9RcPRj5Q8TpenranzDKTszkaSqB2HJ7IA5aQjJuhF697WqJpWx5oyYiRLVst1bIWL4TlxFCuvobbye++hIV69HWyX32Coiw5dNEewhgz0OxsCrdoA04CSuVFFRgH79XDZbLWz5ncbv1xYifEgluXx0HohnlcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737618323; c=relaxed/simple;
	bh=j99vjpjVE8l+NdTsIoZrwtaY8Nz67MOeMa7X2lWpvLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWUBGXCIHnxC8IViuaOQUD8yhWWyf3DpZ0pK+rjAPf3VlUr+6DADJifZexDUnBMWbTgeBxMxi6Vrrh1JybQ8BaJxDZ+LTR8xkw7IUtnkb3KiSyam/x31Wj5hEfZgL1CXtAsEQ8fMhCPotcAiM84tyyJNJCunR0RhoQvYG5SNCyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWw2vR8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990BBC4CED3;
	Thu, 23 Jan 2025 07:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737618322;
	bh=j99vjpjVE8l+NdTsIoZrwtaY8Nz67MOeMa7X2lWpvLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWw2vR8E8hObAcI4oZo7gMmmecG5Xbj3ZQBHeX4qL2alJWUGKF9ebcDqrQkITOxIp
	 iH307juZ59Cl9opcyRCeXMkbQByRC1VXAzVm5N3kUHZxLXmapgGVBZThNZ0if+Kcfb
	 ufwe+BR5UCA4H7yb5KDHIMFkIQwYSXeG4uDoAV482Md1+a7dnHXI5qqLFHY2bEDubb
	 6UcxOhw7H48OfAs6XLDgCk/kXwOUo/7CEr0ZxveiRia2qr9ZmDZziDL7V4vZR/7Ond
	 +p9s9XxAMtVhBkLZcOxg+9uDUT4eRISMhSclKh9KIyrLNXtaCtBSyjuzgeVX12H7cW
	 phJjtFvpJF9TA==
Date: Thu, 23 Jan 2025 08:45:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: geert+renesas@glider.be, robh@kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, john.madieu@gmail.com, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, magnus.damm@gmail.com
Subject: Re: [PATCH v3 2/9] dt-bindings: soc: renesas: Add RZ/G3E variant SYS
 binding
Message-ID: <20250123-conscious-resolute-dog-b3dda7@krzk-bin>
References: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
 <20250122103911.517484-3-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122103911.517484-3-john.madieu.xa@bp.renesas.com>

On Wed, Jan 22, 2025 at 11:39:04AM +0100, John Madieu wrote:
> Add RZ/G3E (R9A09G047) variant to the existing RZ/V2H System
> Controller (SYS) binding as both IPs are compatible.
> 
> They however have different SoC IDs, RZ/G3E has has VSP control Register
> compared to RZ/V2H SYS IP. Hence a new compatible string renesas,r9a09g047-sys
> introduced to handle these differences.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  .../bindings/soc/renesas/renesas,r9a09g057-sys.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


