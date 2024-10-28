Return-Path: <linux-renesas-soc+bounces-10186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4029B3DF4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 23:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE5E51C21C9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 22:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE011D88D7;
	Mon, 28 Oct 2024 22:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovzZMX+s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449F190049;
	Mon, 28 Oct 2024 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730155426; cv=none; b=jbcJ9FBNyOUfwxPmGz5KlcbY+Eag7LZ6+wJ8IwMDmhbhtu3Jayi3r3MRgvnPNdVNuWROQLgky1B+buAhX4u/FkoYEgq9PMtpWSuouQBv/g1Mslb10DgQdkt09AyyMk9/6hyE6Sv8H19zTRME9ZuKtq3zQSob5cyJeFI8ZuKyCyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730155426; c=relaxed/simple;
	bh=SE+WE1kudze4FGAujRK2AgdkGJ912lqkZsyRAZy3qIg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V34bH9IQKzu8Y5sQYh8ajpAqs7wCTY+nIHzxH2XKbzMj/51HvSvH5SQ52/10DNFKbmP6zNYS7f+j38Uezpq1gD3RkGXQYBc0VHd4ts+aGiUZVp0Y5LAzXjRj4HRGiBaS0o8a3l15XYvk2KQJip9MQiKtJ2inLXjkgdEiVzBloow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovzZMX+s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3159FC4CECD;
	Mon, 28 Oct 2024 22:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730155425;
	bh=SE+WE1kudze4FGAujRK2AgdkGJ912lqkZsyRAZy3qIg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ovzZMX+sUeINz5iM91hL0ZfK2ZB7ootK0QPt+N0mI+R0jey50P885nc58m37sP0WX
	 fM3paqdkbkQOG6foAiWrqmNk6WWnI1ynE8WZ+leS8o58PDm0sQPzipZyLlhR3Z8XV0
	 EBAErzdmzgRc/JazZ6D7flAAFddc4kSKj70dsmd3Wcp8X07f8X7RmS4znZ0pJkzhH9
	 oyAQOJWPE65wnWLRuh8cHWq2aotjQagU4uR0xcwGOaI4fjLOpiDxmZIQ16ycmIl7mJ
	 VNEpwPKUTjxv8d9Xct/0oKd3t2AuoZegdn5EQPkSIPM+cYjXlSwT5AqX/q2yxnZzQr
	 2wiazXu8Nhaqw==
Date: Mon, 28 Oct 2024 15:43:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Paul Barker
 <paul.barker.ct@bp.renesas.com>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC] MAINTAINERS: Re-add cancelled Renesas driver
 sections
Message-ID: <20241028154344.70a92853@kernel.org>
In-Reply-To: <ZxZvL37ZdKg1P-QE@ryzen.lan>
References: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>
	<ZxZvL37ZdKg1P-QE@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Oct 2024 17:11:43 +0200 Niklas Cassel wrote:
> > +RENESAS R-CAR SATA DRIVER
> > +L:	linux-ide@vger.kernel.org
> > +L:	linux-renesas-soc@vger.kernel.org
> > +S:	Supported  
> 
> Seems a bit weird to keep the "S: Supported" line, if there is no
> "M: " or "R: " entry. I suggest you kill it.

Agreed, I think they should all be (temporarily?) designated as Orphans.

