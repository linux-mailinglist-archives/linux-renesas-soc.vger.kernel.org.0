Return-Path: <linux-renesas-soc+bounces-17094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00CAB6A0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 13:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E8533B99BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 11:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7540276024;
	Wed, 14 May 2025 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0JCzueK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD6842A82;
	Wed, 14 May 2025 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222313; cv=none; b=QRh2TNbMmFS/KOuLYBIt31l8CYIz32eP6SOD9bAC+ibSLH8/schv2F8cPeSnsqTzAAvQffXPyhrNul/H0hSsdejOUc278ywPflR9s6Cf6ue0O2qYxtYIok45aKoqdxXwxMxFEFjocAF5ZAzPpwPp50VuJsrpKBKOG4eVjwcxMec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222313; c=relaxed/simple;
	bh=gxyZSrmBDmqX32YqUTwl2p4jw1lJWQ4gQiNsJnaveRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PSwNKwC8OIRlvTM5AC5eBXNQBwVqILuDvyk+IRZoxhCju4PCGAS40JPQsEl5apvUw4q+MBreaTZDoe2WJ3zNZlM+PZ44fSQlHEg0pF30uaa8Kw/7d1Qn3ucYpOGqNcEnICYZNbAQ4eZ1Xii7ild04VFvfwHGAETaivbW/csIeqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0JCzueK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25422C4CEF0;
	Wed, 14 May 2025 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222313;
	bh=gxyZSrmBDmqX32YqUTwl2p4jw1lJWQ4gQiNsJnaveRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p0JCzueKZiWVU9x5plR+Ot+TmLrStNZOlN9S/m9Q9M/3bmw0sS32GdWCEFAEgSROH
	 kCMJuZyTEef5L7ABdau0wQQm0ZBxtPoZrINmik+1VW5SKpzYLHcZZb5prmZErMJnX5
	 j+TfVsVnh8MY75y3nBVIWQ6miHJMu1qI2fyNX3o1XJDee1RmLJnTXRSUqyhtvBeGHq
	 kE/Xe50tCq4DT/vFtK0YIeRG/gwgXdLatXEqzs97ffsSTAIC390T+bVTaI1yALHaba
	 5dgmuWOFWoMdFyAj6W98B49/osm+iA/vHXhxwByEDTndRJjsBEGN2iwzEa2WF7dSft
	 RqOuBbTD4CEhA==
From: Vinod Koul <vkoul@kernel.org>
To: yoshihiro.shimoda.uh@renesas.com, kishon@kernel.org, 
 geert+renesas@glider.be, magnus.damm@gmail.com, horms+renesas@verge.net.au, 
 fabrizio.castro@bp.renesas.com, Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH RESEND v3 0/5] phy: renesas: rcar-gen3-usb2: Fixes for
 Renesas RZ/G3S
Message-Id: <174722231081.74407.5340697321228432140.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:31:50 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 07 May 2025 15:50:27 +0300, Claudiu wrote:
> Series add fixes for the Renesas USB2 PHY driver identified while
> working on the Renesas RZ/G3S USB support. These changes are
> needed for the upcomming RZ/G3S USB support (especially for the
> power management support).
> 
> Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
> unbind/bind and data transfer tests before/after the unbind/bind.
> 
> [...]

Applied, thanks!

[1/5] phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
      commit: 54c4c58713aaff76c2422ff5750e557ab3b100d7
[2/5] phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
      commit: de76809f60cc938d3580bbbd5b04b7d12af6ce3a
[3/5] phy: renesas: rcar-gen3-usb2: Lock around hardware registers and driver data
      commit: 55a387ebb9219cbe4edfa8ba9996ccb0e7ad4932
[4/5] phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
      commit: 9ce71e85b29eb63e48e294479742e670513f03a0
[5/5] phy: renesas: rcar-gen3-usb2: Set timing registers only once
      commit: 86e70849f4b2b4597ac9f7c7931f2a363774be25

Best regards,
-- 
~Vinod



