Return-Path: <linux-renesas-soc+bounces-18808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3CAEA621
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 21:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3DD6189C560
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 19:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936E72EF667;
	Thu, 26 Jun 2025 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Elq4s9t9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E142ED155;
	Thu, 26 Jun 2025 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965001; cv=none; b=l4EuyawgMi48EXQKJFZjzQwIUwin7KxprWfKIMT4285rzKVwbt/jr4wDi7AtcEjyTPn8hyHigdOKFujOs/Co/6V+uSvbXXjch49KY6l8iuXAamF+hpp6UkOoEm8B9zbGuDv78GKIXpt+4iQCnfcOiR9VEuVEtmiCa2MbvyHztrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965001; c=relaxed/simple;
	bh=XZlMQtOpbNIhRZ9pHesx/nbn3+6U5J4RnnbP/llCorU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RC6G4FkTTtfZdwKAwvOaESs+a+qwbpmuYSXnIGE6wSkq6RfBYSbvzUjZJrcB251HhkR4rn3bXP+BVkgwTpQOrlxkFt0VXfHa4Hbh8//zKYhKk6BrOTkDjyEEmEMpUH/MQXm0D9QvU2c9Y7ZDawxc19ygwzwsVIZcA6R5QyKqtQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Elq4s9t9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1224AC4CEEB;
	Thu, 26 Jun 2025 19:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750965001;
	bh=XZlMQtOpbNIhRZ9pHesx/nbn3+6U5J4RnnbP/llCorU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Elq4s9t98ApYLWb9OT7lHEbs4xMsxf2C5cA+eNoj6yT+o4TQfi86YXu3fLIiWB1kG
	 3ucymYmROlOKDVAhNxpCWdQMU3E24QiddwEyG6ADo5oy0+OSvcwfNXYP7shPa+fx1a
	 zjx7onUFkYHoaozmapAO+gAV3Fp+iv/5jS6/5QN+ayMIC31UXxLVaNpr7UXrGR53IN
	 rryDOgP7oY35ZfNS9ns5pZijkY/7T/wmDPTiaChHmxDuBA/m/WOD+JyZi54f1IcO8P
	 +7+fCq0+RxDwayCQuOqSi7rdtTcothfgaXeVRHnquI+yo9FGbLew4oVrG7XiHOlpde
	 aUQLSQ6l8qThw==
Date: Thu, 26 Jun 2025 14:10:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH] dt-bindings: net: Rename renesas,r9a09g057-gbeth.yaml
Message-ID: <175096499970.600223.16523078298033164696.robh@kernel.org>
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


On Wed, 25 Jun 2025 10:10:48 +0200, Geert Uytterhoeven wrote:
> The DT bindings file "renesas,r9a09g057-gbeth.yaml" applies to a whole
> family of SoCs, and uses "renesas,rzv2h-gbeth" as a fallback compatible
> value.  Hence rename it to the more generic "renesas,rzv2h-gbeth.yaml".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../{renesas,r9a09g057-gbeth.yaml => renesas,rzv2h-gbeth.yaml}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/net/{renesas,r9a09g057-gbeth.yaml => renesas,rzv2h-gbeth.yaml} (98%)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


