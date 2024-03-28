Return-Path: <linux-renesas-soc+bounces-4150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D889030C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 16:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFB6529399E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 15:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFDD12F592;
	Thu, 28 Mar 2024 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGORrA6j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC3112F39B;
	Thu, 28 Mar 2024 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711639683; cv=none; b=Cqpdo+eAUqERhpYdjxHmd7SOXpzxA0ADmp/z3P8eLRZitIAPb+Fg1TwOc5x3cdyFTtEo1EU+oZKjyb+vkaj0HL9FGGDUxFbaFgct58B9/k1e0ei8JU6eV8x7tINYC088cxeU5rk8QCw36LxeTSPmRvHKkUXmoS28mUh086kgdQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711639683; c=relaxed/simple;
	bh=3m1zJheBZ2qgYqtI3eJ7NXOpCOoW+ev2kS6TiY54vF0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oW6IyfM0odhcs2PiXp1FKUwvARRaqt9phe+3ETtYBHEqqD8XBhz+KvBPj2H7uiUyJJ77ovVvhimMufqQjvd23Eojc3b9epVR7FQkiho9BsBsTtwDdnfXqQJP4U1i6NStLXkpLNEgZlLHuytMQK2oWI/DOVrljKxQIdmhqUcHG28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGORrA6j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374CFC433F1;
	Thu, 28 Mar 2024 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711639682;
	bh=3m1zJheBZ2qgYqtI3eJ7NXOpCOoW+ev2kS6TiY54vF0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uGORrA6jY7X/gJOw7CtimwbgpyQIsMStDS7MNpeKRVZM2Hf+Gijdq453U1ABRE+xY
	 QvCuWEfYtfq+mfGbDZ4tQlM2S2OdJxRq2a7E2SVIBwqMnaQtcQkFZpZd0O1WqwkbOU
	 pI4FM5je6v8Ue7WHt6GDkDxoxlonE0iqt4AHBM4qpHLmJ1nKSxeAFlemEkbnlRiUSL
	 +2imaf5RJWVxDPete3qlKSEtyy7drfxxeHvKA9o98FFkEN2IN4JY74MvAWJ86euf3r
	 tX1wpwSzlAO6cR46vRqyEOAA8EG3YewOC6UhEg0wTApkL+p1TFNu4fuU8pW4ESfBbw
	 hyhpRaIQ4lpkg==
Date: Thu, 28 Mar 2024 08:28:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v4 0/2] ravb: Support describing the MDIO bus
Message-ID: <20240328082801.6ec0d406@kernel.org>
In-Reply-To: <20240328094546.GI1108818@ragnatech.se>
References: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>
	<20240328094546.GI1108818@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 Mar 2024 10:45:46 +0100 Niklas S=C3=B6derlund wrote:
> This series was marked as Deferred in patchwork. I just wonder why that=20
> is? Patch 1/2 touches bindings so it could go thru the Renesas tree but=20
> patch 2/2 touches the driver and depends on 1/2. Should not this whole=20
> series go thru net-next?

I don't see why either. Looks ready to apply, TBH.

pw-bot: under-review

I'll get to applying later today, hopefully.

