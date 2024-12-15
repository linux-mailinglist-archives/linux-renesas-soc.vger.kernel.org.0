Return-Path: <linux-renesas-soc+bounces-11351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8463B9F269A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Dec 2024 23:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B5031885603
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Dec 2024 22:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BB71BD519;
	Sun, 15 Dec 2024 22:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAgKAGse"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC1E1E502;
	Sun, 15 Dec 2024 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734302307; cv=none; b=X5+aZL7358HhnY3VIAVRBSGgviML+0qaR2Ry7pezNxKgk7ilA00POtdbbYt3H8B7SH58nF/oxusCDbC06njVjKPYj/42bCuV9Ilp6bI2SFgCF1SA8iz0spjCSnqWyGPWHlNcOZVPYmFkXHGvPzt3dlGaFQsOc2J9rzthUiG9dsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734302307; c=relaxed/simple;
	bh=HEHav5FT/SmaHg6TudEIA9CJ7AFKk/9Sy6PJHM/fkt8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GnBLb2z+31Tk/FaEyoaLasEnSsmiGmc6i92+Ufsw95ouZr9CCC3WZWqapHz1CW1VfPHTrpMiWcIi/ZomhRYulSFXIBcznLyV4N1JwsWoYQDZFutJ6DylI7dDrvGfeo0QSYHMifIp+9unTVg/KO0wTTBmueCR0dCDRJVuBYHVsVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAgKAGse; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5230C4CECE;
	Sun, 15 Dec 2024 22:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734302307;
	bh=HEHav5FT/SmaHg6TudEIA9CJ7AFKk/9Sy6PJHM/fkt8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jAgKAGselq2632Eh3Ty4sEgzlqXCYqPUjcvsi8goLxbHoCILdw0414Cs+U38bsUwn
	 URdd3+Ha9lxgtTLyix1B8WAK6CEH9nN3lW3Fln0+kKgi4SdKgfKhrI1atgnLjSdj02
	 PtBAukX5wnSXzcdvXIWBIn9HYkqjLr50FXMYPpXWHhagMfRuBgsHuhGyIeFcoBjaAm
	 s1wJ1TRyhHNyHdRwzvqbS1Rnyy+NMper3CRva54ULiEc8/l9CSi563GfpKt7/rN72j
	 cbayPIuQxCaP+WQikpNtnj9a2lR69dHl4iJ2BAjXJq6qLWDwyUjBcL4GVfub9ruIOG
	 pBJ0nMEhMHr+Q==
Date: Sun, 15 Dec 2024 14:38:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
 <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Michael
 Dege <michael.dege@renesas.com>, Christian Mardmoeller
 <christian.mardmoeller@renesas.com>, Dennis Ostermann
 <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net-next 0/4] mdio support updates
Message-ID: <20241215143825.7ae9f6a3@kernel.org>
In-Reply-To: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
References: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  8 Dec 2024 20:52:32 +0500 Nikita Yushchenko wrote:
> This series cleans up rswitch mdio support, and adds C22 operations.

This series doesn't apply any more, please rebase / repost.
-- 
pw-bot: nap

