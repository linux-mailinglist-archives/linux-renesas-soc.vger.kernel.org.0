Return-Path: <linux-renesas-soc+bounces-5697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1888D4874
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 11:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AAE41C23320
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 09:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B490183962;
	Thu, 30 May 2024 09:27:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B192A18396B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717061220; cv=none; b=KrJNtIvKVRyCS4vpUD6944Rapu4mpQ9+zb0g7pW4wBMIPWJJvwH1tzdQ/MPNq0WTzFBEJGTDh/vYz3BH44y5FMheTyaLnNV9wdQj2eiEoqeB+OYFNdrj869e1L9YhbzxZhfIwkodDa1QIUzCo8n6/azEUZ8OjL2wEeknGOj33WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717061220; c=relaxed/simple;
	bh=TBaX7vs8tuzXYNNm49/SPeYDoAXeXr+3vgwskd3zd64=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWlgfbvIEoHz3e+ig0PaW8RuMLCvCLC2CJtLmbxdl+UT3Jm6ZWYPXQC44YXvKmB3xAl4nvzZBM15vaW6hZqVw2CQ71BHDB4jIuKS0AViOieR5KbC+KiNFOfxoUBhmF6X60vGabBshZurruqEeuh0FNerg4T98CQPlPnlonPQzrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id c2069fa9-1e66-11ef-8e2e-005056bdf889;
	Thu, 30 May 2024 12:26:56 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 12:26:56 +0300
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use
 for_each_child_of_node_scoped()
Message-ID: <ZlhGYFM6iVlGjZk-@surfacebook.localdomain>
References: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>

Thu, May 30, 2024 at 11:19:29AM +0200, Geert Uytterhoeven kirjoitti:
> Use the scoped variant of for_each_child_of_node() to simplify the code.

I do not see the point of this patch. This makes code actually more
complicated, and I'm not sure the code generation is the same and not worse.

-- 
With Best Regards,
Andy Shevchenko



