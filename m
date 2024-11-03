Return-Path: <linux-renesas-soc+bounces-10263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C259BA77B
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Nov 2024 19:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA9381C20AA2
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Nov 2024 18:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04A6187879;
	Sun,  3 Nov 2024 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epXc8mpm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB5B1EF01;
	Sun,  3 Nov 2024 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730659821; cv=none; b=EyddzOyILq2YCddkLRiU1n/+Z0K3K6zZI3asBTF0Pua86+6FQ05pw3tXWt9HFyn37Cufo2WqXelB/wJ0zjRVF4O276WSN73JoRkoAfSkhFkCh6XT6j69k4Tl/X23/+pymrIaQWsGzW4m6tpHXdDNKYmhphUWgdXMmRvl6nFUwHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730659821; c=relaxed/simple;
	bh=ArlCszO/6ZYqC0Nxcu1SiuF9ped7P1H2Pv1TYd1KdWQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b7wcIIYRpRCXwu7iphQaCz/AEa/IT1FkFeCeHjFL4qnjLfspzfDr8FXuWUbhV2rXAnkQYyV0BTD39UzddPJRxhqlf8X8uZ3WjUUP+Dv5iLfWsE7TdukRE23gXIoQHm2lt+SsNKUSMseQ1+drjKguFoK/8MiOQ0PYvMqEScLft/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epXc8mpm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B427C4CECD;
	Sun,  3 Nov 2024 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730659820;
	bh=ArlCszO/6ZYqC0Nxcu1SiuF9ped7P1H2Pv1TYd1KdWQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=epXc8mpmbu1A3yIV5gwMiNlU9xSL9I1R53e+fQrOJcA+pIN824jx7zjW/m8aeLeUD
	 nyZF1egnapYatzemJSJrQXccCjWpC41R+l+j9fMug8i6OLlVusRM0CTtZUQEZIuBGl
	 2JUK+5865rC0qKekc/0XlTpMx8/HfCmaklhz0+JFl5pueyd3OGCus3fwQavXSfyh0F
	 MumenGzQl+y5dMc3XDXcBEPrDjbF48Sz5P9cDu4Jv2efcT3vEZq8WBZXCvB1W4M35h
	 Y+Dc8H2gFYbuH2kLrEGbqrld7XgTRmd7mrXiAg2DWVbH37RKbmFJ4JmcgEMafmoERD
	 cwor3islUUJNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCF038363C3;
	Sun,  3 Nov 2024 18:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv4 net-next] net: dsa: use ethtool string helpers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173065982851.3230954.2623889336248911818.git-patchwork-notify@kernel.org>
Date: Sun, 03 Nov 2024 18:50:28 +0000
References: <20241028044828.1639668-1-rosenp@gmail.com>
In-Reply-To: <20241028044828.1639668-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, florian.fainelli@broadcom.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, kurt@linutronix.de, woojung.huh@microchip.com,
 UNGLinuxDriver@microchip.com, clement.leger@bootlin.com,
 george.mccollister@gmail.com, horms@kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 27 Oct 2024 21:48:28 -0700 you wrote:
> These are the preferred way to copy ethtool strings.
> 
> Avoids incrementing pointers all over the place.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> (for hellcreek driver)
> Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
> 
> [...]

Here is the summary with links:
  - [PATCHv4,net-next] net: dsa: use ethtool string helpers
    https://git.kernel.org/netdev/net-next/c/f12b363887c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



