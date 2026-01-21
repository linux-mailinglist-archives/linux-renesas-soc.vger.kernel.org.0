Return-Path: <linux-renesas-soc+bounces-27245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGYYEhJZcWkNEwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:54:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F04CB5F1C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 143354E6E7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 22:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA7D449ECF;
	Wed, 21 Jan 2026 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXzI3I3r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A7B37E31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036040; cv=none; b=L70/z8NoIZ9Glph25g6HTdeFcb+y41JCQ2wQlGok5TrFHlHFiWdE/mM7rqagD900tVABT6sp+VEmSkOYfsQGUwgrrHHDIGupU/+Uisez1BRA+6k0lk+0M2Du8Ru139fV36u3XJ7EsSPQSAuj9Vi40rBKVXzPKOy1mo3oi6824o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036040; c=relaxed/simple;
	bh=tW6BQQWLK6LD5clxNFXzE8v4o9oRX1JWcPOvo/Jp5Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVoULZT3ciw1WIrEt4oI/xuOTybek0wHHFipPiIzSZ/L4u1myaEHqfrgWgemUgy+khJHQVdAekNrxv+ldqscEV82yCvdVv332XxKRkBaT4xsksCXBCN0y1J5AwV/OcY2jZ0rPDzXCfkmrlfOu9hOPrdo40LHVocZffbHBiubjlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXzI3I3r; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-121a0bcd376so977313c88.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 14:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769036033; x=1769640833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cp39T9yhEDWCKMoI7qosF72z7yBKmmlkDNy5bRjSKFM=;
        b=IXzI3I3rSDvxoa9XS2qqBcrgBmKQINLb+OhGgJA7GE158nev7WZW8U91vcZmM6HR5n
         hCsHfEjk4D6RjcLifvzTiNezebMWV1TTQA1Hzz54CLp8lU+DKSFeNWp56ITsWneghP/M
         F+mhleyb3042tUyqR70liXnFWIeHW56ilbm40Ddn5c6DPNUauGOsFTFvF3DySqlxKBXM
         sYhbdHhKyDsxjzoWVtmHo10AR4npaXT1DCeFsJQ6BU7XgAYp1cp6Wj8gJx0tbOxF6htJ
         M1bjfod8ZO4OjtjciaXO4R5KldicaGIHqUoz14HFIcaML6yFvMCGVGfWciFsVuYYTfNr
         1hVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036033; x=1769640833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cp39T9yhEDWCKMoI7qosF72z7yBKmmlkDNy5bRjSKFM=;
        b=dxkYMn9Un2NyhuLYhGauHtn0ClH14waYIrd5IMSsvR9YjWPcVh7pWDtU4lITZIz6No
         92nUcEb4QCiZr0Am2gSRt6j6xxiIkkYOZUY156eFSZ64AcbAYbDcEHmndBmd50EkAls5
         Rz6ymxi6oMJK6ocWuqTNGF51rxiY/ChjU7ksHx8+Q6TnwZny0tGZfVuLXpx80sZij5jb
         M2xCgRZE/f2Oio4UQv8hPMnghYYosho/Ul+v8HA0myhb3TwfD4TJHIHHJ2MablPlumS8
         jlZe7s45zESS3imsSRXp/sb3sMVEEYSg56bN62piufxz4MgZqfhxG2yea6IjPAbPwo+V
         KWCA==
X-Forwarded-Encrypted: i=1; AJvYcCXgn2pSnAIeWz6Tq/B+XmV+pItIZfAReOoc7FJkAHnY08HqjHNiGGQJ9TVhmku6X1+iCRw7yYOjiTHBlKQbby34Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm+Kbpe6wZ+XedNqj8bj0YOvF0Uh1e25LSkZdXHR0f4Ct850NT
	M4IyFTe2wn4RizMt+y/qMYstiwpx3duFlSCsxRQ62u4AMktUybCnaJtFLnQTwQ==
X-Gm-Gg: AZuq6aLlMBn89I9xKyapcwr08oFQEWGCah2Wda/iDzVGw66bSnkGjzRhC3ZBXSehDSP
	vDfDu+LscozNmm3FB5ZJYiGKOTCPAyZYDX9X7ldwMOX3QdQifanFRVYrz6avYExCpdXzjCmckaa
	aYSFIS3CbOR0RJEwCzkGWN3RKnEnWevcsp4H8zmMg9P/BUG/C/9EUCC77Z8rEnWaLgv/lycogQt
	AQtJs1uJ0M2sJzD3nN9s/YKLVrJI8Qt58tBhJ3ZLE7P+FL0t14lT4Jv5XCkcaCAhI266Xtuouzd
	FteEeiXr+AqmeadDcSlxQYYKMpWNLcs7v3EUGa2qEdXx1NiJtz3E7hw0riR1JutTeKJlh0N2EnX
	vuIawMgHpjj1l2dheF4V/oPqy0NUPp4yh+Ab/gCi05aXv47DXVGsdnUCMhjeXp4QW6XrhBWUO3X
	u7YrDo1bp+i/Qf8tC8zVxeeF3sg362IoohY8slitCIyzntuHHKMUqcn5nER5vTefY=
X-Received: by 2002:a05:7300:a498:b0:2ae:5b01:bfa5 with SMTP id 5a478bee46e88-2b6fdc9c839mr4812625eec.32.1769036032553;
        Wed, 21 Jan 2026 14:53:52 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:abb8:3a31:328a:3594])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36550dfsm23464605eec.25.2026.01.21.14.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:53:52 -0800 (PST)
Date: Wed, 21 Jan 2026 14:53:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Job Noorman <job@noorman.info>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] Input: ili210x - add support for polling mode
Message-ID: <tuvidadi4sezm5b3ydvuie6pcxpf7pw2jrysafwdhpmtz6vjxl@o4zqdnjxkaed>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117001215.59272-3-marek.vasut+renesas@mailbox.org>
 <wv3vil4b4lgfrqt4qnzxiffnniw422xjfdiz4svkklnfrslz3g@yzqc265pj5t5>
 <bbb7fb54-5b04-4c38-840b-8cab58eeec7b@mailbox.org>
 <nk5qn7ye44lbtppp2opa273ut7lxkcz7jsw6giagwngiwhg7rr@puexvdzd2ymq>
 <cd8f71db-c2d1-4c85-8148-83822762a916@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd8f71db-c2d1-4c85-8148-83822762a916@mailbox.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-27245-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: F04CB5F1C1
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 11:42:55PM +0100, Marek Vasut wrote:
> On 1/21/26 6:23 AM, Dmitry Torokhov wrote:
> > On Tue, Jan 20, 2026 at 11:50:53PM +0100, Marek Vasut wrote:
> > > On 1/20/26 7:31 PM, Dmitry Torokhov wrote:
> > > > Hi Marek,
> > > > 
> > > > On Sat, Jan 17, 2026 at 01:12:04AM +0100, Marek Vasut wrote:
> > > > > @@ -860,16 +893,12 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
> > > > >    	 * the touch controller to disable the IRQs during update, so we have
> > > > >    	 * to do it this way here.
> > > > >    	 */
> > > > > -	scoped_guard(disable_irq, &client->irq) {
> > > > > -		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
> > > > > -
> > > > > -		ili210x_hardware_reset(priv->reset_gpio);
> > > > > -
> > > > > -		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
> > > > > -
> > > > > -		ili210x_hardware_reset(priv->reset_gpio);
> > > > > -
> > > > > -		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
> > > > > +	if (client->irq > 0) {
> > > > > +		scoped_guard(disable_irq, &client->irq) {
> > > > > +			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> > > > > +		}
> > > > 
> > > > You already have a scope here, no need to establish a new one:
> > > > 
> > > > 		guard(disable_irq)(&client->irq);
> > > > 		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> > > 
> > > This part ^ I do not understand. If there is no IRQ defined in DT, I need to
> > > call ili210x_firmware_update_noirq() without the guard because I cannot
> > > disable_irq() with client->irq < 0, else I need to call
> > > ili210x_firmware_update_noirq() within the scoped_guard() to disable IRQs to
> > > avoid spurious IRQs that would interfere with the firmware update ?
> > 
> > You do not need to use scoped_guard() because you already define a scope
> > in your if statement:
> > 
> > if (client->irq > 0) {
> > 	guard(disable_irq)(&client->irq);
> > 	error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> > } else {
> > 	error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> > }
> > 
> > This is sill a bit awkward. Maybe we could add to interrupt.h
> 
> Let me do the part above in V5 , and then the part below as a separate
> follow up patch/series. I already added the later in tree so it won't be
> lost. Does that work for you ?

It does, thanks.

-- 
Dmitry

