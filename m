Return-Path: <linux-renesas-soc+bounces-25673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB7CAE4B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 23:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ECEC305A808
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 22:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A55921E0AF;
	Mon,  8 Dec 2025 22:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="u/94yr7V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0D32E3B15
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 22:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231796; cv=none; b=r7WCnCIJVGXofCxK9/q+ZcM7Xgn0U0w1a6JMRUb+wILqCMjCH7CEw73bn0v/2B76Ub1DktmQG0TBDSMKpHcZ9gosi70HIKySLj/xwF6/W0Ka2foiGGCsgtxTAVJdzwokU6GosSm+ucn2Rnj122XF13bFAKzlSztM77colMan1t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231796; c=relaxed/simple;
	bh=J8irHp6MbN2c2a4RVyStaynsf/OasjHQTErx7VEKAK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8MdpBo7SXlKBRJgJk28LbKcS1SxAFjRw3yiPQZeWuHB3AiNlMbZFFeae0CKSlEGt3X9JHHrRti39OPDffdHvDMpDweLgfCKbBwSIA5Fb63QOzNuaSKFes/UK6HmNFqBhhZcY1zFPxUQzvmZOf/RE7UXpPHlrDLZSWycw3f3p9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=u/94yr7V; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 25E901A2043;
	Mon,  8 Dec 2025 22:09:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9AF5606DD;
	Mon,  8 Dec 2025 22:09:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42453103C8D5C;
	Mon,  8 Dec 2025 23:09:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=IpPBmn5Por7VIp81eYBe7WxjsEyiLaoPiOP1GCzp0vM=;
	b=u/94yr7VKJoFAIT4XNcqfKwDGfDww8jQcNrKa80RhoiKz8dI10C+jw63Z8IKyGl+8FIQcC
	PLlFBjx7EFH64SlaAXhzNxWuLf/TlijbJKQUDTnIArKKzcB4Yb+8jGiemMQM+dgg7Rkmd5
	hjc9IEAS1Csuj2rVZMPO9GySBF9PpKAUWMowLF0M1SlbSEyxqbK4Ga7O1F18GyYWFlw637
	ER4ttJKWEiRbwFH2QaFkaVzw570KweYOHZ4tuH8Qd0+x3VeXOzNlbCbhjjHtw96+dMm3m/
	UojUMoSzE9zrBx2IsNwubh8yNpSGtwBYF55SslsB9gD3JOj9nejB+BHFOOsvtA==
Date: Mon, 8 Dec 2025 23:09:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: claudiu.beznea.uj@bp.renesas.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] Add RTC support for the Renesas RZ/V2H
 SoC
Message-ID: <176523152343.342815.5815704941932518377.b4-ty@bootlin.com>
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 07 Nov 2025 21:07:02 +0000, Ovidiu Panait wrote:
> This series adds RTC support for the Renesas RZ/V2H SoC.
> 
> The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> (r9a08g045), with the following differences:
> - it lacks the time capture functionality
> - the maximum supported periodic interrupt frequency is 128Hz instead
>   of 256Hz
> - it requires two reset lines instead of one
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
      https://git.kernel.org/abelloni/c/4800046b56a5
[2/4] rtc: renesas-rtca3: Add support for multiple reset lines
      https://git.kernel.org/abelloni/c/6ada8e24238d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

