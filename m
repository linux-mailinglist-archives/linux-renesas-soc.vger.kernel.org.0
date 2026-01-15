Return-Path: <linux-renesas-soc+bounces-26890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6A8D2847A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 21:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A8C9300251C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 20:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A0531A7F3;
	Thu, 15 Jan 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsGPH3Iv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A632DF12F;
	Thu, 15 Jan 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507309; cv=none; b=bVJDwhoeGG3fHAsS/4jVCiiej9GIATKnG70spF/E1KDcb3bqY3phq8NBTtAxpUlW/dKu0XQcqRbgB1hMNExrwkhtWrpiqvczyYiV0RG9C5CJPszJFE7nzbKGLf5anIpKbBrht1KDyVdEa3xJXF5GwIpAv3UJfKmKh4C3KJl4dik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507309; c=relaxed/simple;
	bh=zJzmID6LrfZsolTF0bdsRqEDmsoqKjjDc5djAfmj4l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1kY7eAygMAzvPKY+Hlkt0AW6vD3I6r9V3YGx8FbwRPyEnkdy+BpuL7dVmIYTIBkCX2DxFPTx4Ul4Ag3YUl8yHe7gZUJx++iBNgByXXMu/N3GgTzSMmrQg9DiMj66JV/LDBXnZlV9birJDJEVAe7D+WoY5H67y6QI5FLaMMrMfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsGPH3Iv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F28C116D0;
	Thu, 15 Jan 2026 20:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768507309;
	bh=zJzmID6LrfZsolTF0bdsRqEDmsoqKjjDc5djAfmj4l4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsGPH3IvDTZpkDAdmrFSsSJksFXsXDEIwUf4brF9zOSpK1BU4Srqp4VD5TgeQmjXf
	 Gk2JGO/kSrV4sve6e1VR60Aj8rYmr/zOpdf0ZhbOO1IqT/KHxcJLwmyz00qSWt+43i
	 WP8aadjzpLk4qIULQLKbLiMhKDTxrY1SIb2I4WQ8ldhfxI8BJzqnnErUgzFJg4CLub
	 MtbHW6kLsSvEgr3BqOLmdTsI/9WQjn4EiaB64CwcEUiBJsSxni7vb3V4E4z5cRE/J6
	 0HtwBcJpau83MI5acbqCgFRZ5vyUjNJ3vvbBZscBd1Rj9Obh4bUdBn/iaAh2nTRLds
	 FOtRqet6YQP3w==
Date: Thu, 15 Jan 2026 14:01:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Joseph Guo <qijian.guo@nxp.com>, linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: waveshare,dsi2dpi:
 Document 1..4 DSI lane support
Message-ID: <176850730712.1093165.15441480948491259694.robh@kernel.org>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>


On Thu, 15 Jan 2026 03:39:42 +0100, Marek Vasut wrote:
> Describe 1..4 DSI lanes as supported. Internally, this bridge is
> an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 supports up to 4 DSI lanes, so this is a hard limit for
> this bridge. The lane configuration is preconfigured in the bridge
> for each of the WaveShare panels.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Joseph Guo <qijian.guo@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: No change
> ---
>  .../devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml  | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


