Return-Path: <linux-renesas-soc+bounces-11832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B191DA00E45
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 20:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B2A3A16BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 19:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCF71FBC8E;
	Fri,  3 Jan 2025 19:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8nficac"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9771F9F58;
	Fri,  3 Jan 2025 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735931178; cv=none; b=KTJUyXevIWA8+Ygu8u+ItBds8zsIYuTurHmhpgejpibP5aDhP6APPbMfmZBwDKND/uEuJ/mZ8uRG2bmUKiAdgt71VaNYuHhu8jf5PSt6AGZ8ABonvYgO7X89KWluyFINS/pN0WQWb0TOOcB2tC7XOGLO+ZlGKxNI7tpKkWo+wq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735931178; c=relaxed/simple;
	bh=hQ24nSrSoeMEbwiAoTRpkrbPmhF13tHCnomM0aWSxjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONw9pafLKNsQ+Wy9qkA6W7nKDy9EXQPh9YWRmtxCik8PYhnjeDgvNaygN3Uvdp3EQJvpu1sUWMYq6/3ddWL3DBYW1dHfWAbzKrpK0aTvKZvTz4pH14B83MPSyjUlOa8Mbc7uZXzpbjXnuuoyQ87rkUTxdjC23WkpSUreAZxHS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8nficac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8431EC4CECE;
	Fri,  3 Jan 2025 19:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931177;
	bh=hQ24nSrSoeMEbwiAoTRpkrbPmhF13tHCnomM0aWSxjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8nficac6xeQKGhPlcaqdJd8F9ahUHmOmOM+QRsu7w0uJLlQs1BJ35+p7tEH+wI+c
	 Vk8cedUfcmflfXGKlGtWxaVUjsbO0Y/deJ6k1+cQKk10L6AewCOjZrxrk+s50jWStE
	 fiJ0Iith+ND5PuUx4bN8iXv2YpN8yWGJaLxz/xSyRrx57TuRO7WW4AIoBHGxBHU/w4
	 XQrwPbV5HrSp64AUVd2+q9qKKwYYmt17fZp8/gv7qLzYa0Y6sdA2hiErKNKSz5Zx7Z
	 sgEBWiYD6BSPZFxeChaS9TimwxjgPj6kFPmoSJH/CXqqdZrw1zT7QSMJbA1UeuO6Ys
	 mtlFx8aPy5IJg==
Date: Fri, 3 Jan 2025 13:06:15 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, john.madieu@gmail.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: renesas: Add RZ/G3E variant SYS
 bindings
Message-ID: <173593117523.2593499.9941727288995689867.robh@kernel.org>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
 <20250101163344.128139-2-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250101163344.128139-2-john.madieu.xa@bp.renesas.com>


On Wed, 01 Jan 2025 17:33:41 +0100, John Madieu wrote:
> Add RZ/G3E (R9A09G047) variant to the existing RZ/V2H System
> Controller (SYS) binding as both IPs are compatible.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> Changes:
>  - v1 -> v2: Do not rely on syscon compatible string anymore
> 
> Notes:
>     v1: Acked-by: Rob Herring (Arm) <robh@kernel.org>
>     v1: Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>     v2: Tags dropped due to small changes in compatible property structure.
> 
>  .../bindings/soc/renesas/renesas,r9a09g057-sys.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


