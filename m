Return-Path: <linux-renesas-soc+bounces-17965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20417AD226F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 17:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D90BD167636
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 15:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDD220409A;
	Mon,  9 Jun 2025 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGK0cklY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3661FECB1;
	Mon,  9 Jun 2025 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483010; cv=none; b=LzfL2yuTEPGPrP9LF9Rn+Sa8AjqUaNr4w1Ws8qfo0ZvpNnjD9pIusEfMkH9zbj1lWwb7C3gU9jr7oKsfyp35H8WFLLk0NoMDM7FvZCT7xobjJxrA0LdLprurhQhZUIBXVrQYDunPvBFCbCfZLQEg/x3Ohho6ddt7uTQW5pHvJv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483010; c=relaxed/simple;
	bh=JEaoeBlNalvpwQRoytIiNvD9tjnVPiRK0lszvnNoMPU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bsiJUnOzRUweSgCeew4EyyXfWuxtySgDZ5Yzf/V4NlENhTqK9jQM1zewB2bDEvA3ld356h6V6ZJipS8YbuGXvAyDacOlrgXLb8HYbWXiU91sHpmXHP5+apy4c38WIVBY/SguyW9vdBPnNkM6W0JD2ntX6s7BEclN15xhJ+FJt0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGK0cklY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AB2C4CEEB;
	Mon,  9 Jun 2025 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749483010;
	bh=JEaoeBlNalvpwQRoytIiNvD9tjnVPiRK0lszvnNoMPU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aGK0cklYzhbhSzbxuULRNH0nY2obBUr9i4TivAUUATvp0tWbCIqqSMHXAUfn43AaV
	 lxUBSMADyN9fnMHh8hP4Dhjl8pxehV+YDotRapw0G2pBfMiluORO38Jk70IwNOtUiC
	 NV5t2Z6/Ec5a/2SbpVOQ1UkWIQe8Ie590zhQBYS9hBArt4OmI0cvPviKQZ3HpihQLf
	 IUDawoua0q3NcXwoaHyINVtCK+P9dfNwE0Ulb6vJqNhabICpeWAJ2e+h/MUcStwzMF
	 Sy4P+GjpctDTpE5K+JsVZuZDnnKWAl3wzXns2S8j2Tjhbunh8CUf4mdmT/TG3Lunju
	 a9YEDOtNiFN3w==
Date: Mon, 9 Jun 2025 08:30:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 john.madieu@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: net: renesas-gbeth: Add support for
 RZ/G3E (R9A09G047) SoC
Message-ID: <20250609083008.0157fe47@kernel.org>
In-Reply-To: <20250604065200.163778-3-john.madieu.xa@bp.renesas.com>
References: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
	<20250604065200.163778-3-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Jun 2025 08:51:58 +0200 John Madieu wrote:
> Document support for the GBETH IP found on the Renesas RZ/G3E (R9A09G047) SoC.
> The GBETH block on RZ/G3E is equivalent in functionality to the GBETH found on
> RZ/V2H(P) (R9A09G057).

Could you repost this as a stand-alone patch with [PATCH net-next]
in the subject? I believe the patches in this series need to go
to 3 different trees, /Documentation/devicetree/bindings/net
to networking.

