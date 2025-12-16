Return-Path: <linux-renesas-soc+bounces-25785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FB7CC1326
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 07:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39DB93003845
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 06:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2773370F3;
	Tue, 16 Dec 2025 06:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQfLDO7u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B281D1E8836;
	Tue, 16 Dec 2025 06:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868042; cv=none; b=UrFDnk8BavnW82NdhfWvRLSDztEUBoIWpeRvV3uwknWbGDYdpLyGAbmbaDDSQAlLhPKfMsyYKLOp8OExjEe2osuEu7VDrfCxb80kh9ir5on33C4J8HinyAtLOTffYxPASCy5v7L2//pCMkF0yJoaZ5apmxL6LxGO8xcPlXIiJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868042; c=relaxed/simple;
	bh=HlB4rvd0gE1zxwKcPPjkgwihp2trB2AYciEwnFA7cSE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JmtCbQ/NJ5j/dGjL22RHlIxv5Sn6/hc4EVHymyz11gAJvPZn3M/PL+0mk++EFDYkAIgowEHpBm/kRjNu32ANd69YRappuEqO5trnA6oPWpxAnHZfQNdIC7rYRGuB229ausL+9ilzTZawIc3JIBilO0nw9SryO9iylOU3HWLIQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQfLDO7u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CC0C4CEF1;
	Tue, 16 Dec 2025 06:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765868041;
	bh=HlB4rvd0gE1zxwKcPPjkgwihp2trB2AYciEwnFA7cSE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tQfLDO7uNYdyb/sRdRL9yxT0y5CgZn4jMOG3SOE2frN6wAZpSj8syRMx4R2a82z94
	 co6p7tuIKHBRRoI4KXMSan/DwVyjkjFNjFiAk+e4CPe19ilfTHHHJdd+LvJV+Qpbwc
	 coJkK6KGTst2WdIa5aR+qkD0uF5OUwU422HU3l8OqCjhS1D7D1nzWdEmQeDtm9JHe0
	 uEVT8dA77WhbQqsDFhs+wj/Iwr/VrEHHd9c3vjLss4tkJdz5eb1Ab/cQ9fNEkcnDZb
	 yVMrSah4StaIYZAZmIQpFfABj7wRiDbuwNgyO1OZ7YTpznh1we6kE2TxBmzKD38zBQ
	 KwS0ZUJdHSZHg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20251212203226.458694-7-robh@kernel.org>
References: <20251212203226.458694-7-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: samsung: Drop s3c6400.dtsi
Message-Id: <176586803906.20461.7032133342686064495.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 07:53:59 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 12 Dec 2025 14:32:13 -0600, Rob Herring (Arm) wrote:
> This .dtsi file is not included anywhere in the tree and can't be
> tested.
> 
> 

Applied, thanks!

[1/1] ARM: dts: samsung: Drop s3c6400.dtsi
      https://git.kernel.org/krzk/linux/c/549089586a4a45720702c3bbc9fd4fa2ad60ac6d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


