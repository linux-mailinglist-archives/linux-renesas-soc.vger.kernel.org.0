Return-Path: <linux-renesas-soc+bounces-22709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC3BBE49B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 16:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4C9FE34845A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 14:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022142D46BD;
	Mon,  6 Oct 2025 14:11:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43FA1B5EC8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759759878; cv=none; b=Pwa5dYO03gt8f0OzWmwo5GB9yB5xb4mOa/5OKR3zpoE40+sk19Sgc7BvMYzxKxzeUCQjkk9GctsyduJZ/j+sIXvrAlt3Y6kr43/p8fg842qR0+afglqV1x3Lk4MpLCfjdcM2F4woviNoMJg+ARFkmpiOUP8W8WPIR0uaPWAxIvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759759878; c=relaxed/simple;
	bh=Mg/jC+FLhJpwM/iO1rt/TYkO4L6jfihw3EuIYOjBrrA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bRVdHk8gLFyTcbDxPaJuPN7645SYhe7jw66wcDibHc9gZ3G7W8V0y6ESk0Yxm4GbipUs4ZBLsGy7CAhDNP7+qkJU1BELuBAQNQm3FPbOZ67dtlggnb3VtWSKVvfafGyXFo6LTD0ocCDG0uPtjN6lMTBsONJF5czvQOmzais2d0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5lvT-0007Bu-BH; Mon, 06 Oct 2025 16:10:55 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5lvS-002FFX-2u;
	Mon, 06 Oct 2025 16:10:54 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5lvS-00000000B4r-3UUA;
	Mon, 06 Oct 2025 16:10:54 +0200
Message-ID: <8220c385d69bd46adf65f58d8e95b247dff6ae1e.camel@pengutronix.de>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into
 reset toggle callback
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut
	 <marek.vasut@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Date: Mon, 06 Oct 2025 16:10:54 +0200
In-Reply-To: <CAMuHMdVEK5MaJNWwpT_7yo0=tk+Pm+99QRD3SStkWsHHDDVJ7A@mail.gmail.com>
References: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
	 <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com>
	 <9864e81d-3b62-4513-9deb-1ce154cdc571@mailbox.org>
	 <CAMuHMdVEK5MaJNWwpT_7yo0=tk+Pm+99QRD3SStkWsHHDDVJ7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

Hi Geert, Marek,

On Mo, 2025-10-06 at 16:03 +0200, Geert Uytterhoeven wrote:
> Hi Marek,
>=20
> On Mon, 6 Oct 2025 at 15:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> > On 10/6/25 3:43 PM, Geert Uytterhoeven wrote:
> > > > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 p=
age 583
> > > > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) i=
ndicate
> > > > after reset has been asserted by writing a matching reset bit into =
register
> > > > SRCR, it is mandatory to wait 1ms.
> >=20
> > [...]
> >=20
> > > > +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > > > +        * On older SoCs, delay after SRCR has been written is 35us
> > > > +        * (one cycle of the RCLK clock @ ca. 32 kHz).
> > > > +        */
> > > > +       if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RCAR_GEN4)
> > > > +               udelay(1000);
> > >=20
> > > 1ms is a bit long for busy waiting, so I'd really like to avoid this.
> > >=20
> > > While the documentation does state this 1ms, I understand the
> > > issue we saw in the field was fixed by
> > > https://patch.msgid.link/20250922162113.113223-1-marek.vasut+renesas@=
mailbox.org
> >=20
> > This synchronizes the asynchronized resets, this is a separate topic
> > from the 1ms delay.
> >=20
> > > so perhaps we can do without this longer delay?
> >=20
> > This aligns the driver with hardware operation charts in the V4H RM,
> > which mandate the 1ms. If we want to follow the RM accurately, then we
> > do need the 1ms delay, otherwise who knows what kind of fringe failures
> > we could run into.
>=20
> All true...
>=20
> > > FTR, it looks like the reset controller documentation doesn't say
> > > anything about the context from which it is safe to make reset calls?
> >=20
> > What does this mean ? Please clarify .
>=20
> Are you allowed to call reset_control_reset() from atomic context,
> like the ISP driver does?
> For the clock subsystem, this is clearly documented: e.g. clk_enable()
> can be called from atomic context, clk_prepare() cannot.

The reset_control_assert()/deassert() APIs are de-facto only safe to
call from contexts that can sleep, because some reset drivers sleep or
call gpio_set_value_cansleep().
This is not properly documented and the reset functions don't enforce
it with might_sleep() either, which is an oversight.

regards
Philipp

