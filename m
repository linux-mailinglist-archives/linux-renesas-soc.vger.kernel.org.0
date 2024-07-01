Return-Path: <linux-renesas-soc+bounces-6935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EC91E0B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 15:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CA891C2131B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 13:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4699215E5CB;
	Mon,  1 Jul 2024 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pAsSCj1O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A258046525;
	Mon,  1 Jul 2024 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719840600; cv=none; b=jS02mCr93p2MSf3rk5sBpKJSLaeXHQhE2iS6zDeaHjRppz7m/ZiOSftYDDsrZjxqZDKVAutOnJ7Q/HeJGJIH3RkP9ZZ5HEbaOdaaDuszzlxbuGJdjL/rJzotnZNPVSVz6Wuahyo2pxI+NE8ihPDt8j7pedm/qzO8jvzqbSgleZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719840600; c=relaxed/simple;
	bh=N33YnknYZdI99Z5fUnYlO+EWksB0MLJlAabHAe1v+As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJratd12L5bBSS8wbt+QFOwNp5LjZCbF3am1OED5UNpBDN/v8uSsLGIBj+lFQiZCkpXQQwGqcRWL1uqRGz47l1sQsrxEqJBoQfduZVmx5RxH1OkxJF00r6840TWLIvN4/O5xFxGNSEZMAU+nEzYq0vAoHrBANi/AWXkucypUSY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pAsSCj1O; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JPobowfqZNCXAQsrqYlBdjImKeL9t2WbB4Y9awxzs/c=; b=pAsSCj1ONbfdXxH0TI+4IdimTP
	ZVMeMMjJjzVjqpLM+IR8DRyqWowsrIKRNW1SYRi0MmTXj3S9xL7DRm9f/iZ6jJJhbRE1fSLFGXhZL
	az566878vwKrG9DxBQPt+oWshCoI19585vs56F0XRn1QRSklItHljyESlt8KVtz+Pq0E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sOH6G-001XsE-04; Mon, 01 Jul 2024 15:29:44 +0200
Date: Mon, 1 Jul 2024 15:29:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
	kernel test robot <lkp@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
Message-ID: <9578dbe6-6e42-43a6-a5de-65bf75ce6131@lunn.ch>
References: <20240630034649.173229-1-marex@denx.de>
 <20240630034649.173229-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630034649.173229-2-marex@denx.de>

On Sun, Jun 30, 2024 at 05:46:18AM +0200, Marek Vasut wrote:
> The rtl82xx DT bindings do not require ethernet-phy-ieee802.3-c22
> as the fallback compatible string. There are fewer users of the
> Realtek PHY compatible string with fallback compatible string than
> there are users without fallback compatible string, so drop the
> fallback compatible string from the few remaining users:
> 
> $ git grep -ho ethernet-phy-id001c....... | sort | uniq -c
>       1 ethernet-phy-id001c.c816",
>       2 ethernet-phy-id001c.c915",
>       2 ethernet-phy-id001c.c915";
>       5 ethernet-phy-id001c.c916",
>      13 ethernet-phy-id001c.c916";
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406290316.YvZdvLxu-lkp@intel.com/
> Signed-off-by: Marek Vasut <marex@denx.de>

"ethernet-phy-ieee802.3-c22" is pretty much pointless. I don't
remember seeing a DT description which actually needs it. It is in the
binding more for completion, since "ethernet-phy-ieee802.3-c45" is
needed sometimes, and -c22 just completes the list.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

