Return-Path: <linux-renesas-soc+bounces-11201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA929EBC2A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 22:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FFD5188ADE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 21:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3B32397A2;
	Tue, 10 Dec 2024 21:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRVeJlIg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC5E232373;
	Tue, 10 Dec 2024 21:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733867736; cv=none; b=na1Ilu2SKcfnn/YGpJaP6xS7KJmzQ+SX6Ue340Nf91XT7rz2DrfJSs8YtJQoIvcUfVyYWiABy8htouZXGO15Pb+2AjEXMoCptu8Ux2BMoZRCKWV1LZcCWIHDHnUUcTyANYLGeoSQ7aP+LTu0lv0iFw3tZeTAlGoQw/qKM7iILGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733867736; c=relaxed/simple;
	bh=JGzm5kn0zW/cTRR818QpfYPr3GrBn5g7uRFlG1i+UB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrnYBjr0OgEe6G+Tjooo3VJdRP8Ibbb4497sZOCbTQihsOaay2JSc9KYKiF5nQ5bdltahnY2d9tVmWcO5eMKZPb01NCchsyd0iJYauBaSpD80t8wc9DoANBBg/Q+ncd8EBS9Y3Sbudlqa7U+oOCAmXyn5oGWx5+r3TF/OPTkfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRVeJlIg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1668EC4CED6;
	Tue, 10 Dec 2024 21:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733867736;
	bh=JGzm5kn0zW/cTRR818QpfYPr3GrBn5g7uRFlG1i+UB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRVeJlIgFWdH778YlGN0wImA7G8elslk5iJjiWW7nCCqfaZLbfhsbCGqUaQdF1/g8
	 p3kOnian/9WkZZsERBtRad+UKwWAYQYB5nWrzwpFYcmpdY1f75uI1TLW4QsfQm7ffN
	 vYuWpZzXP7hwwtfJyT2RePWTvETnx+ldF40CDRMk+JQXl0vnZRrEGGUvHsIKyff+Ed
	 n9BO/bIjAksXzURBTv4E2Qj709YoldpeaM8Yd43VsqDXJpFTuMdY6wFnKbfrGpw6w9
	 y75/pF8UEh8PRDzqx93QKxd5N5xPZ9cOHm2ECiWGBxy2rHNA/VvPcvCjswW6XdTF13
	 d9kA8n52GawDA==
Date: Tue, 10 Dec 2024 15:55:34 -0600
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: soc: renesas: Document Renesas RZ/G3E
 SoC variants
Message-ID: <20241210215534.GA531298-robh@kernel.org>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20241206212559.192705-3-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206212559.192705-3-john.madieu.xa@bp.renesas.com>

On Fri, Dec 06, 2024 at 10:25:56PM +0100, John Madieu wrote:
> Document RZ/G3E (R9A09G047) SoC variants.

Your subject could be improved so that it doesn't match this one:

https://lore.kernel.org/all/20241203105005.103927-3-biju.das.jz@bp.renesas.com/

Which threw off my tools...

> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  .../devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml   | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

