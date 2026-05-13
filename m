Return-Path: <linux-renesas-soc+bounces-32579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBNiEL2VBGoTLwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 17:16:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F935535E62
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 17:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 624E330F8CC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 14:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3185531328E;
	Wed, 13 May 2026 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktYSF6U8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C98309EF4;
	Wed, 13 May 2026 14:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681543; cv=none; b=ZhgeXI6+HkwY6lroAmxGFVsSRX68jOyVTBczhgTubNnkf/BE81uocr9EPtoa8RBxTclcr7i7Eox1vIAEyPXlwngv/0FuA8Mzy1swzb9bNQu5qH50WdHvCEZF5vjYxmaXuOyi9Z5icBZL7WZNKvs8l2xPm9wXku2ikwtgudFpE7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681543; c=relaxed/simple;
	bh=FneLC5Y8ebM1bPUQXuiZSuwdyebbAuAFdFrj9Xpa0UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/h8DyyBHltnO7Yxo6ivid8bWPDPWJzJFV7Oce3P3pT4ycbt2vPyxgE1MHQ5j1Q3WgKZP2qC0BTOjlGdksgowak8mfZ1xUuE8tecvIIBaIE4P4LFsXQ1fND/5+87RjHvORh0awLeZkzBL0laI0xRqNxDZ9WSDLKhzdP7rScma34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktYSF6U8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB105C19425;
	Wed, 13 May 2026 14:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778681543;
	bh=FneLC5Y8ebM1bPUQXuiZSuwdyebbAuAFdFrj9Xpa0UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktYSF6U8y7nOrjFy0itrSUtBYWTHhFHQEIkQW8PDRyf4uOBw2DmnMZX83JvVZLsWH
	 s1X2+AZLI55TNeI5DILq6kNEY7pUwOTZZrlZqjM8akjTkrmn5OcM86K7h/Fg8XpT4H
	 l01axXQM+KGbHX137/Zhhlc64Six8BSdCBKdDtuDlxnLJ6FGY20xx5XELdH6JNRPoA
	 POkIbqrnqPO/RMSUWeLVu78sr4VpFs0HjMvLAIPd5/WFnt7m6SDORVwdw/OWdn8s37
	 uqamTULzvS/bl9NOZ7uVobJi3xgFqXDLm4Tbc6epeYFiwKb+T/csZCwncY4mEqfsgU
	 v9+Uii1vfxcxw==
Date: Wed, 13 May 2026 15:12:16 +0100
From: Lee Jones <lee@kernel.org>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 02/10] mfd: rz-mtu3: use device-managed reset deassert
Message-ID: <20260513141216.GE305027@google.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260507123903.GI305027@google.com>
 <TYYPR01MB156155B2A517931DADFBEA65B853C2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYYPR01MB156155B2A517931DADFBEA65B853C2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
X-Rspamd-Queue-Id: 8F935535E62
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32579-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 07 May 2026, Cosmin-Gabriel Tanislav wrote:

> > From: Lee Jones <lee@kernel.org>
> > Sent: Thursday, May 7, 2026 3:39 PM
> > 
> > On Fri, 10 Apr 2026, Cosmin Tanislav wrote:
> > 
> > > Replace devm_reset_control_get_exclusive() and the manual
> > > reset_control_deassert()/reset_control_assert() with handling by
> > > devm_reset_control_get_exclusive_deasserted().
> > >
> > > While at it, remove struct rz_mtu3_priv::rstc and use a local variable
> > > for it as it is not needed inside rz_mtu3_reset_assert().
> > >
> > > Rename rz_mtu3_reset_assert() to rz_mtu3_mfd_remove() to accurately
> > > describe its usage since it no longer calls reset_control_assert().
> > >
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > > ---
> > >
> > > V2:
> > >  * no changes
> > >
> > >  drivers/mfd/rz-mtu3.c | 23 +++++++----------------
> > >  1 file changed, 7 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> > > index 9cdfef610398f..6b9c6831dffa9 100644
> > > --- a/drivers/mfd/rz-mtu3.c
> > > +++ b/drivers/mfd/rz-mtu3.c
> > > @@ -21,7 +21,6 @@
> > >
> > >  struct rz_mtu3_priv {
> > >  	void __iomem *mmio;
> > > -	struct reset_control *rstc;
> > >  	spinlock_t lock;
> > >  };
> > >
> > > @@ -301,13 +300,9 @@ void rz_mtu3_disable(struct rz_mtu3_channel *ch)
> > >  }
> > >  EXPORT_SYMBOL_GPL(rz_mtu3_disable);
> > >
> > > -static void rz_mtu3_reset_assert(void *data)
> > > +static void rz_mtu3_mfd_remove(void *data)
> > 
> > Remove any mention of "mfd".
> > 
> 
> _mfd here is to describe that it removes MFD devices, not that it is
> part of a MFD driver.
> 
> What name would you prefer to use in this case?

If you want to be specific about what it's doing:

  rz_mtu3_remove_devices()
  
However, my advice would be to go with something more generic.

  rz_mtu3_remove()

[...] 

> > >  static const struct mfd_cell rz_mtu3_devs[] = {
> > > @@ -321,6 +316,7 @@ static const struct mfd_cell rz_mtu3_devs[] = {
> > >
> > >  static int rz_mtu3_probe(struct platform_device *pdev)
> > >  {
> > > +	struct reset_control *rstc;
> > 
> > This shouldn't go above the main device data structs.
> > 
> 
> I was following reverse fir tree ordering, as required in some other
> subsystems.
> 
> Is there an MFD-specific preferred style that I should follow?
> 
> Would you prefer having it right before unsigned int i?

Reverse Christmas-tree order doesn't make sense in quite a lot of cases.

I have no strong opinions, but _generally_ prefer to put the important
and physically large ones at the top (structs) and the little ones at
the bottom (ints and bools) - this also _mostly_ works out as RCT.

The really important ones here are the device driver structs.

> > >  	struct rz_mtu3_priv *priv;
> > >  	struct rz_mtu3 *ddata;
> > >  	unsigned int i;
> > > @@ -340,15 +336,14 @@ static int rz_mtu3_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(priv->mmio))
> > >  		return PTR_ERR(priv->mmio);
> > >
> > > -	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > > -	if (IS_ERR(priv->rstc))
> > > -		return PTR_ERR(priv->rstc);
> > > +	rstc = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
> > > +	if (IS_ERR(rstc))
> > > +		return PTR_ERR(rstc);
> > >
> > >  	ddata->clk = devm_clk_get(&pdev->dev, NULL);
> > >  	if (IS_ERR(ddata->clk))
> > >  		return PTR_ERR(ddata->clk);
> > >
> > > -	reset_control_deassert(priv->rstc);
> > >  	spin_lock_init(&priv->lock);
> > >  	platform_set_drvdata(pdev, ddata);
> > >
> > > @@ -361,14 +356,10 @@ static int rz_mtu3_probe(struct platform_device *pdev)
> > >  	ret = mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> > >  			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> > >  	if (ret < 0)
> > > -		goto err_assert;
> > > +		return ret;
> > >
> > > -	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
> > > +	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_mfd_remove,
> > >  					&pdev->dev);
> > > -
> > > -err_assert:
> > > -	reset_control_assert(priv->rstc);
> > > -	return ret;
> > >  }
> > >
> > >  static const struct of_device_id rz_mtu3_of_match[] = {
> > > --
> > > 2.53.0
> > 
> > --
> > Lee Jones

-- 
Lee Jones

