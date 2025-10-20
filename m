Return-Path: <linux-renesas-soc+bounces-23313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97833BEFFAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 10:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F31A4E392B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 08:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F3F2DF156;
	Mon, 20 Oct 2025 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wkfYZFYm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3AB33993;
	Mon, 20 Oct 2025 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949344; cv=none; b=mwKKETPzTXe70VJs3LoAOrgK0s8FsFym8rcA5S0PA7AvH9irD2tjhLsjjmNViqeF/knbR+EiYnvB/cqE7Q+p6/f5uNNqpoE0UFQ/TWmHxHGfXZBMPuaUhD98WUCxAEecIjPmWITXRwx/wtWIcnq4ngo04y4YZcLOLhFMNqcRaHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949344; c=relaxed/simple;
	bh=vmQbyDz0qoPP+fUeUlVChAg17zYAvrtDgUE6LZ0MBsw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KXIHWB+trxBrQGr+n+yDkJ69A1Wg8LYeSC6jnsNyAjsCSmldxhp/Z5j0o/ddayK+flz3WWoA6heLoCAfwKCq3fx3/Ez19IwR3+BDXEtI3B3ZPZcTId582BRjtHMQdawHqZV4NFw5tRY1UQmltmxzwpGgrsIQrwhvs6K/OFopC3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wkfYZFYm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7B458C0AFD7;
	Mon, 20 Oct 2025 08:35:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07333606D5;
	Mon, 20 Oct 2025 08:35:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8E79102F2380;
	Mon, 20 Oct 2025 10:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760949335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eYsZarm5XDz2C3FmlRNVCBIQTw/bhVlzjG8MTAL1fRI=;
	b=wkfYZFYmutmD0eFc2XaqJZtq80XePi2gWLpyOc8cIHeFJk//IgZ4Xpv4qzaRGJyHcVBYup
	HpOjiBZx+wLtFgvyu9R1W/8x3zm767yZmadimIRJmoGo/euspyDQUKnxcdSmEkXzxqWjcn
	kcSiyu8ViKikZf98SD1jP/bkF2t3hMrW1QpAuQ0ZHbbbWqgAo8rS0jYOQjtp/slNsD8Z18
	0TTDcH8tXiBitM8zeS+bFkcLaEwa3eOLGOSnNHQfpP4pZBTc6qXrByq0puK3udqP37nguE
	VmtE7eGGiFN15UxQCSph3D8N/nJEEg13REATwcohAhLalHGG+srz4tHa/Z70Ew==
Date: Mon, 20 Oct 2025 10:35:29 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: use
 interrupt for Micrel PHYs
Message-ID: <20251020103529.0f948c67@bootlin.com>
In-Reply-To: <20251001104312.40771-2-wsa+renesas@sang-engineering.com>
References: <20251001104312.40771-2-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Wed,  1 Oct 2025 12:38:06 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Make use of the interrupts wired to the Micrel PHYs via the GPIO IRQ
> mux.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Works nicely and kinda out-of-the-box for the Micrel PHYs, couldn't get
> it to work (reliably?) with the Marvell PHYs on the EB. Leaving this for
> later (if ever), no more bandwidth currently. But at least we have an
> upstream user for the gpioirqmux now.
> 
> RFC because Hervé's patches are still in-flight.

Yes and v5 has been sent:
  https://lore.kernel.org/lkml/20251020080648.13452-1-herve.codina@bootlin.com/

This v5 iteration should impact modification done in this RFC.

> 
>  .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

