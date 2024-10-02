Return-Path: <linux-renesas-soc+bounces-9326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A772298E55D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 23:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9C9F1C223B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 21:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5E8216A1D;
	Wed,  2 Oct 2024 21:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyYOVB/7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69201D131B;
	Wed,  2 Oct 2024 21:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727905032; cv=none; b=MM/rn9HZyMxbuJv9pEoRmowHLPUNrwPG5SHdK6coENh+jRhnR+cqiu7YqmKkkxOcRcoxWLCL0jt1ObSFZ/uGj9WfO7fMUFuQP5zD7yAAduGxnxQRgfiOC+rduDnCxX9oHniSJlKuI4xNNhRq3zHhHLSOo4Lso7e8bKhrth4I33I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727905032; c=relaxed/simple;
	bh=z6yZ/ShbdkhxihwxYPu4zhNzEVFScmUJDYnzhuSEUtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2aprbHq+lLNSPfgskM6rz4f3u0eetuz/XG7VKeFmua5m+ZHI163HiWXuz8mY500inEmzVzIVspGWNZbg1WEhaSEjt7IzZ/0JGCAT3PeoTj4INCcIk6BkBaoITDpUOfIpCGwXz+EjGFYSbrNiGF+BwMHoLzc/mjaSKHwNBYJguM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyYOVB/7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52124C4CEC2;
	Wed,  2 Oct 2024 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727905032;
	bh=z6yZ/ShbdkhxihwxYPu4zhNzEVFScmUJDYnzhuSEUtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyYOVB/7MX4vW286i/lc3uLniyT+VM0KcB4OrRqaxj3GMaNOJvjvROoU7bok0cG2T
	 QUFRfFoV9j//A5+R4N7g6GQTKSYAcpDMHR3yePhsR/NRETD1J4mJZ/JNfHiTWFxq4S
	 9BKrPtdRYV3GRIUuKK1BuEQ+9/+YLqU00PJzuj8x9fqK7EB3XK6ydRbBZMYuILCE2q
	 s0Qf5XV2vF4JGltY7jYvtjAC+um2QooDU3iQGFd7rkOwskM0QlSZwVq6yoI+yTr8rc
	 vnrWyMsyvo3dIl7/JrgQc6d8oNT+GJVBBFMG+zY9ww/9y7EXUUq8yTP7WL1yayH1LP
	 hCN4Bu1h7hXew==
Date: Wed, 2 Oct 2024 16:37:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas,usbhs: Deprecate
 renesas,enable-gpio
Message-ID: <172790502576.1347171.2357265482413319250.robh@kernel.org>
References: <cover.1727853953.git.geert+renesas@glider.be>
 <e9cf476ffac794bad7b0860dc89afd62a9ebc812.1727853953.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9cf476ffac794bad7b0860dc89afd62a9ebc812.1727853953.git.geert+renesas@glider.be>


On Wed, 02 Oct 2024 09:35:12 +0200, Geert Uytterhoeven wrote:
> Commit 2071d0968e564b4b ("Documentation: gpio: guidelines for bindings")
> deprecated the "gpio" suffix for GPIO consumers in favor of the "gpios"
> suffix.  Update the Renesas HS-USB DT bindings to reflect this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


