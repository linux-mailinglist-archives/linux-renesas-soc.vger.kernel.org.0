Return-Path: <linux-renesas-soc+bounces-25048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0497FC7F3BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 08:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E75EE4E16AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 07:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F852E92DA;
	Mon, 24 Nov 2025 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hv+ciIij"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E9381C4;
	Mon, 24 Nov 2025 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763970256; cv=none; b=bKdcufu/8fSw6PRSb8ZLBbm89OXtPnw757OkRgNpLFdu84D/CW0V5n+hbUBeCBI9i6e0mRWC9rRHt7C7zI3KbixrwHk9VRCy4LFtiTW2pDP+iFnj/osR8xw4GuvVFv0bWtWehhntWU4C67IENGQIYb7KOMUdZQIhNQXkJybQuBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763970256; c=relaxed/simple;
	bh=IGnsZJem8ODUTaWQYGiJxbrxJEvUBfZngP/yr/uADco=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhO6iRYR3wdffJC+U6DDFq0QNnhHX1OpYe1lGfiyutkbgonjhRgVFEgAMOO4s3/IxJ/iwlf5PZwr7cnL8tkaSJLFjdTDpAE4qQqS/Usm+AIGKZpx6hZxaRSAGpnZzh7xMErQktj9IBni/K56tiRyrgNPsJrQwBWlj69glBnXYCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hv+ciIij; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BC274C139A0;
	Mon, 24 Nov 2025 07:43:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54626606FC;
	Mon, 24 Nov 2025 07:44:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67D3410370001;
	Mon, 24 Nov 2025 08:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763970241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XjTRK+n1XVbSuqorTHFvg0O0Wc2+5yrpOYwsMZyJn14=;
	b=Hv+ciIijCBCwyXIWDwuaEMarRngTSbhfHxN2wyjs1Jyv49EsSZ26/OeY3dJrbFANJhv9W7
	bACHMxAt6VbHSor1uDgJwzTmO2dk4NXZ45ceAKBtkYqQwlx/aKcy6/sVxWhLmnlDEfIX8U
	G8kj5Om3mnKGjVxnlHYMLpVT21dmFxfy9t+jL7fojNXK4sYTmUDASKbFCGheocEVfb9GCD
	UKorlKW8U0KtH0IbhBA/SIp4eetTFxe3Kf2TagtVmYevW3FQ7kHWlfIkR9JBAVzqRgkO3Y
	dfthU+ALRUDieei2tJ//dup8UkVl7emTTW1euWyzGwqS64OIvsDUmUoefh1cOw==
Date: Mon, 24 Nov 2025 08:43:58 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, linux-renesas-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: renesas_usbf: Handle
 devm_pm_runtime_enable() errors
Message-ID: <20251124084358.06492237@bootlin.com>
In-Reply-To: <20251124022215.1619-1-vulab@iscas.ac.cn>
References: <20251124022215.1619-1-vulab@iscas.ac.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Haotian,

On Mon, 24 Nov 2025 10:22:15 +0800
Haotian Zhang <vulab@iscas.ac.cn> wrote:

> devm_pm_runtime_enable() can fail due to memory allocation.
> The current code ignores its return value, potentially causing
> pm_runtime_resume_and_get() to operate on uninitialized runtime
> PM state.
> 
> Check the return value of devm_pm_runtime_enable() and return on failure.
> 
> Fixes: 3e6e14ffdea4 ("usb: gadget: udc: add Renesas RZ/N1 USBF controller support")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Thanks for the patch.

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

