Return-Path: <linux-renesas-soc+bounces-25225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E10C8BC38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 21:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED313354450
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 20:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E2323AB9D;
	Wed, 26 Nov 2025 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMmDAc/i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1243B34252D;
	Wed, 26 Nov 2025 20:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187523; cv=none; b=cmggnWkq/qDrx2Kx1cjRuPtVtV50ATA4qlLlS9x9/pX1QxWsZaUhRVKUvzpVHXrwKiDMQEmB4Sw2DppzY1tV9tMGrQDRgnU7Pp4klN6rH6WQnu5tgujraiyiQ5oOCgfuPRH0+8peyhnCOifteDQ1OZ8Tzi3zHsMi9ZWM/ULrXhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187523; c=relaxed/simple;
	bh=4UvnEA00ko1lzXg0hdjBBBEsnJicagQcXbbjtn3U4jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FVGt9IiIuXaQF/eHMZ0OwqWiPGCjorMFbFrPgE+wtDTv3y3U/RYvwPjoiunSffY4P2GNT1r1z5huK86uts3BRZlR6d0BwmBmXBo4EixX9KvjU/aU1PG217FG1e2+dc9EdHT3FRBwmi2qXlF0VIhXJ8BRUp4UQSjnFTuX2YxI3Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMmDAc/i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BF9C113D0;
	Wed, 26 Nov 2025 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187522;
	bh=4UvnEA00ko1lzXg0hdjBBBEsnJicagQcXbbjtn3U4jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KMmDAc/iJr+WTIK/XNheFgGF6KoMxY8sGn6uKmy7ktSGlsc5vAWgRt5OoP/og4282
	 iYmETb05ebG5T/0nIWKMYdjtUyF7kBBvRW51Br6V7CfyjHNIBDPA+HK5KmycbyCF7g
	 tGFNL90m86oHbEdTEg+E0W+Vc/56Fq/XSASSc6z88l5ag9WUXVUQ5dSQ7v0C4Q/nXA
	 2u5iLPnCHmGwtAV1uaqmVLkhXEMfEavoGxYU2Wyri7aHXWoeA64ZANBsABB8Jpv65S
	 4M/c2DQYkuMsVf2yLK7BgXqj1rCY6wewj90H4jo+tX/QiXEBqR8lk0P1VeXC+sA3Dt
	 c3KUU2YCiOzFg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Peng Fan <peng.fan@nxp.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: (subset) [PATCH v7 1/2] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
Date: Wed, 26 Nov 2025 14:10:43 -0600
Message-ID: <176418784429.1591314.3521019603654312437.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124182751.507624-1-robh@kernel.org>
References: <20251124182751.507624-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Nov 2025 12:27:47 -0600, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> [...]

Applied, thanks!

[2/2] remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"
      commit: c70b9d5fdcd707ddac29284ea425fd433f374696

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

