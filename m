Return-Path: <linux-renesas-soc+bounces-13594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FE3A42707
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 16:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6D1916BA06
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 15:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17A11EA7CD;
	Mon, 24 Feb 2025 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NHW/xI8g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v+xXlJ8H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F370E15E90
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740412396; cv=none; b=lLJoal5jQGUwoZhT4W5+DxQpKVGUEuoBqfv6I9iATcIYiKg7w/GRtZRdMzx4Eyqu9yS7yFhgLvbE6TkAasuT2IBXP2D4FbbqeusCBSm0Nv/AqhfA+CbGNzK6GPv+9O3oIcsM48yLDGmu+Uj/UJOBzUNfThnSuSxBJkmpLqdJlic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740412396; c=relaxed/simple;
	bh=dxRtSoXI4/alCOToH99+0j1dluyIz3vSHWn6cefYIpA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bKOYn1lH8Xc4Fk4ed+phRsb37dKEUG49SCYvq7oCaXhltWumtqXEoFCn0oyMQKfyu6e3BW8YY3u7gwxVJXhEQs4ivC6GpShDEYgPpqn2WOSdgE8b+rmH1PjS+XofTEE8BUWHV4YPy18hBUAFOw1iJKc/tcosW+TACksZkoxlQPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NHW/xI8g; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v+xXlJ8H; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740412386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HstKDEouAOmCP+UwL4jMqlguN70ChZK9BJssWehN1OM=;
	b=NHW/xI8gtq6PWZcUEr018CAzsriS+15iGEIBEsYmIXEMD/d1jPgpkipMWhcvXE62uG6ESv
	LNfAkV0lZMQPodJJ41EvOqs+9jNDDNYCh6EX5maUjuGQlcq6xoiaE436VnDQf9w36GJlZd
	9ER6gwUb53zt1QxX6GLcxfwHJiLyBYbgR4ikbDZmc/YWcRNwY89LcqxDfYhfVT2pwHa+sf
	tIJ33PFLIhR1v/tNJNmA04YwJhjqTo/SngbNcH6z4q3fOXcVzKksWflDgyZI5CrKAx+2Hn
	sH+/RiUdRk+or3xIkWbf4zEJ1+x8FFshb/40LE/AMLcbCN9g2+SbzFiTIqW6lQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740412386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HstKDEouAOmCP+UwL4jMqlguN70ChZK9BJssWehN1OM=;
	b=v+xXlJ8HFfGPfxRKmGALFxLrf7QNS6WvgbLPvAtreItZ54TFl55LUz7nW0fJvzMbETRv3P
	XNSDwNuh4WhfjzAg==
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros
 ICU_TSSR_TSSEL_{MASK,PREP}
In-Reply-To: <TY3PR01MB11346ECB931169C195A63F49386C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
 <20250224131253.134199-12-biju.das.jz@bp.renesas.com>
 <CAMuHMdWjpdHH-+R5pQ9DJ+_MJQ8Nd06dYcKEqqo2Asd7TLTMTA@mail.gmail.com>
 <TY3PR01MB11346ECB931169C195A63F49386C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Date: Mon, 24 Feb 2025 16:53:06 +0100
Message-ID: <87v7szfifx.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 24 2025 at 13:59, Biju Das wrote:
>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>> > -#define ICU_TSSR_TSSEL_PREP(tssel, n)          ((tssel) << ((n) * 8))
>> > -#define ICU_TSSR_TSSEL_MASK(n)                 ICU_TSSR_TSSEL_PREP(0x7F, n)
>> > +#define ICU_TSSR_TSSEL_PREP(tssel, n, f_width) ((tssel) << ((n) * (f_width)))
>> > +#define ICU_TSSR_TSSEL_MASK(n, _field_width)   \
>> 
>> Nit: please use f_width or field_width consistently.
>
> With field_width there was some alignment issue, that is
> the reason it is shortened to f_width.
>
> If there are no other comments for this patch, I will switch using
> field_width in the next version.

If this is the only change, then please just post an updated version of
_this_ patch (11/12) as a reply to the patch itself. No need to resend
the whole series for that cosmetic change,

Thanks,

        tglx

