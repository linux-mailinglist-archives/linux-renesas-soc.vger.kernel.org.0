Return-Path: <linux-renesas-soc+bounces-18748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B834AE8B5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 19:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B41F3A5D66
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E56A1AC88A;
	Wed, 25 Jun 2025 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIAxI9Q+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C813224F6;
	Wed, 25 Jun 2025 17:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750871733; cv=none; b=C5mBOVE3aDHvIB/49/SugPObJJsidHDxlrxNP2gk0NM6JiCjPLCc9aT7Sr+Qia+AeaRBzLCW3/OFJweSwLQnOQmjV6m6APsyO/0l8DH5EAtE+EG6oBK8zaSIsUzmfJJzNT1liyb9mLl8oWH+PxM3uGAhxu92k0VGpeycaSKnrXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750871733; c=relaxed/simple;
	bh=tsPO0OiBG0PBkJSG9uxmHSEGiRUT65aNlEBWC9J6YaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMfxru8/sPGv/VBM6CddvxZmKRQltgOK85g0w6xVp+UZtLFdaVd12LgyxCwyyrQt0KcJxO7uMBCwyyZsMnX78OU7wcnM3lVBc95fh9MhKzDe33w7oY8y/YikVmDGXGQgCOt4+Ozgej+Gi09gEVyoAtvEYnL24VcIHdaGTKrJDIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIAxI9Q+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481A7C4CEEA;
	Wed, 25 Jun 2025 17:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750871732;
	bh=tsPO0OiBG0PBkJSG9uxmHSEGiRUT65aNlEBWC9J6YaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NIAxI9Q+V8bIHjAs4Fxp6lyInGwd77wN+e9vmBEL9ifR9OCEFHhAzhrvlKGvgHS5W
	 N7hCw9fCHd1xuPRiJSY4Jk8ElbiVC7OjcsaHCvY1KhIstYCJRuc2xIzo3jQf1ZpB6A
	 DV7fO5csG6cSpBbstMfChRSNOoEchn4g1yEKtb8EaeZVSSn5+njtXTuCmzvWFlkKM9
	 OPRt/QlEg+cQJn9yI4LqKLcUth3kBuk6eaBMjfC1xxzdD7MNGEUqHYyoLNc9UwqtRS
	 Su0X5XW80XeRCwGEkcS7giV/udeIDDuHieRiDiMvqJTBPjgTbs9LGckRkB4BeRWBJe
	 DMAt42uMfA4rA==
Date: Wed, 25 Jun 2025 18:15:28 +0100
From: Simon Horman <horms@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: Rename renesas,r9a09g057-gbeth.yaml
Message-ID: <20250625171528.GK1562@horms.kernel.org>
References: <721f6e0e09777e0842ecaca4578bc50c953d2428.1750838954.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <721f6e0e09777e0842ecaca4578bc50c953d2428.1750838954.git.geert+renesas@glider.be>

On Wed, Jun 25, 2025 at 10:10:48AM +0200, Geert Uytterhoeven wrote:
> The DT bindings file "renesas,r9a09g057-gbeth.yaml" applies to a whole
> family of SoCs, and uses "renesas,rzv2h-gbeth" as a fallback compatible
> value.  Hence rename it to the more generic "renesas,rzv2h-gbeth.yaml".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms@kernel.org>


