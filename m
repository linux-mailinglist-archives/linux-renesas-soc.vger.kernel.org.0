Return-Path: <linux-renesas-soc+bounces-6575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF9910E17
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 19:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E5FEB240AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E0E1B3736;
	Thu, 20 Jun 2024 17:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLJGINxY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86CF17545;
	Thu, 20 Jun 2024 17:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718903232; cv=none; b=h4lO98Mgk+i+AJWes4oTB5Pkssv/XkFuyZtqJ+oTY3rTNHrYhKV1AIXuYeJGJJlfO3JC0JQtyd7b9ls8nuVYVaW66d2wA0/3GFSc76sOO5olMFg4vllW5wRDoaNkOfJk+PA6FS64dSoMeDTB5G65XBjuONCd6IdlV1Ef9wppvgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718903232; c=relaxed/simple;
	bh=vfg6ofMLdebvhnvtThIAkjpo/NtZuM5xMOktgv6kglw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJ5IM0rsutkxl1p92yGn3Ru8RueyJ3hA8R7fw8FKuCeE8NSeI6BjCbVUcjylAQqLO59SffdqLf3qCfy4kVG1kWrTdH85gmgeJjc0fZgRGy68pcnj9QEITK18a0tGFeWDh4KiFUOQctprC6z5ImSZ0Mjni9QSeXwWsC3JQcmLZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLJGINxY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C20DC2BD10;
	Thu, 20 Jun 2024 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718903232;
	bh=vfg6ofMLdebvhnvtThIAkjpo/NtZuM5xMOktgv6kglw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLJGINxYAdM1a6pGCvhkzNz1Ezzv+Z34OST1wXv2RW90eV7rnHQPpIc+9Zr5ByYGT
	 ublI+rs8H3AKXtzfVdEQQ+yDXZAg9Wnccs3Y1br5xG7tP+tSe2FeXIvhxDkqoR22ax
	 k8qvvpwkdMOiCzOulL/R1EeMmKoUIWtYwAZP7jeBqsu96Y4X0XhK+vaIP/uV8kH5Zt
	 z6Aq4oGkOQtgIU0h8H+veOknWFjUtcExgTHo/AXpSyBQ5eZ65uqFAzRtkdrNb8Q6Vw
	 Roj23HkZYNjm+lZwhLGRM1phZ2+XC/le89FRpk8Pz0E0MY7evH2kCdevZ5+wFGYD1/
	 9rQ93L07bu+1w==
Date: Thu, 20 Jun 2024 18:07:07 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: tmio: Remove obsolete .set_pwr() callback()
Message-ID: <20240620170707.GV3029315@google.com>
References: <cover.1718897545.git.geert+renesas@glider.be>
 <fbbc13ddd19df2c40933ffa3b82fb14841bf1d4c.1718897545.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbbc13ddd19df2c40933ffa3b82fb14841bf1d4c.1718897545.git.geert+renesas@glider.be>

On Thu, 20 Jun 2024, Geert Uytterhoeven wrote:

> Commit ca78476e4888f1f1 ("mfd: Remove toshiba tmio drivers") removed the
> last users of the .set_pwr() callback in the tmio_mmc_data structure.
> Remove the callback, and all related infrastructure.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Laurent tried this before in commit 3af9d15c719017fe
> ("mmc: tmio-mmc: Remove .set_pwr() callback from platform data"),
> but it had to be reverted in commit 9d731e7539713acc ("Revert
> "mmc: tmio-mmc: Remove .set_pwr() callback from platform data"")
> because there were still users at that time.
> ---
>  drivers/mmc/host/tmio_mmc.h      | 3 ---
>  drivers/mmc/host/tmio_mmc_core.c | 8 --------
>  include/linux/mfd/tmio.h         | 1 -

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

