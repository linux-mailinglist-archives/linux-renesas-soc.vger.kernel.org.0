Return-Path: <linux-renesas-soc+bounces-25728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B1CB9E7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 23:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F768307A234
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 22:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B56228C84D;
	Fri, 12 Dec 2025 22:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="dRVPQAQU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441C619258E;
	Fri, 12 Dec 2025 22:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765577187; cv=none; b=Pgfjhbuu3G/5GsFvDO42Kk1izt3wslVmel8WnGVCaHPO/33xmC0rdRddkwTLTJIgJrp+U3ahxNPPnv+4YZPl3U14VMJOGN1w0qPDwi/AGZd+/yYUPyN/d6b46frMk1MkCQ2WGghcI95igy5hcqj8PBx2SzCjEpaAOt6S8rYf5UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765577187; c=relaxed/simple;
	bh=gPwKxCd2LVBnJ4p5fX3ephTehUZ4nezWU5qgNY16S14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NpdJPEWzgeiLoIgy9HURF1Qnk29XAfsQOrCtuBDGdvE3xxiwBoOieP/9rV5a8gkErUQ769DEky09SMUR6iVrpq9NBaEmPBYm39IEQEjqzH//JdjXYHK6C2r7ASfvx0l/GgUXeEz94d5wUBJJERpPdGkFQkGWpaGRA7OiXGHODz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=dRVPQAQU; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id C6415DF83D5;
	Fri, 12 Dec 2025 22:58:39 +0100 (CET)
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:6d9f:c3d:adb3:41ea])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 811066012D;
	Fri, 12 Dec 2025 22:58:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1765576712;
	bh=gPwKxCd2LVBnJ4p5fX3ephTehUZ4nezWU5qgNY16S14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dRVPQAQUwrYpZ+vlWxvBAV0aRc3cx/hfMjdv7NoQUmjhWlqo26/6F/ZlYvnWXsWJL
	 ezQkixGbeA5jyETgHYl8xz3Tcl+FZnrv7JCQsf+gHBkkxvYrm596pNcoWvL8miXCRk
	 yeXrt4wsmxVbqJFHPTncFTBBYULcDwWjua4K89L/1wl9JoRmjxlMKWQTDkQ4wWgzaH
	 FzcJDhLzRzi9Zu2zjgJMmOZbS+S2TF6HwoE8LUjHmlAOntGkTzxI335x1/DWjC0aKP
	 oTpNXFtSzpNeiSqWQhbZdWu9Lk+gR8oedCbfeG8/1v8A85cQV7cEFjf1kaJpxLuKDT
	 8dJno7OoFsG8w==
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Daniel Mack <daniel@zonque.org>,  Haojian
 Zhuang <haojian.zhuang@gmail.com>,  Andrew Lunn <andrew@lunn.ch>,  Gregory
 Clement <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  linux-renesas-soc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
In-Reply-To: <20251212203226.458694-4-robh@kernel.org> (Rob Herring's message
	of "Fri, 12 Dec 2025 14:32:10 -0600")
References: <20251212203226.458694-4-robh@kernel.org>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Fri, 12 Dec 2025 22:58:16 +0100
Message-ID: <m2345fmkg7.fsf@free.fr>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed

"Rob Herring (Arm)" <robh@kernel.org> writes:

> These .dtsi files are not included anywhere in the tree and 
> can't be
> tested. They have not been touched since 2018 other than 
> clean-ups.
>
And yet, there are used by people using pxa2xx board with an DT 
support
(like the mioa701 for which a board file was never merged).

If you remove pxa25x.dtsi and pxa27x.dtsi, you might as well 
remove all
support for this architecture from the kernel, as these are the 
building
blocks needed to make it work.

That might be what should be done, I'll let Arnd and Daniel 
comment on
the future of PXA in the kernel.

Cheers.

--
Robert

-- 
Formal Signature
Emacs 25, org-mode 9, mu4e 1.0

