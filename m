Return-Path: <linux-renesas-soc+bounces-11242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B395C9ED820
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 22:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8409162F10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 21:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB081DDC28;
	Wed, 11 Dec 2024 21:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qav6MAm1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECB1259498;
	Wed, 11 Dec 2024 21:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733951335; cv=none; b=inlRj4CHF6rZlKK8kbySJRgCGkbfF/yPVvnzmrf086dAEJFQkSp7jIJe4ADyTu8fdtMNoM+C895vaqqhl7fjH25+4V7zKqwQDV6pWGh3dBoFjdxlm8+OljPuNFv6pP+PSYhpXsZzAX+/EGnE9mfUmF5WtV+E3VanQyG1SUPjQt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733951335; c=relaxed/simple;
	bh=n3mGI7Wt8nt1KnqU9h5UNwpt6C2Cfg4J3xCsGHL+n68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuZ29l2AOuQX7nJ105YvnOUrOUfEGF3dQ24aOEfhhyKgGJDJN8Lxw2Hv1sNs9jgIWLFQqKefYD8SRWswA+1KzcFhXYWnkmgDFkk5TOvJa5KnPDN1eTvpZUaMcgEXMOB0SfDiZlemYJM1syPMSH+k8DgmR66KMa71CWEyscMsK/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qav6MAm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A652C4CED2;
	Wed, 11 Dec 2024 21:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733951335;
	bh=n3mGI7Wt8nt1KnqU9h5UNwpt6C2Cfg4J3xCsGHL+n68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qav6MAm1mnzI5DFjzb6P9JtdL1B+5N4sIy1Yi5LFPEpmfLYOyk4abOzgcPbF/ywM/
	 qKqo3S2M/U1xFOWZxiuneMv95yUitPv8AeiWOv5SdNMOcKEmcuwUzC69U8mv05eYb+
	 OPWKHgDZb6JasOEUj42DsK3U7VgEBVHJRvuEoNJuOjF+fi/nwUrmELNUW33T2LKeX4
	 atkErFvnjayPWsrx3sQc8RweJAClgvJn97saH0w52X8DNZ7seOE6JfvYi8vtYK8ieU
	 42xCBs5pbLK+XUbADg3Ak1XkP18pfm5mOWqjOD7BknWGpNnALQ0Bv5Kv+oMI5RDjVy
	 EaX0bv9hh91DQ==
Date: Wed, 11 Dec 2024 15:08:53 -0600
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] soc: renesas: Add system controller support for
 RZ/G3E SoC
Message-ID: <20241211210853.GA3708218-robh@kernel.org>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>

On Fri, Dec 06, 2024 at 10:25:54PM +0100, John Madieu wrote:
> This patch series adds support for the RZ/G3E system controller and extends
> the existing RZ/V2H(P) system controller to support syscon. The RZ/G3E
> system controller allows detecting various SoC features like core count,
> NPU availability, and CA55 PLL configuration.
> 
> Key features:
> - Syscon support for both RZ/V2H and RZ/G3E system controllers
> - Detection of quad/dual core configuration
> - Detection of Ethos-U55 NPU presence
> - Validation of CA55 PLL frequency setting
> - SoC-specific extended identification through callbacks

This series and some other questions about syscon prompted me to look 
into syscon driver a bit. Consider this resulting series[1] in context 
with your changes.

Rob

[1] https://lore.kernel.org/all/20241211-syscon-fixes-v1-3-b5ac8c219e96@kernel.org/

