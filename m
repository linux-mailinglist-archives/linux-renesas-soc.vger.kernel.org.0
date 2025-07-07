Return-Path: <linux-renesas-soc+bounces-19291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A38AFAB4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 07:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6805A3BBE68
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 05:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0242750EE;
	Mon,  7 Jul 2025 05:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TCHUcLQq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41748279358;
	Mon,  7 Jul 2025 05:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751867735; cv=none; b=MevhyR2RioQwEcToQCRPScaM6Biwh/1kbx55IqvqH3scn2M5Rg7oR+YrYcdJWhmQocHlSimdovXn7oE35aySxBJ82U/1v5Snmc2tojki090jGBCfvqHVSWsTQu1ZknIfKnoLhKYU5koIWKewT1oWVDHZK0owSIg89q3H7uVyJHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751867735; c=relaxed/simple;
	bh=agT+rksJrE3ABKNsxwdmU+u2gNiWvtWgQOiuxjDV/vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqeWl3zxAk7eyfpXcbHMyif6kMjvOFLlvWUMCSuzzgiTudVSMzbnZPyBx2Nr/0Odcjd93rBYgIOL3pCZC20dPTeBTaAL3Zi1mAFU1Z+1lX9dPwa6S+M5BPqLIJd8Vy5gzwnoxDxYYBDd3PD2rUjGv1icyUr+9SMWLHplerkecXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=TCHUcLQq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ayac4Wu6F6RskgZmI4mhqRr5rEoHR5pqbZM0eTHhi9U=; b=TCHUcLQqlzAfLejpy3IuqdGgCh
	59DNK5YRFHiTMfCTzYTEeeilvnpQS0ZR0+ifkmLof5r3/R8ke3fKM3tT3B4o+eYIPIsNgF/fkx0Qe
	apFHU7NAPppHSl+LUcmWiXgHMzegZNyyN7tqpWyR88AH04Xee/ZyiCMjMz57TG6r9TeU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYeoz-000gCY-Ue; Mon, 07 Jul 2025 07:55:21 +0200
Date: Mon, 7 Jul 2025 07:55:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
Message-ID: <08324803-3039-4814-b93e-12b863bbadd1@lunn.ch>
References: <20250707003918.21607-1-rosenp@gmail.com>
 <20250707003918.21607-2-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707003918.21607-2-rosenp@gmail.com>

On Sun, Jul 06, 2025 at 05:39:17PM -0700, Rosen Penev wrote:
> There's no architecture specific requirement for it to compile. Allows
> the bots to test compilation properly.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>


