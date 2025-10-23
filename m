Return-Path: <linux-renesas-soc+bounces-23493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DFEC00D2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2AB188660B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 11:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA01A30101D;
	Thu, 23 Oct 2025 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKNsRUHF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17325A331;
	Thu, 23 Oct 2025 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219777; cv=none; b=lMbCcuvjV70b2EZFrdEDvyx8vG9HQFY9i5Zk4YcueTY5NWIEEyaw4FrZtmy6WAL8GjKZQLYZZ05ndsvsoXOfjHQlKxHe5BUNO5+fBRBdkVuILaxaO6IqjMvaBD+/B/masXAwACSHfzRH7CqFUReNyl7yYCb4pWN+dY4+oTa7Bm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219777; c=relaxed/simple;
	bh=VLTyMEgWZ26DVoXr5wDEctO7Ua1B5nMgdZuBZlcAuDg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nIjTw5LqsOHUoeM1tpJc9QMgWogpRvmONzBsN73Q5ZJ2/H1OCKTFidOaHoadrHDjMQv4v5zLQt9GT5ThTwxFvOzSiOpZlCKB9FJSwMPa02FoDzvPDX8mIhwWisl77uX9rYyab/JhhnCR4iUTGWNqG2N5EDWzHrZp2MfSHoBVwII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKNsRUHF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A65C4CEE7;
	Thu, 23 Oct 2025 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761219777;
	bh=VLTyMEgWZ26DVoXr5wDEctO7Ua1B5nMgdZuBZlcAuDg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UKNsRUHFLyT/slj/vWpIUoPyLc+Z5R0htSaXKUK2f2YIjWJof3GMmt1XpMPSh45Ic
	 CeBV3lWxibb7/hz+3jXxVA97JoexuWckqwg2PqkhGXEvsRkKjuTJPTjbfCBUF2BRTG
	 +ORbldyS5wBrTMAiC+EloerxDpX3JwyziL7DOUt4+89za9MLLIoNIDiZgP0FqI8NTI
	 ccIf2Xw9anlvFZnA4H+qA5X4fQmSzVtvXGBatkzGw8+4OEfDgacVKMtqvk6uyHEwJ8
	 RbuTNhCgngwwFWRZ1Y/hvdOIiRi5v2tFAsNem2lctFy0Kfr49lBB5XB83gM/MjystB
	 mOGegRuW1g/Rw==
From: Lee Jones <lee@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251023065610.2855-2-wsa+renesas@sang-engineering.com>
References: <20251023065610.2855-2-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH v3] mfd: da9063: occupy second I2C address,
 too
Message-Id: <176121977532.2102421.3342566348531968923.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 12:42:55 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 23 Oct 2025 08:55:59 +0200, Wolfram Sang wrote:
> The second address can be used as a shortcut to access register pages
> 2+3. The driver does not use this feature yet. The second address should
> still be marked as used, otherwise userspace could interfere with the
> driver.
> 
> 

Applied, thanks!

[1/1] mfd: da9063: occupy second I2C address, too
      commit: 3bf76786c95c52bd8cd065061126b3006a0177ed

--
Lee Jones [李琼斯]


