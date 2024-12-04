Return-Path: <linux-renesas-soc+bounces-10913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94059E3D71
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 15:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6CD31631C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 14:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EAC20ADFE;
	Wed,  4 Dec 2024 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Usdn+bwE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F8F1B4124;
	Wed,  4 Dec 2024 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324222; cv=none; b=okDrh4aCOAokGbbovj2Ajy/MYawqE49UdnvRu96W5NeHb1iUcBeAM/XeoZYkU+nO3ReRQ0M54L3iULKBHmox7GEgj6u0vFUr3PQESqUqjAK6rpYzY1mLfJYR7bMj0/I6ZAtt2ImaRF76hhuqFcvQdg1Cg9wRGKuuirrF6OnkAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324222; c=relaxed/simple;
	bh=ePxESmCgHTiRwfXvDSvoMPA1PfHyYxc9VH93hhPaqBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoRpY5P/R5K2RH8DyLsUYijoakaZSv3aSRIL/flap0EjkvirU8hbLwJ8etBhmdL/fsGNSQcxo6nafLdJk7GR6H/P0vjnGlSlTblf1PqTJvNysgg90AK5JXIQIsPR4/JnjiBw9exXKdIQKDYcmxav2VLtiUgkGq5R6XEsVLvL0yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Usdn+bwE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B64FC4CECD;
	Wed,  4 Dec 2024 14:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733324222;
	bh=ePxESmCgHTiRwfXvDSvoMPA1PfHyYxc9VH93hhPaqBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Usdn+bwE+mAJa0hppiOpkuPW0EIoYS/701981+1RNxBY7qK3ENfKsJWadTIqoISUb
	 KklrA/s6F3JLhbjHmwXWIIg4KX4MglApBI9FcN0hlVP1M9ecfG9aa5lCqjzGWjatD1
	 fJjBqHYHcmxZqNZCZRqYdibvRmU1NWtymrjimUfqCdEUT3jAzYSXqyHFmvzAxRTUkW
	 /30KRN+fp2J4+yscygZN+k624iI0TIAS8IAERI3Bv5mPpfKqnGJofWS0Fudsug37iC
	 aPnY9B/woDv1EfrvR0mWYdsa/EeLrZsG5pNrgGmifsqH1EBipXyBlJSPpvVbMBtn7n
	 YFejAwQ9nFJCQ==
Date: Wed, 4 Dec 2024 08:57:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.au@gmail.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/13] dt-bindings: soc: renesas: Document RZ/G3E
 SMARC SoM and Carrier-II EVK
Message-ID: <173332422007.216954.11500598713460720525.robh@kernel.org>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
 <20241203105005.103927-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203105005.103927-4-biju.das.jz@bp.renesas.com>


On Tue, 03 Dec 2024 10:49:30 +0000, Biju Das wrote:
> Document the Renesas RZ/G3E SMARC Carrier-II EVK board which is based
> on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC Carrier-II EVK
> consists of an RZ/G3E SoM module and a SMARC Carrier-II carrier board.
> The SoM module sits on top of the carrier board.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


