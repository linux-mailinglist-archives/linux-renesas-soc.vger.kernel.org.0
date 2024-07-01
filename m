Return-Path: <linux-renesas-soc+bounces-6934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B9091E0A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 15:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7823D1C21537
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 13:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B96F15E5AB;
	Mon,  1 Jul 2024 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mdFUZzao"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F2915532E;
	Mon,  1 Jul 2024 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719840405; cv=none; b=X04W3z5HBpCGWGxs/tptat4UAVop3MiqSKeYzqhjRBJTTBl1bnSdd/1fceyHMuidfAq1i9xq2wHY0QvVoLyhz+xjBzoAl/hlp6LPEP4n4ehRXISPUbo0RzO6H4ZaZK+r022wKBziR3NmLch6Vz5oaryDkLq+9GLmtjpFmhfVj5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719840405; c=relaxed/simple;
	bh=WmZxVpHz/uYGQqfBbXLkXjVjWLhoDK6cI32eGgbv13A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RC9ieNV5DeTS9+js3cxZPErZRt1JsGT8A09nNaYJixI0sZ/P0ZnX5vBGDGpI2h7t8BWlqgBPnlJnjtANN/O8OOvgaNeaKTRg4/r+SaE514drO1hoZxk0EX+C++znwqXhkQ6/w+VWRSILb5l55UZKXd9GC5xzKDQ9kVfccsRi9/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mdFUZzao; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m6yAbD0stg+qpxcyNYy3fVFDsM13TjSUtwUOVW+A6RA=; b=mdFUZzaoBNA9ZCiomkFHF/CkpG
	tCP1MVGJjaeqh2F381oZg9P1B4rIbFq9pyb98FX5CzzLrzOh0ZY53DzxgqD2GVue+wZgtPCN5qqkA
	g6/8XIPMQo1nKmyAPPJa+XdkOeFjvLAC6W0WWxu0bJg0wbHpjRcDGtiuJkghQkxeoJWk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sOH37-001XSp-QZ; Mon, 01 Jul 2024 15:26:29 +0200
Date: Mon, 1 Jul 2024 15:26:29 +0200
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
Subject: Re: [PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
Message-ID: <b2916c07-e286-4e7a-854b-5c42771d0065@lunn.ch>
References: <20240630034649.173229-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630034649.173229-1-marex@denx.de>

On Sun, Jun 30, 2024 at 05:46:17AM +0200, Marek Vasut wrote:
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

