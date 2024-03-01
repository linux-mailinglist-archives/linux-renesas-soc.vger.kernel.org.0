Return-Path: <linux-renesas-soc+bounces-3370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23586E323
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27ACA28462F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 14:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179836F07E;
	Fri,  1 Mar 2024 14:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QhQYz4sm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+Tn5C5px"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1D46EB6B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709302545; cv=none; b=Q42gJGSk6cT82EwyUb/E0TBe3jw1O7elXUl3U0kPhne/+frShCoZcHqYgee2VqrOLbsDNlawsVsJYpZTb1NvvbQ01bC3SW3oCIYQe/bv+exvajJlGkYH2vldBGEQTKbiArp2WFRvgYnktCGWJwYVXzmyXdW+wtdFpCZx67dLKco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709302545; c=relaxed/simple;
	bh=SaHTazZIQTDEOebEhC8MWdWyrfn99psE++celG6QhqU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PcwSujoeyaENW8EjS6CX4C2HXvgnKo/YLDpKGFBOAlQOKb2kzI4yKaImJAj1vGf/JPicEI/9l2vKX5Dqdz/69QWGoeyWqdPWM/8wQTlYR6bq2Kc76g9e+9A2YuziHyjT0qe/Jet/HuZxTSVAhR6LN6KqemPSKqf6PdA/61Qt7PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QhQYz4sm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+Tn5C5px; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709302541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0RO7BGaQahkdlqNgxOQwKWdlVowG+Bq0NakNYJDBF70=;
	b=QhQYz4smo7/PQYYeDWV2aggRhbUQubZyrXmufI84yi4ajplcUs5dMtOR1Q3JwTk1O3MXB7
	fF+Bujgw141gdZ9rlXoOqTkScTIZ96wvqASe4yOMky8j+JTo5ZDqn6QId+94UZubSxznQa
	CMXH/Z50q2GMlN4eO2dv0lfpS58S40zifoBIwDmT+Q7aIMZlcb8nvbHwvRUaQPqNrTn7mo
	sYEtt5KbAoEh3kTHysS9JZdTIwKdDVGXjdzN3ooV1BZyrINse0JKTw2RC8ko7HTKnRSnlG
	8lw1YZMJl3JUpsVUekTH7XCydzDvrvEIIS/dc6vkq6MAZjXW/LD1Ir2fKeaTPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709302541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0RO7BGaQahkdlqNgxOQwKWdlVowG+Bq0NakNYJDBF70=;
	b=+Tn5C5pxfcY2PI0CJmnFv9MogHI730t3lFn7AHGOKhTm6jB2qZePGLOLGM1V8WGAYvw+Z4
	4K2+p6QQzTel9ICQ==
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] irqchip/renesas-rzg2l: Use TIEN for enable/disable
In-Reply-To: <20240212113712.71878-5-biju.das.jz@bp.renesas.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
 <20240212113712.71878-5-biju.das.jz@bp.renesas.com>
Date: Fri, 01 Mar 2024 15:15:41 +0100
Message-ID: <87cysexcky.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 12 2024 at 11:37, Biju Das wrote:
> Use TIEN for enable/disable and avoid modifying TINT source selection
> register.

Why?

Changelogs are supposed to explain the WHY and not just decribe the
WHAT.

Thanks,

        tglx

