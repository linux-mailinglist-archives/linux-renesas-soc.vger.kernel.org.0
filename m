Return-Path: <linux-renesas-soc+bounces-21447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C84B45120
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 10:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9703517C32D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 08:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7838D25C81B;
	Fri,  5 Sep 2025 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjPcgtFl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5045B13E898;
	Fri,  5 Sep 2025 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060317; cv=none; b=dHbwJAYRYUVjuJKx7igHajEKGjyyQb4DfZYRNpaKFTdrxqS+uTup3WzxqdDfxkROEygYJoe4pNCh3D2SA1tnOVQKYjhAZjnc5VBz5i6Pbjfk3RctSJd/zD2EtjtHLzEp99wU19v1qCHUb3z3GYaNl334qZaO26LfrfKj5jXVbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060317; c=relaxed/simple;
	bh=3wk8a+bIggfZCsBMSScJxPqeod2bkxkOOu/xeePXKrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1ZTT/ozfcVcy+T1hLbJXkiwkXxA7sq1Zp4ux1+vgYS02ypPiFCYOfbMB2xU/wGTNzoFqZWHKXZdkNegZra0BcDTIYZHtO60keUcejzvkOdshOAep1gIyjVvnxc6nIONUuxT00cIeRgw8v2qrhw+y25ex+c0er56M9JTSDKgw4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjPcgtFl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3B4C4CEF1;
	Fri,  5 Sep 2025 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060316;
	bh=3wk8a+bIggfZCsBMSScJxPqeod2bkxkOOu/xeePXKrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjPcgtFlOi6WtfNtIwSvFSk3c9z+w8/0Hc4MJivYNhfDzDC+eYLrIv4ZNo34k4eY8
	 5ht4IKTV8iv7YfK0eT683kvOapKkdyk7djEUhkNMevsDv9Y4t2nCP1R5zrd9/585RZ
	 HPdZljbk7Ooa+upSTmWDKlxRgdN662Bwss0Exr1NGPiJwHoFs/Jj9B45oqKiUZqVtD
	 HPlfL0Ojy7I1D5LAlzkYBh32nWFinRdqysw/svAAZHvFeNSyehuV3iDAqDLhPPAPjO
	 a8eTfO4D5XuHFOTdeuQHRfWl+sc2EiFqKJX8aiZ7gtrZsX+M0k96b9LRON6jWRyB/2
	 +19v4q8ARIfqA==
Date: Fri, 5 Sep 2025 10:18:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi
 720x1280
Message-ID: <20250905-classic-hairy-camel-44847f@kuoka>
References: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>

On Thu, Sep 04, 2025 at 10:56:56PM +0200, Marek Vasut wrote:
> Document the 5" Raspberry Pi 720x1280 DSI panel based on ili9881.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


