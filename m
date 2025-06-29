Return-Path: <linux-renesas-soc+bounces-18892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BFDAECC70
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 14:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81C1D3B06EB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 12:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B3922068E;
	Sun, 29 Jun 2025 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D+U/fpi2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7254121A931;
	Sun, 29 Jun 2025 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751200098; cv=none; b=rPPY7i28XQMKLbeaD1Xgn1lq4EQMOowEox7rGpwl3NIO+QCVtEvly2UOjp/98O5mtF4D/N/pbo/DKjOayvZCi6NNwQ4P5yvedMF2hB3f9VqzQUr8l3sVNaE2K0ljBKQUIUPD40v9CIBGspfteOQBX09rPozKSPg08NdwH6aLero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751200098; c=relaxed/simple;
	bh=UmCkYjZ4SN7uIpGorsrh78pScN/soOWdA3gPhn0qSTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niQvO5Z9exBTl7ZRjTPw/jdOKGZlkCWeqWIl0RrnFzXvzBB4jp1wzKw52q/m0bbNb5Sus6LAtKIAgM5LzpsM/899AA2UEohrdG/ekA+mTHxB1bpOLmAO0tk6Y/dE8FRF8vD8EQ8pJhh7nz32PHLWdhzgq4qFX2nv2cdM1AQcIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D+U/fpi2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B204C4CEEB;
	Sun, 29 Jun 2025 12:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751200097;
	bh=UmCkYjZ4SN7uIpGorsrh78pScN/soOWdA3gPhn0qSTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+U/fpi2tf4PSGtkLBR/FbmGlNiv1hnR3zCDhpcPBjWhGTBagzsgWhhZlc2C5sgHm
	 iJuwYogEmMKlQdLmHSUSYoF3PDHcd8oHw6XgFNtj+//v8mfBas0N0w2pLuMFOXod1u
	 mPpOze7T83NdqDfS+W18NNDAmbOJebe12k5977WM=
Date: Sun, 29 Jun 2025 14:27:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 5/5] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <2025062914-unkempt-reentry-470c@gregkh>
References: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250628115715.102338-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628115715.102338-6-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Sat, Jun 28, 2025 at 12:57:15PM +0100, Prabhakar wrote:
> +EXPORT_SYMBOL(sci_port_enable);

EXPORT_SYMBOL_GPL() perhaps?  (sorry, I have to ask).

Also, why not limit this to just this one other driver that you want to
use it with the proper namespace usage instead?

Same for all other new exports in this file.

thanks,

greg k-h

