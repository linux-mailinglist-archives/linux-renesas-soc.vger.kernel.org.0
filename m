Return-Path: <linux-renesas-soc+bounces-14131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D555EA56239
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 09:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFB451886318
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 08:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622F21862BD;
	Fri,  7 Mar 2025 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qFGXIpCn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="unJXd0DR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD681A3162;
	Fri,  7 Mar 2025 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741334952; cv=none; b=RUYkKEwSSSL8zo49NJfzxoiAknbyJ83USggEN+BqnwuNqk+akI4GuhLv4/V0WpK97kad686K/C0SnQI2tboijuxWMGWgciLfdN1+5mdO04DbyX08CSfDaPOch6yfft0HoG8hFL2HCUPKLiEE+BDkoMYqDGV5TXTD0JX5cKk+CHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741334952; c=relaxed/simple;
	bh=2TZ9Vv74wbNF9OHjgNXQ2dshAhqsWw0SqXbqgRHX2nY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kebIWtgVRMLKIcYf4hLDu6Ii+E0cYuwNzogALGTTxneyL0tx7Azif2ujrDDUBjSUefVLCcuLNTuETPNVdsESiBaEtpimd8p4H0K44+fV/sY9tb2VwlzSGn88+9bLxp6mdzY0/ovYsie4EQfbaK+bFRwDF47QGrU6Filzg/iQV28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qFGXIpCn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=unJXd0DR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741334949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2TZ9Vv74wbNF9OHjgNXQ2dshAhqsWw0SqXbqgRHX2nY=;
	b=qFGXIpCnIied5+7+el/2Fi9waTQDnirui9C/uKm+a4mlyl7JYc2oZAPwkfarR5WQLnpYTh
	aEv72PJN1+ABqcbvstYNJgjaKLIAP9GM/lyAyUYt2ikwRsS4+j7zrD9ajMoVeCII9y8lS8
	MkH0zhscCdyirH4aD+DqFwtJjjSxWIo1R8V/20jjDxjaalqWXlwXh8/dw7SC2sZnA9eJ+e
	eudRpgyHeRMxTrqOOe+yniGuZP6mk63YS7U3nYMX80B5hrduIhemJXZT1gczkfrAbom81A
	eS40zL76IoUjYYn6wdetDiUpQ5phuyTBDmM0q6AsiPN5bFCw6Qp0bRc/73t9kA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741334949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2TZ9Vv74wbNF9OHjgNXQ2dshAhqsWw0SqXbqgRHX2nY=;
	b=unJXd0DRh7r2y0oblX95z8X0fKUG6JbQ0HkXo9XyaOoD5+6H5/WZOkQ0BPBEnkQrbptmGI
	TZFYMpJjGuOPByBQ==
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 3/6] irqchip/renesas-rzv2h: Add
 rzv2h_icu_register_dma_req()
In-Reply-To: <20250305002112.5289-4-fabrizio.castro.jz@renesas.com>
References: <20250305002112.5289-1-fabrizio.castro.jz@renesas.com>
 <20250305002112.5289-4-fabrizio.castro.jz@renesas.com>
Date: Fri, 07 Mar 2025 09:09:07 +0100
Message-ID: <87ecz945zw.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Mar 05 2025 at 00:21, Fabrizio Castro wrote:
> On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
> to the Interrupt Control Unit (ICU).
> For DMA transfers, a request number must be registered with the
> ICU, which means that the DMAC driver has to be able to instruct
> the ICU driver with the registration of such id.
>
> Export rzv2h_icu_register_dma_req() so that the DMAC driver can
> register the DMAC request number.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

