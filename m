Return-Path: <linux-renesas-soc+bounces-22897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E0FBCE472
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 20:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93AC53AEAE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 18:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B62227BB9;
	Fri, 10 Oct 2025 18:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJpSuy6Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F332C8B;
	Fri, 10 Oct 2025 18:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760121963; cv=none; b=rfLYUC7/tJ/nua+aMweTRmW8AQX+eiUHNapzgnjrEpBoQEU3WsyL3pUqbn2QhpfbOxCGx7RTgmVlC5hZ6mpgF5LE71U0qOwgnc5cV1PSDNDqMEAriWo/UuYXlVe6EwHxdBndOCUSWL9N7iK6QGGKbxBeUgF25h04GHnGG0SQQhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760121963; c=relaxed/simple;
	bh=/RQkKmofIpTcP5IxDbViET4LQva955Hk1A6mQ8+698A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjDKSZG52+Vp0lgqPena47g3dqaNd39Jkri5fw9yJHGvSLV8GppO29Mnde5YMedCSzyLFmmSx6jQJtIHyiLAy7y+CPod36OWB7Ac9IFAXoTbuQVOoa3GKUPrJfY67ar6QB5AAWdEIzCmBSoMZPedgNS6EA5xaRBm2d/a9Z745MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJpSuy6Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880D9C4CEF1;
	Fri, 10 Oct 2025 18:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760121962;
	bh=/RQkKmofIpTcP5IxDbViET4LQva955Hk1A6mQ8+698A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJpSuy6QLNiZepjO1i/r9yn4XyKjK8af2RMEVi9vJQPOa0cQBGykqdlOd7ezfx4Qm
	 VQO3orKj+KV4q88mxx4V5o0G/RZ96P4dPmuaMIEBgZkCcFoHg1hqwRKzxo7FC+jWCL
	 bTLHHdOu7OoNEAUpHCynugIsv/3xe6w2/ja6emg0JRBnLatxMx9WUCruDnQzIZoeiM
	 r/MPvV0zCUiU4/bDOSe2zqfReyPbY3X4ZlnBVHFxI/HU3BPOy6tozCndzzuQPr3zOt
	 PynJpJjbpWo7WGC2TC4qe5rFzVNLnmSiIQRnZ60mz+WvclrN541aqTH20dg4epely8
	 Nyolnk19KiaQw==
Date: Fri, 10 Oct 2025 13:46:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	linux-renesas-soc@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: bus: allwinner,sun50i-a64-de2: don't
 check node names
Message-ID: <176012195864.688896.9808018119386389754.robh@kernel.org>
References: <20251009183835.5533-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009183835.5533-2-wsa+renesas@sang-engineering.com>


On Thu, 09 Oct 2025 20:37:43 +0200, Wolfram Sang wrote:
> Node names are already and properly checked by the core schema. No need
> to do it again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
> * dropped superfluous '^.*' from the regex
> 
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


