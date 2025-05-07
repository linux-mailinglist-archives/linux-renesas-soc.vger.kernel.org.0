Return-Path: <linux-renesas-soc+bounces-16750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC73AADEBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 14:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E46BA4E0EE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 12:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8F225D91E;
	Wed,  7 May 2025 12:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEGWnAWZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2119E2580E7;
	Wed,  7 May 2025 12:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620161; cv=none; b=k9maYVR2w6OsIaGaq6HFvEl318DrFWZJq5tYi2JxIrRdExhmoBUu2ysrIMEqGa24aONqz+II9tkDwGZgB9HJlSR+CENccOx4rtilOXcZkiWioKPJkRSrr92MWrYZK3EgWtFi4bd8fy9EnVAgi0GE9gEfMAIJSrqKRQlwYYiaHiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620161; c=relaxed/simple;
	bh=wH4xtkWcEczPIbR5zdksI+tOyUkjQOacyI0SB1IT7gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kworU0AKPMS6BqNMLg+JtEg9c7bN2EXfE1xVxvgEOrinJ5AUiyTomstPjbHTp6Rq2a6ToFsHHcW0t/hrUmHxzqnM+2ltLm2VeCCqIxINE/M107MZvO8G5U49nB8uEObaQL1FZWFvVJpy6ERqC892n5ufHHQLBBAN8TgFbNfosgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEGWnAWZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBEAC4CEE7;
	Wed,  7 May 2025 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620160;
	bh=wH4xtkWcEczPIbR5zdksI+tOyUkjQOacyI0SB1IT7gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEGWnAWZtEuuzRLGQlVb64t0VgcoEEuUnTRAwShsSGwjAyFSG+VoCeQVTJMu6HYai
	 a2RQ6x8zG7OzwK/XO3RlDqjinsJwXlvOsOt+QQJOY5iRpLI9uXouCUcPH3E1+banCU
	 3tr68sk9tW901Qg8IH1jRndFOwxabl0mRB5ZY8cPgslI2+Z9krtvRNR6ZHc7Di3eLL
	 rPH/8Reqmi4jgU7XoasQel3PsiWOQMO9gHX7C2DjfyyU67To6KM5UujjyQgdSEpJCJ
	 KssZMlEzPrvqOe5aDwsEmvpck+NPszR5AB5cVP+pEtIdiBzzMSZiKCHxqVU2mbZqfK
	 YWhUNiENTyURQ==
Date: Wed, 7 May 2025 07:15:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/V2N SoC
Message-ID: <174662015723.718661.4953901456484650872.robh@kernel.org>
References: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Fri, 02 May 2025 17:25:40 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a compatible string for the Renesas RZ/V2N SoC variants that include a
> Mali-G31 GPU. These variants share the same restrictions on interrupts,
> clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
> validation accordingly.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


