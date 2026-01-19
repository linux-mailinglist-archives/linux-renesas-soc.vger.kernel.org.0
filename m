Return-Path: <linux-renesas-soc+bounces-27072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBDFD3B763
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27C7330066DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4669A2D978B;
	Mon, 19 Jan 2026 19:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IMSLc4o7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C19D1DF987;
	Mon, 19 Jan 2026 19:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768851417; cv=none; b=LDoXzyHOpVfNW67l7T4vE7H25kbt6ciBkzAmtfL2nr/jY5elNWHyfpFD4Uhl9VGMB3Uni7YcHKF3fDfoOt1+IImhgUwhEOl0mIMs70s8n/A07XqaaeEe/ips5y7s0Yw46/iQJ2Om0AStTsws1sy2LiK6WczrKR41pk985k7tE1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768851417; c=relaxed/simple;
	bh=7eJs1js0kzkykoWC9UfncMbeJwi/Au6UVBsFkGUutdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiRw9j3MAIAfPAGr08Qlz55DI15ARBDzB8iCpQaPizdRFhm/lex4TeJ9p/L4ykGWrOLunPfvJ0y+pl5JOuBQLzEeEj0/AiMBwqBESmz3bzD7SR/ou4Efb9nwdfJfHt3qGzaed1msRJKbEv/tARp/VMHCbVwXJkYKdvTmn/c1NHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IMSLc4o7; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dw11H6w78z9ty2;
	Mon, 19 Jan 2026 20:36:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768851412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1iSB+HjxfdTbn/qJazSyM/WPRoVcW0kk2zyYVSmsRw=;
	b=IMSLc4o71oCuud3/mgU0vqtL2aGaucGMYe9ldiVOXDBvIysI1UwL8QpXHe+T8/cx9O0/dh
	GaMbYmma77UIYQGVk3MvmFG5wsuRSZbZZmX58Oj6LrSIUBNeJ3/kDKmTzov/MNwmdMEjU3
	uK0PJHjQ0ozp0TuAJEafXJgCSLKLBo0vZp6rz6cvfWiP30gYV6FzZ+ZPio8TZkJopoTHiV
	+N8I2bn5mnlkc2JLlCfoH415gxCRD6xA0h6Ch4hI33TmJcCzi6a4nfqJjp1CxDnOWuTI8G
	ZxuBrRzivHNazLkGdhLf4dsYyFIxbZ/8OOv/qYBwXLC4EREELABrqKuOFpFr7A==
Message-ID: <d921ff48-caa3-4d79-80e8-35c4848258da@mailbox.org>
Date: Mon, 19 Jan 2026 20:36:49 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: rs9: Convert to clk_hw_onecell_data and
 of_clk_hw_onecell_get()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: hroataoz38uemmwm6ipktpdnc3ty38xi
X-MBO-RS-ID: 5c469c576e36adb1d1d

On 1/19/26 4:23 PM, Geert Uytterhoeven wrote:
> rs9_of_clk_get() does not validate the clock index in the passed
> DT clock specifier.  If DT specifies an incorrect and out-of-range
> index, this may access memory beyond the end of the fixed-size clk_dif[]
> array.
> 
> Instead of fixing this by adding a range check to rs9_of_clk_get(),
> convert the driver to use the of_clk_hw_onecell_get() helper, which
> already contains such a check.  Embedding a clk_hw_onecell_data
> structure in the rs9_driver_data structure has the added benefit that
> the clock array always has the correct size, and thus can no longer
> become out of sync when adding support for new rs9 variants.
> 
> Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> While this patch applies on top of "[PATCH v2] clk: rs9: Reserve 8
> struct clk_hw slots for for 9FGV0841", it can be applied or backported
> without, by ignoring the change from "clk_dif[4]" to "clk_dif[8]".

Since the 9FGV0841 is the biggest part in the 9FGV series, the one-liner 
fix I posted is better suited as a stable backport. This rework 
shouldn't have the Fixes tag, since it is only that, a rework.

With that fixed:

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

